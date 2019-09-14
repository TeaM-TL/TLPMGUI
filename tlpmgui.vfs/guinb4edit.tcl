# -*-Tcl-*-
### TL install
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb4edit.tcl 250 2007-01-14 23:36:09Z tlu $
	    
# Edit file filename and execute script
set filehandle [open $filename r]
set contents [read $filehandle]
close $filehandle

toplevel .edit
wm title .edit $titlewindow 
ttk::frame .edit.buttons
pack .edit.buttons -side bottom -fill x -pady 2m
ttk::button .edit.buttons.cancel -text [mc "Cancel"] -command {
    destroy .edit
}
ttk::button .edit.buttons.done -text [mc "Done"]  -command {
    cursorwait 1
    buttonlock 1
    startprogress 1 inf
    set contents [.edit.text get 0.0 end]
    writescript $contents $filename "w+"
    destroy .edit
    # prepare script
    writescript $filecontents $filewininst "w+"
    # exec tlpm.bat
    executeprocess [mc "File \"%s\" succesfully saved" $filename] inf
    cursorwait 0
    buttonlock 0
}
pack .edit.buttons.cancel .edit.buttons.done -side left -expand 1

ctext .edit.text -relief sunken -bd 2 \
    -yscrollcommand ".edit.scroll set" -setgrid 1 \
    -height 30 -width 100 -undo 1 -wrap word  -autosep 1
ttk::scrollbar .edit.scroll -command ".edit.text yview"
pack .edit.scroll -side right -fill y
pack .edit.text -expand yes -fill both
.edit.text insert 0.0 $contents

# Grab focus for this window
focus .edit.text
grab .edit
# autohide scrollbar
::autoscroll::autoscroll .edit.scroll
# syntax highlight
ctext::addHighlightClassForRegexp .edit.text map1 blue {^Map[^\n\r]*}
ctext::addHighlightClassForRegexp .edit.text map2 blue {^MixedMap[^\n\r]*}

ctext::addHighlightClassForRegexp .edit.text comments1 brown {\%[^\n\r]*}
ctext::addHighlightClassForRegexp .edit.text comments2 brown {\#[^\n\r]*}

#EOF
