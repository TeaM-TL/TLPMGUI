# -*-Tcl-*-
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: main.tcl 350 2007-02-06 11:21:49Z tlu $
############################
# Tcl/Tk 8.4.11
############################## SETTINGS
  
############### version
set TEXLIVE "2007"
set VER "74"
set INSTALL " ver. 1.$VER 2007.02.06"
set TCLREV [info patchlevel]

##########################
package require starkit
starkit::startup
set sourcedir $starkit::topdir

set executable [file tail [info nameofexecutable]]

if {[string first "--debug" $argv] ne -1} then {
    set debugInfo 1
} else {
    set debugInfo 0
}
#recognize Windows
if { [string tolower [file extension $executable]] eq ".exe"} then {
    set windows 1
    set tlplatform "win32"
    if {$debugInfo eq 1} then {
	console show
    }
} else {
    # recognize other platform and machine
    set windows 0
    if {[string first - $executable] ne -1} then {
	set tlplatform [string range $executable [expr [string first - $executable]+1] end]
    } else {
	# Idea from Tile
	set platform [string tolower [lindex $tcl_platform(os) 0]]
	set machine $tcl_platform(machine)
	switch -glob -- $machine {
	    sun4* { set machine sparc }
	    intel -
	    i*86* { set machine i386 }
	    "Power Macintosh" { set machine powerpc }
	}
	switch -- $platform {
	    AIX   { set machine powerpc }
	    HP-UX { set machine hppa }
	}
    
	set tlplatform "$machine-$platform"
    }
}

###########
# main window
if {[catch {package require Tk} TkREV] eq 1} then {
	puts "\n+--------------------------------------------+\n          Error!   tlpmgui requires X11  Tk problem:\n  $TkREV \n +--------------------------------------------+\n"
	exit
}
eval destroy [winfo children .]		;# in case script is re-sourced
if {[catch {package require tile} TILEREV] eq 1} then {
	puts "\n +--------------------------------------------+\n             Error!   Tile has problem:\n $TILEREV \n +--------------------------------------------+\n"
	exit
}
set RELEASE "$TEXLIVE - $INSTALL - \[Tcl-Tk $TCLREV/Tile $TILEREV\]"

# current working directory
set cwd [file dirname $sourcedir]
cd $cwd
set dirname $cwd


#########################
## Additional packages:
#
## Setting translations
package require msgcat
namespace import ::msgcat::mc
catch {::msgcat::mcload [file join $cwd msgs]}
## other common packages
package require fsdialog
package require help
package require ctext
package require tooltip
package require autoscroll
package require inifile

# default directories
if {$windows eq 1} then {
    # name of executables
    set tlpm "[file join $cwd tlpm.exe]"
    # path to temp dir
    if [info exists env(Temp)] then {
	if [file exists $env(Temp)] then {
	    set envTemp [file attribute $env(Temp) -shortname]
	    set temperror 0
	} else {
	    set envTemp [pwd]
	    if [file writable $envTemp] then {
		set temperror 0
	    } else {
		set temperror 1
	    }
	}
    } else {
	set envTemp [pwd]
	if [file writable $envTemp] then {
	    set temperror 0
	} else {
	    set temperror 1
	}
    }
    # package for add and remove from Start menu
    package require dde
    # load package for update registry
    package require registry
} else {
    # name of executables
    set tlpm "[file join $cwd tlpm-$tlplatform.pl]"
    # path to temp dir
    if {[info exists env(TMP)] eq 1} then {
	set envTemp $env(TMP)
    } elseif {[file writable /tmp] eq 1} then {
	set envTemp "/tmp"
    } else {
	cd 
	set envTemp [pwd]
    }
    set temperror 0
}
#############################
##### Setting auxiliary files
# procedures
set fileproc $sourcedir/proc.tcl
###### gui
set filegui  $sourcedir/gui.tcl
# run from DVD
set filegui0 $sourcedir/guinb0.tcl
# install
set filegui1 $sourcedir/guinb1.tcl
set filegui1col  $sourcedir/guinb1col.tcl
set filegui1lang $sourcedir/guinb1lang.tcl
set filesearchscheme $sourcedir/searchscheme.tcl
set filesearchbin  $sourcedir/searchbin.tcl
set filetpmcollection $sourcedir/tpmcollection.tcl
set filefirst $sourcedir/first.tcl
set filegsinstall $sourcedir/gsinstall.tcl
set filedvioutinstall $sourcedir/dvioutinstall.tcl
set fileperlinstall $sourcedir/perlinstall.tcl
set fileupdmap $sourcedir/updmap.tcl
# add packages
set filegui2 $sourcedir/guinb2.tcl
# remove packages
set filegui3 $sourcedir/guinb3.tcl
set filesearchpkg $sourcedir/searchpkg.tcl
# manage installation
set filegui4 $sourcedir/guinb4.tcl
set filegui4edit $sourcedir/guinb4edit.tcl
# remove installation
set filegui5 $sourcedir/guinb5.tcl
# help for tlpmgui
set filehelpdir [file join $cwd help]
# glue language.dat from scratch
set filegluelang $sourcedir/gluelanguage.tcl
# Install in window
set filewininstall $sourcedir/wininstall.tcl
set filewinpostinstall $sourcedir/winpostinstall.tcl
set filedisplaylog $sourcedir/displaylog.tcl
set filedebug $sourcedir/debug.tcl
set fileregisterfiletype $sourcedir/registerfiletype.tcl
set filechangelog $sourcedir/Changelog
set fileiniwrite  $sourcedir/iniwrite.tcl
set filedelete $sourcedir/delete.tcl
set filefinalmessage $sourcedir/finalmessage.tcl
set filesearchpkgtodel $sourcedir/searchpkgtodel.tcl
set filesearchpkgtoinst $sourcedir/searchpkgtoinst.tcl
set filelistpkgtodel $sourcedir/listpkgtodel.tcl
#
## batchfile -- for tlpm
set filebatch [file join $envTemp tlpm.batch]
## packages file
set filepkglist [file join $envTemp tlpm.pkg]
## log file for tlpm
set filelog [file join $envTemp  tlpm.log]
### batch for execute tlpm or other executables
if {$windows eq 1} then {
    set filewininst [file join $envTemp tlpminst.bat]
    if {[string first " " $filewininst] ne -1} then {
	set filewininst \"[file join $envTemp tlpminst.bat]\"
    }
} else {
    set filewininst [file join $envTemp tlpminst.bat]
}
### error log
set filewinerrlog [file join $envTemp tlpmguierr.log]
### log
set filewinlog [file join $envTemp tlpmgui.log]
### pkg info
set filepkginfo [file join $envTemp tlpmgui.info]

### error log
set winerrlog ""

## reading procedures
source "$fileproc"
##########################
# temp error
if {$temperror eq 1} then {
    set finalIcon error
    set finalTitle [mc "Oops"]
    set finalMessage [mc "\"%s\" not found." "%Temp%"]
    set message [mc "\"Temp\" directory is needed for installing TeX Live and adding/removing packages"]
    source $filefinalmessage
    exit
}

# test tlpm
if {[file exists $tlpm] eq 0} then {
    set tlpmerror 1
} else {
    if {$windows ne 1} then {
	set filecontents "[file nativename $tlpm] -v > [file nativename $filepkginfo]"
	writescript $filecontents $filewininst "w+"
	executeprocess 0 inf
	set testtlpm [readscriptall $filepkginfo]
	if {[string first "Jackowski" $testtlpm] eq -1} then {
	    set tlpmerror 1
	} else {
	    set tlpmerror 0
	}
    } else {
	set tlpmerror 0
    }
}
if {$tlpmerror eq 1} then {
    set finalIcon error
    set finalTitle [mc "Oops"]
    set finalMessage [mc "\"%s\" not found." $tlpm]
    set message [mc "tlpm is needed for installing TeX Live and adding/removing packages"]
    source $filefinalmessage
    source $filedelete
    exit
}

############################## MAIN
# splash
package require Splash
wm withdraw .
Splash::wait
## parent directory for SetupTL, default root of CD-ROM
set dircd [file dirname $cwd]
# search CD drive contains TeX Live
if {$windows eq 1} then {
    if {[file exists [file join $dircd 00INST.TL]] || [file exists [file join $dircd 00LIVE.TL]]} then {
	# bingo!
    } else {
	# search all drives
	foreach dirvolume [lsort -decreasing [file volumes]] {
	    if {[file exists [file join $dirvolume 00INST.TL]] || [file exists [file join $dirvolume 00LIVE.TL]]} then {
		set dircd $dirvolume
		break
	    }
	    if {[file exists [file join $dirvolume texlive 00INST.TL]] || [file exists [file join $dirvolume texlive 00LIVE.TL]]} then {
		set dircd [file join $dirvolume texlive]
		break
	    }
	}
    }
}
# defaults numbers of lang and collection
set langnum 0
set colnum 0
# defaults for initialize variables
set firsttimelang 1
set firsttimecol 1
set rmlocal 0
set listPositionAdd "-1"
set searchListAdd ""
set listPositionRm "-1"
set searchListRm ""
# defaults scheme
set scheme "scheme-medium"

########################
# query: TL is installed or not
if {$windows eq 1} then {
    if {[info exists env(TLroot)] eq 1} then {
	set TLroot    [string map {"\\" "/"} $env(TLroot)]
	set dirtlroot $TLroot
    } else {
	if {[catch {exec [file join $cwd which] tex.exe} texpath] eq 0} then {
	    set TLroot [file dirname [file dirname [file dirname $texpath]]] 
	    set dirtlroot $TLroot
	} else {
	    if [info exists env(TEXLIVE_INSTALL_PREFIX)] then {
		set dirtlroot  [file join $env(TEXLIVE_INSTALL_PREFIX) $TEXLIVE]
	    } else {
		set dirtlroot "C:/TeXLive$TEXLIVE"
	    }
	}
    }
} else {
    if {[info exists env(TLroot)] eq 1} then {
	set TLroot $env(TLroot)
	set dirtlroot $TLroot
    } else {
	if {[catch {exec which tex} texpath] eq 0} then {
	    if {[catch {file link $texpath} texfile] eq 0} then {
		set TLroot [file dirname [file dirname [file dirname $texfile]]]
	    } else {
		set TLroot [file dirname [file dirname [file dirname $texpath]]]
	    }
	    if {[file exists $texpath]} then {
		set dirtlroot $TLroot
	    } else {
		unset TLroot
		if [info exists env(TEXLIVE_INSTALL_PREFIX)] then {
		    set dirtlroot  [file join $env(TEXLIVE_INSTALL_PREFIX) $TEXLIVE]
		} else {
		    set dirtlroot [file join / usr local texlive $TEXLIVE]
		}
	    }
	} else {
	    if [info exists env(TEXLIVE_INSTALL_PREFIX)] then {
		set dirtlroot  [file join $env(TEXLIVE_INSTALL_PREFIX) $TEXLIVE]
	    } else {
		set dirtlroot [file join / usr local texlive $TEXLIVE]
	    }
	}
    }
}
if {[string first "--install-mode" $argv] ne -1} then {
    if [info exists TLroot] then {
	unset TLroot
	if [info exists env(TEXLIVE_INSTALL_PREFIX)] then {
	    set dirtlroot  [file join $env(TEXLIVE_INSTALL_PREFIX) $TEXLIVE]
	} else {
	    if {$windows eq 1} then {
		set dirtlroot "C:/TeXLive$TEXLIVE"
	    } else {
		set dirtlroot [file join / usr local texlive $TEXLIVE]
	    }
	}
    }
}
if {[info exists env(TEXMFCNF)] eq 1} then {
	set TEXMFCNF $env(TEXMFCNF)
} else {
    if {[info exists TLroot] eq 1} then {
	set TEXMFCNF [file join $TLroot texmf-var web2c]
    } else {
	set TEXMFCNF [file join $dirtlroot texmf-var web2c]
    }
}
set dirtexmfcnf $TEXMFCNF

set dirtexmftemp [file join $dirtlroot temp]

if [file exists $filewinerrlog] then {
    catch {file delete $filewinerrlog}
}

# painting GUI 
source $filegui
#
Splash::delete
## EOF
