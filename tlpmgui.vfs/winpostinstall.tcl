# -*-Tcl-*-
### TL install
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
## $Id: winpostinstall.tcl 350 2007-02-06 11:21:49Z tlu $

####################################### postinstall action
### progressbar
startprogress 1 inf
if {$windows eq 1} then {
    # tlpath - path to dir with texmf-dis, texmf, bin, perltl
    if {$dvd eq 1} then {
	set tlpath "$dircd"
    } else {
	set tlpath "$dirtlroot"
    }
    ##
    set unzip [file join $dircd support unzip.exe]
    if {[file exists $unzip] eq 1} then {
	set unzip [file nativename [file attributes $unzip -shortname]] 
	### GhostScript install
	source $filegsinstall
	### Dviout install
	source $filedvioutinstall
    }
    set actioninfo [mc "Postinstall actions ..."]
    ## setting environment variables
    set tlbinpath [file nativename [file join $tlpath bin win32]]
    if {$dvianswer eq "yes"} then {
	append tlbinpath ";[file nativename [file join $dirtlroot dviout]]"
    }
    append currpath "$tlbinpath"
    if {$gsanswer eq "yes"} then {
	append currpath ";$gsbinpath"
    }
    set addPath $currpath
    append currpath ";$env(PATH)"
    set    variables "\nSET PATH=[file nativename $currpath]"
    append variables "\nSET TLroot=[file nativename $dirtlroot]"
    append variables "\nSET TEXMFCNF=[file nativename $dirtexmfcnf]"
    append variables "\nSET TEXMFTEMP=[file nativename $dirtexmftemp]"
    if {$gsanswer eq "yes"} then {
	append variables "\nSET GS_LIB=[file nativename $gspath/gs8.54/lib];[file nativename $gspath/gsfonts]"
    }

    if {$dvd eq 1} then {
	append testgsperl "perl"
	append variables "\nSET TEXMFVAR=[file nativename [file join $dirtlroot texmf-var]]"
    }
    if { [string first "perl" $testgsperl] ne -1} then {
	append variables "\nSET PERL5LIB=[file nativename $tlpath/perltl/lib];[file nativename $tlpath/perltl/site/lib]"
    }

    if {$tcl_platform(os) eq "Windows NT"} then {
	## insert entries into registry for WIN NT/2K/XP
	if {$admin eq 1} then {
	    # For All users
	    set regPath {HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment}
	    set curPath [registry get $regPath "Path"]
	} else {
	    # For Current User
	    set regPath {HKEY_CURRENT_USER\Environment}
	    if {[catch {registry get $regPath "Path"} curPath ]} then {
		set curPath "%Path%"
	    }
	}
	catch {registry set $regPath "Path"     "[file nativename $addPath];$curPath" expand_sz}
	catch {registry set $regPath "TLroot"    [file nativename $dirtlroot]}
	catch {registry set $regPath "TEXMFCNF"  [file nativename $dirtexmfcnf]}
	catch {registry set $regPath "TEXMFTEMP" [file nativename $dirtexmftemp]}
	if {$dvd eq 1} then {
	    catch {registry set $regPath "TEXMFVAR"  [file nativename [file dirname $dirtexmfcnf]]}
	}
	### PERL
	if { [string first "perl" $testgsperl ] ne -1} then {
	    set PKGPERL 1
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
	    if {$ENVPERL eq 1} then {
		catch {registry set $regPath "PERL5LIB" "[file nativename $tlpath/perltl/lib];[file nativename $tlpath/perltl/site/lib]"}
	    }
	} else {
	    set ENVPERL 0
	    set PKGPERL 0
	} 
	## update registry information
	catch {registry broadcast "$regPath"}
	catch {registry broadcast "Environment"}
    } else {
	## update autoexec.bat for Windows 95/98/Me
	set filehandle [open C:/autoexec.bat a+]
	puts $filehandle $variables
	close $filehandle
    }
}
################## files and directories

#### temp
if {$windows eq 1} then {
    file mkdir $dirtexmftemp
}
#remove attribute RO from TLroot directory, subdirectories and files
if {$windows eq 1} then {
    if {$tcl_platform(os) eq "Windows NT"} then {
	set filecontents "attrib -R /D /S [file nativename [file join $dirtlroot *.*]]"
    } else {
	set filecontents "attrib -R /S [file nativename [file join $dirtlroot *.*]]"
    }
} else {
    set filecontents "chmod -R u+w [file nativename $dirtlroot]"
}
writescript $filecontents $filewininst "w+"
set actioninfo [mc "Setting RW attributes ..."]
executeprocess 0 inf

### progressbar
startprogress 1 inf
set actioninfo [mc "Copying files ..."]
#### texmf-var/web2c
file mkdir $dirtexmfcnf
if {$dvd eq 1} then {
    set dirtlrootsave $dirtlroot
    set dirtlroot $dircd
}

set finalIcon error
set finalTitle [mc "Error"]
set finalMessage [mc "Error open file: %s" ""]
if [catch {file copy -force \
	       $dirtlroot/texmf/web2c/fmtutil.cnf \
	       $dirtlroot/texmf/web2c/mktex.cnf   $dirtexmfcnf} message] then {
    # error message
    source $filefinalmessage
}

if {$windows eq 1} then {
    if [catch {file copy -force \
		   $dirtlroot/texmf/web2c/texmf.cnf-4WIN \
		   $dirtexmfcnf/texmf.cnf} message] then {
	# error message
	source $filefinalmessage
    }
}

# updmap.cfg
source $fileupdmap


#### texmf-var
set dirtexmfvar [file dirname $dirtexmfcnf]

## context/config
if {[file exists $dirtlroot/texmf-dist/tex/context/config/cont-usr.tex] eq 1} then {
    file mkdir $dirtexmfvar/tex/context/config
    file copy -force \
	$dirtlroot/texmf-dist/tex/context/config/cont-usr.tex \
	$dirtexmfvar/tex/context/config
}

## dvipdfm/config
if {$windows eq 1} then { 
    set win32 "-win32"
} else { 
    set win32 "" 
}
file mkdir $dirtexmfvar/dvipdfm/config
if [catch {file copy -force \
	       $dirtlroot/texmf/dvipdfm/config/config$win32 \
	       $dirtexmfvar/dvipdfm/config/config} message] then {
    # error message
    source $filefinalmessage
}

## dvips/config
file mkdir $dirtexmfvar/dvips/config
if [catch {file copy -force \
	       $dirtlroot/texmf/dvips/config/config.ps \
	       $dirtexmfvar/dvips/config} message] then {
    # error message
    source $filefinalmessage
}

## fonts
file mkdir $dirtexmfvar/fonts/pk
file mkdir $dirtexmfvar/fonts/tfm

## tex/generic/config
file mkdir $dirtexmfvar/tex/generic/config 
if [catch {file copy -force \
	       $dirtlroot/texmf/tex/generic/config/pdftexconfig.tex \
	       $dirtexmfvar/tex/generic/config} message] then {
    # error message
    source $filefinalmessage
}

## tex/plain/config
if {[file exists $dirtlroot/texmf-dist/tex/plain/config/language.def] eq 1} then {
    file mkdir $dirtexmfvar/tex/plain/config
    if [catch {file copy -force \
		   $dirtlroot/texmf-dist/tex/plain/config/language.def \
		   $dirtexmfvar/tex/plain/config} message] then {
	# error message
	source $filefinalmessage
    }
}

## xdvi
file mkdir $dirtexmfvar/xdvi
if [catch {file copy -force \
	       $dirtlroot/texmf/xdvi/XDvi \
	       $dirtexmfvar/xdvi} message] then {
    # error message
    source $filefinalmessage
}

## language.dat
if {$dvd eq 1} then {
    file copy -force \
	$dirtlroot/texmf/tex/generic/config/language.dat \
	$dirtexmfvar/tex/generic/config
    set dirtlroot $dirtlrootsave
} else {
    ## glueing language.dat from scratch
    source $filegluelang
}
## texmf-local
set dirlocal [file dirname $dirtlroot]
if ![file exists $dirlocal/texmf-local] then {
    file mkdir $dirlocal/texmf-local
    file mkdir $dirlocal/texmf-local/doc
    file mkdir $dirlocal/texmf-local/dvips
    file mkdir $dirlocal/texmf-local/fonts
    file mkdir $dirlocal/texmf-local/tex
}

#remove attribute RO from texmf-var directory, subdirectories and files
if {$windows eq 1} then {
    if {$dvd eq 0} then {
	if {$tcl_platform(os) eq "Windows NT"} then {
	    set filecontents "attrib -R /S [file nativename [file join $dirtexmfvar *.*]]"
	} else {
	    set filecontents "attrib -R /D /S [file nativename [file join $dirtexmfvar *.*]]"
	}
    }
} else {
    set filecontents "chmod -R u+w [file nativename $dirtexmfvar]"
}
writescript $filecontents $filewininst "w+"
set actioninfo [mc "Setting RW attributes ..."]
executeprocess 0 inf
startprogress 1 inf

