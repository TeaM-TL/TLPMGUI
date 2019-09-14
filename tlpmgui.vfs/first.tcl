# -*-Tcl-*-
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: first.tcl 175 2006-12-31 01:26:11Z tlu $
# initialization of variables if window with collection
# or languages never opened

if {$firsttimecol eq 1} then {
    set i 1
    foreach k [lsort [glob -nocomplain -directory $dircd/texmf/tpm collection-* ]] { 
	set selcol [file rootname [file tail $k]]
	if {[string first "collection-lang" $selcol] eq -1 } then {
	    # check in collection list, compare with collections in scheme
	    if { [string first [string range $selcol 11 end] $schemetpm ] ne -1 } then {
		eval set col$i $selcol
	    } else {
		# default switch on 
		switch -regexp $selcol {
		    #ghostscript {if {$windows eq 1} then {eval set col$i $selcol} else {eval set col$i 0}}
		    perl        {if {$windows eq 1} then {eval set col$i $selcol} else {eval set col$i 0}}
		    wintools    {if {$windows eq 1} then {eval set col$i $selcol} else {eval set col$i 0}}
		    default     {eval set col$i 0}
		}
	    }
	incr i
	}
    }
    set colnum $i
}


if {$firsttimelang eq 1} then {
    set i 1
    foreach k [lsort [glob -nocomplain -directory $dircd/texmf/tpm collection-lang* ]] { 
	set sellang [file rootname [file tail $k]]
	# check in language list, compare with collections in scheme
	if { [string first [string range $sellang 11 end] $schemetpm ] ne -1 } then {
	    eval set lang$i $sellang
	} else {
	    eval set lang$i 0
	}
	incr i
    }
    set langnum $i
}

# EOF
