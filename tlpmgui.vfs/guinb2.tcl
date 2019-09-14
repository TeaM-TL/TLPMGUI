# -*-Tcl-*-
### TL install packages
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb2.tcl 350 2007-02-06 11:21:49Z tlu $
####################################### GUI add packages
ttk::frame $frm2.f
pack $frm2.f 
#######################     row 1

ttk::frame $frm2.f.f1 -relief  ridge -borderwidth 2
ttk::label $frm2.f.f1.l -text [mc "Adding packages"] \
    -foreground blue -font {helvetica 10 bold}
ttk::label $frm2.f.f1.l1 -text [mc "Use Ctrl or Shift or drag to select more"]
grid $frm2.f.f1 -row 1 -column 1 -columnspan 3 -padx 2m -pady 2m -sticky nwe
pack $frm2.f.f1.l $frm2.f.f1.l1  -side top

#######################     row 2 col 1
# listbox: packages
ttk::labelframe $frm2.f.f21 -text [mc "Select packages to install"]
set f221 $frm2.f.f21
grid $frm2.f.f21 -row 2 -column 1 -rowspan 2 \
    -sticky nswe -padx 2m -pady 1m
# search field
ttk::frame $f221.f
pack $f221.f -pady 1m
ttk::label $f221.f.l -text [mc "Search"]
ttk::entry $f221.f.e -validate key -validatecommand {
    set searchListAdd [ $f221.lb get 0 end]
    set listPositionAdd [lsearch $searchListAdd " %P*"]
    if {$listPositionAdd ne -1} then {
	$f221.lb yview $listPositionAdd
	$f221.lb selection set $listPositionAdd
    }
    return 1
}
ttk::button $f221.f.b -text [mc "Next"] -command {
    set searchListAdd [$f221.lb get 0 end]
    set searchStringAdd [$f221.f.e get] 
    append searchStringAdd "*"
    set listPositionAdd [lsearch -start [incr listPositionAdd] $searchListAdd " $searchStringAdd"]
    if {$listPositionAdd ne -1} then {
	$f221.lb yview $listPositionAdd
	$f221.lb selection set $listPositionAdd
    }
}
pack $f221.f.l $f221.f.e $f221.f.b -anchor w -side left -padx 1m -pady 1m
tooltip::tooltip $f221.f.e [mc "Enter starting chars of the package name to speed-up the search"]
# listbox
# for stupid windows :-(
if {$windows eq 1} then {
    set listboxheight 25
} else {
    set listboxheight 24
}

listbox $f221.lb -width 40 -height $listboxheight \
    -selectmode extended \
    -yscrollcommand "$f221.scry set"  \
    -xscrollcommand "$f221.scrx set" 
ttk::scrollbar $f221.scrx -command "$f221.lb xview" -orient horizontal 
ttk::scrollbar $f221.scry -command "$f221.lb yview" -orient vertical
pack $f221.scrx -side bottom -fill x
pack $f221.scry -side right -fill y
pack $f221.lb -fill y -expand 1
# autohide scrollbar
::autoscroll::autoscroll $f221.scrx
######################   row2 col 2
# Buttons
ttk::labelframe $frm2.f.f22 -text [mc "Buttons"]
set f222 $frm2.f.f22

grid $frm2.f.f22 -row 2 -column 2 -rowspan 2 \
    -sticky nswe -pady 1m

