# -*- Tcl -*-
# French translation of http://tug.org/texlive/devsrc/Master/setuptl/msgs/translate_me.msg
# by Arthur Reutenauer (arthur.reutenauer@normalesup.org) ; UTF-8 encoding
# --- new translations
::msgcat::mcset fr \
"Are you sure to install the DVI previer - dviout?"\
"�tes-vous certain de vouloir installer le visualisateur DVI dviout ?"
::msgcat::mcset fr "A problem copying files by tlpm" "tlpm a rencontr� des probl�mes en copiant des fichiers"
::msgcat::mcset fr \
"\n\nMost importantly, %s should be added to your PATH for the current and future sessions.

Formats will be built for each user when needed. If you wish to build all formats at once, for all users of your system, run fmtutil-sys --all.

For future global configuration changes, edit the files in %s (or run texconfig or texconfig-sys).

tlpmgui can be run again to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains updates and corrections.

Welcome to TeX Live!"\
"\n\nVous devez ajouter %s � la variable d'environnement PATH pour pouvoir utiliser les programmes install�s.

Les formats sont fabriqu�s automatiquement pour chaque utilisateur, � la
demande. Si vous d�sirez installer tous les formats maintenant, pour tous les
utilisateurs de cet ordinateur, ex�cutez la commande fmtutil-sys --all.

Si vous d�sirez modifier la configuration globale � l'avenir, vous pouvez �diter les fichiers dans %s, ou ex�cuter les commandes texconfig ou texconfig-sys.

Vous pourrez relancer tlpmgui pour ajouter ou supprimer des paquets ou des
collections individuels.

