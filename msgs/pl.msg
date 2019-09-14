# -*- Tcl -*-
# $Id: pl.msg 339 2007-02-04 15:24:59Z tlu $
# --- new translations
::msgcat::mcset pl \
"Are you sure to install the DVI previer - dviout?"\
"Czy zainstalować przeglądarkę plików DVI - dviout?"
::msgcat::mcset pl "TeX Live has not been successfully installed" "TeX Live nie został poprawnie zainstalowany"
::msgcat::mcset pl "A problem copying files by tlpm" "Problem z kopiowaniem plików przez tlpm"
::msgcat::mcset pl \
"\n\nMost importantly, %s should be added to your PATH for the current and future sessions.

Formats will be built for each user when needed. If you wish to build all formats at once, for all users of your system, run fmtutil-sys --all.

For future global configuration changes, edit the files in %s (or run texconfig or texconfig-sys).

tlpmgui can be run again to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains updates and corrections.

Welcome to TeX Live!"\
"\n\nNajważniejszą czynnością jest dodanie %s do zmiennej PATH dla bieżącej i przyszłych sesji.

Formaty będą budowane gdy będą potrzebne dla każdego użytkownika oddzielnie. Jeśli chcesz zainstalować wszystkie formaty od razu, dla wszystkich użytkowników, to uruchom polecenie fmtutil-sys --all.

Dla późniejszych globalnych konfiguracji edytuj pliki znajdujące się w %s (lub uruchom texconfig albo texconfig-sys).

Możesz uruchomić ponownie tlpmgui aby dodać lub usunąć pojedyncze pakiety czy kolekcje.

