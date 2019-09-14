# -*- Tcl -*-
# $Id: translate_me.msg 339 2007-02-04 15:24:59Z tlu $
# --- new translations
::msgcat::mcset en \
"Are you sure to install the DVI previer - dviout?"\
"Are you sure to install the DVI previer - dviout?"
::msgcat::mcset en "TeX Live has not been successfully installed" "TeX Live has not been successfully installed"
::msgcat::mcset en "A problem copying files by tlpm" "A problem copying files by tlpm"
::msgcat::mcset en \
"\n\nMost importantly, %s should be added to your PATH for the current and future sessions.

Formats will be built for each user when needed. If you wish to build all formats at once, for all users of your system, run fmtutil-sys --all.

For future global configuration changes, edit the files in %s (or run texconfig or texconfig-sys).

tlpmgui can be run again to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains updates and corrections.

Welcome to TeX Live!"\
"\n\nMost importantly, add %s to your PATH for current and future sessions.

Formats will be built for each user as needed. If you wish to install all formats at once, for everyone on your system, run fmtutil-sys --all.

For future global configuration, edit files in %s (or run texconfig or texconfig-sys).

You can run again tlpmgui to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains any updates and corrections.

Welcome to TeX Live!"
::msgcat::mcset en "Installation is finished" "Installation is finished"
::msgcat::mcset en \
"\nYou should add %s to your PATH environment variable"\
"\nYou should add %s to your PATH environment variable"
::msgcat::mcset en \
"Perl installation"\
"Perl installation"
::msgcat::mcset en \
"Are you sure to install perl?"\
 "Are you sure to install perl?"
::msgcat::mcset en \
"Warning! Perl is already installed in your system!"\
 "Warning! Perl is already installed in your system!"
::msgcat::mcset en \
"Perl is not installed in your system, but it is needed for a complete installation of TeX Live"\
"Perl is not installed in your system, but it is needed for a complete installation of TeX Live"
::msgcat::mcset en \
"Ghostscript installation"\
 "Ghostscript installation"
::msgcat::mcset en \
"Are you sure to install Ghostscript?"\
"Are you sure to install Ghostscript?"
::msgcat::mcset en \
"Warning! Ghostscript is already installed in your system!\nPath: %s" \
"Warning! Ghostscript is already installed in your system!\nPath: %s"
::msgcat::mcset en \
"Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly" \
"Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly"

# ---
::msgcat::mcset en "Setting RW attributes ..." "Setting RW attributes ..."
::msgcat::mcset en "Searching for packages ..." "Searching for packages ..."
::msgcat::mcset en "Preinstall actions" "Preinstall actions"
::msgcat::mcset en "Postinstall actions ..." "Postinstall actions ..."
::msgcat::mcset en "Copying files ..." "Copying files ..."
::msgcat::mcset en "Installing packages ..." "Installing packages ..."
::msgcat::mcset en "Removing packages ..." "Removing packages ..."
::msgcat::mcset en "Removing files ..."  "Removing files ..."
::msgcat::mcset en "Refreshing the database ..." "Refreshing the database ..."
::msgcat::mcset en "Next" "Next"
::msgcat::mcset en "yes" "Yes"
::msgcat::mcset en "no" "No"

# guinb1.tcl
::msgcat::mcset en\
"\"%s\" not found."\
"\"%s\" not found."

::msgcat::mcset en\
"tlpm is needed for installing TeX Live and adding/removing packages"\
"tlpm is needed for installing TeX Live and adding/removing packages"

::msgcat::mcset en\
"\"Temp\" directory is needed for installing TeX Live and adding/removing packages"\
"\"Temp\" directory is needed for installing TeX Live and adding/removing packages"

::msgcat::mcset en\
"File writing failed!"\
"File writing failed!"

::msgcat::mcset en\
"Writing of the %s file failed!\nCheck the file permissions."\
"Writing of the %s file failed!\nCheck the file permissions."

::msgcat::mcset en\
"File reading failed!"\
"File reading failed!"

::msgcat::mcset en\
"Read of the %s  file failed!\nCheck the file permissions and whether it exist."\
"Read of the %s  file failed!\nCheck the file permissions and whether it exist."

::msgcat::mcset en "Warning" "Warning"

::msgcat::mcset en\
"The environment variable \"%s\" exists.\nAre you sure to replace it?"\
"The environment variable \"%s\" exists.\nAre you sure to replace it?"

::msgcat::mcset en\
"Current value:\n%s=%s"\
"Current value:\n%s=%s"

# tooltips
::msgcat::mcset en\
"Enter starting chars of the package name to speed-up the search"\
"Enter starting chars of the package name to speed-up the search"

::msgcat::mcset en\
"Selects the path/drive with TeX Live %s"\
"Selects the path/drive with TeX Live %s"

::msgcat::mcset en\
"Selects the destination directory of the TeX Live installation"\
"Selects the destination directory of the TeX Live installation"

::msgcat::mcset en\
"Not ready yet"\
"Not ready yet"

::msgcat::mcset en\
"Searches for installed packages"\
"Searches for installed packages"

::msgcat::mcset en\
"Removes selected packages"\
"Removes selected packages"

::msgcat::mcset en\
"Info on the selected package"\
"Info on the selected package"

::msgcat::mcset en\
"Searches for not installed packages"\
"Searches for not installed packages"

::msgcat::mcset en\
"Installs selected packages"\
"Installs selected packages"

#
::msgcat::mcset en\
"Collections:"\
"Collections:"

::msgcat::mcset en\
"Confirm to install"\
"Confirm to install"

::msgcat::mcset en\
"Are you sure to install TeX Live?"\
"Are you sure to install TeX Live?"

::msgcat::mcset en\
"Remove the texmf-local directory"\
"Remove the texmf-local directory"

#-- new since 1.0
::msgcat::mcset en\
"Install for all users\n(administrator privileges required)"\
"Install for all users\n(administrator privileges required)"

::msgcat::mcset en\
"Run from DVD"\
"Run from DVD"

::msgcat::mcset en\
"Setting environment variables for running from DVD"\
"Setting environment variables for running from DVD"

::msgcat::mcset en\
"Setting the environment"\
"Setting the environment"

::msgcat::mcset en\
"Set"\
"Set"

::msgcat::mcset en\
"TeX Live is ready to run directly from the DVD"\
"TeX Live is ready to run directly from the DVD"

#----------
#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:5
::msgcat::mcset en\
"Contents of %s"\
"Contents of %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:11
::msgcat::mcset en\
"Contents of the %s file:"\
"Contents of the %s file:"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:27
::msgcat::mcset en\
"Close"\
"Close"

#. widget: window title
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:13
::msgcat::mcset en\
"TeX Live installation and maintenance utility, %s"\
"TeX Live installation and maintenance utility, %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:32
::msgcat::mcset en\
"Installation"\
"Installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:82
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:87
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:131
::msgcat::mcset en\
"Removing packages"\
"Removing packages"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:47
::msgcat::mcset en\
"Manage the installation"\
"Manage the installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:51
::msgcat::mcset en\
"Removing the installation"\
"Removing the installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:68
::msgcat::mcset en\
"Help"\
"Help"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:72
::msgcat::mcset en\
"Exit"\
"Exit"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:9
::msgcat::mcset en\
"Installation of the TeX Live %s edition"\
"Installation of the TeX Live %s edition"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:15
::msgcat::mcset en\
"Main customization"\
"Main customization"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:19
#: D:/Work/TclTk/TL/tl43.vfs/guinb1col.tcl:3
::msgcat::mcset en\
"Standard collections"\
"Standard collections"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:20
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:23
::msgcat::mcset en\
"Select"\
"Select"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:22
#: D:/Work/TclTk/TL/tl43.vfs/guinb1lang.tcl:3
::msgcat::mcset en\
"Language collections"\
"Language collections"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:29
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:33
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:120
::msgcat::mcset en\
"Install"\
"Install"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:47
::msgcat::mcset en\
"Select a scheme"\
"Select a scheme"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:58
::msgcat::mcset en\
"Select a system"\
"Select a system"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:91
::msgcat::mcset en\
"Directories"\
"Directories"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:126
::msgcat::mcset en\
"Options"\
"Options"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:130
::msgcat::mcset en\
"alternative directory for generated fonts"\
"alternative directory for generated fonts"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:131
::msgcat::mcset en\
"create symlinks in standard directories"\
"create symlinks in standard directories"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:132
::msgcat::mcset en\
"do not install the macro/font doc tree"\
"do not install the macro/font doc tree"\

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:133
::msgcat::mcset en\
"do not install the macro/font source tree"\
"do not install the macro/font source tree"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:12
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:12
::msgcat::mcset en\
"Use Ctrl or Shift or drag to select more"\
"Use Ctrl or Shift or drag to select more"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:18
::msgcat::mcset en\
"Select packages to install"\
"Select packages to install"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:35
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:35
::msgcat::mcset en\
"Buttons"\
"Buttons"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gluelanguage.tcl:24
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:37
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:115
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:64
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:107
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:126
::msgcat::mcset en\
"Error"\
"Error"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:126
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:131
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:185
::msgcat::mcset en\
"Adding packages"\
"Adding packages"

#. widget: ttk::dialog .done
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset en\
"Packages installed successfully." \
"Packages installed successfully."

