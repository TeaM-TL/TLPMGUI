# -*-Tcl-*-
### TL install
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: wininstall.tcl 347 2007-02-05 23:02:33Z tlu $
####################################### install
## install via tlpm
if {[file exists $dircd/texmf]} then {
    # change cursor
    cursorwait 1
    startprogress 1 inf
    set actioninfo [mc "Preinstall actions"]
    # hide other windows
    if [winfo exists .col]   then { destroy .col }
    if [winfo exists .lang]  then { destroy .lang }
    if [winfo exists .log]   then { destroy .log }
    if [winfo exists .info]  then { destroy .info }
    if [winfo exists .error] then { destroy .error }
    # lock other buttons
    $f21.b1 configure -state disabled
    $f21.b2 configure -state disabled
    $f24.b2 configure -state disabled
    if {$windows eq 1} then {
	$f24.cb2 configure -state disabled
	.fn.b2   configure -state disabled
	if {$dvdtab eq 1} then {
		$frm0.f.f2.b configure -state disabled
	}
    }
    set i 1
    while {$i<$schemenum} {
	$f31.rb$i  configure -state disabled
	incr i
    }
    set i 1
    while {$i<$binnum} {
	$f32.cb$i  configure -state disabled
	incr i
    }

    ## initialize variables
    source $filefirst
    ##setting scheme and target directory
    set filecontents "inst $scheme.scheme -d \"[file nativename $dirtlroot]\""
    ## extract collection from scheme for uninstall unchecked
    append instmarkstring "collection-" [string map {{,} {,collection-}} [string map {{ } {}} [string range $schemetpm [expr [string first ":" $schemetpm] +1] end-2]]]
    set instunmark [split $instmarkstring ","]
    ###############################
    ## setting collection
    set i 1
    while {$i<$colnum} {
	if { [eval set col$i] ne 0 } then {
	    ## remove installed collection from scheme
	    ## for posibility uninstall needn't collection
	    ## but existing in scheme
	    set pos [lsearch $instunmark [eval set col$i]]
	    if { $pos ne "-1" } then {
		set instunmark [lreplace $instunmark $pos $pos]
	    } else {
		append filecontents "\ninst [eval set col$i]"
	    }
	    if {$debugInfo eq 1} then {
		puts "- $i - [eval set col$i]"
	    }
	}
	incr i
    }
    # Perl installation
    if {$windows eq 1} then {
	source $fileperlinstall
    }
    ###############################
    ## setting languages
    set i 1
    while {$i<$langnum} {
	if {  [eval set lang$i] ne 0 } then {
	    ## remove installed collection from scheme
	    ## for posibility uninstall needn't collection
	    ## but existing in scheme
	    set pos [lsearch $instunmark [eval set lang$i]]
	    if { $pos ne "-1" } then {
		set instunmark [lreplace $instunmark $pos $pos]
	    } else {
		append filecontents "\ninst [eval set lang$i]"
	    }
	    if {$debugInfo eq 1} then {
		puts "- $i - [eval set lang$i]"
	    }
	}
	incr i
    }
    ###############################
    ## variable for add/remove environment variables
    set testgsperl $filecontents
    ###############################
    ## uninstall unchecked collection and languages
    if {[llength $instunmark] ne 0} then {
	set uninstlist [join $instunmark " -i\nuninst "]
	append filecontents "\nuninst $uninstlist -i"
    }
    
    #################################################
    ### install
    ## write script for tlpm
    writescript $filecontents $filebatch "w+"
    set binaries ""
    # select binaries:
    for {set i 1} {$i < $binnum} {incr i} {
	if { [eval set bin$i] ne 0} then {
	    append binaries "[eval set bin$i] "
	}
    }
    if {$windows eq 1} then {
	set filecontents "[file nativename $tlpm] -s \'[file nativename $dircd]\' -b \'[file nativename $filebatch]\'"
    } else {
	set filecontents "[file nativename $tlpm] $binaries -s [file nativename $dircd] -b [file nativename $filebatch]"
    }
    ## write script for run tlpm
    writescript $filecontents $filewininst "w+"
    ### execute tlpm
    set actioninfo [mc "Copying files ..."]
    executeprocess 0 normal
    #################################################
    ### postinstall actions
    set dvd 0
    if {[file exists $dirtlroot/texmf/web2c] eq 1} then {
	source $filewinpostinstall
	set actioninfo ""
	set finalTitle [mc "Installation is finished"]
	if {$windows eq 1} then {
	    set finalMessage "[mc "TeX Live has been sucessfully installed in your system"]\n\n[mc "Press \"OK\" to exit"]"
	} else {
	    set finalMessage [mc "TeX Live has been sucessfully installed in your system"]
	}
	set finalIcon info
    } else {
	puts "----------\n Read before click Ok:\n $filelog\n $filewinerrlog\n===================="
	set finalTitle [mc "Error!"]
	set finalMessage [mc "TeX Live has not been successfully installed"]
	set finalIcon error
	set message "[mc "A problem copying files by tlpm"]\n\n[mc "Press \"OK\" to exit"]"
	puts "Read before press Ok:\n $filelog\n$filewinerrlog"
	
    }

    ### Final
    source $filefinalmessage
    	
    .fn.b2 configure -state normal
    source $filedelete
    exit

    ################################################
} else {
    if {[winfo exists .error] eq 1} then {destroy .error}
    set finalIcon error
    set finalTitle [mc "Error"]
    set finalMessage [mc "Wrong path to the TeX Live directory."]
    set message [mc "Try again.\nPress the CD/DVD button to select the proper path."] 
    source $filefinalmessage
}

## EOF
