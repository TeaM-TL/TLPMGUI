# -*-Tcl-*-
### TeXLive installer
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: gluelanguage.tcl 175 2006-12-31 01:26:11Z tlu $
#
# glue language dat
# used by install and add package
## open language.dat to append
if {[file exists $dirtlroot/texmf/tex/generic/config/language.us] eq 1} then {
    file copy   -force \
	$dirtlroot/texmf/tex/generic/config/language.us \
	$dirtlroot/texmf-var/tex/generic/config/language.dat
    if {$windows eq 1} then {
	file attributes    $dirtlroot/texmf-var/tex/generic/config/language.dat  -readonly 0
    }
    set filecontents ""
    # join files
    foreach i [lsort [glob -nocomplain -directory $dirtlroot/texmf/tex/generic/config/ language.*.dat]] {
	append filecontents [readscriptall $i]
    }
    if { [catch {set filehandle [open $dirtlroot/texmf-var/tex/generic/config/language.dat a+]} result] eq 0} then {
	fconfigure $filehandle -translation {crlf lf}
	puts $filehandle $filecontents
	close $filehandle
    } else {
	set filecontents ""
	ttk::messageBox -title [mc "Error"] -icon error \
	    -message "$result"
    }
}
# EOF