#  -*-Tcl-*-
### TL install
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: searchscheme.tcl 201 2007-01-05 20:21:33Z tlu $
####################################### Search
### main customize SCHEME
### progressbar
startprogress 1 inf

set i "1"
foreach k [lsort [glob -nocomplain -directory $dircd/texmf/tpm scheme* ]] { 
    set selscheme [file rootname [file tail $k]]
    if [winfo exists $f31.rb$i] then { destroy $f31.rb$i }
    ttk::radiobutton $f31.rb$i -variable scheme -value $selscheme \
	-text $selscheme -command {
	    regexp \[0-9]{1,2}$ [focus] i
	    source $filetpmcollection
	    # reset collections nad languages
	    set firsttimelang 1
	    set firsttimecol 1
	    source $filefirst
	}
    grid $f31.rb$i -row $i -column 1 -padx 2m -pady 1.5m -sticky w
    # filename of scheme
    eval set schemefile$i $k
    # button info
    if [winfo exists $f31.b$i] then { destroy $f31.b$i }
    ttk::button $f31.b$i -text [mc "Info"] -command {
	set schemetpmcurr $schemetpm
	regexp \[0-9]{1,2}$ [focus] i
	source $filetpmcollection
	if {[winfo exists .info] eq 1} then {destroy .info}
	ttk::dialog .info -icon info \
	    -title [mc "Scheme info"]  \
	    -message [mc "Collections:"] \
	    -detail $schemetpm \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
	set schemetpm $schemetpmcurr
    }
    if {$selscheme eq $scheme} then {
	source $filetpmcollection
    } 
    grid $f31.b$i -row $i -column 2 -padx 2m -pady 1.5m
    incr i
}
### number of scheme
set schemenum $i

### stop progressbar
startprogress 0 inf
## EOF