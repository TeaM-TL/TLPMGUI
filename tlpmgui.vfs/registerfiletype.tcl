#  -*-Tcl-*-
# from http://wiki.tcl.tk/1074
# $Id: registerfiletype.tcl 330 2007-02-03 21:22:08Z tlu $
#----------------------------------------------------------------------
# 2007.02.03 TLu: added catch for all registry command
#----------------------------------------------------------------------
#
# RegisterFileType::RegisterFileType --
#
#       Register a file type on Windows
#
# Author:
#       Kevin Kenny <kennykb@acm.org>.
#       Last revised: 27 Nov 2000, 22:35 UTC
#
# Parameters:
#       extension -- Extension (e.g., .tcl) of the new type
#                    being registered.
#       className -- Class name (e.g., "tclfile") of the new type
#       textName  -- Textual name (e.g. "Tcl Script") of the
#                    new type.
#       script    -- Name of the file containing a Tcl script
#                    to run when a file of the given type is
#                    opened.  The script will receive the name
#                    of the file in [lindex $argv 0].
#
# Options:
#       -icon FILENAME,NUMBER
#               Set the icon for files of the new type
#               to be the NUMBER'th icon in the given file.
#               The file must be a full path name.
#       -mimetype TYPE
#               Set the MIME type corresponding to the new
#               file type to the specified string.
#       -new BOOLEAN
#               If BOOLEAN is true, set things up so that
#               the new file type appears in the "New" menu
#               in the Explorer and the system tray.
#       -text BOOLEAN
#               If BOOLEAN is true, the new file type contains
#               plain ASCII text of some sort.  Set the
#               Edit and Print actions to open and print
#               ASCII files.
#
# Results:
#       None.
#
# Side effects:
#       Adds the following keys to the system registry:
#
#       HKEY_CLASSES_ROOT
#         (Extension)           (Default value)         ClassName
#                               "Content Type"          MimeType        [1]
#           ShellNew            "NullFile"              ""              [2]
#         (ClassName)           (Default value)         TextName
#           DefaultIcon         (Default value)         IconName,#      [3]
#           Shell
#             Open
#               command         (Default value)         -SEE BELOW-
#             Edit
#               command         (Default value)         -SEE BELOW-     [4]
#             Print
#               command         (Default value)         -SEE BELOW-     [4]
#         MIME
#           Database
#             Content Type
#               (MimeType)      (Default value)         Extension       [1]
#
#       [1] These values are added only if the -mimetype option is used.
#       [2] This value is added only if the -new option is true.
#       [3] This value is added only if the -icon option is used.
#       [4] These values are added only if the -text option is true.
#
#       The command to open the file consists of three arguments.
#       The first is the name of the current Tcl executable.  The
#       second is the script name, and the third is "%1", which causes
#       the target file to be passed as a command-line argument.
#       The edit command is the command that opens text files, and the
#       print command is the command that prints text files.
#
#----------------------------------------------------------------------

proc RegisterFileType {extension className textName script args} {
    
    package require registry
    
    # extPath is the class path for the file's extension
    
    set extPath HKEY_CLASSES_ROOT\\$extension
    catch {registry set $extPath {} $className sz}
    
    # classPath is the class path for the file's class
    
    set classPath HKEY_CLASSES_ROOT\\$className
    catch {registry set $classPath {} $textName sz}
    
    # shellPath is the shell key within classPath
    
     set shellPath $classPath\\Shell

    # Set up the 'Open' action
    
    set openCommand {}
#----------------- orig
#    append openCommand \" \
#             [file nativename [info nameofexecutable]] \
#             \" { } \" [file nativename $script] \" { } \"%1\"
#----------------- /orig
#----------------- tlu
    append openCommand \"[file nativename $script]\" \"%1\"
#-----------------/tlu

    catch {registry set $shellPath\\open\\command {} $openCommand sz}

    # Process optional args

    foreach {key val} $args {
	switch -exact -- $key {

             -mimetype {

                 # Set up the handler for the MIME content type,
                 # and add the content type item to the database

                 catch {registry set $extPath "Content Type" $val sz}
                 set mimeDbPath "HKEY_CLASSES_ROOT\\MIME\\Database"
                 append mimeDbPath "\\Content Type\\" $val
                 catch {registry set $mimeDbPath Extension $extension sz}
             }

             -icon {

                 # Add the file icon to the shell database

                 if {![regexp {^(.*),([^,]*)} $val junk file icon]} {
                     error "-icon option requires fileName,iconNumber"
                 }
                 catch {registry set $classPath\\DefaultIcon {} [file nativename $file],$icon sz}
             }

             -text {
                 if {$val} {

                     # Copy the Print action for text files
                     # into the Print action for the new type

                     set textPath HKEY_CLASSES_ROOT\\txtfile\\Shell
                     if {![catch {registry get $textPath\\print\\command {}} pCmd]} then {
                         catch {registry set $shellPath\\print\\command {} $pCmd sz}
                         catch {registry set $shellPath\\print {} &Print sz}
                     }

                     # Copy the Open action for text files
                     # into the Edit action for the new type.

                     if {![catch {registry get $textPath\\open\\command {}} eCmd]} then {
                         catch {registry set $shellPath\\edit\\command {} $eCmd sz}
                         catch {registry set $shellPath\\edit {} &Edit sz}
                     }
                 }
             }

             -new {
                 if {$val} {

                     # Add the 'NullFile' action to the
                     # shell's New menu

                    catch {registry set $extPath\\ShellNew NullFile {} sz}
                 }
             }

             default {
                 error "unknown option $key, must be -icon, -mimetype, -new or -text"
             }
         }
     }
 }
