# -*- Tcl -*-
# $Id: cs.msg 345 2007-02-05 22:10:33Z tlu $
# CZ translation of http://tug.org/texlive/devsrc/Master/setup-win32/msgs/translate_me.msg
# by Petr Kolar, with corrections by Petr Sojka; utf8 encoding (hopefully)
# --- new translations
::msgcat::mcset cs \
"Are you sure to install the DVI previer - dviout?"\
"Opravdu chcete nainstalovat DVI previer - dviout?"
::msgcat::mcset cs "TeX Live has not been successfully installed" "TeX Live nebyl úspěšně nainstalován"
::msgcat::mcset cs "A problem copying files by tlpm" "Problém s kopírováním prostřednictvím tlpm"
::msgcat::mcset cs \
"\n\nMost importantly, %s should be added to your PATH for the current and future sessions.

Formats will be built for each user when needed. If you wish to build all formats at once, for all users of your system, run fmtutil-sys --all.

For future global configuration changes, edit the files in %s (or run texconfig or texconfig-sys).

tlpmgui can be run again to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains updates and corrections.

Welcome to TeX Live!"\
"\n\nNejprve to hlavní: %s byste si měli přidat do proměnné PATH pro současné a následné spouštění disku.

Formáty budou vybudovány pro každého uživatele v okamžiku potřeby. Pokud chcete nainstalovat všechny formáty pro všechny uživatele nyní, spusťte fmtutil-sys --all.

Pro další globální nastavení, editujte soubory v %s (nebo spusťte texconfig a texconfig-sys).

Můžete znovu spustit tlpmgui k přidání, nebo odebrání, dalších balíků a možností.

