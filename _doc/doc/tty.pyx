*tty.pyx*                                     Last change: 2023 Sep 15

"tty" — Terminal control functions
**********************************

**Source code:** Lib/tty.py

======================================================================

The "tty" module defines functions for putting the tty into cbreak and
raw modes.

Because it requires the "termios" module, it will work only on Unix.

The "tty" module defines the following functions:

tty.cfmakeraw(mode)                             *cfmakeraw()..tty.pyx*

   Convert the tty attribute list _mode_, which is a list like the one
   returned by "termios.tcgetattr()", to that of a tty in raw mode.

   New in version 3.12.

tty.cfmakecbreak(mode)                       *cfmakecbreak()..tty.pyx*

   Convert the tty attribute list _mode_, which is a list like the one
   returned by "termios.tcgetattr()", to that of a tty in cbreak mode.

   New in version 3.12.

tty.setraw(fd, when=termios.TCSAFLUSH)             *setraw()..tty.pyx*

   Change the mode of the file descriptor _fd_ to raw. If _when_ is
   omitted, it defaults to "termios.TCSAFLUSH", and is passed to
   "termios.tcsetattr()". The return value of "termios.tcgetattr()" is
   saved before setting _fd_ to raw mode; this value is returned.

tty.setcbreak(fd, when=termios.TCSAFLUSH)       *setcbreak()..tty.pyx*

   Change the mode of file descriptor _fd_ to cbreak. If _when_ is
   omitted, it defaults to "termios.TCSAFLUSH", and is passed to
   "termios.tcsetattr()". The return value of "termios.tcgetattr()" is
   saved before setting _fd_ to cbreak mode; this value is returned.

See also:

  Module "termios"
     Low-level terminal control interface.

vim:tw=78:ts=8:ft=help:norl: