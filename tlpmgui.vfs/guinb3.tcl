# -*-Tcl-*-
### TL remove packages
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb3.tcl 350 2007-02-06 11:21:49Z tlu $
####################################### GUI remove packages
ttk::frame $frm3.f
pack $frm3.f -expand 1 -fill x -anchor n
#######################     row 1

ttk::frame $frm3.f.f1 -relief  ridge -borderwidth 2
ttk::label $frm3.f.f1.l -text [mc "Removing packages"] \
    -foreground blue -font {helvetica 10 bold}
ttk::label $frm3.f.f1.l1 -text [mc "Use Ctrl or Shift or drag to select more"]

grid $frm3.f.f1 -row 1 -column 1 -columnspan 3 -padx 2m -pady 2m -sticky nwe
pack $frm3.f.f1.l $frm3.f.f1.l1 -side top

#######################     row 2 col 1
# list of packages
ttk::labelframe $frm3.f.f21 -text [mc "Select packages for removal"]
set f321 $frm3.f.f21
grid $frm3.f.f21 -row 2 -column 1 -sticky nswe -padx 2m -pady 1m
# search field
ttk::frame $f321.f
pack $f321.f -pady 1m
ttk::label $f321.f.l -text [mc "Search"]
ttk::entry $f321.f.e -validate key -validatecommand {
    set searchListRm [$f321.lb get 0 end]
    set listPositionRm [lsearch $searchListRm " %P*"]
    if {$listPositionRm ne -1} then {
	$f321.lb yview $listPositionRm
	$f321.lb selection set $listPositionRm
    }
    return 1
}
ttk::button $f321.f.b -text [mc "Next"] -command {
    set searchListRm [$f321.lb get 0 end]
    set searchStringRm [$f321.f.e get] 
    append searchStringRm "*"
    set listPositionRm [lsearch -start [incr listPositionRm] $searchListRm " $searchStringRm" ]
    if {$listPositionRm ne -1} then {
	$f321.lb yview $listPositionRm
	$f321.lb selection set $listPositionRm
    }
}
pack  $f321.f.l $f321.f.e $f321.f.b -anchor w -side left -padx 1m -pady 1m
tooltip::tooltip $f321.f.e [mc "Enter starting chars of the package name to speed-up the search"]
# listbox
# for stupid windows :-(
if {$windows eq 1} then {
    set listboxheight 25
} else {
    set listboxheight 24
}
listbox $f321.lb -width 40 -height $listboxheight \
    -selectmode extended \
    -yscrollcommand "$f321.scry set"  \
    -xscrollcommand "$f321.scrx set"
ttk::scrollbar $f321.scrx -command "$f321.lb xview" -orient horizontal 
ttk::scrollbar $f321.scry -command "$f321.lb yview" -orient vertical
pack $f321.scrx -side bottom -fill x
pack $f321.scry -side right -fill y
pack $f321.lb -fill y  -expand 1
# autohide scrollbar
::autoscroll::autoscroll $f321.scrx
######################   row2 col 2
# buttons
ttk::labelframe $frm3.f.f22 -text [mc "Buttons"]
set f322 $frm3.f.f22
grid $frm3.f.f22 -row 2 -column 2 -sticky nswe -pady 1m

