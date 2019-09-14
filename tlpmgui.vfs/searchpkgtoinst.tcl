# -*-Tcl-*-
### TeX Live installer
## 2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: searchpkgtoinst.tcl 318 2007-02-03 00:13:13Z tlu $
######################## 
cursorwait 1
buttonlock 1
### progressbar
startprogress 1 inf
set actioninfo [mc "Searching for packages ..."]
### script for search all packages
set filecontents "list > \"[file nativename $filepkglist]\""
writescript $filecontents $filebatch "w+"
if {$windows eq 1} then {
    set filecontents "\"[file nativename $tlpm]\" -s \'[file nativename $dircd]\' -b \'[file nativename $filebatch]\' -d \'[file nativename $dirtlroot]\'"
} else {
    set filecontents "[file nativename $tlpm] -s [file nativename $dircd] -b [file nativename $filebatch] -d [file nativename $dirtlroot]"
}
writescript $filecontents $filewininst "w+"
### execute tlpm
executeprocess 0 inf
#################################################
### progressbar
set actioninfo [mc "Searching for packages ..."]
startprogress 1 inf
source $filesearchpkg
# join list into string separated by comma
set a ","
set pkgall [ append a [join $pkgcol ,] $a [join $pkg , ] $a]

#################################################
### script for search installed packages
if {$windows eq 1} then {
    set filecontents "list -p -d \'[file nativename $dirtlroot]\' > \"[file nativename $filepkglist]\""
} else {
    set filecontents "list -p -d [file nativename $dirtlroot] > [file nativename $filepkglist]"
}
writescript $filecontents $filebatch "w+"
### execute tlpm
executeprocess 0 in
set actioninfo [mc "Searching for packages ..."]
source $filelistpkgtodel
startprogress 1 inf
set input [open $filepkglist r]
set pkgins ""
while {![eof $input]} {
    set pkgins [linsert $pkgins end [gets $input]]
}   
close $input

#################################################
### new = all - installed
set pkgnew [string trim $pkgall]

foreach k $pkgins {
    set a ","
    set pkg [append a $k $a]
    set idxf [string first $pkg $pkgnew]
    if {$idxf ne -1} then {
	set pkglen [string length $pkg]
	set idxe [ expr $idxf + $pkglen - 2 ]
	set pkgnew [string replace $pkgnew $idxf $idxe ]
    }
}

#################################################
# convert string into list 
set pkglist [split [string range $pkgnew 1 end] {,}]

### update listbox
$f221.lb delete 0 end
foreach item $pkglist {
    $f221.lb insert end " $item"
    # hightlighting on the list
    switch -regexp $item {
	^bin        {$f221.lb itemconfigure end -foreground brown}
	^collection {$f221.lb itemconfigure end -foreground blue}
	^FAQ        {$f221.lb itemconfigure end -foreground brown}
	^hyphen     {$f221.lb itemconfigure end -foreground brown}
	^lib        {$f221.lb itemconfigure end -foreground red}
	^lshort     {$f221.lb itemconfigure end -foreground brown}
	^scheme     {$f221.lb itemconfigure end -foreground red}
	^texlive    {$f221.lb itemconfigure end -foreground brown}
    }
    # remove *.win32 from the list
    if {[regexp -nocase ^bin-\.*\.win32$ $item] eq 1} then {
	$f221.lb delete end end
    }
    if {[regexp -nocase ^lib-\.*\.win32$ $item] eq 1} then {
	$f221.lb delete end end
    }
    if [regexp ^$ $item] then {
	$f221.lb delete end end
    }
}
set actioninfo ""
startprogress 0 inf
buttonlock 0
cursorwait 0

# EOF