## Search
ttk::button $f222.b1 -text [mc "Search"] -command {
    # to_install = all - installed
    if {[file exists $dircd/texmf]} then {
	if {[info exists TEXMFCNF] eq 1} then {
	    source $filesearchpkgtoinst
	} else {
	    ttk::messageBox -icon error \
		-title [mc "Oops"]  \
		-message [mc "The TEXMFCNF environment variable not found."] \
		-detail  [mc "Probably TeX Live is not correctly installed."]\
		-buttons [list ok] \
		-labels [list ok "Ok"]
	}
    } else {
	ttk::messageBox -icon error \
	    -title [mc "Error"] \
	    -message [mc "Wrong path to the TeX Live directory."] \
	    -detail  [mc "Try again.\nPress the CD/DVD button to select the proper path."] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]   
    }
}
## Install
ttk::button $f222.b2 -text [mc "Install"] -command {
    cursorwait 1
    buttonlock 1
    set pkg ""
    foreach k [lsort [$f221.lb curselection]] {
	append pkg [$f221.lb get $k] ", "
    }
    if {$pkg eq "" } then {
	ttk::messageBox -icon error \
	    -title [mc "Adding packages"] \
	    -message [mc "Empty selection!"] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    } else {
	### remove last space and colon
	set pkg  [string range $pkg 0 end-2]
	set answer [ttk::messageBox  -type yesno -icon question \
			-title [mc "Adding packages"] \
			-message [mc "Are you sure to install the selected packages?"] \
			-detail $pkg \
			-labels [list yes [mc "yes"] no [mc "no"]] ]
	if {$answer eq "yes"} then {
	    set actioninfo [mc "Installing packages ..."]
	    startprogress 1 inf
	    ### remove space and split string into list
	    set pkg [split [string map {{ } {}} $pkg]  ","]
	    ### prepare script for tlpm
	    set filecontents "inst [join $pkg "\ninst "]"
	    set testperlgs $filecontents
	    writescript $filecontents $filebatch "w+"
	    ### script for run tlpm
	    if {$windows eq 1} then {
		set filecontents "\"[file nativename $tlpm]\" -s \'[file nativename $dircd]\' -b \'[file nativename $filebatch]\' -d \'[file nativename $dirtlroot]\'"
	    } else {
		set filecontents "[file nativename $tlpm] -s [file nativename $dircd] -b [file nativename $filebatch] -d [file nativename $dirtlroot]"
	    }
	    writescript $filecontents $filewininst "w+"
	    ### execute tlpm
	    executeprocess 0 normal
	    ### postinstall action
	    set actioninfo [mc "Postinstall actions ..."]
	    ### progressbar
	    startprogress 1 inf
	    if {$windows eq 1} then {
		## Perl
		if { [catch {ini::open [file nativename [file join $cwd tlpmgui.ini]]} inifilehandle ]} then {
		    ttk::messageBox -title [mc "File reading failed!"] \
			-message [mc "Read of the %s  file failed!\nCheck the file permissions and whether it exist." tlpmgui.ini] \
			-type ok \
			-icon error
		} else {
		    if [ ::ini::exists $inifilehandle WINDOWS_TOOLS ENV_PERL ] {
			set ENVPERL [ ::ini::value $inifilehandle WINDOWS_TOOLS ENV_PERL ]
		    }
		    if [ ::ini::exists $inifilehandle WINDOWS_TOOLS PKG_PERL ] {
			set PKGPERL [ ::ini::value $inifilehandle WINDOWS_TOOLS PKG_PERL ]
		    }
		    if [ ::ini::exists $inifilehandle WINDOWS_TOOLS DVD ] {
			set DVD [ ::ini::value $inifilehandle WINDOWS_TOOLS DVD ]
		    } else {
			set DVD 0
		    }
		    ini::close $inifilehandle
		}
		## environment variables
		if { [string first "collection-perl" $testperlgs ] ne -1} then {
		    if {$tcl_platform(os) eq "Windows NT"} then {
			if {[catch {info exists $env(PERL5LIB)}] eq 0} then {
			    set answer [ttk::messageBox  -type yesno -icon warning \
					    -title [mc "Warning"] \
					    -message [mc "The environment variable \"%s\" exists.\nAre you sure to replace it?" PERL5LIB] \
					    -detail [mc "Current value:\n%s=%s" PERL5LIB $env(PERL5LIB)] \
					    -labels [list yes [mc "yes"] no [mc "no"]]]
			    if {$answer eq "yes"} then {
				set ENVPERL 1
			    } else {
				set ENVPERL 0
			    }
			} else {
			    set ENVPERL 1
			}
			set PKGPERL 1
			if {$ENVPERL eq 1} then {
			    # For Current User
			    set regPath {HKEY_CURRENT_USER\Environment}
			    if {[catch {registry get $regPath "TLroot"}]} then {
				# For All users
				set regPath {HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment}
			    }
			    registry set $regPath "PERL5LIB" "[file nativename $dirtlroot/xemtex/perl/lib];[file nativename $dirtlroot/xemtex/perl/site/lib]"
			    registry broadcast "Environment"
			} else {
			    set PKGPERL 0
			    set ENVPERL 0
			}
		    }
		} 
		# Write into INI file
		source $fileiniwrite
	    }
	    # glueing language.dat from scratch :-)
	    source $filegluelang
	    # updmap.cfg
	    source $fileupdmap
	    set actioninfo [mc "Refreshing the database ..."]
	    #
	    if {$windows eq 1} then {
		set filecontents "mktexlsr.exe"
	    } else {
		set filecontents "mktexlsr"
	    }
	    writescript $filecontents $filewininst "w+"
	    executeprocess 0 inf
	    set actioninfo [mc "Setting RW attributes ..."]
	    if {$windows eq 1} then {
		#remove attribute RO from TLroot directory, subdirectories and files
		set filecontents "attrib -R /D /S [file nativename [file join $dirtlroot *.*]]"
	    } else {
		set filecontents "chmod -R u+w [file nativename $dirtlroot]"
	    }
	    writescript $filecontents $filewininst "w+"
	    executeprocess 0 inf
	    # refresh list
	    source $filesearchpkgtoinst
	    ttk::messageBox -icon info \
		-title [mc "Done"] \
	    -message [mc "Packages installed successfully."] \
	    -detail [mc "Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package."] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
	}
    }
    startprogress 0 inf
    buttonlock 0
    cursorwait 0
}

