# -*-Tcl-*-
### TL install
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: searchpkg.tcl 265 2007-01-19 17:31:44Z tlu $
##################################
# Reading from file list of packages
#
set pkg ""
set pkgcol ""
set input [open $filepkglist r]
while {![eof $input]} {
    set curr [gets $input]
    if {$curr ne ""} then {
	#sort: first collections, next other
	if { [string first "collection" $curr] ne -1 } then {
	    set pkgcol [linsert $pkgcol end $curr ]
	} else {
	    set pkg [linsert $pkg end $curr ]
	}
    }
}   
close $input
set pkg [lsort -dictionary $pkg]
set pkgcol [lsort -dictionary $pkgcol]

# EOF