# -*-Tcl-*-
### TL write ini file
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
## $Id: iniwrite.tcl 302 2007-02-01 14:44:34Z tlu $

if {[info exists install] eq 1} then {
    set pathToIni [file join $dirtlroot $tlpmdirname]
} else {
    set pathToIni $cwd
}

if { [catch {ini::open [file join $pathToIni tlpmgui.ini] w+} inifilehandle ]} then {
    ttk::messageBox -title [mc "File writing failed!"] \
	-message [mc "Writing of the %s file failed!\nCheck the file permissions." [file join $pathToIni tlpmgui.ini]] \
	-type ok \
	-icon error
} else {
    catch {ini::set $inifilehandle WINDOWS_TOOLS PKG_PERL $PKGPERL}
    catch {ini::set $inifilehandle WINDOWS_TOOLS ENV_PERL $ENVPERL}
    catch {ini::set $inifilehandle WINDOWS_TOOLS PKG_GS $PKGGS}
    catch {ini::set $inifilehandle WINDOWS_TOOLS ENV_GS $ENVGS}
    catch {ini::set $inifilehandle WINDOWS_TOOLS DVD $dvd}
    catch {ini::commit $inifilehandle }
    catch {ini::close $inifilehandle }
}

# EOF