Stránka TeX Live (http://tug.org/texlive/) obsahuje jakákoliv vylepšení a opravy.

Vítejte do světa TeX Live!"
::msgcat::mcset cs "Installation is finished" "Instalace dokončena."
::msgcat::mcset cs \
"\nYou should add %s to your PATH environment variable"\
"\nMěli byste přidat %s do vaší proměnné PATH."
::msgcat::mcset cs \
"Perl installation"\
"Instalace Perlu"
::msgcat::mcset cs \
"Are you sure to install perl?"\
 "Opravdu chcete nainstalovat perl?"
::msgcat::mcset cs \
"Warning! Perl is already installed in your system!"\
 "Varování! Perl už je ve vašem systému nainstalován!"
::msgcat::mcset cs \
"Perl is not installed in your system, but it is needed for a complete installation of TeX Live"\
"Perl není v současné chvíli nainstalován, ale je vyžadován pro korektní instalaci TeX Live."
::msgcat::mcset cs \
"Ghostscript installation"\
 "Instalace Ghostscriptu"
::msgcat::mcset cs \
"Are you sure to install Ghostscript?"\
"Opravdu chcete nainstalovat Ghostscript?"
::msgcat::mcset cs \
"Warning! Ghostscript is already installed in your system!\nPath: %s" \
"Varování! Ghostscript už je ve vašem systému nainstalován!\nPath: %s"
::msgcat::mcset cs \
"Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly" \
"Ghostscript není v současné chvíli nainstalován, ale je vyžadován pro korektní chod TeX Live."

# ---
::msgcat::mcset cs "Setting RW attributes ..." "Nastavení práv pro čtení a zápis ..."
::msgcat::mcset cs "Searching for packages ..." "Hledání balíků ..."
::msgcat::mcset cs "Preinstall actions" "Předinstalační akce"
::msgcat::mcset cs "Postinstall actions ..." "Poinstalační akce ..."
::msgcat::mcset cs "Copying files ..." "Kopírování souborů ..."
::msgcat::mcset cs "Installing packages ..." "Instalace balíků ..."
::msgcat::mcset cs "Removing packages ..." "Odstraňování balíků ..."
::msgcat::mcset cs "Removing files ..."  "Odstraňování souborů ..."
::msgcat::mcset cs "Refreshing the database ..." "Obnovování databáze ..."
::msgcat::mcset cs "Next" "Dál"
::msgcat::mcset cs "yes" "Ano"
::msgcat::mcset cs "no" "Ne"

# guinb1.tcl
::msgcat::mcset cs\
"\"%s\" not found."\
"\"%s\" nebyl nalezen."

::msgcat::mcset cs\
"tlpm is needed for installing TeX Live and adding/removing packages"\
"tlpm je nutný pro instalaci TeX Live a přidání/odstranění balíků!"

::msgcat::mcset cs\
"\"Temp\" directory is needed for installing TeX Live and adding/removing packages"\
"\"Temp\" adresář je nutný pro instalaci TeX Live a přidání/odstranění balíků!"

::msgcat::mcset cs\
"File writing failed!"\
"Selhal zápis do souboru!"

::msgcat::mcset cs\
"Writing of the %s file failed!\nCheck the file permissions."\
"Zápis do souboru %s selhal!\nZkontrolujte práva souboru."

::msgcat::mcset cs\
"File reading failed!"\
"Čtení souboru selhalo!"

::msgcat::mcset cs\
"Read of the %s  file failed!\nCheck the file permissions and whether it exist."\
"Čtení souboru %s selhalo!\nZkontrolujte práva a existenci souboru."

::msgcat::mcset cs "Warning" "Upozornění"

::msgcat::mcset cs\
"The environment variable \"%s\" exists.\nAre you sure to replace it?"\
"Proměnná prostředí \"%s\" existuje.\nOpravdu ji chcete nahradit?"

::msgcat::mcset cs\
"Current value:\n%s=%s"\
"Současná hodnota:\n%s=%s"

# tooltips
::msgcat::mcset cs\
"Enter starting chars of the package name to speed-up the search"\
"Zadejte počáteční znaky názvu balíku pro urychlení hledání:"

::msgcat::mcset cs\
"Selects the path/drive with TeX Live %s"\
"Vybere cestu/disk s TeX Live %s"

::msgcat::mcset cs\
"Selects the destination directory of the TeX Live installation"\
"Vybere cílový adresář pro instalaci TeX Live."

::msgcat::mcset cs\
"Not ready yet"\
"Není připraven!"

::msgcat::mcset cs\
"Searches for installed packages"\
"Hledání nainstalovaných balíků"

::msgcat::mcset cs\
"Removes selected packages"\
"Odstraní vybraný balík."

::msgcat::mcset cs\
"Info on the selected package"\
"Informace o vybraném balíku"

::msgcat::mcset cs\
"Searches for not installed packages"\
"Hledá nenainstalované balíky."

::msgcat::mcset cs\
"Installs selected packages"\
"Nainstaluje vybrané balíky."

#
::msgcat::mcset cs\
"Collections:"\
"Kolekce:"

::msgcat::mcset cs\
"Confirm to install"\
"Potvrzení instalace"

::msgcat::mcset cs\
"Are you sure to install TeX Live?"\
"Opravdu chcete nainstalovat TeX Live?"

::msgcat::mcset cs\
"Remove the texmf-local directory"\
"Odstraň adresář texmf-local"

#-- new since 1.0
::msgcat::mcset cs\
"Install for all users\n(administrator privileges required)"\
"Nainstaluj pro všechny uživatele \n(potřebuje administrátorská práva)"

::msgcat::mcset cs\
"Run from DVD"\
"Spuštění z DVD"

::msgcat::mcset cs\
"Setting environment variables for running from DVD"\
"Nastavení proměnných prostředí pro běh z DVD"

::msgcat::mcset cs\
"Setting the environment"\
"Nastavení prostředí"

::msgcat::mcset cs\
"Set"\
"Nastav"

::msgcat::mcset cs\
"TeX Live is ready to run directly from the DVD"\
"TeX Live je připraven ke spuštění přímo z DVD."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:5
::msgcat::mcset cs\
"Contents of %s"\
"Obsah %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:11
::msgcat::mcset cs\
"Contents of the %s file:"\
"Obsah souboru: %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:27
::msgcat::mcset cs\
"Close"\
"Zavři"

#. widget: window title
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:13
::msgcat::mcset cs\
"TeX Live installation and maintenance utility, %s"\
"Instalace TeX Live a podpůrných nástrojů, %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:32
::msgcat::mcset cs\
"Installation"\
"Instalace"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:82
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:87
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:131
::msgcat::mcset cs\
"Removing packages"\
"Odstraň balíky"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:47
::msgcat::mcset cs\
"Manage the installation"\
"Správa instalace"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:51
::msgcat::mcset cs\
"Removing the installation"\
"Odstraň instalaci"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:68
::msgcat::mcset cs\
"Help"\
"Pomoc"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:72
::msgcat::mcset cs\
"Exit"\
"Konec"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:9
::msgcat::mcset cs\
"Installation of the TeX Live %s edition"\
"Instalace TeX Live %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:15
::msgcat::mcset cs\
"Main customization"\
"Hlavní nastavení"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:19
#: D:/Work/TclTk/TL/tl43.vfs/guinb1col.tcl:3
::msgcat::mcset cs\
"Standard collections"\
"Standardní výběr"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:20
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:23
::msgcat::mcset cs\
"Select"\
"Zvol"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:22
#: D:/Work/TclTk/TL/tl43.vfs/guinb1lang.tcl:3
::msgcat::mcset cs\
"Language collections"\
"Výběr jazyků"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:29
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:33
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:120
::msgcat::mcset cs\
"Install"\
"Nainstaluj"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:47
::msgcat::mcset cs\
"Select a scheme"\
"Zvolte schéma"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:58
::msgcat::mcset cs\
"Select a system"\
"Zvolte systém"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:91
::msgcat::mcset cs\
"Directories"\
"Adresáře"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:126
::msgcat::mcset cs\
"Options"\
"Volby"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:130
::msgcat::mcset cs\
"alternative directory for generated fonts"\
"náhradní adresář pro vygenerované fonty"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:131
::msgcat::mcset cs\
"create symlinks in standard directories"\
"vytvoř symbolické odkazy v standardních adresářích"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:132
::msgcat::mcset cs\
"do not install the macro/font doc tree"\
"Neinstaluj strom makro/font doc"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:133
::msgcat::mcset cs\
"do not install the macro/font source tree"\
"Neinstaluj strom zdrojových souborů maker/fontů"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:12
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:12
::msgcat::mcset cs\
"Use Ctrl or Shift or drag to select more"\
"Použijte Ctrl, nebo Shift, nebo přetáhnutí na označení více položek"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:18
::msgcat::mcset cs\
"Select packages to install"\
"Zvolte balíky, které chcete instalovat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:35
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:35
::msgcat::mcset cs\
"Buttons"\
"Tlačítka"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gluelanguage.tcl:24
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:37
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:115
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:64
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:107
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:126
::msgcat::mcset cs\
"Error"\
"Chyba"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:126
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:131
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:185
::msgcat::mcset cs\
"Adding packages"\
"Přidej balíky"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset cs\
"Packages installed successfully." \
"Balíky byly úspěšně nainstalovány."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset cs\
"Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package." \
"Pokud jste přidali formát nebo balík fontů, zvolte, prosím, \"Správa instalace\" a upravte soubory fmtutil.cfg nebo updmap.cfg"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:179
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:125
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:24
::msgcat::mcset cs\
"Info"\
"Informace"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:213
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:144
::msgcat::mcset cs\
"Info on the selected item"\
"Informace o zvolené položce"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:219
::msgcat::mcset cs\
"\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."\
"\nPozor. Zkontrolujte, prosím, zda je správně zvolena\n mechanika s CD/DVD TeX Live.\n\n\nNejprve vyplňte seznam tlačítkem \"Hledej\", potom zvolte položku a klikněte na tlačítko \"Nainstaluj\" nebo \"Informace\"."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:19
::msgcat::mcset cs\
"Select packages for removal"\
"Zvolte balíky na odstranění"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:42
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:39
::msgcat::mcset cs\
"Search"\
"Hledej"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:119
::msgcat::mcset cs\
"Packages removed successfully"\
"Balíky byly úspěšně odstraněny"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:150
::msgcat::mcset cs\
"\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Add packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."\
"\nPozor: pro informaci o balících, musí být v tabulce \"Přidej balíky\" zvolena mechanika CD s CD TeX Live.\n\nNejprve vyplňte seznam tlačítkem  \"Hledej\", potom zvolte položku a klikněte na tlačítko \"Odstraň\""

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:11
::msgcat::mcset cs\
"Manage the existing TeX Live installation"\
"Úprava existující instalace TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:20
::msgcat::mcset cs\
"Refresh the ls-R database"\
"Obnov databázi ls-R"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:22
::msgcat::mcset cs\
"Refresh"\
"Obnov"

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
::msgcat::mcset cs\
"Done"\
"Hotovo"

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
::msgcat::mcset cs\
"Oops"\
"Jej"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:103
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:132
::msgcat::mcset cs\
"Edit language.dat"\
"Uprav language.dat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:66
::msgcat::mcset cs\
"Creating formats"\
"Vytvoř formáty"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:68
::msgcat::mcset cs\
"All"\
"Vše"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:81
::msgcat::mcset cs\
"Missing"\
"Chybí"


#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:100
::msgcat::mcset cs\
"Editing fmtutil.cnf"\
"Úprava fmtutil.cnf"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:129
::msgcat::mcset cs\
"Editing updmap.cfg"\
"Úprava updmap.cfg"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4edit.tcl:15
::msgcat::mcset cs\
"Cancel"\
"Zruš"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:18
::msgcat::mcset cs\
"Remove the TeX Live installation"\
"Odstraň instalaci TeX Live"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:23
::msgcat::mcset cs\
"The path to the TL directory: %s"\
"Cesta k adresáři TL: %s"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:76
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:24
::msgcat::mcset cs\
"Remove"\
"Odstraň"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:25
::msgcat::mcset cs\
"Confirm removal"\
"Potvrďte odstranění"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:32
::msgcat::mcset cs\
"Please wait. Installation removal in progres."\
"Čekejte, prosím. Probíhá odstranění instalace."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:66
::msgcat::mcset cs\
"TeX Live has been sucessfully removed from your system"\
"TeX Live byl úspěšně odstraněn z Vašeho systému."
::msgcat::mcset cs "Press \"OK\" to exit" "Na ukončení zmáčkněte \"OK\".

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:73
::msgcat::mcset cs\
"I can't find the TeX Live directory.\nEnvironment variable TLroot not found."\
"Není možno nalézt adresář TeX Live.\nNenalezená proměnná prostředí TLroot."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:28
::msgcat::mcset cs\
"Scheme info"\
"Informace o schématu"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:69
::msgcat::mcset cs\
"Installing TeX Live"\
"Instalace TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:73
::msgcat::mcset cs\
"Installation in progress. Please wait."\
"Probíhá instalace. Čekejte, prosím."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset cs\
"Wrong path to the TeX Live directory."\
"Nesprávná cesta k adresáři TeX Live."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset cs\
"Try again.\nPress the CD/DVD button to select the correct path."\
"Zkuste znovu.\nNa volbu správné cesty zmáčkněte tlačítko CD/DVD."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:92
::msgcat::mcset cs\
"TeX Live installed in %s"\
"TeX Live je nainstalován v %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:94
::msgcat::mcset cs\
"\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."\
"\n\nNyní musíte restartovat Váš systém.\nPo restartu můžete spustit tlpmgui na přidání/odstranění balíků a na vykonání údržby."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:96
::msgcat::mcset cs\
"\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."\
"\n\nPo restartu programu tlpmgui můžete přidat/odebrat balíky a provést údržbu."
# guinb2.tcl
# guinb3.tcl
::msgcat::mcset cs\
"Empty selection!" \
"Nezadaná volba!"

# guinb3.tcl
::msgcat::mcset cs\
"Are you sure to remove the selected packages?"\
"Určitě chcete odstranit zvolené balíky?"

# guinb2.tcl
::msgcat::mcset cs\
"Are you sure to install the selected packages?"\
"Určitě chcete nainstalovat zvolené balíky?"

# proc.tcl
::msgcat::mcset cs\
"%s\n\nLog written to file %s\nWould you like to read it?"\
"%s\n\nProtokol zapsaný do souboru %s\nChcete si přečíst log-soubor?"

# guinb5.tcl
::msgcat::mcset cs\
"Are you sure to remove your TeX Live installation?"\
"Určitě chcete odstranit Vaši instalaci TeX Live?"

# guinb4.tcl
::msgcat::mcset cs\
"Edit"\
"Editace"

# winpostinstall.tcl
::msgcat::mcset cs\
"TeX Live has been sucessfully installed in your system"\
"TeX Live byl úspěšně nainstalován do Vašeho systému."

# gui.tcl:71
::msgcat::mcset cs\
"helpen.txt"\
"helpcs.txt"

# gui.tcl:71
::msgcat::mcset cs\
"helpen"\
"helpcs"

# guinb4.tcl
::msgcat::mcset cs\
"File \"%s\" not found.\nProbably TeX Live is not correctly installed." \
"Soubor \"%s\" nebyl nalezen.\nTeX Live není pravděpodobně správně nainstalován."

# guinb4.tcl
::msgcat::mcset cs\
"The TEXMFCNF environment variable not found."\
"Proměnná TEXMFCNF se nenašla."
# guinb4.tcl
::msgcat::mcset cs\
"Probably TeX Live is not correctly installed."\
"TeX Live není pravděpodobně správně nainstalován."

# guinb4edit.tcl
::msgcat::mcset cs\
"File \"%s\" succesfully saved"\
"Soubor \"%s\" byl úspěšne uložen."

# proc.tcl
::msgcat::mcset cs\
"Please wait..."\
"Čekejte, prosím ..."

# 2007.02.05 22:08 PeS
