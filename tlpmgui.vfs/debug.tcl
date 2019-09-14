# -*-Tcl-*-
## 2005-2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: debug.tcl 311 2007-02-02 13:46:21Z tlu $
# Window for debugging
if [winfo exists .debug] then {destroy .debug}

toplevel .debug
wm title .debug "Debug info"

label .debug.li1 -text cwd
label .debug.l1 -textvariable cwd

label .debug.li2 -text dirtlroot
label .debug.l2 -textvariable dirtlroot

label .debug.li3 -text dircd
label .debug.l3 -textvariable dircd

label .debug.li4 -text dvd
label .debug.l4 -textvariable dvd

label .debug.li5 -text tlpm
label .debug.l5 -textvariable tlpm

label .debug.li6 -text testtlpm
label .debug.l6 -textvariable testtlpm

label .debug.li7 -text TLroot
label .debug.l7 -textvariable TLroot

label .debug.li8 -text currPath
label .debug.l8 -textvariable currPath

label .debug.li9 -text pathToCut
label .debug.l9 -textvariable pathToCut

label .debug.li10 -text argv
label .debug.l10 -textvariable argv

label .debug.li11 -text envTemp
label .debug.l11 -textvariable envTemp

## display labels and variables
grid .debug.li1  .debug.l1  -sticky w -padx 2
grid .debug.li2  .debug.l2  -sticky w -padx 2
grid .debug.li3  .debug.l3  -sticky w -padx 2
grid .debug.li4  .debug.l4  -sticky w -padx 2
grid .debug.li5  .debug.l5  -sticky w -padx 2
grid .debug.li6  .debug.l6  -sticky w -padx 2
grid .debug.li7  .debug.l7  -sticky w -padx 2
grid .debug.li8  .debug.l8  -sticky w -padx 2
grid .debug.li9  .debug.l9  -sticky w -padx 2
grid .debug.li10 .debug.l10 -sticky w -padx 2
grid .debug.li11 .debug.l11 -sticky w -padx 2

button .debug.b -text "Close" -command {destroy .debug}
label  .debug.l -text "$sourcedir"
grid .debug.b .debug.l -sticky w -padx 2 -pady 2

## EOF