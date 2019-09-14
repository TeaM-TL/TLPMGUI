# -*-Tcl-*-
### TL install
## 2006-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: searchbin.tcl 276 2007-01-22 18:01:28Z tlu $
####################################### Search
### main customize BIN
### search type of binaries/architectures available on CD/DVD

### progressbar 
startprogress 1 inf

set i "0"

if {$dvd eq 0} then {
    foreach k [lsort [glob -nocomplain -directory $dircd/archive bin-pdftex.*.zip]] { 
	incr i
	set selbin [string range [file extension [file rootname [file tail $k]]] 1 end]
	if [winfo exists $f32.cb$i] then { destroy $f32.cb$i }
	ttk::checkbutton $f32.cb$i -text $selbin \
	    -onvalue $selbin -offvalue 0 -variable bin$i
	pack $f32.cb$i -side top -padx 2m -pady 1m -anchor w
	set bin$i "0"
	if {$windows eq 1} then {
	    if {$selbin eq "win32"} then {
		set bin$i $selbin
	    } 
	    $f32.cb$i configure -state disabled
	} elseif {$selbin eq $tlplatform} then {
	    set bin$i $tlplatform
	    #$f32.cb$i configure -state disabled
	}
    }
} else {
    foreach k [lsort [glob -nocomplain -directory $dircd/texmf/lists bin-pdftex.* ]] { 
	incr i
	set selbin [string range [file extension [file tail $k]] 1 end]
	if [winfo exists $f32.cb$i] then { destroy $f32.cb$i }
	ttk::checkbutton $f32.cb$i -text $selbin \
	    -onvalue $selbin -offvalue 0 -variable bin$i
	pack $f32.cb$i -side top -padx 2m -pady 1m -anchor w
	set bin$i "0"
	if {$windows eq 1} then {
	    if {$selbin eq "win32"} then {
		set bin$i $selbin
	    } 
	    $f32.cb$i configure -state disabled
	} elseif {$selbin eq $tlplatform} then {
	    set bin$i $tlplatform
	    #$f32.cb$i configure -state disabled
	}
    }
}
### number of scheme
set binnum $i

### stop progressbar
startprogress 0 inf
## EOF