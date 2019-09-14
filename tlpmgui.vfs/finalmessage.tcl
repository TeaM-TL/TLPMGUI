# -*-Tcl-*-
### TL install
## 2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: finalmessage.tcl 290 2007-01-28 15:42:30Z tlu $
####################################### install
ttk::messageBox -buttons [list ok] \
	-icon $finalIcon \
	-title $finalTitle \
	-message $finalMessage \
	-detail $message

# EOF