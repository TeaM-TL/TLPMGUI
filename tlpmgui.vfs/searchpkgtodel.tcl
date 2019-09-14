# -*-Tcl-*-
### TeX Live installer
## 2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: searchpkgtodel.tcl 318 2007-02-03 00:13:13Z tlu $
########################  
cursorwait 1
buttonlock 1
startprogress 1 inf
set actioninfo [mc "Searching for packages ..."]
### script for run tlpm
### script for search installed packages
if {$windows eq 1} then {
    set filecontents "list -p -d \"[file nativename $dirtlroot]\" > \"[file nativename $filepkglist]\""
} else {
    set filecontents "list -p -d [file nativename $dirtlroot] > [file nativename $filepkglist]"
}
writescript $filecontents $filebatch "w+"
if {$windows eq 1} then {
    set filecontents "\"[file nativename $tlpm]\" -b \'[file nativename $filebatch]\' -d \'[file nativename $dirtlroot]\'"
} else {
    set filecontents "[file nativename $tlpm] -b [file nativename $filebatch] -d [file nativename $dirtlroot]"
}
writescript $filecontents $filewininst "w+"
### execute tlpm
executeprocess 0 inf
#################################################
source $filelistpkgtodel

# EOF