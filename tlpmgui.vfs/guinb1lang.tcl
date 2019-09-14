# -*-Tcl-*-
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb1lang.tcl 175 2006-12-31 01:26:11Z tlu $
#
# Window for select collection
if [winfo exists .lang] then { destroy .lang }
toplevel .lang
wm title .lang [mc "Language collections"]

ttk::frame .lang.f1 -borderwidth 2m
pack .lang.f1 -fill both -expand 1
# number of widgets
set i "1"
# numbers of row and column in frame
set row 1
set col 1

foreach k [lsort [glob -nocomplain -directory $dircd/texmf/tpm collection-lang* ]] { 
    set sellang [file rootname [file tail $k]]
    if {$firsttimelang eq 1} then {
	# check in language list, compare with collections in scheme
	if { [string first [string range $sellang 11 end] $schemetpm 12] ne -1 } then {
	    eval set lang$i $sellang
	} else {
	    eval set lang$i 0
	}
    }
    
    ttk::checkbutton .lang.f1.cb$i  -onvalue $sellang -variable lang$i \
	-text [string toupper [string range $sellang 15 end] 0 0]
    grid .lang.f1.cb$i  -row $row  -column $col -sticky w
    if { $row eq 15 } then {
	set row 0
	incr col
    }
    incr i
    incr row
}
set firsttimelang 0

# numbers of languages
set langnum $i

#######

ttk::frame .lang.f2 -borderwidth 2m
pack .lang.f2 -fill x  -expand 1

ttk::button .lang.f2.b3 -text [mc "Done"] -command {destroy .lang}
grid .lang.f2.b3 -row 16 -column 3 -padx 2m

## Grab focus for this window
bind .lang <Motion> {focus %W}
focus .lang.f2.b3
## Help
bind .lang <F1> { displayhelp }
# EOF
