#
#   splash.tcl
#
#   Development by Steve Landers (steve@DigitalSmarties.com)
#   Digital Smarties (DigitalSmarties.com)
#
#   Copyright (c) 2001-2002 Steve Landers
#   All Rights Reserved
#
#   Free for any use under the same terms as Tcl/Tk
#   See http://purl.org/tcl/home/software/tcltk/license_terms.html
#
#   $Id: splash.tcl,v 1.13 2002/12/05 03:41:47 steve Exp $
#
#   Splash::create args
#       Invoke at the start of the script using Splash. Does nothing in the
#       calling (parent) script, but causes the splash window to be created
#       and displayed in the child process that is started by Splash::start
#
#   Splash::start args
#       where args may be 
#           -app application    application name
#           -img image          image for the splash screen
#           -icon ico           Windows icon for the application
#           -delay delay        ms between animation updates (default = 500ms)
#           -color color        foreground color of message text
#
#       Note that animated splash screens are supported. If img
#       is an animated GIF, then the first index/layer is displayed
#       as the background, and subsequent layers are assumed to be
#       the animation, overlayed on the background image and cycled
#       through at $delay intervals.
#
#   Splash::message txt
#       Overlays the text message on the splash screen.
#
#   Splash::delete secs
#       Deletes the splash window, making sure it has been displayed for
#       at least the specified number of seconds, and de-iconifies the
#       the toplevel window
#
#   Splash::wait {window}
#       Creates $window and posts a "Please wait ..." message. Window
#       defaults to .wait
#       

package provide Splash 1.0
package require Tk
#package require cmdline

namespace eval Splash {
    namespace export create start message message
    variable after_id {}
    variable child {}
    variable socket {}
    variable splash_app Splash          # application name
    variable splash_delay 500           # delay between showing layers
    variable splash_ico ""              # Windows icon
    variable splash_color white         # message color
    variable splash_cmd ""              # command to invoke - defaults to current SK

    #
    #   Create the splash window.
    #
    #   If the image is indexed and contains multiple layer/sub-images then
    #   we assume that it is an animated image and start the animation
    #   timer. Note that layer 0 is assumed to be the background image so
    #   we only animate layers 1 and above.
    #
    #   In the parent process this procedure just posts a "please wait"
    #   dialog. When called from the child it connects back to the parent,
    #   which is listening for the connection (see Splash::start)
    #
    proc create {args} {
        variable child
        set argv [lindex $args 0]
        set argc [llength $argv]
        if {$argc == 2 && [string equal [lindex $argv 0] _splash_]} {
            #
            #   child process
            #
            set port [lindex $argv 1]
            set child 1
        } else {
            #
            #   parent process - post a small "Please wait ..." message
            #   which is withdrawn once the splash screen is displayed
            #
            Splash::wait
            set child 0
            return
        }
        variable socket
        variable splash_app
        variable splash_img
        variable splash_ico
        variable splash_delay
        variable splash_color
        wm withdraw .
        set socket [socket 127.0.0.1 $port]
        if {[gets $socket details] <= 0} {
            error "couldn't read splash details"
            exit
        }
        set splash_app [lindex $details 0]
        set splash_img [lindex $details 1]
        set splash_ico [lindex $details 2]
        set splash_delay [lindex $details 3]
        set splash_color [lindex $details 4]
        global tcl_platform
        if {[string equal $tcl_platform(platform) windows]} {
            set splash_font [list helvetica 10 normal]
        } else {
            set splash_font [list helvetica 12 normal]
        }
        wm withdraw .
        wm resizable . 0 0
        wm title . "Welcome to $splash_app"

        set num_images 0
        while {![catch "image create photo img$num_images -file $splash_img \
                        -format \{gif -index $num_images\}" msg]} {
            incr num_images
        }
        if {$num_images == 0} {
            exit
        }
        set height [image height img0]
        set width [image width img0]
        canvas .splash -height $height -width $width
        .splash create image 0 0 -image img0 -anchor nw
        set w [expr {[winfo reqwidth  .splash] / 2}]
        set asc [font metrics $splash_font -displayof .splash -ascent]
        set desc [font metrics $splash_font -displayof .splash -descent]
        set h [expr {$asc + $desc + 5}]
        .splash create text $w $h -text {} -justify center \
                            -fill $splash_color -anchor n \
                            -tags message \
                            -font $splash_font
        pack .splash -side top -fill x
        center .
        if {$splash_ico != {} && [string equal $tcl_platform(platform) windows]} {
            catch {wm iconbitmap . $splash_ico}
        }
        fileevent $socket readable Splash::__message
        if {$num_images > 1} {
            set item [.splash create image 0 0 -image img1 -anchor nw]
            Splash::animate $item 0 $num_images
        }
        wm protocol . WM_DELETE_WINDOW exit
        raise .
        wm deiconify .
        update idletasks
        puts $socket ""     ;# let the parent know we've started
        flush $socket
        vwait forever
    }

