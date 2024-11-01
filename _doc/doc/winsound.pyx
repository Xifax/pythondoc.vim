*winsound.pyx*                                Last change: 2023 Sep 15

"winsound" — Sound-playing interface for Windows
************************************************

======================================================================

The "winsound" module provides access to the basic sound-playing
machinery provided by Windows platforms.  It includes functions and
several constants.

winsound.Beep(frequency, duration)              *Beep()..winsound.pyx*

   Beep the PC’s speaker. The _frequency_ parameter specifies
   frequency, in hertz, of the sound, and must be in the range 37
   through 32,767. The _duration_ parameter specifies the number of
   milliseconds the sound should last.  If the system is not able to
   beep the speaker, "RuntimeError" is raised.

winsound.PlaySound(sound, flags)           *PlaySound()..winsound.pyx*

   Call the underlying "PlaySound()" function from the Platform API.
   The _sound_ parameter may be a filename, a system sound alias,
   audio data as a _bytes-like object_, or "None".  Its interpretation
   depends on the value of _flags_, which can be a bitwise ORed
   combination of the constants described below. If the _sound_
   parameter is "None", any currently playing waveform sound is
   stopped. If the system indicates an error, "RuntimeError" is
   raised.

winsound.MessageBeep(type=MB_OK)         *MessageBeep()..winsound.pyx*

   Call the underlying "MessageBeep()" function from the Platform API.
   This plays a sound as specified in the registry.  The _type_
   argument specifies which sound to play; possible values are "-1",
   "MB_ICONASTERISK", "MB_ICONEXCLAMATION", "MB_ICONHAND",
   "MB_ICONQUESTION", and "MB_OK", all described below.  The value
   "-1" produces a “simple beep”; this is the final fallback if a
   sound cannot be played otherwise.  If the system indicates an
   error, "RuntimeError" is raised.

winsound.SND_FILENAME                     *SND_FILENAME..winsound.pyx*

   The _sound_ parameter is the name of a WAV file. Do not use with
   "SND_ALIAS".

winsound.SND_ALIAS                           *SND_ALIAS..winsound.pyx*

   The _sound_ parameter is a sound association name from the
   registry.  If the registry contains no such name, play the system
   default sound unless "SND_NODEFAULT" is also specified. If no
   default sound is registered, raise "RuntimeError". Do not use with
   "SND_FILENAME".

   All Win32 systems support at least the following; most systems
   support many more:

   +----------------------------+------------------------------------------+
   | "PlaySound()" _name_       | Corresponding Control Panel Sound name   |
   |============================|==========================================|
   | "'SystemAsterisk'"         | Asterisk                                 |
   +----------------------------+------------------------------------------+
   | "'SystemExclamation'"      | Exclamation                              |
   +----------------------------+------------------------------------------+
   | "'SystemExit'"             | Exit Windows                             |
   +----------------------------+------------------------------------------+
   | "'SystemHand'"             | Critical Stop                            |
   +----------------------------+------------------------------------------+
   | "'SystemQuestion'"         | Question                                 |
   +----------------------------+------------------------------------------+

   For example:
>
      import winsound
      # Play Windows exit sound.
      winsound.PlaySound("SystemExit", winsound.SND_ALIAS)

      # Probably play Windows default sound, if any is registered (because
      # "*" probably isn't the registered name of any sound).
      winsound.PlaySound("*", winsound.SND_ALIAS)
<
winsound.SND_LOOP                             *SND_LOOP..winsound.pyx*

   Play the sound repeatedly.  The "SND_ASYNC" flag must also be used
   to avoid blocking.  Cannot be used with "SND_MEMORY".

winsound.SND_MEMORY                         *SND_MEMORY..winsound.pyx*

   The _sound_ parameter to "PlaySound()" is a memory image of a WAV
   file, as a _bytes-like object_.

   Note:

     This module does not support playing from a memory image
     asynchronously, so a combination of this flag and "SND_ASYNC"
     will raise "RuntimeError".

winsound.SND_PURGE                           *SND_PURGE..winsound.pyx*

   Stop playing all instances of the specified sound.

   Note:

     This flag is not supported on modern Windows platforms.

winsound.SND_ASYNC                           *SND_ASYNC..winsound.pyx*

   Return immediately, allowing sounds to play asynchronously.

winsound.SND_NODEFAULT                   *SND_NODEFAULT..winsound.pyx*

   If the specified sound cannot be found, do not play the system
   default sound.

winsound.SND_NOSTOP                         *SND_NOSTOP..winsound.pyx*

   Do not interrupt sounds currently playing.

winsound.SND_NOWAIT                         *SND_NOWAIT..winsound.pyx*

   Return immediately if the sound driver is busy.

   Note:

     This flag is not supported on modern Windows platforms.

winsound.MB_ICONASTERISK               *MB_ICONASTERISK..winsound.pyx*

   Play the "SystemDefault" sound.

winsound.MB_ICONEXCLAMATION         *MB_ICONEXCLAMATION..winsound.pyx*

   Play the "SystemExclamation" sound.

winsound.MB_ICONHAND                       *MB_ICONHAND..winsound.pyx*

   Play the "SystemHand" sound.

winsound.MB_ICONQUESTION               *MB_ICONQUESTION..winsound.pyx*

   Play the "SystemQuestion" sound.

winsound.MB_OK                                   *MB_OK..winsound.pyx*

   Play the "SystemDefault" sound.

vim:tw=78:ts=8:ft=help:norl: