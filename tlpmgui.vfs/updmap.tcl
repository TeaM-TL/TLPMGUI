# -*-Tcl-*-
### TeX Live installer
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: updmap.tcl 289 2007-01-26 22:39:58Z tlu $

set filecontents "# created during TeX Live installation, [clock format [clock seconds]].
################################################################
# OPTIONS
################################################################
#
# dvipsPreferOutline
#
# Should dvips (by default) prefer bitmap fonts or outline fonts
# if both are available? Independent of this setting, outlines
# can be forced by putting \"p psfonts_t1.map\" into a config file
# that dvips reads. Bitmaps (for the fonts in question) can
# be forced by putting \"p psfonts_pk.map\" into a config file.
# We provide such config files which can be enabled via
# dvips -Poutline ... resp. dvips -Ppk ...
#
# Valid settings for dvipsPreferOutline are true / false:
dvipsPreferOutline true

#
# LW35
#
# Which fonts for the \"Basic 35 Laserwriter Fonts\" do you want to use and
# how are the filenames chosen? Valid settings:
#   URW:     URW fonts with \"vendor\" filenames (e.g. n019064l.pfb)
#   URWkb:   URW fonts with \"berry\" filenames (e.g. uhvbo8ac.pfb)
#   ADOBE:   Adobe fonts with \"vendor\" filenames (e.g. hvnbo___.pfb)
#   ADOBEkb: Adobe fonts with  \"berry\" filenames (e.g. phvbo8an.pfb)
LW35 URWkb

#
# dvipsDownloadBase35
# 
# Should dvips (by default) download the standard 35 LaserWriter fonts
# with the document (then set dvipsDownloadBase35 true) or should these
# fonts be used from the ps interpreter / printer?
# Whatever the default is, the user can override it by specifying
# dvips -Pdownload35 ... resp. dvips -Pbuiltin35 ... to either download
# the LW35 fonts resp. use the built-in fonts.
#
# Valid settings are true / false:
dvipsDownloadBase35 false

#
# pdftexDownloadBase14
#
# Should pdftex download the base 14 pdf fonts? Since some configurations
# (ps / pdf tools / printers) use bad default fonts, it is safer to download
# the fonts. The pdf files will get bigger, though.
# Valid settings are true (download the fonts) or false (don't download
# the fonts). Adobe recomments to embed all fonts.
pdftexDownloadBase14 true

#
# dvipdfmDownloadBase14
#
# Should dvipdfm download the base 14 pdf fonts? Since some configurations
# (ps / pdf tools / printers) use bad default fonts, it is safer to download
# the fonts. The pdf files will get bigger, though.
# Valid settings are true (download the fonts) or false (don't download
# the fonts).
dvipdfmDownloadBase14 true

################################################################
# Map files.
################################################################
#
# There are two possible entries: Map and MixedMap. Both have one additional
# argument: the filename of the map file. MixedMap (\"mixed\" means that
# the font is available as bitmap and as outline) lines will not be used
# in the default map of dvips if dvipsPreferOutline is false. Inactive
# Map files should be marked by \"#! \" (without the quotes), not just #.
#
# (comments on a few map files from the teTeX updmap.cfg; for TeX Live,
# the actual Map lines are created during installation.)
# 
# AntykwaPoltawskiego; CTAN:fonts/psfonts/polish/antp/
# 
# AntykwaTorunska; CTAN:fonts/antt/
# 
# \"quasi\" fonts derived from URW and enhanced (from the Polish TeX users);
# CTAN:fonts/psfonts/polish/qfonts/
# 
# Bitstream Charter text font
#
# Computer Modern fonts extended with Russian letters;
# CTAN:fonts/cyrillic/cmcyr/
# 
# symbols for ConTeXt macro package
#
# latin modern; CTAN:fonts/lm.
#
# a symbol font; CTAN:fonts/psfonts/marvosym/
#
# two font map entries for the mathpple package
#
# for Omega
#
# the pazo fonts; CTAN:fonts/mathpazo
#
# pxfonts (palatino extension); CTAN:fonts/pxfonts
#
# txfonts (times extension); CTAN:fonts/txfonts
#
# XY-pic fonts; CTAN:macros/generic/diagrams/xypic
#
# 7-8-9 sizes for cmex taken from TeXtrace2001 different implementation
# for font entries found in ams-cmex-bsr-interpolated.map and
# cmother-bsr-interpolated.map.
#
# ps-type1 versions for ams; CTAN:fonts/amsfonts/ps-type1
#
# ps-type1 versions for cm; CTAN:fonts/cm/ps-type1/bluesky
#
# CSTeX; http://math.feld.cvut.cz/olsak/cstex/
#
# mf -> type1 converted fonts by Taco Hoekwater
#
# Polish version of Computer Modern; CTAN:language/polish/plpsfont
#
# Polish version of Computer Concrete; CTAN:fonts/psfonts/polish/cc-pl
#
# See comments in doc/fonts/belleek/README about using mt-belleek.map
# instead of mt-yy.map:
#
# Euro Symbol fonts by Henrik Theiling; CTAN:fonts/eurosym
#
# vntex support, see http://vntex.org/
#
# Doublestroke, based on Knuth's Computer Modern Roman; CTAN:fonts/doublestroke
#
# FPL, free substitutes for the commercial Palatino SC/OsF fonts
# are available from CTAN:fonts/fpl; used by psnfss 9.2."

# from lists
if {$dvd eq 1} then {
    set pathToLists [file join $dircd texmf lists *]
} else {
    set pathToLists [file join $dirtlroot texmf lists *]
}
set re "^\!add(Mixed)*Map"
set Result  [grep $re $pathToLists]
foreach i $Result {
	if {[string first add $i] ne -1} then {
		lappend filecontents1 [regsub {^\!add(.+)} $i \1]
	}
}

# from tpm's
if {$dvd eq 1} then {
    set pathToLists [file join $dircd texmf-dist tpm *]
} else {
    set pathToLists [file join $dirtlroot texmf-dist tpm *]
}
set re "<TPM:Execute\ function=\"addMap\""
set Result [grep $re $pathToLists]
foreach i $Result {
    if {[string first mixed $i] ne -1} then {
	regsub -all {^(.+parameter=\")([a-zA-z0-9.-]+)\".+} $i {MixedMap \2} Result1
	lappend filecontents1 $Result1
    } elseif {[string first parameter $i] ne -1} then {
	regsub -all {^(.+addMap\" parameter=\")([a-zA-z0-9.-]+)\".+} $i {Map \2} Result1
	lappend filecontents1 $Result1
    }
}
set updmapSorted [lsort -unique $filecontents1]
if {[string length [lindex $updmapSorted 0]] < 3} then {
	set updmapSorted [lrange $updmapSorted 1 end]
}
append filecontents "\n[join $updmapSorted \n]"
writescript $filecontents [file join $dirtexmfcnf updmap.cfg] "w+"

# EOF
