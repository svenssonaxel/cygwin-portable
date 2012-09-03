Cygwin made portable.

You can install it on a USB drive, take it to another computer/os/user/path, and it still works.





Installation:

- Download http://cygwin.com/setup.exe and place it in the cygwin\portable-cygwin directory.

- Make sure there are no spaces or other odd characters in the path to portable-cygwin.

- Run Cygwin-portable-setup.bat to start the installation with correct settings.

- Follow the guided installation process as usual, choosing any additional packages you want.
  (The cygwinports repository is included in case you want something from there.)

- Done!





Usage hints:

- During install, cygwin\Cygwin.bat is created. It's not portable, so don't use it.
  Instead, use Cygwin-portable.bat to start a shell.

- To install 1338 tools, type:
  wget -O- http://1338.se/install | bash

- Your home directory is /home, not /home/username.
  This way you're always at home whoever you happen to be.

- The /sf directory contains symbolic links to special folders on your windows box.
  They are updated automatically as you move around.
  You may want to link some of them from your home directory like this:
   ln -s /sf/desktop desktop

- The /parent symlink points to the parent of the cygwin install folder.

- If you set up servers like sshd, be sure to know what you're doing.
  Installing windows services that depend on a drive you'll remove in a minute is usually not a good idea.
  However, since your cygwin install is portable, you could just copy it to get a local installation.
  To do this, close all cygwin processes and use the windows GUI to copy/paste.

- Use Cygwin-portable-setup.bat to add/remove packages.

- These files are safe to delete if you don't want them:
  - Cygwin-portable.bat (shortcut to cygwin\portable-cygwin\Cygwin.bat)
  - Cygwin-portable-setup.bat (shortcut to cygwin\portable-cygwin\Setup.bat)
  - autorun.inf (will give your USB drive a cygwin icon if placed in the drive root)
  - cygwin\Packages (contains temporary files downloaded during installation)
  - README.txt (this file)
