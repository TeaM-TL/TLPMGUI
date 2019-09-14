# -*- Tcl -*-
### TeX Live installer
## 2007 Tomasz Luczak tlu@technodat.com.pl
# $Id: delete.tcl 302 2007-02-01 14:44:34Z tlu $

# remove files
if [file exists $filebatch] then {
    catch {file delete $filebatch}
}
if [file exists $filepkglist] then {
    catch {file delete $filepkglist}
}
if [file exists $filelog] then {
    catch {file delete $filelog}
}
if [file exists $filewininst] then {
    catch {file delete $filewininst}
}
if [file exists $filewinerrlog] then {
    catch {file delete $filewinerrlog}
}
if [file exists $filewinlog] then {
    catch {file delete $filewinlog}
}
if [file exists $filepkginfo] then {
    catch {file delete $filepkginfo}
}

# EOF