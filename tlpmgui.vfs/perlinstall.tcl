# -*-Tcl-*-
### Install GhostScript
## 2006-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: perlinstall.tcl 345 2007-02-05 22:10:33Z tlu $
startprogress 1 inf
set actioninfo [mc "Perl installation"]
if {[catch {exec [file join $cwd which] perl.exe} perlresult] eq 0} then {
    set perlbinpath [file dirname $perlresult]    
    set perlmessage "[mc "Warning! Perl is already installed in your system!"] \n$perlbinpath"
    set perlicon warning
} else {
    set perlmessage [mc "Perl is not installed in your system, but it is needed for a complete installation of TeX Live"]
    set perlicon question
}
set perlanswer [ttk::messageBox  -type yesno -icon $perlicon \
		    -title [mc "Perl installation"] \
		    -message [mc "Are you sure to install perl?"] \
		    -detail $perlmessage \
		    -labels [list yes [mc "yes"] no [mc "no"]]]
if {$perlanswer eq "yes"} then {
    if {[string first "collection-perl" $filecontents] eq -1} then {
	append  filecontents "\ninst collection-perl"
    }
} else {
    if {[string first "collection-perl" $filecontents] ne -1} then {
	append  filecontents "\nuninst collection-perl -i"
    }
}
startprogress 0 inf

# EOF
