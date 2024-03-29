#
# $Id: utils.tcl,v 1.5 2006/07/04 17:21:55 jenglish Exp $
#
# Tile widget set: utilities for widget implementations.
#

### Focus management.
#

## tile::takefocus --
#	This is the default value of the "-takefocus" option
#	for widgets that participate in keyboard navigation.
#
# See also: tk::FocusOK
#
proc tile::takefocus {w} {
    expr {[$w instate !disabled] && [winfo viewable $w]}
}

## tile::clickToFocus $w --
#	Utility routine, used in <ButtonPress-1> bindings --
#	Assign keyboard focus to the specified widget if -takefocus is enabled.
#
proc tile::clickToFocus {w} {
    if {[tile::takesFocus $w]} { focus $w }
}

## tile::takesFocus w --
#	Test if the widget can take keyboard focus:
#
#	+ widget is viewable, AND:
#	- if -takefocus is missing or empty, return 0, OR
#	- if -takefocus is 0 or 1, return that value, OR
#	- append the widget name to -takefocus and evaluate it
#	  as a script.
#
# See also: tk::FocusOK
#
# Note: This routine doesn't implement the same fallback heuristics 
#	as tk::FocusOK.
#
proc tile::takesFocus {w} {

    if {![winfo viewable $w]} { return 0 }

    if {![catch {$w cget -takefocus} takefocus]} {
	switch -- $takefocus {
	    0  -
	    1  { return $takefocus }
	    "" { return 0 }
	    default {
		set value [uplevel #0 $takefocus [list $w]]
		return [expr {$value eq 1}]
	    }
	}
    }

    return 0
}

### Grabs.
#
# Rules:
#	Each call to [grabWindow $w] or [globalGrab $w] must be
#	matched with a call to [releaseGrab $w] in LIFO order.
#
#	Do not call [grabWindow $w] for a window that currently
#	appears on the grab stack.
#
#	See #1239190 and #1411983 for more discussion.
#
namespace eval tile {
    variable Grab 		;# map: window name -> grab token

    # grab token details:
    #	Two-element list containing:
    #	1) a script to evaluate to restore the previous grab (if any);
    #	2) a script to evaluate to restore the focus (if any)
}

## SaveGrab --
#	Record current grab and focus windows.
#
proc tile::SaveGrab {w} {
    variable Grab

    set restoreGrab [set restoreFocus ""]

    set grabbed [grab current $w]
    if {[winfo exists $grabbed]} {
    	switch [grab status $grabbed] {
	    global { set restoreGrab [list grab -global $grabbed] }
	    local  { set restoreGrab [list grab $grabbed] }
	    none   { ;# grab window is really in a different interp }
	}
    }

    set focus [focus]
    if {$focus ne ""} {
    	set restoreFocus [list focus -force $focus]
    }

    set Grab($w) [list $restoreGrab $restoreFocus]
}

## RestoreGrab --
#	Restore previous grab and focus windows.
#	If called more than once without an intervening [SaveGrab $w],
#	does nothing.
#
proc tile::RestoreGrab {w} {
    variable Grab

    if {![info exists Grab($w)]} {	# Ignore
	return;
    }

    # The previous grab/focus window may have been destroyed,
    # unmapped, or some other abnormal condition; ignore any errors.
    #
    foreach script $Grab($w) {
	catch $script
    }

    unset Grab($w)
}

## tile::grabWindow $w --
#	Records the current focus and grab windows, sets an application-modal
#	grab on window $w.
#
proc tile::grabWindow {w} {
    SaveGrab $w
    grab $w
}

## tile::globalGrab $w --
#	Same as grabWindow, but sets a global grab on $w.
#
proc tile::globalGrab {w} {
    SaveGrab $w
    grab -global $w
}

## tile::releaseGrab --
#	Release the grab previously set by [tile::grabWindow]
#	or [tile::globalGrab].
#
proc tile::releaseGrab {w} {
    grab release $w
    RestoreGrab $w
}

### Auto-repeat.
#
# NOTE: repeating widgets do not have -repeatdelay
# or -repeatinterval resources as in standard Tk;
# instead a single set of settings is applied application-wide.
# (TODO: make this user-configurable)
#
# (@@@ Windows seems to use something like 500/50 milliseconds
#  @@@ for -repeatdelay/-repeatinterval)
#

namespace eval tile {
    variable Repeat
    array set Repeat {
	delay		300
	interval	100
	timer		{}
	script		{}
    }
}

## tile::Repeatedly --
#	Begin auto-repeat.
#
proc tile::Repeatedly {args} {
    variable Repeat
    after cancel $Repeat(timer)
    set script [uplevel 1 [list namespace code $args]]
    set Repeat(script) $script
    uplevel #0 $script
    set Repeat(timer) [after $Repeat(delay) tile::Repeat]
}

## Repeat --
#	Continue auto-repeat
#
proc tile::Repeat {} {
    variable Repeat
    uplevel #0 $Repeat(script)
    set Repeat(timer) [after $Repeat(interval) tile::Repeat]
}

## tile::CancelRepeat --
#	Halt auto-repeat.
#
proc tile::CancelRepeat {} {
    variable Repeat
    after cancel $Repeat(timer)
}

### Miscellaneous.
#

## tile::CopyBindings $from $to --
#	Utility routine; copies bindings from one bindtag onto another.
#
proc tile::CopyBindings {from to} {
    foreach event [bind $from] {
	bind $to $event [bind $from $event]
    }
}

## tile::LoadImages $imgdir ?$patternList? --
#	Utility routine for pixmap themes
#
#	Loads all image files in $imgdir matching $patternList.
#	Returns: a paired list of filename/imagename pairs.
#
proc tile::LoadImages {imgdir {patterns {*.gif}}} {
    foreach pattern $patterns {
	foreach file [glob -directory $imgdir $pattern] {
	    set img [file tail [file rootname $file]]
	    if {![info exists images($img)]} {
		set images($img) [image create photo -file $file]
	    }
	}
    }
    return [array get images]
}

#*EOF*