##########  postinstall action
set actioninfo [mc "Postinstall actions ..."]
## prepare postinstall script tlpm.bat
if {$windows eq 1} then {
    set filecontents $variables
    if {$dvd eq 1} then {
	append filecontents "\nmktexlsr.exe\nupdmap.exe"
    } else {
	append filecontents "\nmktexlsr.exe\nupdmap.exe\nfmtutil --all"
    }
} else {
    set filecontents "PATH=$env(PATH):$dirtlroot/bin/$tlplatform"
    append filecontents "\nmktexlsr\nupdmap-sys"
}
## prepare script
writescript $filecontents $filewininst "w+"
if {$dvd eq 1} then {
    set message [mc "TeX Live is ready to run directly from the DVD"]
} else {
    set message [mc "TeX Live installed in %s" [file nativename $dirtlroot]]
    if {$tcl_platform(os) ne "Windows NT"} then {
	if {$windows eq 1} then {
	    append message [mc "\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."]
	} else {
	    append message [mc "\n\nMost importantly, %s should be added to your PATH for the current and future sessions.

Formats will be built for each user when needed. If you wish to build all formats at once, for all users of your system, run fmtutil-sys --all.

For future global configuration changes, edit the files in %s (or run texconfig or texconfig-sys).

tlpmgui can be run again to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains updates and corrections.

Welcome to TeX Live!"  [file nativename [file join $dirtlroot bin $tlplatform]] [file nativename [file join $dirtlroot texmf-var]] ]
       }
    } else {
       append message [mc "\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."]
}
} 

executeprocess 0 inf

############## setuptl
startprogress 1 inf
set tlpmdirname [file tail $cwd]
if [file exists [file join $dirtlroot $tlpmdirname]] then {
    catch {file delete -force [file join $dirtlroot $tlpmdirname]}
}

if {$windows eq 1} then {
    # Win32
    ### progressbar	
    # missing error handling!
    catch {file copy -force $cwd $dirtlroot}
    # remove non Win32 files
    foreach platform {i386-linux i386-darwin x86_64-linux powerpc-darwin darwin-univ-aqua tlpmgui-sparc-solaris} {
	catch {file delete [file join $dirtlroot $tlpmdirname tlpmgui-$platform]}
	catch {file delete [file join $dirtlroot $tlpmdirname tlpm-$platform.pl]}
    }
    catch {file delete  -force [file join $dirtlroot $tlpmdirname TLPM]}
    ### Start menu
    if {[file exists [file join $dirtlroot $tlpmdirname [file tail $sourcedir]]] eq 1 } then {
	set startcmd "\"[file nativename [file join $dirtlroot $tlpmdirname [file tail $sourcedir]]]\""
	set startcwd "\"[file nativename [file join $dirtlroot $tlpmdirname]]\""
	catch {dde execute progman progman "\[CreateGroup(TeX Live $TEXLIVE)\]"}
	catch {dde execute progman progman "\[AddItem($startcmd, TeX Live Manager, $startcmd, 0, 0, 0, $startcwd)\]"}
	if {$dvianswer eq "yes"} then {
	    set startdvicmd "\"[file nativename [file join $dirtlroot dviout dviout.exe]]\""
	    set startdvicwd "\"[file nativename $dirtlroot]\""
	    catch {dde execute progman progman "\[AddItem($startdvicmd, DVI viewer, $startdvicmd, 0, 0, 0, $startdvicwd)\]"}
	}
	catch {dde execute progman progman "\[ShowGroup(TeX Live $TEXLIVE,6)\]"}	    
	# Create config file TLPMGUI.INI
	set install 1
	source $fileiniwrite
    }	
}
if {($dvd eq 0)&&($windows eq 0)} then {
    # Linux
    # missing error handling!
    catch {file copy -force $cwd $dirtlroot}
    catch {file link [file join $dirtlroot bin $tlplatform tlpmgui] [file join $dirtlroot $tlpmdirname $executable]}
    # remove non Linux files
    catch {file delete [file join $dirtlroot $tlpmdirname tlpmgui.exe]}
    catch {file delete [file join $dirtlroot $tlpmdirname tlpm.exe]}
    catch {file delete [file join $dirtlroot $tlpmdirname tlpm.winconf]}
    catch {file delete [file join $dirtlroot $tlpmdirname which.exe]}
    catch {file delete [file join $dirtlroot $tlpmdirname tclpip84.dll]}
}
startprogress 0 inf
cursorwait 0

## EOF