Na stronach internetowych TeX Live (http://tug.org/texlive/) znajdują się poprawki i aktualizacje.

Witamy w TeX Live!"
::msgcat::mcset pl "Installation is finished" "Instalacja zakończona"
::msgcat::mcset pl \
"\nYou should add %s to your PATH environment variable"\
"\nPowinieneś dodać %s do zmiennej środowiskowej PATH"
::msgcat::mcset pl \
"Perl installation"\
"Instalacja Perla"
::msgcat::mcset pl\
"Are you sure to install perl?"\
"Na pewno zainstalować pakiet perl?"
::msgcat::mcset pl \
"Warning! Perl is already installed in your system!"\
"Uwaga! Perl jest już zainstalowany w Twoim systemie!"
::msgcat::mcset pl \
"Perl is not installed in your system, but it is needed for a complete installation of TeX Live"\
"Perl nie jest zainstalowany w Twoim systemie, ale jest niezbędny do poprawnej instalacji TeX Live"
::msgcat::mcset pl \
"Ghostscript installation"\
"Instalacja Ghostscripta"
::msgcat::mcset pl \
"Are you sure to install Ghostscript?"\
"Na pewno zainstalować Ghostscript?"
::msgcat::mcset pl \
"Warning! Ghostscript is already installed in your system!\nPath: %s" \
"Uwaga! Ghostscript jest już zainstalowany w Twoim systemie!\nŚcieżka: %s"
::msgcat::mcset pl \
"Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly" \
"Ghostscript nie jest zainstalowany w Twoim systemie, ale jest niezbędny do poprawnej pracy z TeX Live"

# ---
::msgcat::mcset pl "Setting RW attributes ..." "Ustawianie atrybutów RW ..."
::msgcat::mcset pl "Searching for packages ..." "Wyszukiwanie pakietów ..."
::msgcat::mcset pl "Preinstall actions" "Czynności przedinstalacyjne"
::msgcat::mcset pl "Postinstall actions ..." "Czynności poinstalacyjne ..."
::msgcat::mcset pl "Copying files ..." "Kopiowanie plików ..."
::msgcat::mcset pl "Installing packages ..." "Instalacja pakietów ..."
::msgcat::mcset pl "Removing packages ..." "Usuwanie pakietów ..."
::msgcat::mcset pl "Removing files ..."  "Usuwanie plików ..."
::msgcat::mcset pl "Refreshing the database ..." "Odświeżanie bazy ..."
::msgcat::mcset pl "Next" "Następne"
::msgcat::mcset pl "yes" "Tak"
::msgcat::mcset pl "no" "Nie"

# guinb1.tcl
::msgcat::mcset pl\
"\"%s\" not found."\
"Nie znaleziono \"%s\"."

::msgcat::mcset pl\
"tlpm is needed for installing TeX Live and adding/removing packages"\
"Program tlpm jest wymagany do instalacji TeX Live oraz dodawania i usuwania pakietów."

::msgcat::mcset pl\
"\"Temp\" directory is needed for installing TeX Live and adding/removing packages"\
"Katalog \"Temp\" jest wymagany do instalacji TeX Live oraz dodawania i usuwania pakietów."

::msgcat::mcset pl\
"File writing failed!"\
"Nieudany zapis pliku!"

::msgcat::mcset pl\
"Writing of the %s file failed!\nCheck the file permissions."\
"Nieudany zapis pliku %s!\nSprawdź prawa dostępu."

::msgcat::mcset pl\
"File reading failed!"\
"Nieudany odczyt pliku!"

::msgcat::mcset pl\
"Read of the %s  file failed!\nCheck the file permissions and whether it exist."\
"Nieudany odczyt pliku %s!\nSprawdź prawa dostępu i istnienie pliku."

::msgcat::mcset pl "Warning" "Ostrzeżenie"

::msgcat::mcset pl\
"The environment variable \"%s\" exists.\nAre you sure to replace it?"\
"Zmienna środowiskowa \"%s\" już istnieje.\nCzy ją zastapić?"

::msgcat::mcset pl\
"Current value:\n%s=%s"\
"Aktualna wartość:\n%s=%s"

# tooltips
::msgcat::mcset pl\
"Enter starting chars of the package name to speed-up the search"\
"Wpisz znaki nazwy dla szybkiego wyszukania pakietu"

::msgcat::mcset pl\
"Selects the path/drive with TeX Live %s"\
"Wybiera ścieżkę/dysk z TeX Live %s"

::msgcat::mcset pl\
"Selects the destination directory of the TeX Live installation"\
"Wybiera katalog do zainstalowania TeX Live"

::msgcat::mcset pl\
"Not ready yet"\
"Jeszcze nie gotowe"

::msgcat::mcset pl\
"Searches for installed packages"\
"Wyszukuje zainstalowane pakiety"

::msgcat::mcset pl\
"Removes selected packages"\
"Usuwa zainstalowane pakiety"

::msgcat::mcset pl\
"Info on the selected package"\
"Informacja o zaznaczonym pakiecie"

::msgcat::mcset pl\
"Searches for not installed packages"\
"Wyszukuje niezainstalowane pakiety"

::msgcat::mcset pl\
"Installs selected packages"\
"Instaluje zaznaczone pakiety"

#
::msgcat::mcset pl\
"Collections:"\
"Kolekcje:"

::msgcat::mcset pl\
"Confirm to install"\
"Potwierdzenie instalacji"

::msgcat::mcset pl\
"Are you sure to install TeX Live?"\
"Na pewno uruchomić instalację TeX Live?"

::msgcat::mcset pl\
"Remove the texmf-local directory"\
"Usuń katalog texmf-local"

#-- new since 1.0
::msgcat::mcset pl\
"Install for all users\n(administrator privileges required)"\
"Instaluj dla wszystkich\n(wymagane są prawa administratora)"

::msgcat::mcset pl\
"Run from DVD"\
"Uruchom z DVD"

::msgcat::mcset pl\
"Setting environment variables for running from DVD"\
"Ustawianie zmiennych dla uruchamiania z DVD"

::msgcat::mcset pl\
"Setting the environment"\
"Ustawianie zmiennych"

::msgcat::mcset pl\
"Set"\
"Ustaw"

::msgcat::mcset pl\
"TeX Live is ready to run directly from the DVD"\
"TeX Live został przygotowany do uruchomienia wprost z DVD"

#----------
#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:5
::msgcat::mcset pl\
"Contents of %s"\
"Zawartość %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:11
::msgcat::mcset pl\
"Contents of the %s file:"\
"Zawartość pliku: %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:27
::msgcat::mcset pl\
"Close"\
"Zamknij"

#. widget: window title
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:13
::msgcat::mcset pl\
"TeX Live installation and maintenance utility, %s"\
"Program instalacji i konfiguracji TeX Live, %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:32
::msgcat::mcset pl\
"Installation"\
"Instalacja"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:82
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:87
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:131
::msgcat::mcset pl\
"Removing packages"\
"Usuwanie pakietów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:47
::msgcat::mcset pl\
"Manage the installation"\
"Zarządzanie instalacją"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:51
::msgcat::mcset pl\
"Removing the installation"\
"Odinstalowanie"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:68
::msgcat::mcset pl\
"Help"\
"Pomoc"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:72
::msgcat::mcset pl\
"Exit"\
"Koniec"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:9
::msgcat::mcset pl\
"Installation of the TeX Live %s edition"\
"Instalacja TeX Live %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:15
::msgcat::mcset pl\
"Main customization"\
"Modyfikacja schematów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:19
#: D:/Work/TclTk/TL/tl43.vfs/guinb1col.tcl:3
::msgcat::mcset pl\
"Standard collections"\
"Kolekcje standardowe"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:20
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:23
::msgcat::mcset pl\
"Select"\
"Wybierz"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:22
#: D:/Work/TclTk/TL/tl43.vfs/guinb1lang.tcl:3
::msgcat::mcset pl\
"Language collections"\
"Kolekcje języków"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:29
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:33
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:120
::msgcat::mcset pl\
"Install"\
"Instaluj"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:47
::msgcat::mcset pl\
"Select a scheme"\
"Wybierz schemat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:58
::msgcat::mcset pl\
"Select a system"\
"Wybierz system"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:91
::msgcat::mcset pl\
"Directories"\
"Katalogi"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:126
::msgcat::mcset pl\
"Options"\
"Opcje"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:130
::msgcat::mcset pl\
"alternative directory for generated fonts"\
"alternatywny katalog dla generowanych fontów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:131
::msgcat::mcset pl\
"create symlinks in standard directories"\
"tworzenie dowiązań w standardowych katalogach"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:132
::msgcat::mcset pl\
"do not install the macro/font doc tree"\
"nie instaluj dokumentacji makr/fontów"\

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:133
::msgcat::mcset pl\
"do not install the macro/font source tree"\
"nie instaluj plików źródłowych makr/fontów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:12
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:12
::msgcat::mcset pl\
"Use Ctrl or Shift or drag to select more"\
"Użyj klawiszy Ctrl, Shift lub przeciągnij mysz aby zaznaczyć więcej pakietów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:18
::msgcat::mcset pl\
"Select packages to install"\
"Wybierz pakiety do instalacji"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:35
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:35
::msgcat::mcset pl\
"Buttons"\
"Przyciski"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gluelanguage.tcl:24
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:37
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:115
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:64
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:107
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:126
::msgcat::mcset pl\
"Error"\
"Błąd"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:126
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:131
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:185
::msgcat::mcset pl\
"Adding packages"\
"Dodawanie pakietów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset pl\
"Packages installed successfully." \
"Pakiety zostały pomyślnie zainstalowane."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset pl\
"Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package." \
"Jeśli dodano fonty lub formaty proszę wybrać \"Zarządzanie instalacją\" i wyedytować fmtutil.cnf lub updmap.cfg"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:179
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:125
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:24
::msgcat::mcset pl\
"Info"\
"Informacje"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:213
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:144
::msgcat::mcset pl\
"Info on the selected item"\
"Informacje o zaznaczonym pakiecie"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:219
::msgcat::mcset pl\
"\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."\
"\nUwaga. Wybierz najpierw napęd CD \n\nNastępnie naciśnij przycisk \"Szukaj\" aby wypełnić listę pakietów. Po zaznaczeniu pakietu wybierz przycisk \"Instaluj\", by zainstalować, lub \"Informacje\" aby wyświetlić opis."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:19
::msgcat::mcset pl\
"Select packages for removal"\
"Wybierz pakiety do usunięcia"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:42
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:39
::msgcat::mcset pl\
"Search"\
"Szukaj"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:119
::msgcat::mcset pl\
"Packages removed successfully"\
"Pakiety zostały pomyślnie usunięte"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:150
::msgcat::mcset pl\
"\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Add packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."\
"\nUwaga: wyświetlenie informacji o pakietach wymaga sprawdzenia, czy napęd CD z TeX Live został poprawnie wybrany w zakładce \"Dodawanie...\"\n\nNastępnie naciśnij przycisk \"Szukaj\" aby wypełnić listę pakietów. Po zaznaczeniu pakietu wybierz przycisk \"Usuń\", aby usunąć pakiet bądź \"Informacje\", aby wyświetlić opis."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:11
::msgcat::mcset pl\
"Manage the existing TeX Live installation"\
"Zarządzanie istniejącą instalacją TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:20
::msgcat::mcset pl\
"Refresh the ls-R database"\
"Odświeżenie bazy ls-R"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:22
::msgcat::mcset pl\
"Refresh"\
"Odśwież"

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
::msgcat::mcset pl\
"Done"\
"Gotowe"

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
::msgcat::mcset pl\
"Oops"\
"Błąd"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:103
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:132
::msgcat::mcset pl\
"Edit language.dat"\
"Edycja language.dat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:66
::msgcat::mcset pl\
"Creating formats"\
"Tworzenie formatów"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:68
::msgcat::mcset pl\
"All"\
"Wszystkie"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:81
::msgcat::mcset pl\
"Missing"\
"Brakujące"


#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:100
::msgcat::mcset pl\
"Editing fmtutil.cnf"\
"Edycja fmtutil.cnf"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:129
::msgcat::mcset pl\
"Editing updmap.cfg"\
"Edycja updmap.cfg"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4edit.tcl:15
::msgcat::mcset pl\
"Cancel"\
"Anuluj"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:18
::msgcat::mcset pl\
"Remove the TeX Live installation"\
"Odinstalowanie TeX Live"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:23
::msgcat::mcset pl\
"The path to the TL directory: %s"\
"Ścieżka do katalogu TeX Live: %s"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:76
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:24
::msgcat::mcset pl\
"Remove"\
"Usuń"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:25
::msgcat::mcset pl\
"Confirm removal"\
"Potwierdź usunięcie"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:32
::msgcat::mcset pl\
"Please wait. Installation removal in progres."\
"Proszę czekać. Trwa odinstalowywanie."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:66
::msgcat::mcset pl\
"TeX Live has been sucessfully removed from your system"\
"TeX Live został usunięty z Twojego systemu"
::msgcat::mcset pl "Press \"OK\" to exit" "Naciśnij \"OK\" aby zakończyć"
#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:73
::msgcat::mcset pl\
"I can't find the TeX Live directory.\nEnvironment variable TLroot not found."\
"Nie można znaleźć katalogu z TEX Live.\nNie znaleziono zmiennej środowiskowej TLroot."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:28
::msgcat::mcset pl\
"Scheme info"\
"Zawartość schematu"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:69
::msgcat::mcset pl\
"Installing TeX Live"\
"Instalacja TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:73
::msgcat::mcset pl\
"Installation in progress. Please wait."\
"Trwa instalacja. Proszę czekać."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset pl\
"Wrong path to the TeX Live directory."\
"Niepoprawna ścieżka do katalogu z płytą z TeX Live."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset pl\
"Try again.\nPress the CD/DVD button to select the proper path."\
"Spróbuj ponownie.\nNaciśnij przycisk CD/DVD i wybierz poprawną ścieżkę."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:92
::msgcat::mcset pl\
"TeX Live installed in %s"\
"TeX Live został zainstalowany w %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:94
::msgcat::mcset pl\
"\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."\
"\n\nMusisz zrestartować system.\nPo restarcie możesz uruchomić tlpmgui aby dodać/usunąć pakiety lub wykonać inne czynności administracyjne."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:96
::msgcat::mcset pl\
"\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."\
"\n\nPo ponownym uruchomieniu tlpmgui możesz dodać/usunąć pakiety lub wykonać inne czynności administracyjne."

# guinb2.tcl
# guinb3.tcl
::msgcat::mcset pl\
"Empty selection!" \
"Nic nie zaznaczono"

# guinb3.tcl
::msgcat::mcset pl\
"Are you sure to remove the selected packages?"\
"Na pewno usunąć wybrane pakiety?"

# guinb2.tcl
::msgcat::mcset pl\
"Are you sure to install the selected packages?"\
"Na pewno zainstalować wybrane pakiety?"

# proc.tcl
::msgcat::mcset pl\
"%s\n\nLog written to file %s\nWould you like to read it?"\
"%s\n\nLog zapisano do pliku %s\nCzy chcesz go przejrzeć?"

# guinb5.tcl
::msgcat::mcset pl\
"Are you sure to remove your TeX Live installation?"\
"Na pewno odinstalować TeX Live?"

# guinb4.tcl
::msgcat::mcset pl\
"Edit"\
"Edytuj"

# winpostinstall.tcl
::msgcat::mcset pl\
"TeX Live has been sucessfully installed in your system"\
"TeX Live został pomyślnie zainstalowany w Twoim komputerze"

# gui.tcl:71
::msgcat::mcset pl\
"helpen.txt"\
"helppl.txt"

# gui.tcl:71
::msgcat::mcset pl\
"helpen"\
"helppl"

# guinb4.tcl
::msgcat::mcset pl\
"File \"%s\" not found.\nProbably TeX Live is not correctly installed." \
"Nie znaleziono pliku \"%s\".\nPrawdopodobnie TeX Live nie jest poprawnie zainstalowany."

# guinb4.tcl
::msgcat::mcset pl\
"The TEXMFCNF environment variable not found."\
"Nie znaleziono zmiennej TEXMFCNF."

# guinb4.tcl
::msgcat::mcset pl\
"Probably TeX Live is not correctly installed."\
"Prawdopodobnie TeX Live nie jest poprawnie zainstalowany."

# guinb4edit.tcl
::msgcat::mcset pl\
"File \"%s\" succesfully saved"\
"Plik \"%s\" pomyślnie zapisano"

# proc.tcl
::msgcat::mcset pl\
"Please wait..."\
"Proszę czekać..."

# 2005.10.11 0:40
# 2005.10.31 21:55 TLu
