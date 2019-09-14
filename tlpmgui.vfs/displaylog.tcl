#  -*-Tcl-*-
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: displaylog.tcl 251 2007-01-15 00:30:19Z tlu $
## display log
## invoke from executetlpm (log) and gui (help)
if [winfo exists .log] then { 
    destroy .log 
}

toplevel .log
wm title .log $titlewindow

ttk::frame .log.f
pack .log.f -fill both -pady 2m
#######################     row 1
## label
ttk::label .log.f.l -text $subtitlewindow  -font {helvetica 10 bold}
grid .log.f.l -row 1 -column 1 -sticky nwe -padx 2m 
    
######################      row 2
## text
ttk::frame .log.f.f
grid .log.f.f -row 2 -column 1 -padx 2m  -pady 2m 

ctext .log.f.f.t -relief sunken -bd 2\
    -yscrollcommand ".log.f.f.scry set" -setgrid 1\
    -width 80 -height 35 -wrap word  -autosep 1 
ttk::scrollbar .log.f.f.scry -command ".log.f.f.t yview" -orient vertical
pack .log.f.f.scry -side right -fill y
pack .log.f.f.t -expand yes -fill both

# autohide scrollbar
::autoscroll::autoscroll .log.f.f.scry
# syntax highlight
ctext::addHighlightClassForRegexp .log.f.f.t log blue {^\#\ [^ ]+\ [^ ]+\ [^ ]+\ }
#######################    row 3
## button
ttk::button .log.f.b -text [mc "Close"] -command { destroy .log }
grid .log.f.b -row 3 -column 1

#######################
## read log file
set logcontents [readscriptall $filetodisplay]
.log.f.f.t insert end $logcontents

#################
## focus
bind .log <Motion> {focus %W}
focus .log.f.b
 
## EOF