# -*- Tcl -*-
# French translation of http://tug.org/texlive/devsrc/Master/setuptl/msgs/translate_me.msg
# by Arthur Reutenauer (arthur.reutenauer@normalesup.org) ; UTF-8 encoding
# --- new translations
::msgcat::mcset fr \
"Are you sure to install the DVI previer - dviout?"\
"Êtes-vous certain de vouloir installer le visualisateur DVI dviout ?"
::msgcat::mcset fr "A problem copying files by tlpm" "tlpm a rencontré des problèmes en copiant des fichiers"
::msgcat::mcset fr \
"\n\nMost importantly, %s should be added to your PATH for the current and future sessions.

Formats will be built for each user when needed. If you wish to build all formats at once, for all users of your system, run fmtutil-sys --all.

For future global configuration changes, edit the files in %s (or run texconfig or texconfig-sys).

tlpmgui can be run again to add or remove individual packages or collections.

The TeX Live web site (http://tug.org/texlive/) contains updates and corrections.

Welcome to TeX Live!"\
"\n\nVous devez ajouter %s à la variable d'environnement PATH pour pouvoir utiliser les programmes installés.

Les formats sont fabriqués automatiquement pour chaque utilisateur, à la
demande. Si vous désirez installer tous les formats maintenant, pour tous les
utilisateurs de cet ordinateur, exécutez la commande fmtutil-sys --all.

Si vous désirez modifier la configuration globale à l'avenir, vous pouvez éditer les fichiers dans %s, ou exécuter les commandes texconfig ou texconfig-sys.

Vous pourrez relancer tlpmgui pour ajouter ou supprimer des paquets ou des
collections individuels.

Veuillez consulter le site de TeX Live (http://tug.org/texlive/) pour des mises à jour et des corrections.

Bienvenue sur TeX Live !"
::msgcat::mcset fr "Installation is finished" "L'installation est terminée"
::msgcat::mcset fr \
"\nYou should add %s to your PATH environment variable"\
"\nVous devez ajouter %s à votre variable d'environnement PATH"
::msgcat::mcset fr \
"Perl installation"\
"Installation de Perl"
::msgcat::mcset fr \
"Are you sure to install perl?"\
"Êtes-vous certain de vouloir installer Perl ?"
::msgcat::mcset fr \
"Warning! Perl is already installed in your system!"\
"Attention ! Perl est déjà installé sur votre ordinateur !"
::msgcat::mcset fr \
"Perl is not installed in your system, but it is needed for a complete installation of TeX Live"\
"Perl n'est pas installé sur votre ordinateur, mais est nécessaire pour l'instanllation complète de TeX Live"
::msgcat::mcset fr \
"Ghostscript installation"\
"Installation de Ghostscript"
::msgcat::mcset fr \
"Are you sure to install Ghostscript?"\
"Êtes-vous certain de vouloir installer Ghostscript ?"
::msgcat::mcset fr \
"Warning! Ghostscript is already installed in your system!\nPath: %s" \
"Warning! Ghostscript is already installed in your system!\nPath: %s"
::msgcat::mcset fr \
"Ghostscript is not installed in your system, but it is necessary for TeX Live to work properly" \
"Ghostscript n'est pas installé sur votre system, mais est nécessaire au bon fonctionnement de TeX Live"

# ---
::msgcat::mcset fr "Setting RW attributes ..." "Réglage des droits de lecture et d'écriture..."
::msgcat::mcset fr "Searching for packages ..." "Recherche de paquets..."
::msgcat::mcset fr "Preinstall actions" "Action préalable à l'installation..."
::msgcat::mcset fr "Postinstall actions ..." "Action postérieure à l'installation..."
::msgcat::mcset fr "Copying files ..." "Copie des fichiers..."
::msgcat::mcset fr "Installing packages ..." "Installation des paquets..."
::msgcat::mcset fr "Removing packages ..." "Suppression des paquets..."
::msgcat::mcset fr "Removing files ..."  "Suppression des fichiers..."
::msgcat::mcset fr "Refreshing the database ..." "Mise à jour de la base de données..."
::msgcat::mcset fr "Next" "Suivant"
::msgcat::mcset fr "yes" "Oui"
::msgcat::mcset fr "no" "Non"

# guinb1.tcl
::msgcat::mcset fr\
"tlpm not found. Are you sure to continue?"\
"Je ne trouve pas tlpm. Êtes-vous certain de vouloir continuer ?"

::msgcat::mcset fr\
"tlpm is needed for installing TeX Live and adding/removing packages"\
"tlpm est indispensable pour installer TeX Live, et ajouter ou supprimer des paquets"

::msgcat::mcset fr\
"File writing failed!"\
"Échec en écriture sur le fichier"

::msgcat::mcset fr\
"Writing of the %s file failed!\nCheck the file permissions."\
"Je n'arrive pas à écrire sur le fichier %s.\nVérifiez les droits d'écriture."

::msgcat::mcset fr\
"File reading failed!"\
"Échec en lecture du fichier"

::msgcat::mcset fr\
"Read of the %s  file failed!\nCheck the file permissions and whether it exist."\
"Je n'arrive pas à lire le fichier %s.\nVérifiez que le fichier existe, et qu'il a les bons droits en lecture"

::msgcat::mcset fr "Warning" "Attention"

::msgcat::mcset fr\
"The environment variable \"%s\" exists.\nAre you sure to replace it?"\
"La variable d'environnement \"%s\" existe déjà.\nÊtes-vous certain de vouloir la remplacer ?"

::msgcat::mcset fr\
"Current value:\n%s=%s"\
"Valeur actuelle :\n%s=%s"

# tooltips
::msgcat::mcset fr\
"Enter starting chars of the package name to speed-up the search"\
"Entrée des mots-clés pour rechercher un paquet"

::msgcat::mcset fr\
"Selects the path/drive with TeX Live %s"\
"Choisissez l'emplacement de TeX Live %s"

::msgcat::mcset fr\
"Selects the destination directory of the TeX Live installation"\
"Choisissez l'emplacement où sera installée TeX Live"

::msgcat::mcset fr\
"Not ready yet"\
"Je ne suis pas encore prêt"

::msgcat::mcset fr\
"Searches for installed packages"\
"Rechercher parmi les paquets installés"

::msgcat::mcset fr\
"Removes selected packages"\
"Supprimer les paquets sélectionnés"

::msgcat::mcset fr\
"Info on the selected package"\
"Informations sur le(s) paquet(s) sélectionné(s)"

::msgcat::mcset fr\
"Searches for not installed packages"\
"Rechercher parmi les paquets non installés"

::msgcat::mcset fr\
"Installs selected packages"\
"Installer les paquets sélectionnés"

#
::msgcat::mcset fr\
"Collections:"\
"Collections:"

::msgcat::mcset fr\
"Confirm to install"\
"Confirmer l'installation"

::msgcat::mcset fr\
"Are you sure to install TeX Live?"\
"Êtes-vous certain de vouloir commencer l'installation de TeX Live ?"

::msgcat::mcset fr\
"Remove the texmf-local directory"\
"Supprimer le répertoire texmf-local"

#-- new since 1.0
::msgcat::mcset fr\
"Install for all users\n(administrator privileges required)"\
"Installer pour tous les utilisateurs\n(les droits d'Administrateur sont requis)"

::msgcat::mcset fr\
"Run from DVD"\
"Exécuter à partir du DVD"

::msgcat::mcset fr\
"Setting environment variables for running from DVD"\
"Réglage de l'environnement pour exécuter à partir du DVD"

::msgcat::mcset fr\
"Setting the environment"\
"Réglage de l'environnement"

::msgcat::mcset fr\
"Set"\
"Réglage"

::msgcat::mcset fr\
"TeX Live is ready to run directly from the DVD"\
"Tous les réglages ont été effectués pour l'exécution directe à partir du DVD"

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
"Désinstallation de TeX Live"

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
"Installation de TeX Live, édition %s"

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
"Sélection"

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
"Choisissez un schéma d'installation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:58
::msgcat::mcset fr\
"Select a system"\
"Choisissez un système"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:91
::msgcat::mcset fr\
"Directories"\
"Répertoires"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:126
::msgcat::mcset fr\
"Options"\
"Options"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:130
::msgcat::mcset fr\
"alternative directory for generated fonts"\
"Changer le répertoire pour les polices fabriquées à la volée"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb1.tcl:131
::msgcat::mcset fr\
"create symlinks in standard directories"\
"Créer les liens symboliques dans les répertoires standards"

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
"Utilisez Contrôle ou Maj (Shift) pour ajouter des paquets"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:18
::msgcat::mcset fr\
"Select packages to install"\
"Choisissez les paquets à installer"

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
"Les paquets ont été installés sans erreur."

#. widget: ttk::dialog .done
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:214
::msgcat::mcset fr\
"Please go to \"Manage the installation\" and edit fmtutil.cfg or updmap.cfg if you have added a format or font package." \
"Veuillez sélectionner « Gestion de l'installation » et éditer fmtutil.cfg ou updmap.cfg si vous avez ajouté un format ou un paquet de polices."

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
"Informations sur l'élément sélectionné"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb2.tcl:219
::msgcat::mcset fr\
"\nAttention. Please check if a CD drive with the TeX Live CD\n is properly selected.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Install\" or \"Info\" button."\
"\nAttention. Veuillez vérifier que le lecteur de CD avec le CD TeX Live a été correctement choisi.\n\nRemplissez la liste avec le bouton « Rechercher », puis choisissez un élément, et cliquer sur « Installer », ou « Info »."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:19
::msgcat::mcset fr\
"Select packages for removal"\
"Choisissez le(s) paquet(s) à supprimer"

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
"Les paquets ont été supprimés sans erreur"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb3.tcl:150
::msgcat::mcset fr\
"\nAttention: to display package information, the CD drive with the TeX Live CD should be selected in the \"Add packages\" tab.\n\nFirst fill in the list using the \"Search\" button, then select an item and click the \"Remove\" button to remove the package."\
"\nAttention : pour obtenir des informations sur les paquets, vous devez sélectionner, dans la section « Ajout de paquets », un emplacement pour le lecteur de CD contenant le CD TeX Live.\n\nRemplissez la liste avec le bouton « Rechercher », puis choisissez un élément, et cliquer sur « Installer », ou « Info »."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:11
::msgcat::mcset fr\
"Manage the existing TeX Live installation"\
"Gérer l'installation de TeX Live existante"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:20
::msgcat::mcset fr\
"Refresh the ls-R database"\
"Mettre à jour la base de donnée ls-R"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:22
::msgcat::mcset fr\
"Refresh"\
"Mettre à jour"

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
"Terminé"

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
"Éditer le fichier language.dat"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:66
::msgcat::mcset fr\
"Creating formats"\
"Créer les formats"

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
"Éditer le fichier fmtutil.cnf"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb4.tcl:129
::msgcat::mcset fr\
"Editing updmap.cfg"\
"Éditer le fichier updmap.cfg"

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
"Désinstaller TeX Live"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:23
::msgcat::mcset fr\
"The path to the TL directory: %s"\
"Emplacement du répertoire TL : %s"

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
"Veuillez confirmer la désinstallation"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:32
::msgcat::mcset fr\
"Please wait. Installation removal in progres."\
"Veuillez patienter. La désinstallation est en cours..."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:66
::msgcat::mcset fr\
"TeX Live has been sucessfully removed from your system"\
"TeX Live a été correctement désinstallé de votre ordinateur."

::msgcat::mcset fr "Press \"OK\" to exit" "Appuyez sur \"OK\" pour sortir"

#. widget: unknown
#: D:/Work/TclTk/TL/tl43.vfs/guinb5.tcl:73
::msgcat::mcset fr\
"I can't find the TeX Live directory.\nEnvironment variable TLroot not found."\
"Je ne trouve pas le répertoire d'installation de TeX Live.\nLa variable d'environnement TLroot n'est pas correctement réglée.\n"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/searchscheme.tcl:28
::msgcat::mcset fr\
"Scheme info"\
"Information sur le schéma"

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
"L'emplacement du répertoire d'installation de TeX Live est incorrect."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/wininstall.tcl:86
::msgcat::mcset fr\
"Try again.\nPress the CD/DVD button to select the correct path."\
"Veuillez réessayer.\nAppuyez sur le bouton « CD/DVD » pour choisir l'emplacement correct."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:92
::msgcat::mcset fr\
"TeX Live installed in %s"\
"TeX Live a été installé dans %s"

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:94
::msgcat::mcset fr\
"\n\nYou should now reboot your system.\nAfter rebooting you can run tlpmgui to add/remove package(s) or perform other maintenance tasks."\
"\n\nVous devez maintenant redémarre votre ordinateur.\nAprès le redémarrage vous pouvez si nécessaire relancer tlpmgui pour ajouter ou supprimer des paquets et procéder à d'autres tâches de gestion."

#. widget: none
#: D:/Work/TclTk/TL/tl43.vfs/winpostinstall.tcl:96
::msgcat::mcset fr\
"\n\nAfter restarting tlpmgui you can add/remove package(s) or perform other maintenance tasks."\
"\n\nUne fois tlpmgui relancé, vous pouvez ajouter ou supprimer des paquets, et gérer votre installation."

# guinb2.tcl
# guinb3.tcl
::msgcat::mcset fr\
"Empty selection!" \
"La sélection est vide !"

# guinb3.tcl
::msgcat::mcset fr\
"Are you sure to remove the selected packages?"\
"Êtes-vous certain de vouloir supprimer les paquets sélectionnés ?"

# guinb2.tcl
::msgcat::mcset fr\
"Are you sure to install the selected packages?"\
"Êtes-vous certain de vouloir installer les paquets sélectionnés ?"

# proc.tcl
::msgcat::mcset fr\
"%s\n\nLog written to file %s\nWould you like to read it?"\
"%s\n\nL'historique de la session a été écrit dans le fichier %s\nVoulez-vous le consulter maintenant ?"

# guinb5.tcl
::msgcat::mcset fr\
"Are you sure to remove your TeX Live installation?"\
"Êtes-vous certain de vouloir désinstaller TeX Live de votre ordinateur ?"

# guinb4.tcl
::msgcat::mcset fr\
"Edit"\
"Éditer"

# winpostinstall.tcl
::msgcat::mcset fr\
"TeX Live has been sucessfully installed in your system"\
"TeX Live a été installé avec succès sur votre ordinateur"

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
"Je ne trouve pas le fichier « %s ».\nTeX Live n'est probablement pas installé."

# guinb.tcl
::msgcat::mcset fr\
"The TEXMFCNF environment variable not found."\
"Je ne trouve pas la variable TEXMFCNF."

# guinb4.tcl
::msgcat::mcset fr\
"Probably TeX Live is not correctly installed."\
"TeX Live n'est probablement pas correctement installé."

# guinb4edit.tcl
::msgcat::mcset fr\
"File \"%s\" succesfully saved"\
"Le fichier « %s » a été correctement sauvegardé."

# proc.tcl
::msgcat::mcset fr\
"Please wait..."\
"Veuillez patienter..."

# 2005.10.11 0:40
# 2005.10.31 21:55 TLu
# 2007.01.15 00:55 ARt