ttk::button $f322.b1 -text [mc "Search"] -command {
    if {[info exists TEXMFCNF] eq 1} then {
	if {[file exists $dircd/texmf]} then {
	    source $filesearchpkgtoinst
	} else {
	    source $filesearchpkgtodel
	}
    } else {
	ttk::messageBox  -icon error \
	    -title [mc "Oops"] \
	    -message [mc "The TEXMFCNF environment variable not found."] \
	    -detail [mc "Probably TeX Live is not correctly installed."] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    }
}
ttk::button $f322.b2 -text [mc "Remove"] -command {
    cursorwait 1
    buttonlock 1
    set pkg ""
    foreach k [lsort [$f321.lb curselection]] {
	append pkg [$f321.lb get $k] ", "
    }
    if {$pkg eq "" } then {
	ttk::messageBox  -icon error \
	    -title [mc "Removing packages"] \
	    -message [mc "Empty selection!"] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    } else {
	### remove last space and colon
	set pkg  [string range $pkg 0 end-2]
	set answer [ttk::messageBox  -type yesno -icon question \
			-title [mc "Removing packages"] \
			-message [mc "Are you sure to remove the selected packages?"] \
			-detail "$pkg" \
			-labels [list yes [mc "yes"] no [mc "no"]]]
	if {$answer eq "yes"} then {
	    ### progressbar
	    startprogress 1 inf
	    set actioninfo [mc "Removing packages ..."]
	    ### remove space and split string into list
	    set pkg [split [string map {{ } {}} $pkg]  ","]
	    ### prepare script for tlpm
	    set filecontents "uninst [join $pkg " -i\nuninst "] -i"
	    writescript $filecontents $filebatch "w+"
	    if {$windows eq 1} then {
		if { [catch {ini::open [file nativename [file join  $cwd tlpmgui.ini]]} inifilehandle ]} then {
		    ttk::messageBox -title [mc "File reading failed!"] \
			-message [mc "Read of the %s  file failed!\nCheck the file permissions and whether it exist." tlpmgui.ini] \
			-type ok \
			-icon error
		    set ENVPERL 0
		} else {
		    if [ ::ini::exists $inifilehandle WINDOWS_TOOLS ENV_PERL ] {
			set ENVPERL [ ::ini::value $inifilehandle WINDOWS_TOOLS ENV_PERL ]
		    } else {
			set ENVPERL 0
		    }
		    if [ ::ini::exists $inifilehandle WINDOWS_TOOLS PKG_PERL ] {
			set PKGPERL [ ::ini::value $inifilehandle WINDOWS_TOOLS PKG_PERL ]
		    } else {
			set PKGPERL 0
		    }
		    if [ ::ini::exists $inifilehandle WINDOWS_TOOLS DVD ] {
			set DVD [ ::ini::value $inifilehandle WINDOWS_TOOLS DVD ]
		    } else {
			set DVD 0
		    }
		}
		ini::close $inifilehandle
		set testperlgs $filecontents
		## environment variables
		if { [string first "collection-perl" $testperlgs ] ne -1} then {
		    if {[catch {info exists env(PERL5LIB)}] eq 0 } then { 
			if {$ENVPERL eq 1} then {
			    # For Current User
			    set regPath {HKEY_CURRENT_USER\Environment}
			    if {[catch {registry get $regPath "TLroot"}]} then {
				# For All users
				set regPath {HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment}
			    }
			    if { [catch {registry delete $regPath "PERL5LIB"} regerror]} then {
				ttk::messageBox -title [mc "Delete from registry failed!"] \
				    -message "$regerror" \
				    -type ok \
				    -icon error
			    }
			    registry broadcast "Environment"
			    set ENVPERL 0
			    set PKGPERL 0
			}
		    }
		}
		# Write into INI file
		source $fileiniwrite
			     
		### script for run tlpm
		set filecontents "\"[file nativename $tlpm]\" -b \'[file nativename $filebatch]\' -d \'[file nativename $dirtlroot]\'"
	    } else {
		set filecontents "[file nativename $tlpm] -b [file nativename $filebatch] -d [file nativename $dirtlroot]"
	    }
	    writescript $filecontents $filewininst "w+"
	    ### execute tlpm
	    executeprocess 0 inf
	    if {$windows eq 1} then {
		if { [string first "collection-perl" $testperlgs ] ne -1} then {
		    catch {file delete -force [file join $TLroot perltl]}
		}
	    }
	    ### execute postaction
	    startprogress 1 inf
	    # updmap.cfg
	    source $fileupdmap
	    set actioninfo [mc "Refreshing the database ..."]
	    if {$windows eq 1} then {
		set filecontents "mktexlsr.exe"
	    } else {
		set filecontents "mktexlsr"
	    }
	    writescript $filecontents $filewininst "w+"
	    executeprocess 0 inf
	    # refresh list
	    if {[file exists $dircd/texmf]} then {
		source $filesearchpkgtoinst
	    } else {
		source $filesearchpkgtodel
	    }
	    ttk::messageBox -icon info \
		-title [mc "Done"] \
		-message [mc "Packages removed successfully"] \
		-buttons [list ok] \
		-labels [list ok "Ok"]
	}
    }
    buttonlock 0
    cursorwait 0
}
################### Info
ttk::button $f322.b3 -text [mc "Info"] -command {
    cursorwait 1
    buttonlock 1
    set pkg ""
    foreach k [lsort [$f321.lb curselection]] {
	append pkg [$f321.lb get $k] ", "
    }
    if {$pkg eq "" } then {
	ttk::messageBox -icon error \
	    -title [mc "Removing packages"] \
	    -message [mc "Empty selection!"] \
	    -buttons [list ok] \
	    -labels [list ok "Ok"]
    } else {
	startprogress 1 inf
	$f323.t delete 0.0 end
	$f323.t insert end [pkginfo]
	startprogress 0 inf
    }
    buttonlock 0
    cursorwait 0
}
tooltip::tooltip $f322.b1 [mc "Searches for installed packages"]
tooltip::tooltip $f322.b2 [mc "Removes selected packages"]
tooltip::tooltip $f322.b3 [mc "Info on the selected package"]
pack $f322.b1 $f322.b2 $f322.b3 -side top -anchor center -padx 2m -pady 2m

#######################     row 2 col 3
# text: info
ttk::labelframe $frm3.f.f23 -text [mc "Info on the selected item"]
set f323 $frm3.f.f23
grid $frm3.f.f23 -row 2 -column 3 -sticky nswe -padx 2m -pady 1m
ctext $f323.t -width 65 -linemap no -wrap word \
    -yscrollcommand "$f323.scry set"  
$f323.t insert end [mc "\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Add packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."]
ttk::scrollbar $f323.scry -command "$f323.t yview" -orient vertical
pack $f323.scry -side right -fill y
pack $f323.t -expand 1 -fill both
#::autoscroll::autoscroll $f323.scry
# syntax highlight
ctext::addHighlightClassForRegexp $f323.t title blue {^Title[^\n\r]*}
ctext::addHighlightClassForRegexp $f323.t descr blue {Description}

# EOF
