*unix.pyx*                                    Last change: 2023 Sep 15

Unix Specific Services
**********************

The modules described in this chapter provide interfaces to features
that are unique to the Unix operating system, or in some cases to some
or many variants of it.  Here’s an overview:

* "posix" — The most common POSIX system calls

  * Large File Support

  * Notable Module Contents

    * "environ"

* "pwd" — The password database

  * "getpwuid()"

  * "getpwnam()"

  * "getpwall()"

* "grp" — The group database

  * "getgrgid()"

  * "getgrnam()"

  * "getgrall()"

* "termios" — POSIX style tty control

  * "tcgetattr()"

  * "tcsetattr()"

  * "tcsendbreak()"

  * "tcdrain()"

  * "tcflush()"

  * "tcflow()"

  * "tcgetwinsize()"

  * "tcsetwinsize()"

  * Example

* "tty" — Terminal control functions

  * "cfmakeraw()"

  * "cfmakecbreak()"

  * "setraw()"

  * "setcbreak()"

* "pty" — Pseudo-terminal utilities

  * "fork()"

  * "openpty()"

  * "spawn()"

  * Example

* "fcntl" — The "fcntl" and "ioctl" system calls

  * "fcntl()"

  * "ioctl()"

  * "flock()"

  * "lockf()"

* "resource" — Resource usage information

  * "error"

  * Resource Limits

    * "RLIM_INFINITY"

    * "getrlimit()"

    * "setrlimit()"

    * "prlimit()"

    * "RLIMIT_CORE"

    * "RLIMIT_CPU"

    * "RLIMIT_FSIZE"

    * "RLIMIT_DATA"

    * "RLIMIT_STACK"

    * "RLIMIT_RSS"

    * "RLIMIT_NPROC"

    * "RLIMIT_NOFILE"

    * "RLIMIT_OFILE"

    * "RLIMIT_MEMLOCK"

    * "RLIMIT_VMEM"

    * "RLIMIT_AS"

    * "RLIMIT_MSGQUEUE"

    * "RLIMIT_NICE"

    * "RLIMIT_RTPRIO"

    * "RLIMIT_RTTIME"

    * "RLIMIT_SIGPENDING"

    * "RLIMIT_SBSIZE"

    * "RLIMIT_SWAP"

    * "RLIMIT_NPTS"

    * "RLIMIT_KQUEUES"

  * Resource Usage

    * "getrusage()"

    * "getpagesize()"

    * "RUSAGE_SELF"

    * "RUSAGE_CHILDREN"

    * "RUSAGE_BOTH"

    * "RUSAGE_THREAD"

* "syslog" — Unix syslog library routines

  * "syslog()"

  * "openlog()"

  * "closelog()"

  * "setlogmask()"

  * Examples

    * Simple example

vim:tw=78:ts=8:ft=help:norl: