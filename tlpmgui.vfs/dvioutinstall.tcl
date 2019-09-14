# -*-Tcl-*-
### Install Dviout
## 2006-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: dvioutinstall.tcl 302 2007-02-01 14:44:34Z tlu $

set actioninfo [mc "Dviout installation"]
startprogress 1 inf
set dvianswer [ttk::messageBox  -type yesno -icon question \
		  -title [mc "Dviout installation"] \
		  -message [mc "Are you sure to install the DVI previer - dviout?"] \
		  -labels [list yes [mc "yes"] no [mc "no"]]]
if {$dvianswer eq "yes"} then {
    set dviout "tex318w.zip"
    catch {file mkdir $dirtlroot/dviout}
    if {[catch {file copy -force [file join $dircd support $dviout] "$dirtlroot/dviout"}] eq 0} then {
	cd $dirtlroot/dviout
	set filecontents "$unzip $dviout"
	writescript $filecontents $filewininst "w+"
	executeprocess 0 inf
	file delete $dviout
	cd $cwd
	startprogress 1 inf
	# regitester file type DVI for dviout
	source $fileregisterfiletype
	set dvifile [file nativename [file attributes [file join $dirtlroot dviout dviout.exe] -shortname]]
	RegisterFileType .dvi DVIfile "Device Independent File" $dvifile -icon $dvifile,0
	catch {registry broadcast HKEY_CURRENT_USER}
	catch {registry broadcast HKEY_CLASSES_ROOT}
	
	#write parameters for dviout into install.par
	set filecontents "dpi=600"
	append filecontents "\nTEXROOT=\"[file nativename [file join $dirtlroot texmf-var fonts]];[file nativename [file join $tlpath texmf-dist fonts]];[file nativename [file join $tlpath texmf fonts]]\"\n"
	append filecontents {TEXPK=^r\tfm\\^s^tfm;^r\pk\\^s.^dpk;^r\vf\\^s.vf;^r\ovf\\^s.ovf;^r\tfm\\^s.tfm}
	append filecontents "\ngsx=\"[file nativename [file join $gsbinpath gswin32c.exe]]\""
	append filecontents "\ngen=\"`[file nativename [file attributes [file join $tlpath bin win32 mktexpk.exe] -shortname]] --mfmode / --dpi ^d --bdpi ^D --mag ^M ^s\""
	
	writescript $filecontents [file join $dirtlroot dviout install.par] "w+"
    }
}
set actioninfo [mc "Postinstall actions ..."]
startprogress 0 inf
# EOF