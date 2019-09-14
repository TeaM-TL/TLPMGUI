# -*-Tcl-*-
### TL install
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb1.tcl 302 2007-02-01 14:44:34Z tlu $
####################################### GUI install
#######################     row 1
ttk::frame $frm1.f -relief ridge -borderwidth 2

ttk::label $frm1.f.l -text [mc "Installation of the TeX Live %s edition" $TEXLIVE] -foreground blue -font {helvetica 10 bold}
grid $frm1.f -row 1 -column 1 -columnspan 4 -padx 2m -pady 2m -sticky nwe
pack $frm1.f.l 

#######################     row 2  
## main customization
ttk::labelframe $frm1.f21 -text [mc "Main customization"]
set f21 $frm1.f21
grid $frm1.f21 -row 2 -column 1 -columnspan 2 -pady 0m -padx 2m -sticky nswe

ttk::label $f21.l1 -text [mc "Standard collections"]
ttk::button $f21.b1 -text [mc "Select"] -command {source $filegui1col}

ttk::label $f21.l2 -text [mc "Language collections"]
ttk::button $f21.b2 -text [mc "Select"] -command {source $filegui1lang}

pack $f21.l1 $f21.b1 $f21.l2 $f21.b2 \
    -side left -padx 2m -pady 2m

#### buttons Install and Help
ttk::labelframe $frm1.f24 -text [mc "Install"]
set f24 $frm1.f24
grid $frm1.f24 -row 2 -column 3 -columnspan 2 -padx 2m -pady 0m -sticky we

ttk::button $f24.b2 -text [mc "Install"] -command {
    if {$tlpmerror eq 0} then {
	set answer [ttk::messageBox  -type yesno -icon question \
			-title [mc "Confirm to install"] \
			-message [mc "Are you sure to install TeX Live?"] \
		       -labels [list yes [mc "yes"] no [mc "no"]]]
	if {$answer eq "yes"} then {
	    source $filewininstall
	}
    } else {
	ttk::messageBox -icon error \
	    -title [mc "Error"] \
	    -message [mc "tlpm not found"]\
	    -buttons [list ok] \
	    -labels [list ok "Ok"] \
	    -detail [mc "tlpm is needed for installing TeX Live and adding/removing packages"]
    }
}
pack $f24.b2  -expand 1 -padx 2m -pady 2m -anchor center -side left
set admin 0
if {$windows eq 1} then {
    ttk::checkbutton $f24.cb2 -variable admin \
	-text [mc "Install for all users\n(administrator privileges required)"]

    pack  $f24.cb2 -expand 1 \
	-padx 2m -pady 2m -anchor center -side left
}

###################### row 3
## Scheme selection 
ttk::labelframe $frm1.f31 -text [mc "Select a scheme"]
set f31 $frm1.f31
grid $frm1.f31 -row 3 -column 1 -rowspan 2 \
       -pady 2m -padx 2m -sticky nswe 

## search and list scheme
source $filesearchscheme

## Binaries selection
## need rework for automatically search binaries same as scheme
##
ttk::labelframe $frm1.f32 -text [mc "Select a system"]
set f32 $frm1.f32
grid $frm1.f32 -row 3 -column 2  -rowspan 2 \
    -pady 2m -padx 2m -sticky nswe
source $filesearchbin

############# Directories
ttk::labelframe $frm1.f33 -text [mc "Directories"]
set f33 $frm1.f33
grid $frm1.f33 -row 3 -column 3 -columnspan 2 -pady 2m -padx 2m -sticky nswe

## CD-ROM
ttk::label  $f33.l -width 30 -textvariable dircd -relief sunken -anchor w
ttk::button $f33.b -text "CD/DVD" -command {
    selectAndLoadDir 1
    set dircd $dirname
    source $filesearchscheme
    if [info exists binnum] then {
	for {set i 1} {$i <= $binnum} {incr i} {
	    destroy $f32.cb$i
	}
    }
    # DVD or CD
    if {[file exists $dircd/00LIVE.TL]} then {
	set dvd 1
    } else { 
	set dvd 0
    }
    source $filesearchbin
}
tooltip::tooltip $f33.b [mc "Selects the path/drive with TeX Live %s" $TEXLIVE]
grid $f33.b  -row 1 -column 1 -padx 2m -pady 2m -sticky we 
grid $f33.l  -row 1 -column 2 -padx 2m -pady 2m -sticky we

## TLroot
ttk::label  $f33.l1 -width 30 -textvariable dirtlroot -relief sunken -anchor w
ttk::button $f33.b1 -text "TLroot" -command {
    selectAndLoadDir 0
    set dirtlroot $dirname
    set dirtexmftemp [file join $dirtlroot temp]
    set dirtexmfcnf [file join $dirtlroot texmf-var web2c]
}
tooltip::tooltip $f33.b1 [mc "Selects the destination directory of the TeX Live installation"]
grid $f33.b1 -row 2 -column 1 -padx 2m -pady 2m -sticky we
grid $f33.l1 -row 2 -column 2 -padx 2m -pady 2m -sticky we

# ## TEXMFTEMP
# ttk::label  $f33.l2 -width 30 -textvariable dirtexmftemp -relief sunken -anchor w
# ttk::button $f33.b2 -text "TEXMFTEMP" \
#     -command {selectAndLoadDir 0 ; set dirtexmftemp $cwd}

# grid $f33.b2 -row 3 -column 1 -padx 2m -pady 2m -sticky we
# grid $f33.l2 -row 3 -column 2 -padx 2m -pady 2m -sticky we
# if {$windows ne 1} then {$f33.b2 configure -state disabled}
# ## TEXMFCNF
# ttk::label  $f33.l3 -width 30 -textvariable dirtexmfcnf -relief sunken -anchor w
# ttk::button $f33.b3 -text "TEXMFCNF" \
#     -command {selectAndLoadDir 0 ; set dirtexmfcnf $cwd}

# grid $f33.b3 -row 4 -column 1 -padx 2m -pady 2m -sticky we
# grid $f33.l3 -row 4 -column 2 -padx 2m -pady 2m -sticky we
# if {$windows ne 1} then {$f33.b3 configure -state disabled}
##################### row 4
## logo
ttk::frame $frm1.f41 
set f41 $frm1.f41
grid $frm1.f41 -row 4 -column 3 -columnspan 2 -pady 2m -padx 2m -sticky nswe
 
set imagelogo [image create photo -format GIF -file [file join $sourcedir logotug.gif]]
canvas $f41.c -width 300 -height 292
$f41.c create image 150 146 -image $imagelogo

grid $f41.c -sticky ns
## EOF