Veuillez consulter le site de TeX Live (http://tug.org/texlive/) pour des mises � jour et des corrections.

Bienvenue sur TeX Live !"
::msgcat::mcset fr "Installation is finished" "L'installation est termin�e"
::msgcat::mcset fr \
"\nYou should add %s to your PATH environment variable"\
"\nVous devez ajouter %s � votre variable d'environnement PATH"
::msgcat::mcset fr \
"Perl installation"\
"Installation de Perl"
::msgcat::mcset fr \
"Are you sure to install perl?"\
"�tes-vous certain de vouloir installer Perl ?"
::msgcat::mcset fr \
"Warning! Perl is already installed in your system!"\
"Attention ! Perl est d�j� install� sur votre ordinateur !"
::msgcat::mcset fr \
"Perl is not installed in your system, but it is needed for a complete installation of TeX Live"\
"Perl n'est pas install� sur votre ordinateur, mais est n�cessaire pour l'instanllation compl�te de TeX Live"
::msgcat::mcset fr \
"Ghostscript installation"\
"Installation de Ghostscript"
::msgcat::mcset fr \
"Are you sure to install Ghostscript?"\
"�tes-vous certain de vouloir installer Ghostscript ?"
::msgcat::mcset fr \
"Warning! Ghostscript is already installed in your system!\nPath: %s" \
"Warning! Ghostscript is already installed in your system!\nPath: %s"
::msgcat::mcset fr \
"Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly" \
"Ghostscript n'est pas install� sur votre system, mais est n�cessaire au bon fonctionnement de TeX Live"

# ---
::msgcat::mcset fr "Setting RW attributes ..." "R�glage des droits de lecture et d'�criture..."
::msgcat::mcset fr "Searching for packages ..." "Recherche de paquets..."
::msgcat::mcset fr "Preinstall actions" "Action pr�alable � l'installation..."
::msgcat::mcset fr "Postinstall actions ..." "Action post�rieure � l'installation..."
::msgcat::mcset fr "Copying files ..." "Copie des fichiers..."
::msgcat::mcset fr "Installing packages ..." "Installation des paquets..."
::msgcat::mcset fr "Removing packages ..." "Suppression des paquets..."
::msgcat::mcset fr "Removing files ..."  "Suppression des fichiers..."
::msgcat::mcset fr "Refreshing the database ..." "Mise � jour de la base de donn�es..."
::msgcat::mcset fr "Next" "Suivant"
::msgcat::mcset fr "yes" "Oui"
::msgcat::mcset fr "no" "Non"

# guinb1.tcl
::msgcat::mcset fr\
"tlpm not found. Are you sure to continue?"\
"Je ne trouve pas tlpm. �tes-vous certain de vouloir continuer ?"

::msgcat::mcset fr\
"tlpm is needed for installing TeX Live and adding/removing packages"\
"tlpm est indispensable pour installer TeX Live, et ajouter ou supprimer des paquets"

::msgcat::mcset fr\
"File writing failed!"\
"�chec en �criture sur le fichier"

::msgcat::mcset fr\
"Writing of the %s file failed!\nCheck the file permissions."\
"Je n'arrive pas � �crire sur le fichier %s.\nV�rifiez les droits d'�criture."

::msgcat::mcset fr\
"File reading failed!"\
"�chec en lecture du fichier"

::msgcat::mcset fr\
"Read of the %s  file failed!\nCheck the file permissions and whether it exist."\
"Je n'arrive pas � lire le fichier %s.\nV�rifiez que le fichier existe, et qu'il a les bons droits en lecture"

::msgcat::mcset fr "Warning" "Attention"

::msgcat::mcset fr\
"The environment variable \"%s\" exists.\nAre you sure to replace it?"\
"La variable d'environnement \"%s\" existe d�j�.\n�tes-vous certain de vouloir la remplacer ?"

::msgcat::mcset fr\
"Current value:\n%s=%s"\
"Valeur actuelle :\n%s=%s"

# tooltips
::msgcat::mcset fr\
"Enter starting chars of the package name to speed-up the search"\
"Entr�e des mots-cl�s pour rechercher un paquet"

::msgcat::mcset fr\
"Selects the path/drive with TeX Live %s"\
"Choisissez l'emplacement de TeX Live %s"

::msgcat::mcset fr\
"Selects the destination directory of the TeX Live installation"\
"Choisissez l'emplacement o� sera install�e TeX Live"

::msgcat::mcset fr\
"Not ready yet"\
"Je ne suis pas encore pr�t"

::msgcat::mcset fr\
"Searches for installed packages"\
"Rechercher parmi les paquets install�s"

::msgcat::mcset fr\
"Removes selected packages"\
"Supprimer les paquets s�lectionn�s"

::msgcat::mcset fr\
"Info on the selected package"\
"Informations sur le(s) paquet(s) s�lectionn�(s)"

::msgcat::mcset fr\
"Searches for not installed packages"\
"Rechercher parmi les paquets non install�s"

::msgcat::mcset fr\
"Installs selected packages"\
"Installer les paquets s�lectionn�s"

#
::msgcat::mcset fr\
"Collections:"\
"Collections:"

::msgcat::mcset fr\
"Confirm to install"\
"Confirmer l'installation"

::msgcat::mcset fr\
"Are you sure to install TeX Live?"\
"�tes-vous certain de vouloir commencer l'installation de TeX Live ?"

::msgcat::mcset fr\
"Remove the texmf-local directory"\
"Supprimer le r�pertoire texmf-local"

#-- new since 1.0
::msgcat::mcset fr\
"Install for all users\n(administrator privileges required)"\
"Installer pour tous les utilisateurs\n(les droits d'Administrateur sont requis)"

::msgcat::mcset fr\
"Run from DVD"\
"Ex�cuter � partir du DVD"

::msgcat::mcset fr\
"Setting environment variables for running from DVD"\
"R�glage de l'environnement pour ex�cuter � partir du DVD"

::msgcat::mcset fr\
"Setting the environment"\
"R�glage de l'environnement"

::msgcat::mcset fr\
"Set"\
"R�glage"

::msgcat::mcset fr\
"TeX Live is ready to run directly from the DVD"\
"Tous les r�glages ont �t� effectu�s pour l'ex�cution directe � partir du DVD"

#----------
#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:5
::msgcat::mcset fr\
"Contents of %s"\
"Contenus de %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:11
::msgcat::mcset fr\
"Contents of the %s file:"\
"Fichier de contenus : %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/displaylog.tcl:27
::msgcat::mcset fr\
"Close"\
"Fermer"

#. widget: window title
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:13
::msgcat::mcset fr\
"TeX Live installation and maintenance utility, %s"\
"Utilitaire d'installation et de gestion de TeX Live, %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:32
::msgcat::mcset fr\
"Installation"\
"Installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:82
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:87
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:131
::msgcat::mcset fr\
"Removing packages"\
"Suppression de paquets"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:47
::msgcat::mcset fr\
"Manage the installation"\
"Gestion de l'installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:51
::msgcat::mcset fr\
"Removing the installation"\
"D�sinstallation de TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:68
::msgcat::mcset fr\
"Help"\
"Aide"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:72
::msgcat::mcset fr\
"Exit"\
"Quitter"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:9
::msgcat::mcset fr\
"Installation of the TeX Live %s edition"\
"Installation de TeX Live, �dition %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:15
::msgcat::mcset fr\
"Main customization"\
"Personnalisation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:19
#: D:/Work/TclTk/TL/tl43.vfs/guinb1col.tcl:3
::msgcat::mcset fr\
"Standard collections"\
"Collections standard"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:20
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:23
::msgcat::mcset fr\
"Select"\
"S�lection"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:22
#: D:/Work/TclTk/TL/tl43.vfs/guinb1lang.tcl:3
::msgcat::mcset fr\
"Language collections"\
"Collections de langues"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:29
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:33
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:120
::msgcat::mcset fr\
"Install"\
"Installer"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:47
::msgcat::mcset fr\
"Select a scheme"\
"Choisissez un sch�ma d'installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:58
::msgcat::mcset fr\
"Select a system"\
"Choisissez un syst�me"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:91
::msgcat::mcset fr\
"Directories"\
"R�pertoires"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:126
::msgcat::mcset fr\
"Options"\
"Options"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:130
::msgcat::mcset fr\
"alternative directory for generated fonts"\
"Changer le r�pertoire pour les polices fabriqu�es � la vol�e"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:131
::msgcat::mcset fr\
"create symlinks in standard directories"\
"Cr�er les liens symboliques dans les r�pertoires standards"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:132
::msgcat::mcset fr\
"do not install the macro/font doc tree"\
"Ne pas installer l'arborescence de documentation sur les macros et les polices"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:133
::msgcat::mcset fr\
"do not install the macro/font source tree"\
"Ne pas installer l'arborescence de sources des macros et des polices"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:12
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:12
::msgcat::mcset fr\
"Use Ctrl or Shift or drag to select more"\
"Utilisez Contr�le ou Maj (Shift) pour ajouter des paquets"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:18
::msgcat::mcset fr\
"Select packages to install"\
"Choisissez les paquets � installer"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:35
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:35
::msgcat::mcset fr\
"Buttons"\
"Boutons"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gluelanguage.tcl:24
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:37
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:115
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:64
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:95
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:107
#: D:/Work/TclTk/TL/tl43.vfs/proc.tcl:126
::msgcat::mcset fr\
"Error"\
"Erreur"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/gui.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:126
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:131
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:185
::msgcat::mcset fr\
"Adding packages"\
"Ajout de paquets"

#. widget: ttk::dialog .done
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset fr\
"Packages installed successfully." \
"Les paquets ont �t� install�s sans erreur."

#. widget: ttk::dialog .done
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset fr\
"Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package." \
"Veuillez s�lectionner � Gestion de l'installation � et �diter fmtutil.cfg ou updmap.cfg si vous avez ajout� un format ou un paquet de polices."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:179
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:125
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:24
::msgcat::mcset fr\
"Info"\
"Info"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:213
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:144
::msgcat::mcset fr\
"Info on the selected item"\
"Informations sur l'�l�ment s�lectionn�"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:219
::msgcat::mcset fr\
"\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."\
"\nAttention. Veuillez v�rifier que le lecteur de CD avec le CD TeX Live a �t� correctement choisi.\n\nRemplissez la liste avec le bouton � Rechercher �, puis choisissez un �l�ment, et cliquer sur � Installer �, ou � Info �."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:19
::msgcat::mcset fr\
"Select packages for removal"\
"Choisissez le(s) paquet(s) � supprimer"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:42
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:39
::msgcat::mcset fr\
"Search"\
"Rechercher"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:119
::msgcat::mcset fr\
"Packages removed successfully"\
"Les paquets ont �t� supprim�s sans erreur"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:150
::msgcat::mcset fr\
"\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Add packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."\
"\nAttention : pour obtenir des informations sur les paquets, vous devez s�lectionner, dans la section � Ajout de paquets �, un emplacement pour le lecteur de CD contenant le CD TeX Live.\n\nRemplissez la liste avec le bouton � Rechercher �, puis choisissez un �l�ment, et cliquer sur � Installer �, ou � Info �."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:11
::msgcat::mcset fr\
"Manage the existing TeX Live installation"\
"G�rer l'installation de TeX Live existante"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:20
::msgcat::mcset fr\
"Refresh the ls-R database"\
"Mettre � jour la base de donn�e ls-R"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:22
::msgcat::mcset fr\
"Refresh"\
"Mettre � jour"

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
::msgcat::mcset fr\
"Done"\
"Termin�"

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
::msgcat::mcset fr\
"Oops"\
"Oups"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:39
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:43
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:103
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:132
::msgcat::mcset fr\
"Edit language.dat"\
"�diter le fichier language.dat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:66
::msgcat::mcset fr\
"Creating formats"\
"Cr�er les formats"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:68
::msgcat::mcset fr\
"All"\
"Tout"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:81
::msgcat::mcset fr\
"Missing"\
"Manquant"


#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:100
::msgcat::mcset fr\
"Editing fmtutil.cnf"\
"�diter le fichier fmtutil.cnf"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:129
::msgcat::mcset fr\
"Editing updmap.cfg"\
"�diter le fichier updmap.cfg"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4edit.tcl:15
::msgcat::mcset fr\
"Cancel"\
"Annuler"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:11
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:18
::msgcat::mcset fr\
"Remove the TeX Live installation"\
"D�sinstaller TeX Live"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:23
::msgcat::mcset fr\
"The path to the TL directory: %s"\
"Emplacement du r�pertoire TL : %s"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:76
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:24
::msgcat::mcset fr\
"Remove"\
"Supprimer"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:25
::msgcat::mcset fr\
"Confirm removal"\
"Veuillez confirmer la d�sinstallation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:32
::msgcat::mcset fr\
"Please wait. Installation removal in progres."\
"Veuillez patienter. La d�sinstallation est en cours..."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:66
::msgcat::mcset fr\
"TeX Live has been sucessfully removed from your system"\
"TeX Live a �t� correctement d�sinstall� de votre ordinateur."

::msgcat::mcset fr "Press \"OK\" to exit" "Appuyez sur \"OK\" pour sortir"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:73
::msgcat::mcset fr\
"I can't find the TeX Live directory.\nEnvironment variable TLroot not found."\
"Je ne trouve pas le r�pertoire d'installation de TeX Live.\nLa variable d'environnement TLroot n'est pas correctement r�gl�e.\n"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:28
::msgcat::mcset fr\
"Scheme info"\
"Information sur le sch�ma"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:69
::msgcat::mcset fr\
"Installing TeX Live"\
"Installation de TeX Live"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:73
::msgcat::mcset fr\
"Installation in progress. Please wait."\
"Installation en cours. Veuillez patienter."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset fr\
"Wrong path to the TeX Live directory."\
"L'emplacement du r�pertoire d'installation de TeX Live est incorrect."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset fr\
"Try again.\nPress the CD/DVD button to select the correct path."\
"Veuillez r�essayer.\nAppuyez sur le bouton � CD/DVD � pour choisir l'emplacement correct."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:92
::msgcat::mcset fr\
"TeX Live installed in %s"\
"TeX Live a �t� install� dans %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:94
::msgcat::mcset fr\
"\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."\
"\n\nVous devez maintenant red�marre votre ordinateur.\nApr�s le red�marrage vous pouvez si n�cessaire relancer tlpmgui pour ajouter ou supprimer des paquets et proc�der � d'autres t�ches de gestion."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:96
::msgcat::mcset fr\
"\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."\
"\n\nUne fois tlpmgui relanc�, vous pouvez ajouter ou supprimer des paquets, et g�rer votre installation."

# guinb2.tcl
# guinb3.tcl
::msgcat::mcset fr\
"Empty selection!" \
"La s�lection est vide !"

# guinb3.tcl
::msgcat::mcset fr\
"Are you sure to remove the selected packages?"\
"�tes-vous certain de vouloir supprimer les paquets s�lectionn�s ?"

# guinb2.tcl
::msgcat::mcset fr\
"Are you sure to install the selected packages?"\
"�tes-vous certain de vouloir installer les paquets s�lectionn�s ?"

# proc.tcl
::msgcat::mcset fr\
"%s\n\nLog written to file %s\nWould you like to read it?"\
"%s\n\nL'historique de la session a �t� �crit dans le fichier %s\nVoulez-vous le consulter maintenant ?"

# guinb5.tcl
::msgcat::mcset fr\
"Are you sure to remove your TeX Live installation?"\
"�tes-vous certain de vouloir d�sinstaller TeX Live de votre ordinateur ?"

# guinb4.tcl
::msgcat::mcset fr\
"Edit"\
"�diter"

# winpostinstall.tcl
::msgcat::mcset fr\
"TeX Live has been sucessfully installed in your system"\
"TeX Live a �t� install� avec succ�s sur votre ordinateur"

# gui.tcl:71
::msgcat::mcset fr\
"helpen.txt"\
"helpfr.txt"

# gui.tcl:71
::msgcat::mcset fr\
"helpen"\
"helpfr"

# guinb4.tcl 
::msgcat::mcset fr\
"File \"%s\" not found.\nProbably TeX Live is not correctly installed." \
"Je ne trouve pas le fichier � %s �.\nTeX Live n'est probablement pas install�."

# guinb.tcl
::msgcat::mcset fr\
"The TEXMFCNF environment variable not found."\
"Je ne trouve pas la variable TEXMFCNF."

# guinb4.tcl
::msgcat::mcset fr\
"Probably TeX Live is not correctly installed."\
"TeX Live n'est probablement pas correctement install�."

# guinb4edit.tcl
::msgcat::mcset fr\
"File \"%s\" succesfully saved"\
"Le fichier � %s � a �t� correctement sauvegard�."

# proc.tcl
::msgcat::mcset fr\
"Please wait..."\
"Veuillez patienter..."

# 2005.10.11 0:40
# 2005.10.31 21:55 TLu
# 2007.01.15 00:55 ARt