## Info
ttk::button $f222.b3 -text [mc "Info"] -command {
    cursorwait 1
    buttonlock 1
    set pkg ""
    foreach k [lsort [$f221.lb curselection]] {
	append pkg [$f221.lb get $k] ", "
    }
    if {$pkg eq "" } then {
	startprogress 0 inf
	ttk::messageBox -icon error \
	    -title [mc "Adding packages"] \
	    -message [mc "Empty selection!"] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    } else {
	startprogress 1 inf
	$f233.t delete 0.0 end
	$f233.t insert end [pkginfo]
	startprogress 0 inf
    }
    buttonlock 0
    cursorwait 0
}
tooltip::tooltip $f222.b1 [mc "Searches for not installed packages"]
tooltip::tooltip $f222.b2 [mc "Installs selected packages"]
tooltip::tooltip $f222.b3 [mc "Info on the selected package"]

pack $f222.b1 $f222.b2 $f222.b3 \
    -side top -anchor center -padx 2m -pady 2m

########################    row 2 col 3
## CD-ROM
ttk::labelframe $frm2.f.f23 -text "CD/DVD"
set f223 $frm2.f.f23
grid $frm2.f.f23 -row 2 -column 3 -sticky nswe -padx 2m -pady 1m

## CD-ROM
ttk::button $f223.b  -text "CD/DVD" \
    -command {selectAndLoadDir 1; set dircd $dirname}
tooltip::tooltip $f223.b [mc "Selects the path/drive with TeX Live %s" $TEXLIVE]
ttk::label  $f223.l -width 30 -textvariable dircd -relief sunken -anchor w
pack $f223.b -side left -padx 2m -pady 2m
pack $f223.l -side left -padx 2m -pady 2m -expand 1 -fill x

#######################     row 3 col 3
## text: info
ttk::labelframe $frm2.f.f33 -text [mc "Info on the selected item"]
set f233 $frm2.f.f33
grid $frm2.f.f33 -row 3 -column 3 -sticky nswe -padx 2m -pady 1m

ctext $f233.t -width 65  -linemap no -wrap word \
    -yscrollcommand "$f233.scry set" 
$f233.t insert end [mc "\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."]
ttk::scrollbar $f233.scry -command "$f233.t yview" -orient vertical
pack $f233.scry -side right -fill y
pack $f233.t  -expand 1 -fill y

# autohide scrollbar
#::autoscroll::autoscroll $f233.scry

# syntax highlight
ctext::addHighlightClassForRegexp $f233.t title blue {^Title[^\n\r]*}
# syntax highlight
ctext::addHighlightClassForRegexp $f233.t descr blue {Description}

# EOF