#. widget: ttk::dialog .done
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset en\
"Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package." \
"Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:179
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:125
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:24
::msgcat::mcset en\
"Info"\
"Info"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:213
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:144
::msgcat::mcset en\
"Info on the selected item"\
"Info on the selected item"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:219
::msgcat::mcset en\
"\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."\
"\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:19
::msgcat::mcset en\
"Select packages for removal"\
"Select packages for removal"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:42
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:39
::msgcat::mcset en\
"Search"\
"Search"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:119
::msgcat::mcset en\
"Packages removed successfully"\
"Packages removed successfully"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:150
::msgcat::mcset en\
"\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Adding packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."\
"\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Adding packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:11
::msgcat::mcset en\
"Manage the existing TeX Live installation"\
"Manage the existing TeX Live installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:20
::msgcat::mcset en\
"Refresh the ls-R database"\
"Refresh the ls-R database"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:22
::msgcat::mcset en\
"Refresh"\
"Refresh"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1col.tcl:49
#: D:/Work/TclTk/TL/tl43.vfs/guinb1lang.tcl:44
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:172
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:28
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:74
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:87
#: D:/Work/TclTk/TL/tl43.vfs/guinb4edit.tcl:18
# guinb5.tcl
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:68
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:80
::msgcat::mcset en\
"Done"\
"Done"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:111
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:72
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:31
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:52
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:56
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:77
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:90
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:112
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:116
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:141
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:145
::msgcat::mcset en\
"Oops"\
"Oops"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:103
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:132
::msgcat::mcset en\
"Edit language.dat"\
"Edit language.dat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:66
::msgcat::mcset en\
"Creating formats"\
"Creating formats"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:68
::msgcat::mcset en\
"All"\
"All"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:81
::msgcat::mcset en\
"Missing"\
"Missing"


#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:100
::msgcat::mcset en\
"Editing fmtutil.cnf"\
"Editing fmtutil.cnf"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:129
::msgcat::mcset en\
"Editing updmap.cfg"\
"Editing updmap.cfg"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4edit.tcl:15
::msgcat::mcset en\
"Cancel"\
"Cancel"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:18
::msgcat::mcset en\
"Remove the TeX Live installation"\
"Remove the TeX Live installation"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:23
::msgcat::mcset en\
"The path to the TL directory: %s"\
"The path to the TL directory: %s"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:76
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:24
::msgcat::mcset en\
"Remove"\
"Remove"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:25
::msgcat::mcset en\
"Confirm removal"\
"Confirm removal"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:32
::msgcat::mcset en\
"Please wait. Installation removal in progres."\
"Please wait. Installation removal in progres."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:66
::msgcat::mcset en\
"TeX Live has been sucessfully removed from your system"\
"TeX Live has been sucessfully removed from your system"
::msgcat::mcset en "Press \"OK\" to exit" "Press \"OK\" to exit"
#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:73
::msgcat::mcset en\
"I can't find the TeX Live directory.\nEnvironment variable TLroot not found."\
"I can't find the TeX Live directory.\nEnvironment variable TLroot not found."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:28
::msgcat::mcset en\
"Scheme info"\
"Scheme info"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:69
::msgcat::mcset en\
"Installing TeX Live"\
"Installing TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:73
::msgcat::mcset en\
"Installation in progress. Please wait."\
"Installation in progress. Please wait."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset en\
"Wrong path to the TeX Live directory."\
"Wrong path to the TeX Live directory."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset en\
"Try again.\nPress the CD/DVD button to select the correct path."\
"Try again.\nPress the CD-ROM button to select the correct path."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:92
::msgcat::mcset en\
"TeX Live installed in %s"\
"TeX Live installed in %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:94
::msgcat::mcset en\
"\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."\
"\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:96
::msgcat::mcset en\
"\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."\
"\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."

# guinb2.tcl
# guinb3.tcl
::msgcat::mcset en\
"Empty selection!" \
"Empty selection!"

# guinb3.tcl
::msgcat::mcset en\
"Are you sure to remove the selected packages?"\
"Are you sure to remove the selected packages?"

# guinb2.tcl
::msgcat::mcset en\
"Are you sure to install the selected packages?"\
"Are you sure to install the selected packages?"

# proc.tcl
::msgcat::mcset en\
"%s\n\nLog written to file %s\nWould you like to read it?"\
"%s\n\nLog written to file %s\nWould you like to read it?"

# guinb5.tcl
::msgcat::mcset en\
"Are you sure to remove your TeX Live installation?"\
"Are you sure to remove your TeX Live installation?"

# guinb4.tcl
::msgcat::mcset en\
"Edit"\
"Edit"

# winpostinstall.tcl
::msgcat::mcset en\
"TeX Live has been sucessfully installed in your system"\
"TeX Live has been sucessfully installed in your system"

# gui.tcl:71
::msgcat::mcset en\
"helpen.txt"\
"helpen.txt"

# gui.tcl:71
::msgcat::mcset en\
"helpen"\
"helpen"

# guinb4.tcl 
::msgcat::mcset en\
"File \"%s\" not found.\nProbably TeX Live is not correctly installed."\
"File \"%s\" not found.\nProbably TeX Live is not correctly installed."

# guinb.tcl
::msgcat::mcset en\
"The TEXMFCNF environment variable not found."\
"The TEXMFCNF environment variable not found."

# guinb4.tcl
::msgcat::mcset en\
"Probably TeX Live is not correctly installed."\
"Probably TeX Live is not correctly installed."

# guinb4edit.tcl
::msgcat::mcset en\
"File \"%s\" succesfully saved"\
"File \"%s\" succesfully saved"

# proc.tcl
::msgcat::mcset en\
"Please wait..."\
"Please wait..."

# EOF
