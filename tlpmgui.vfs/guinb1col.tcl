# -*-Tcl-*-
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb1col.tcl 175 2006-12-31 01:26:11Z tlu $
#
# Window for select collection
if [winfo exists .col] then { destroy .col }
toplevel .col
wm title .col [mc "Standard collections"]
ttk::frame .col.f1 -borderwidth 2m
pack .col.f1 -fill both -expand 1

# number of widgets
set i "1"
# numbers of row and column in frame
set row 1
set col 1

foreach k [lsort [glob -nocomplain -directory $dircd/texmf/tpm collection-* ]] { 
    set selcol [file rootname [file tail $k]]
    if {[string first "collection-lang" $selcol] eq -1 } then {
	if {$firsttimecol eq 1} then {
	    # check in collections list, compare with collections in scheme
	    if { [string first [string range $selcol 11 end] $schemetpm ] ne "-1" } then {
		eval set col$i $selcol
	    } else {# default switch on 
		switch -regexp $selcol {
		    ghostscript {if {$windows eq 1} then { eval set col$i $selcol } else { eval set col$i 0} }
		    perl        {if {$windows eq 1} then { eval set col$i $selcol } else { eval set col$i 0} }
		    wintools    {if {$windows eq 1} then { eval set col$i $selcol } else { eval set col$i 0} }
		    default     {eval set col$i 0 }
		}
	    }
	}
	ttk::checkbutton .col.f1.cb$i  -onvalue $selcol -variable col$i \
	    -text [string toupper [string range $selcol 11 end] 0 0]
	grid .col.f1.cb$i  -row $row  -column $col -sticky w
	if { $row eq 15 } then {
	    set row 0
	    incr col
	}
	incr i
	incr row
    }
}
set firsttimecol 0
# numbers of languages
set colnum $i

#######

ttk::frame .col.f2 -borderwidth 2m
pack .col.f2 -fill x -expand 1

ttk::button .col.f2.b3 -text [mc "Done"] -command {destroy .col}

grid .col.f2.b3 -row 15 -column 3 -padx 2m

## focus
bind .col <Motion> {focus %W}
focus .col.f2.b3
## help
bind .col <F1> { displayhelp }

# EOF
