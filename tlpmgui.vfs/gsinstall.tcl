# -*-Tcl-*-
### Install GhostScript
## 2006-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: gsinstall.tcl 302 2007-02-01 14:44:34Z tlu $
startprogress 1 inf
set gszip "gs854w32-tl.zip"
if [file exists [file join $dircd support $gszip]] then {
    # default path to Ghostscript
    if {[info exists env(windir)] eq 1} then {
	set gspath "[file join [file dirname $env(windir)] gs]"
    } else {
	set gspath "c:/gs" 
    }
    if {[catch {exec [file join $cwd which] gswin32c.exe} gsresult] eq 0} then {
	set gsbinpath [file dirname $gsresult]
	set gsmessage [mc "Warning! Ghostscript is already installed in your system!\nPath: %s" $gsbinpath]
	set gsicon warning
    } else {
	set gsbinpath [file join $gspath gs8.54 bin]
	set gsmessage [mc "Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly"]
	set gsicon question
    }
    set actioninfo [mc "Ghostscript installation"]
    set gsanswer [ttk::messageBox  -type yesno -icon $gsicon \
		      -title [mc "Ghostscript installation"] \
		      -message [mc "Are you sure to install Ghostscript?"] \
		      -detail $gsmessage \
		      -labels [list yes [mc "yes"] no [mc "no"]]]
    if {$gsanswer eq "yes"} then {
	catch {file mkdir $envTemp/gs}
	if {[catch {file copy -force [file join $dircd support $gszip]  "$envTemp/gs"}] eq 0} then {
	    cd $envTemp/gs
	    set filecontents "$unzip $gszip"
	    writescript $filecontents $filewininst "w+"
	    executeprocess 0 inf
	    
	    startprogress 1 inf
	    cd $envTemp/gs
	    set filecontents "setupgs.exe [file nativename $gspath]"
	    writescript $filecontents $filewininst "w+"
	    executeprocess 0 inf
	    cd $cwd
	
	    set actioninfo [mc "Postinstall actions ..."]
	    startprogress 1 inf
	    if {$admin eq 1} then {
		## For All users
		set regPath {HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment}
	    } else {
		## For Current User
		set regPath {HKEY_CURRENT_USER\Environment}
	    }
	    registry set $regPath "GS_LIB" "[file nativename $gspath/gs8.54/lib];[file nativename $gspath/gsfonts]"
	    ## update registry information
	    registry broadcast "Environment"
	    catch {file delete -force [file nativename [file join $envTemp gs $gszip]]}
	    ## remove temporary files, only for WinNT
	    if {$tcl_platform(os) eq "Windows NT"} then {
		catch {file delete -force "$envTemp/gs"}
	    }
	}
    }
    startprogress 0 inf
}
# EOF