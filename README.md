# Structure

./etc/bashrc_custom

Aliases:
- Some aliases like cdd, lsa, lsl and some other for quick commands
- trash to move files to ~/.TRASH
- rmtrash to clean out the trash directory as needed
Functions:
- targzfunc() to put directories into .tar.gz files
- untarfunc() to extract .tar.gz files

./etc/.nanorc for configuration of the nano text editor

./bin/linux.sh does a few important things:
- Check if the OS is Linux and exit with an error outputed if it's not
- Setup the .TRASH directory
- Rename .nanorc to .bup_nanorc
- Copy the /etc/.nanorc config to the home directory .nanorc
- Append a statement to the end of the .bashrc file

Everything gets outputed to a linuxsetup.log file

./bin/cleanup.sh

Effectively reverses changes made by linux.sh file:
- Removes the .nanorc file from home directory
- Deletes the statement from .bashrc
- Deletes the .TRASH directory

Makefile with two main targets: clean (runs the cleanup.sh script to reverse changes and linux depends on clean and runs the linux.sh script after

