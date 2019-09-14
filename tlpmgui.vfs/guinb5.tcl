# -*-Tcl-*-
### TL install
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: guinb5.tcl 302 2007-02-01 14:44:34Z tlu $
####################################### GUI remove TL
ttk::frame $frm5.f
pack $frm5.f 
#######################     row 1
# 
ttk::frame $frm5.f.f1 -relief ridge -borderwidth 2
ttk::label $frm5.f.f1.l -text [mc "Remove the TeX Live installation"] \
    -foreground blue -font {helvetica 10 bold}

grid $frm5.f.f1 -row 1 -column 1 -padx 2m -pady 2m -sticky we
pack $frm5.f.f1.l 

#######################     row 2

ttk::labelframe $frm5.f.f2 -text [mc "Remove the TeX Live installation"]
set f502 $frm5.f.f2
grid $frm5.f.f2 -row 2 -column 1  -padx 2m -pady 2m -sticky we

if {[info exists TLroot] eq 1} then {
    set texmfLocal [file join [file dirname $TLroot] texmf-local]
    ttk::label $f502.l -text [mc "The path to the TL directory: %s" $TLroot]
    ttk::checkbutton $f502.cb -text "[mc "Remove the texmf-local directory"]: $texmfLocal" \
	-variable rmlocal
    ttk::button $f502.b -text [mc "Remove"] -command {
	set answer [ttk::messageBox  -type yesno -icon question \
			-title [mc "Confirm removal"] \
			-message [mc "Are you sure to remove your TeX Live installation?"] \
			-labels [list yes [mc "yes"] no [mc "no"]]]
	if {$answer eq "yes"} then {
	    cursorwait 1
	    buttonlock 1
	    startprogress 1 inf
	    set actioninfo [mc "Removing files ..."]
	    ########################################################################3
	    if {$windows eq 1} then {
		############################# WinNT, W2k, WXP, W2k3
		# remove shortcut from Start menu
		catch {dde execute progman progman "\[DeleteGroup(TeX Live $TEXLIVE)\]"}
		## 
		if {$tcl_platform(os) eq "Windows NT"} then {
		    set filecontents "echo \"Uninstall procedure\"\n\n"
		    foreach directory {bin dviout perltl texmf texmf-dist texmf-var texmf-doc doc temp} {
			if {[file exists [file join $TLroot $directory]]} then {
			    append filecontents "RD /Q /S \"[file nativename [file join $TLroot $directory]]\"\n"
			}
		    }
		    if {([file exists $texmfLocal])&&($rmlocal == "1")} then {
			append filecontents "RD /Q /S \"[file nativename $texmfLocal]\"\n"
		    }
		    	     
		    writescript $filecontents $filewininst "w+"
		    executeprocess 0 inf
		    startprogress 1 inf
		    # remove entries from registry for WIN_NT/2K/XP
		    # For Current User
		    set regPath {HKEY_CURRENT_USER\Environment}
		    if {[catch {registry get $regPath "TLroot"}]} then {
			# For All users
			set regPath {HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment}
		    }
		    set currPath [string map {\\ /} [registry get $regPath "Path"]]
		    # remove path to bin/win32
		    if {[catch {ini::open [file nativename [file join  $cwd tlpmgui.ini]]} inifilehandle]} then {
			ttk::messageBox -title [mc "File reading failed!"] \
			    -message [mc "Read of the %s  file failed!\nCheck the file permissions and whether it exist." tlpmgui.ini] \
			    -type ok \
			    -icon error
			set DVD 0
		    } else {
			if [ ::ini::exists $inifilehandle WINDOWS_TOOLS DVD ] {
			    set DVD [ ::ini::value $inifilehandle WINDOWS_TOOLS DVD ]
			} else {
			    set DVD 0
			}
		    }
		    if {$DVD eq 1} then {
			if {[catch {exec [file join $cwd which] tex.exe} texpath] eq 0} then {
			    set pathToBin [file dirname $texpath]
			} else {
			    set pathToBin [file join $dirtlroot bin win32]
			}
		    } else {
			set pathToBin [file join $dirtlroot bin win32]
		    }
		    set pathToCut "[string map {. {\[.\]} { } {\ }} $pathToBin];*"
		    regsub -nocase -all [subst -nocommand $pathToCut] $currPath {} currPath
		    # remove path to dviout
		    set pathToCut "[string map {. {\[.\]} { } {\ }} [file join $dirtlroot dviout]];*"
		    regsub -nocase -all [subst -nocommand $pathToCut] $currPath {} currPath
		    registry set $regPath "Path" [string map {/ \\} $currPath] expand_sz
		    catch {registry delete $regPath "TLroot"}
		    if {[info exists env(TEXMFCNF)] eq 1 } then {
			catch {registry delete $regPath "TEXMFCNF"}
		    }
		    if {[info exists env(TEXMFTEMP)] eq 1 } then {
			catch {registry delete $regPath "TEXMFTEMP"}
		    }
		    if {[info exists env(TEXMFVAR)] eq 1 } then {
			catch {registry delete $regPath "TEXMFVAR"}
		    }
		    if { [catch {ini::open [file nativename [file join  $cwd tlpmgui.ini]]} inifilehandle ]} then {
			ttk::messageBox -title [mc "File reading failed!"] \
			    -message [mc "Read of the %s  file failed!\nCheck the file permissions and whether it exist." tlpmgui.ini] \
			    -type ok \
			    -icon error
		    } else {
			## Perl
			if [ ::ini::exists $inifilehandle WINDOWS_TOOLS ENV_PERL ] {
			    set ENVPERL [ ::ini::value $inifilehandle WINDOWS_TOOLS ENV_PERL ]
			    if {$ENVPERL eq 1} then {
				if {[info exists env(PERL5LIB)] eq 1 } then { 
				    catch {registry delete $regPath "PERL5LIB"}
				}
			    }
			}
			ini::close $inifilehandle
		    }
		    # update registry information
		    registry broadcast "Environment"
		} else {
		    ############################## Windows 98
		    startprogress 1 inf
		    ## remove directories
		    ## ToDo: better error handling:
		    foreach directory {bin dviout perltl texmf texmf-dist texmf-var texmf-doc doc temp} {
			catch {file delete -force [file join $TLroot $directory]}
		    }
		    if {[info exists env(TEXMFCNF)] eq 1 } then {
			catch {file delete -force [file dirname $env(TEXMFCNF)]}
		    }
		    if {[info exists env(TEXMFTEMP)] eq 1 } then {
			catch {file delete -force $env(TEXMFTEMP)}
		    }
		    if {$rmlocal == "1"} then {
			catch {file delete -force $texmfLocal}
		    }
		    # remove env variables
		    set filename "C:/autoexec.bat"
		    set filecontents ""
		    if { [catch {set input [open $filename r]} result] eq 0} then {
			# read file line by line
			while {![eof $input]} {
#			    append filecontents [cleanautoexec [gets $input]]
			    set line [gets $input]
			    # TLroot, TEXMFCNF, TEXMFVAR, PERL5LIB
			    switch -regexp $line {
				^TLroot\=.+    { set newline "" }
				^TEXMFCNF\=.+  { set newline "" }
				^TEXMFVAR\=.+  { set newline "" }
				^TEXMFTEMP\=.+ { set newline "" }
				^PERL5LIB\=.+  { set newline "" }
				^PATH\=.+ {
				    ## PATH
				    set currPath [string map {\\ /} $line]
				    # remove path to bin/win32
				    set pathToCut "[string map {. {\[.\]} { } {\ }} [file join $dirtlroot bin win32]];*"
				    regsub -nocase -all [subst -nocommand $pathToCut] $currPath {} currPath
				    # remove path to dviout
				    set pathToCut "[string map {. {\[.\]} { } {\ }} [file join $dirtlroot dviout]];*"
				    regsub -nocase -all [subst -nocommand $pathToCut] $currPath {} currPath
				    set newline "\n[string map {/ \\} $currPath]"
				} default {
				    set newline "\n$line"
				}
			    }
			    append filecontents $newline
			}
			close $input
			
			# write autoexec.bat
			if { [catch {set filehandle [open $filename w]} result] eq 0} then {
			    puts -nonewline $filehandle $filecontents
			    close $filehandle
			} else {
			    ttk::messageBox -icon error\
				-title [mc "Error"] \
				-message [mc "Error open file: %s" $filename] \
				-buttons [list ok] \
				-labels [list ok "Ok"]
			}
		    } else {
			ttk::messageBox -icon error\
			    -title [mc "Error"] \
			    -message [mc "Error open file: %s" $filename] \
			    -buttons [list ok] \
			    -labels [list ok "Ok"]
		    }
		}
		# remove association .dvi extension with windvi from registry
		set ext .dvi
		set regPath0 HKEY_CLASSES_ROOT\\$ext
		catch {set regPath1 HKEY_CLASSES_ROOT\\[registry get $regPath0 {}]}
	        set regPath2 HKEY_CLASSES_ROOT\\Applications\\dviout.exe
		set regPath3 HKEY_CURRENT_USER\\Software\\SHIMA
	        catch {registry delete $regPath0}
	        catch {registry delete $regPath1}
	        catch {registry delete $regPath2}
		catch {registry delete $regPath3}
		registry broadcast HKEY_CURRENT_USER
		registry broadcast HKEY_CLASSES_ROOT
	    } else {
		###################### Remove for Linux/Unix
		if {([file exists $texmfLocal])&&($rmlocal == "1")} then {
		     catch {file delete -force $texmfLocal}
		 }
		catch {file delete -force $TLroot}
	    }
	    startprogress 0 inf
	    set actioninfo ""
            cursorwait 0
	    ttk::messageBox -icon info \
	       -title [mc "Done"] \
		-message "[mc "TeX Live has been sucessfully removed from your system"]\n\n[mc "Press \"OK\" to exit"]" \
	       -buttons [list ok] \
	       -labels [list ok "Ok"]

            set progressstart 0
	    source $filedelete
            buttonlock 0
            cursorwait 0
	    exit 
	}   
    }
    pack $f502.l $f502.cb $f502.b -padx 2m -pady 2m
} else {
    ttk::label $f502.l -text [mc "I can't find the TeX Live directory.\nEnvironment variable TLroot not found."]
    pack $f502.l -padx 2m -pady 2m
}

# EOF