    proc center {path} {
        update idletasks
        set w [winfo reqwidth  $path]
        set h [winfo reqheight $path]
        set sw [winfo screenwidth  $path]
        set sh [winfo screenheight $path]
        set x0 [expr {([winfo screenwidth  $path] - $w)/2 - [winfo vrootx $path]}]
        set y0 [expr {([winfo screenheight $path] - $h)/2 - [winfo vrooty $path]}]
        set x "+$x0"
        set y "+$y0"
        if {$::tcl_platform(platform) != "windows"} {
            if { $x0+$w > $sw } {set x "-0"; set x0 [expr {$sw-$w}]}
            if { $x0 < 0 }      {set x "+0"}
            if { $y0+$h > $sh } {set y "-0"; set y0 [expr {$sh-$h}]}
            if { $y0 < 0 }      {set y "+0"}
        }
        after idle wm geometry $path "${w}x${h}${x}${y}"
    }

    #
    #   Start child process to display the splash screen.
    #   
    #   We use a child process so that long running tasks in the parent
    #   (such as downloading code) don't stop the splash animation 
    #   or stop refreshes when moving the splash window
    #
    proc start {args} {
        variable listen
        variable socket
        variable splash_app
        variable splash_img
        variable splash_ico
        variable splash_delay
        variable splash_color
        variable splash_cmd
        variable child

        set options [list app.arg image.arg icon.arg delay.arg color.arg cmd.arg]
        while {[set result [cmdline::getopt args $options opt arg]] != 0} {
            switch $opt {
                app   { set splash_app $arg }
                image { set splash_img $arg }
                icon  { set splash_ico $arg }
                delay { set splash_delay $arg }
                color { set splash_color $arg }
                cmd   { set splash_cmd $arg }
                default { error "splash::start - unknown option $opt" }
            }
        }
        if {$child == {}} {
            # error "Splash: you must call Splash::create first"
            return
        } elseif {$child} {
            return ;# just in case
        }
        if {$splash_img == {}} {
            error "Splash::start - image not specified"
        }
        if {![file readable $splash_img]} {
            error "Splash::start - image \"$splash_img\" isn't readable"
        }
        if {$splash_ico != {} && ![file readable $splash_ico]} {
            error "Splash::start - icon \"$splash_ico\" isn't readable"
        }
        if {![string is integer $splash_delay] || $splash_delay < 0} {
            error "Splash::start - delay must be an integer >= 0"
        }
        set listen [socket -server Splash::connect 0]
        set port [lindex [fconfigure $listen -sockname] 2]
        set cmd [list [info nameofexecutable] $starkit::topdir _splash_ $port]
        eval exec $cmd &
        vwait ::Splash::socket
    }

    #
    #   accept connection from background splash screen process
    #   
    #   If we were extremely paranoid we could also do some authentication
    #   such as 
    #       - checking that host is the local host
    #       - getting a random number and calculating an MD5 check sum
    #         on it, passing it to the child process on the command line
    #         and then getting the child to pass it back.
    #   but, realistically, closing the listening socket is sufficient
    #
    proc connect {sock host port} {
        variable socket
        variable listen
        variable splash_app
        variable splash_img
        variable splash_ico
        variable splash_delay
        variable splash_start
        variable splash_color
        set socket $sock
        close $listen
        fconfigure $socket -buffering line
        puts $socket \
            [list $splash_app $splash_img $splash_ico $splash_delay $splash_color]
        gets $socket line       ;# wait for child to start
        destroy .wait
        update idletasks
        set splash_start [clock seconds]
    }

    #
    #   Animate the image by stepping through the image layers
    #
    proc animate {item num max} {
        variable splash_delay
        variable after_id
        if {[incr num] == $max} {
            set num 1
        }
        .splash itemconfigure $item -image img$num
        set after_id [after $splash_delay Splash::animate $item $num $max]
    }

    #
    #   Delete the splash window. If secs is specified then the splash
    #   window must be displayed for at least this amount of time
    #
    proc delete {{secs 0}} {
        if {$secs == 0} {
            variable socket
            if {$socket != {}} {
                close $socket
                set socket {}
            }
            catch {destroy .wait}
            # on KDE raise causes a delay
            if {[winfo ismapped .]} {
                after idle raise .
            } else {
                wm deiconify .
            }
        } else {
            variable splash_start
            if [info exists splash_start] {
                set elapsed [expr {[clock seconds] - $splash_start}]
                set delay [expr {($secs - $elapsed)*1000}]
            } else {
                set delay 0
            }
            if {$delay > 0} {
                after $delay Splash::delete
            } else {
                Splash::delete
            }
        }
    }

    #
    #   Display a text message over the splash screen
    #
    proc message {txt} {
        variable socket
        if {$socket != {}} {
            if [catch {puts $socket $txt}] {
                set socket {}
            }
        }
    }

    #
    #   called in the child when a message needs displaying
    #
    proc __message {args} {
        variable socket
        if {[eof $socket]} {
            fileevent $socket readable {}
            close $socket
            exit
        } else {
            gets $socket txt
            .splash itemconfigure message -text $txt
            update
        }
    }

    proc wait {{win .wait}} {
        toplevel $win 
        frame $win.f -bd 5 -relief groove
        label $win.f.l -text "Please wait ..."
        pack $win.f -padx 2m -pady 2m
        pack $win.f.l  -padx 2m -pady 2m
        wm overrideredirect $win 1
        center $win
        raise $win
        update
    }
}
