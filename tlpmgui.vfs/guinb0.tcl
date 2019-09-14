#! -*-Tcl-*-
### TL install
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb0.tcl 302 2007-02-01 14:44:34Z tlu $
####################################### GUI installrun from DVD
ttk::frame $frm0.f 
pack $frm0.f

#######################     row 1
ttk::frame $frm0.f.f1 -relief ridge -borderwidth 2
ttk::label $frm0.f.f1.l -text [mc "Setting environment variables for running from DVD"] \
    -foreground blue -font {helvetica 10 bold}
grid $frm0.f.f1 -row 1 -column 1  -padx 2m -pady 2m -sticky nwe
pack $frm0.f.f1.l 

#######################     row 2  
## setup

ttk::labelframe $frm0.f.f2 -text [mc "Setting the environment"]
grid $frm0.f.f2 -row 2 -column 1 -padx 2m -pady 2m -sticky we

ttk::button $frm0.f.f2.b -text [mc "Set"] -command {
    # lock other buttons
    $f21.b1 configure -state disabled
    $f21.b2 configure -state disabled
    $f24.b2 configure -state disabled
    $f24.cb2 configure -state disabled
    $f33.b  configure -state disabled
    $f33.b1 configure -state disabled
    .fn.b2  configure -state disabled
    $frm0.f.f2.b configure -state disabled
    source $filewinpostinstall
    ### Final
    set actioninfo ""
    set finalTitle [mc "Installation is finished"]
    set finalMessage "[mc "TeX Live has been sucessfully installed in your system"]\n\n[mc "Press \"OK\" to exit"]"
    set finalIcon info
    
    ttk::messageBox -buttons [list ok] \
	-icon $finalIcon \
	-title $finalTitle \
	-message $finalMessage \
	-detail $message
	
    .fn.b2 configure -state normal
    source $filedelete
    exit
}

pack $frm0.f.f2.b  -fill y -expand 1 \
    -padx 2m -pady 2m -anchor center -side left


## EOF