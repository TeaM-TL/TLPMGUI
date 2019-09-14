# -*-Tcl-*-
### TeX Live installer
## 2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: listpkgtodel.tcl 318 2007-02-03 00:13:13Z tlu $
########################
startprogress 1 inf
source $filesearchpkg
$f321.lb delete 0 end
foreach item [concat $pkgcol  $pkg] {
    $f321.lb insert end " $item"
    # hightlighting on the list
    switch -regexp $item {
	^bin        {$f321.lb itemconfigure end -foreground brown}
	^collection {$f321.lb itemconfigure end -foreground blue}
	^FAQ        {$f321.lb itemconfigure end -foreground brown}
	^hyphen     {$f321.lb itemconfigure end -foreground brown}
	^lib        {$f321.lb itemconfigure end -foreground red}
	^lshort     {$f321.lb itemconfigure end -foreground brown}
	^scheme     {$f321.lb itemconfigure end -foreground red}
	^texlive    {$f321.lb itemconfigure end -foreground brown}
    }
    # remove *.win32, *.i386 etc from the list
    if {[regexp -nocase ^(bin|lib)-.+\.(alpha|i386|mips|powerpc|sparc|win32|x86_64) $item] eq 1} then {
	$f321.lb delete end end
    }
}
$f321.lb delete end end
set actioninfo ""
startprogress 0 inf
buttonlock 0
cursorwait 0

# EOF