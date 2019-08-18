Cygwin made portable.

You can install it on a USB drive, take it to another computer/OS/user/path, and it still works.





Installation:

- Make sure there are no spaces or other odd characters in the path to cygwin-portable.

- Run Cygwin-portable-setup.bat to start the installation with correct settings.

- Follow the guided installation process as usual, choosing any additional packages you want.

- Done!





Usage hints:

- Use Cygwin-portable.bat to start a shell.

- Your home directory is /home, not /home/username.
  This way you're always at home whoever you happen to be.

- The /sf directory contains symbolic links to special folders on your windows box.
  They are updated automatically as you move around.
  You may want to link some of them from your home directory like this:
   ln -s /sf/desktop desktop

- The /parent symlink points to the parent of the cygwin install folder.
  This is also updated as you move around.

- If you set up servers like sshd, be sure to know what you're doing.
  Installing windows services that depend on a drive you'll remove in a minute is usually not a good idea.
  However, since your cygwin install is portable, you could just copy it to get a local installation.
  To do this, close all cygwin processes and use the windows GUI to copy/paste.

- Use Cygwin-portable-setup.bat to add/remove packages.
  If the setup program complains about being out of date, you may update it this way:
  - Cancel the installation
  - Delete cygwin\cygwin-portable\setup-*.exe
  - Start Cygwin-portable-setup.bat again

- These files are safe to delete if you don't want them:
  - Cygwin-portable.bat
    (Shortcut to cygwin\cygwin-portable\Cygwin.bat)
  - Cygwin-portable-setup.bat
    (Shortcut to cygwin\cygwin-portable\Setup.bat)
  - autorun.inf
    (Will give your USB drive a cygwin icon if placed in the drive root)
  - cygwin\Packages
    (Temporary files downloaded during installation)
  - README.txt
    (This file)
  - cygwin\cygwin-portable\setup-*.exe
    (Will be re-downloaded automatically if/when needed)

- These files are safe to delete when no cygwin process is running:
  - cygwin\parent
  - cygwin\sf
  - cygwin\cygwin-portable\dynamic
  - cygwin\cygwin-portable\cur
  - cygwin\cygwin-portable\session-chcp
  - cygwin\cygwin-portable\session-id
