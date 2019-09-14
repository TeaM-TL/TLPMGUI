# -*-Tcl-*-
### TL install
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb4.tcl 302 2007-02-01 14:44:34Z tlu $
####################################### GUI manage installation
ttk::frame $frm4.f
pack $frm4.f 
#######################     row 1

ttk::frame $frm4.f.f1 -relief ridge -borderwidth 2
ttk::label $frm4.f.f1.l -text [mc "Manage the existing TeX Live installation"] \
    -foreground blue -font {helvetica 10 bold}

grid $frm4.f.f1 -row 1 -column 1 -columnspan 2 -padx 2m -pady 2m -sticky nwe
pack $frm4.f.f1.l -padx 10m

#######################     row 2

#### col 1
ttk::labelframe $frm4.f.f21 -text [mc "Refresh the ls-R database"]
set f421 $frm4.f.f21
ttk::button $f421.b -text [mc "Refresh"] -command {
    if {[info exists TEXMFCNF] eq 1} then {
	cursorwait 1
	buttonlock 1
	startprogress 1 inf
	set actioninfo [mc "Refreshing the database ..."]
	# prepare and execute script
	if {$windows eq 1} then {
	    set filecontents "mktexlsr.exe"
	} else {
	    set filecontents "mktexlsr\n"
	}
	writescript $filecontents $filewininst "w+"
	executeprocess [mc "Done"] inf
	buttonlock 0
	cursorwait 0
    } else {
	ttk::messageBox -icon error \
	    -title [mc "Oops"]  \
	    -message [mc "The TEXMFCNF environment variable not found."] \
	    -detail  [mc "Probably TeX Live is not correctly installed."]\
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
}
grid $frm4.f.f21 -row 2 -column 1 -padx 2m -pady 2m -sticky we
pack $f421.b -padx 2m -pady 2m

#### col 2
set titlewindowlang [mc "Edit language.dat"]
set filenamelang "$dirtlroot/texmf-var/tex/generic/config/language.dat"
ttk::labelframe $frm4.f.f22 -text $titlewindowlang
set f422 $frm4.f.f22
ttk::button $f422.b -text [mc "Edit"] -command {
    cursorwait 1
    buttonlock 1
    set titlewindow $titlewindowlang
    set filename $filenamelang
    set dirtexmfvar [file dirname $TEXMFCNF]
    if {[file exists $filename] eq 1} then {
	if {$windows eq 1} then {
	    set filecontents "fmtutil.exe --all"
	} else {
	    set filecontents "fmtutil-sys --all\n"
	}
	source $filegui4edit
    } else {
	ttk::messageBox -icon error \
	    -title [mc "Oops"]  \
	    -message [mc "File \"%s\" not found." $filename] \
	    -detail  [mc "Probably TeX Live is not correctly installed."]\
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
    buttonlock 0
    cursorwait 0
}
grid $frm4.f.f22 -row 2 -column 2  -padx 2m -pady 2m -sticky we
pack $f422.b -padx 2m -pady 2m

#######################     row 3

#### col 1
ttk::labelframe $frm4.f.f31 -text [mc "Creating formats"]
set f431 $frm4.f.f31
ttk::button $f431.b1 -text [mc "All"] -command {
    cursorwait 1
    buttonlock 1
    startprogress 1 inf
    # prepare and execute script
    if {$windows eq 1} then {
	set filecontents "fmtutil.exe --all"
    } else {
	set filecontents "fmtutil-sys --all\n"
    }
    writescript $filecontents $filewininst "w+"
    executeprocess [mc "Done"] inf
    buttonlock 0
    cursorwait 0
}
ttk::button $f431.b2 -text [mc "Missing"] -command {
    cursorwait 1
    buttonlock 1
    startprogress 1 inf
    # prepare and execute script
    if {$windows eq 1} then {
	set filecontents "fmtutil.exe --missing"
    } else {
	set filecontents "fmtutil-sys --missing\n"
    }
    writescript $filecontents $filewininst "w+"
    executeprocess [mc "Done"] inf
    buttonlock 0
    cursorwait 0
}
grid $frm4.f.f31 -row 3 -column 1 -rowspan 2 -padx 2m -pady 2m -sticky nswe
pack $f431.b1 $f431.b2 -side top -padx 2m -pady 2m -fill y


#### col 2
set filenamefmt "$dirtlroot/texmf-var/web2c/fmtutil.cnf"
set titlewindowfmt [mc "Editing fmtutil.cnf"]
ttk::labelframe $frm4.f.f32 -text "$titlewindowfmt"
set f432 $frm4.f.f32
ttk::button $f432.b -text [mc "Edit"] -command {
    set titlewindow $titlewindowfmt
    set filename $filenamefmt
    set dirtexmfvar [file dirname TEXMFCNF]
    cursorwait 1
    buttonlock 1
    if {[file exists $filename] eq 1} then {
	if {$windows eq 1} then {
	    set filecontents "fmtutil.exe --all"
	} else {
	    set filecontents "fmtutil-sys --all\n"
	}
	source $filegui4edit
    } else {
	ttk::messageBox -icon error \
	    -title [mc "Oops"]  \
	    -message [mc "File \"%s\" not found." $filename] \
	    -detail  [mc "Probably TeX Live is not correctly installed."]\
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
    buttonlock 0
    cursorwait 0
}
grid $frm4.f.f32 -row 3 -column 2  -padx 2m -pady 2m -sticky we
pack $f432.b -padx 2m -pady 2m


#######################     row 4
### col 1 empty

### col 2
set filenameupd "$dirtlroot/texmf-var/web2c/updmap.cfg"
set titlewindowupd [mc "Editing updmap.cfg"]
ttk::labelframe $frm4.f.f42 -text $titlewindowupd
set f442 $frm4.f.f42
ttk::button $f442.b -text [mc "Edit"] -command {
    buttonlock 1
    set titlewindow $titlewindowupd
    set filename $filenameupd
    set dirtexmfvar [file dirname $TEXMFCNF]
    if {[file exists $filename] eq 1} then {
	if {$windows eq 1} then {
	    set filecontents "updmap.exe"
	} else {
	    set filecontents "updmap-sys\n"
	}
	source $filegui4edit
    } else {
	ttk::messageBox -icon error \
	    -title [mc "Oops"]  \
	    -message [mc "File \"%s\" not found." $filename] \
	    -detail  [mc "Probably TeX Live is not correctly installed."]\
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
    buttonlock 0
    cursorwait 0
}
grid $frm4.f.f42 -row 4 -column 2  -padx 2m -pady 2m -sticky we
pack $f442.b -padx 2m -pady 2m
#######################     row 5
### col 1+2
if {$windows ne 1} then {
    ttk::labelframe $frm4.f.f51 -text [mc "Run texconfig"]
    set f451 $frm4.f.f51
    ttk::button $f451.b1 -text "texconfig-sys" -command {
	buttonlock 1
	cursorwait 1
	set actioninfo [mc "Running texconfig ..."]
	set filecontents "xterm -e texconfig-sys"
	writescript $filecontents $filewininst "w+"
	executeprocess 0 inf
	buttonlock 0
	cursorwait 0
    }
    ttk::button $f451.b2 -text "texconfig" -command {
	buttonlock 1
	cursorwait 1
	set actioninfo [mc "Running texconfig ..."]
	set filecontents "xterm -e texconfig"
	writescript $filecontents $filewininst "w+"
	executeprocess 0 inf
	buttonlock 0
	cursorwait 0
    }
    grid $frm4.f.f51 -row 5 -column 1 -columnspan 2 \
	-padx 2m -pady 2m -sticky we
    grid $f451.b1 $f451.b2 -padx 5m -pady 2m 
}

# EOF
