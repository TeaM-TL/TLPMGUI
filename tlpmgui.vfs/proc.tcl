# -*-Tcl-*-
### TeX Live installer
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: proc.tcl 347 2007-02-05 23:02:33Z tlu $
########################  PROCEDURES ############################
# poor man grep from http://wiki.tcl.tk/9395
proc grep {re args} {
    set result ""
    set files [eval glob -types f $args]
    foreach file $files {
	set fp [open $file]
	while {[gets $fp line] >= 0} {
	    if [regexp -- $re $line] {
		lappend result "$line"
	    }
	}
	close $fp
    }
    return $result
 }
#################################
# display help
proc help {} {
    global filehelpdir windows 
#   if {[winfo exists .tophelpwindow] eq "0"} then {
#	wm deiconify .tophelpwindow
#   }
    help::destroy
    help::init [file nativename [file join $filehelpdir [mc "helpen"].html]]
}
###############################
# For autoactivate weel in mouse
# from http://aspn.activestate.com/ASPN/Cookbook/Tcl/Recipe/68394
# 
proc wheelEvent {x y delta {XorY y}} {

    # Get scroll command for this widget
    set widget [winfo containing $x $y]
    if {$widget == ""} return
    if {[catch {set cmd [$widget cget -${XorY}scrollcommand]}]} return
    if {$cmd == ""} return
    set scmd [[lindex $cmd 0] cget -command]

    # NB. Text and Listbox hardcode factor=4
    set xy [$widget ${XorY}view]
    set factor [expr {[lindex $xy 1] - [lindex $xy 0]}]

    # Make sure we activate the scrollbar's command
    set cmd "$scmd scroll [expr -int($delta/(120*$factor))] units"
    eval $cmd
}
###########################
# start/stop progressbar
# variables:
#    start: 1 - on; 0 - off
#    mode: normal - determinate; inf - indeterminate
proc startprogress {start mode} {
    global progressnormal
    if {[winfo exists .fs.wait]} then {
	if {$start eq 1} then {
	    ### start progressbar
	    # info about waiting
	    .fs.wait configure -text [mc "Please wait..."]
	    # progressbar
	    if {$mode eq "normal"} then {
		.fs.pb configure -mode determinate
	    } else {
		.fs.pb configure -mode indeterminate
		.fs.pb start 10
	    }
	} else {
	    # stop progressbar
	    .fs.pb configure -mode determinate
	    set progressnormal 0
	    .fs.pb stop
	    .fs.wait configure -text ""
	}
    }
}
###############################
# changes cursor icon depend mode
proc cursorwait mode {
    if {$mode eq 1} then {
	. configure -cursor watch
    } else {
	. configure -cursor arrow
    }
}
#############################
# execute tlpminst.bat with fileevent for progressbar
# variables:
#   done: if set 0 then don't appear message "$done"
#   mode: normal/inf - type of progressbar
# missing error handling :-(
proc executeprocess {done mode} {
    global filewininst progressstart winerrlog filewinlog windows actioninfo
    set progressstart 1
    startprogress 1 inf
    set winerrlog ""
    if {$windows ne 1} then {
	file attributes $filewininst -permission 0777
    }
    set chann [open "|$filewininst" r]
    fconfigure $chann -blocking 0
    startprogress 0 inf
    startprogress 1 $mode
    if {$mode eq "normal"} then {
	set procname "readeoppercent"
    } else {
	set procname "readeop"
    }
    fileevent $chann readable "$procname $chann"
    ## wait for end subprocess
    vwait progressstart
    ## save  log
    if { [catch {set filehandle [open $filewinlog a+]} result] eq 0} then {
	puts -nonewline $filehandle $winerrlog
	close $filehandle
    } else {
	set filecontents ""
	ttk::messageBox -icon error \
	    -title [mc "Error"] \
	    -message [mc "Error open file: %s" $filewinlog] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
    startprogress 0 inf
    set actioninfo ""
    # sucessfully finish
    if {$done ne 0 } then {
	ttk::messageBox -icon info \
	    -title [mc "Done"] -message $done \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
}
#######################
# read End Of Process
# and increment progressbar
# for install TL/packages
proc readeoppercent chan {
    global winerrlog filewinerrlog progressnormal progressstart percent
    set line [string trim [gets $chan]]
    if {[regexp "\[\ ]\[0-9]{1,3}\[%]$" $line result ] eq 1} then {
	set percent [string range $line 0 [string first " " $line]]
	append percent " \t "
	set progressnormal [string range [string trim $result] 0 end-1]
	append percent $progressnormal
	append percent "%"
    }
    append winerrlog $line "\n"
    if {[eof $chan]} then {
	close $chan
	# write log into file
	writescript $winerrlog $filewinerrlog "a+"
	set progressstart 0
	set percent ""
	return
    }
}
#######################
# read End Of Process
# used for postinstall action and remove TL/packages
proc readeop chan {
    global winerrlog filewinerrlog progressstart
    set line [string trim [gets $chan]]
    append winerrlog $line "\n"
    if {[eof $chan]} then {
	close $chan
	# write log into file
	writescript $winerrlog $filewinerrlog "a+"
	set progressstart 0
	return
    }
}
#####################
# precedure read info about packages for Add and Remove Tabs
proc pkginfo {} {
    global pkg filewininst filebatch filepkginfo dirtlroot dircd sourcedir windows tlpm
    ### remove space and split string into list, get first package
    set pkg [lindex [split [string map {{ } {}} $pkg]  ","] 0]
    ### prepare script for tlpm
    set filecontents "info  $pkg"
    writescript $filecontents $filebatch "w+"
    ### script for run tlpm
    if {$windows eq 1} then {
	set filecontents "\"[file nativename $tlpm]\" -s \'[file nativename $dircd]\' -b \'[file nativename $filebatch]\' -d \'[file nativename $dirtlroot]\' > \"[file nativename $filepkginfo]\""
    } else {
	set filecontents "[file nativename $tlpm] -s [file nativename $dircd] -b [file nativename $filebatch] -d [file nativename $dirtlroot] > [file nativename $filepkginfo]"
    }
    writescript $filecontents $filewininst "w+"
    ### execute tlpm
    executeprocess 0 inf
    set pkginfo [readscriptall $filepkginfo]
    return $pkginfo
}
#####################
# This procedure pops up a dialog to ask for a directory to load into
# the listobox and (if the user presses OK) reloads the directory
# listbox from the directory named in entry.
proc selectAndLoadDir i {
    global dirname windows
    if {$windows eq 1} then {
	set dir [tk_chooseDirectory -initialdir $dirname -parent . -mustexist "$i"]
    } else {
	set dir [ttk::chooseDirectory -initialdir $dirname -parent . -mustexist "$i"]
    }
    if {[string length $dir] != 0} {
	set dirname $dir
    }
}
####################################################
# write script
proc writescript {filecontents filename mode} {
    global argv debugInfo
    
    if {[string first "\"" $filename] eq 0} then {
	set filename [string range $filename 1 end-1]
    }

    if {$debugInfo eq 1} then {
	puts "------ $filename ------\n$filecontents\n===================="
    }
    # mode: a+ - append, w+ - write, etc.
    if { [catch {set filehandle [open $filename $mode]} result] eq 0} then {
	# check ending lines!
	#fconfigure $filehandle -translation {crlf lf}
	puts -nonewline $filehandle $filecontents
	close $filehandle
    } else {
	set filecontents ""
	ttk::messageBox -icon error\
	    -title [mc "Error"] \
	    -message [mc "Error open file: %s" $filename] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
}
####################################################
# read file
proc readscriptall filename {
    if { [catch {set input [open $filename r]} result] eq 0} then {
	set filecontents [read $input]
	close $input
    } else {
	set filecontents ""
	ttk::messageBox -icon error\
	    -title [mc "Error"] \
	    -message [mc "Error open file: %s" $filename] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
	return $filecontents
}
####################################################
# read file, second version
# not use, not ready yet
proc readscriptlist filename {
    set i 0
    set filecontents ""
    if { [catch {set input [open $filename r]} result] eq 0} then {
	while {![eof $input]} {
	    linsert $filecontents $i [gets $input]
	    incr i
	}   
	close $input
   } else {
	set filecontents ""
       ttk::messageBox -icon error\
	    -title [mc "Error"] \
	    -message [mc "Error open file: %s" $filename] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
    return $filecontents
}

###################################
# GUI lock buttons
proc buttonlock mode {
    global f223 f222 f322 f421 f422 f431 f432 f442 f502 windows
    if {$mode eq 1} then {
	set state disabled
	if {$windows eq 1} then {
	    set cursor no
	} else {
	    set cursor watch
	}
    } else {
	set state normal
	set cursor arrow
    }
    ## Add
    $f223.b  configure -state $state -cursor $cursor
    $f222.b1 configure -state $state -cursor $cursor
    $f222.b2 configure -state $state -cursor $cursor
    $f222.b3 configure -state $state -cursor $cursor
    ## Remove
    $f322.b1 configure -state $state -cursor $cursor
    $f322.b2 configure -state $state -cursor $cursor
    $f322.b3 configure -state $state -cursor $cursor
    ## Maintenance
    $f421.b  configure -state $state -cursor $cursor
    $f422.b  configure -state $state -cursor $cursor
    $f431.b1 configure -state $state -cursor $cursor
    $f431.b2 configure -state $state -cursor $cursor
    $f432.b  configure -state $state -cursor $cursor
    $f442.b  configure -state $state -cursor $cursor
    # Remove
    $f502.b  configure -state $state -cursor $cursor
    # Exit
    .fn.b2   configure -state $state -cursor $cursor
}

## EOF
