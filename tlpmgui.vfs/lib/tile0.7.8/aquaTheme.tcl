#
# $Id: aquaTheme.tcl,v 1.17 2006/07/09 18:59:31 jenglish Exp $
#
# Tile widget set: Aqua theme (OSX native look and feel)
#
#
# TODO: panedwindow sashes should be 9 pixels (HIG:Controls:Split Views)
#

namespace eval tile {

    style theme settings aqua {

	style configure . \
	    -font System \
	    -background White \
	    -foreground Black \
	    -selectbackground SystemHighlight \
	    -selectforeground SystemHighlightText \
	    -selectborderwidth 0 \
	    -insertwidth 1 \
	    ;
	style map . \
	    -foreground [list  disabled "#a3a3a3"  background "#a3a3a3"] \
	    -selectbackground [list background "#c3c3c3"  !focus "#c3c3c3"] \
	    -selectforeground [list background "#a3a3a3"  !focus "#000000"] \
	    ;

	# Workaround for #1100117:
	# Actually, on Aqua we probably shouldn't stipple images in
	# disabled buttons even if it did work...
	#
	style configure . -stipple {}

	style configure TButton -padding {0 2} -width -6
	style configure Toolbutton -padding 4
	# See Apple HIG figs 14-63, 14-65
	style configure TNotebook -tabposition n -padding {20 12}
	style configure TNotebook.Tab -padding {10 2 10 2}

	# Enable animation for ttk::progressbar widget:
	style configure TProgressbar -period 100 -maxphase 255

	# Modify the the default Labelframe layout to use generic text element
	# instead of Labelframe.text; the latter erases the window background
	# (@@@ this still isn't right... want to fill with background pattern)

	style layout TLabelframe {
	    Labelframe.border
	    text
	}
	#
	# For Aqua, labelframe labels should appear outside the border,
	# with a 14 pixel inset and 4 pixels spacing between border and label
	# (ref: Apple Human Interface Guidelines / Controls / Grouping Controls)
	#
    	style configure TLabelframe \
		-labeloutside true -labelmargins {14 0 14 4}
    }
}
