# -*-Tcl-*-
### TL gui
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
## $Id: gui.tcl 324 2007-02-03 13:01:57Z tlu $
####################################### GUI
wm title . [mc "TeX Live installation and maintenance utility, %s" $RELEASE]

ttk::frame .f -borderwidth 2m
pack .f -fill both -expand 1

###############################
## status bar
ttk::frame .fs -relief ridge -borderwidth 2
pack .fs -fill x -ipadx 2m

## info about action
ttk::label .fs.info -textvariable actioninfo
## status label
ttk::label .fs.wait -foreground red -font {helvetica 10 bold}
#pack  -anchor w -padx 2m -side left
pack .fs.wait .fs.info -anchor w -side left -padx 2m -pady 3

## progressbar
set progressnormal 0
set progresswidth 300
ttk::progressbar .fs.pb -variable progressnormal \
    -maximum 100 -orient horizontal -length $progresswidth
pack .fs.pb -anchor e  -side right  -expand 1 -fill y

## percent of progress
ttk::label .fs.percent -textvariable percent -justify right
pack .fs.percent -anchor e -side left -padx 2m

# DVD or CD
if {[file exists $dircd/00LIVE.TL]} then {
    set dvd 1
} else { 
    set dvd 0
}

##############################
ttk::notebook .f.nb
if {[info exists TLroot] ne 1} then {
    if {$windows eq 1} then {
	if {$dvd eq 1} then {
	    set frm0 [ttk::frame .f.nb.frm0]
	    .f.nb add .f.nb.frm0 -text [mc "Run from DVD"]
	    source "$filegui0"
	    set dvdtab 1
	} else {
	    set dvdtab 0
	}
    }
    set frm1 [ttk::frame .f.nb.frm1]
    .f.nb add .f.nb.frm1 -text [mc "Installation"]
    source "$filegui1"
    .f.nb select $frm1
} else {
    set frm2 [ttk::frame .f.nb.frm2]
    .f.nb add .f.nb.frm2 -text [mc "Adding packages"]
    source "$filegui2"
    set frm3 [ttk::frame .f.nb.frm3]
    .f.nb add .f.nb.frm3 -text [mc "Removing packages"]
    source "$filegui3"
    set frm4 [ttk::frame .f.nb.frm4]
    .f.nb add .f.nb.frm4 -text [mc "Manage the installation"]    
    source "$filegui4"
    set frm5 [ttk::frame .f.nb.frm5]
    .f.nb add .f.nb.frm5 -text [mc "Removing the installation"]
    source "$filegui5"
    .f.nb select $frm2
}
pack .f.nb
#enable keyboard traversal for a dialog box
ttk::notebook::enableTraversal .f.nb

#####################################
##  help and quit button
ttk::frame .fn
pack .fn -fill x -pady 1m
## authors :-)
ttk::label .fn.info -foreground blue  \
	-text "(c) 2005-2007 TeX Live package manager GUI team  http://www.gust.org.pl"
ttk::button .fn.b1 -text [mc "Help"] -command {help}
ttk::button .fn.b2 -text [mc "Exit"] -command {
    source $filedelete
    exit
}

pack .fn.info .fn.b1 .fn.b2 -fill y -expand 1 \
    -anchor center -side left

######################################

## binding

## Open help after F1 keypresed
bind . <F1> {help}

## for focus on current widget
bind all <MouseWheel> "+wheelEvent %X %Y %D y"
bind all <MouseWheel> "+wheelEvent %X %Y %D x"

# for debug only, display path
bind . <F4> {
    if {$windows eq 1} then {
	set debugInfo 1
	console show
    } else {
	set debugInfo 1
    }
}
bind . <F8> {source $filedebug}
bind . <F9> {source $filedebug}
# display log
bind . <F10> {
    set filetodisplay $filewinlog
    set titlewindow [mc "Contents of %s" $filetodisplay]
    set subtitlewindow [mc "Contents of the %s file:" $filetodisplay]
    source $filedisplaylog  
}
# display errorlog
bind . <F11> {
    set filetodisplay $filewinerrlog
    set titlewindow [mc "Contents of %s" $filetodisplay]
    set subtitlewindow [mc "Contents of the %s file:" $filetodisplay]
    source $filedisplaylog  
}
# display ChangeLog
bind . <F12> {
    set filetodisplay $filechangelog
    set titlewindow Changelog
    set subtitlewindow Changelog
    source $filedisplaylog  
}
## EOF