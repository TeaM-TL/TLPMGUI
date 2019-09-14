#  -*-Tcl-*-
### TL install
## 2005-2006 Tomasz Luczak tlu@technodat.com.pl
# $Id: tpmcollection.tcl 175 2006-12-31 01:26:11Z tlu $

# read contents from tpm (collection)

set input [open [eval set schemefile$i] r]
set schemetpm ""
while {![eof $input]} {
    gets $input tpm
    set tpmfirst [string first "collection-" $tpm]
    if { $tpmfirst ne -1 } then {
	set tpmfirst [expr $tpmfirst + 11]
	set tpmlast [expr [string last \" $tpm] - 1]
	append schemetpm "[string range $tpm $tpmfirst $tpmlast], "
    }
}   
close $input
set comaidx [string last "," $schemetpm]
set schemetpm [string replace $schemetpm $comaidx $comaidx "."]

# EOF