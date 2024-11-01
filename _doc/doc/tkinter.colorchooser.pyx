*tkinter.colorchooser.pyx*                    Last change: 2023 Sep 15

"tkinter.colorchooser" — Color choosing dialog
**********************************************

**Source code:** Lib/tkinter/colorchooser.py

======================================================================

The "tkinter.colorchooser" module provides the "Chooser" class as an
interface to the native color picker dialog. "Chooser" implements a
modal color choosing dialog window. The "Chooser" class inherits from
the "Dialog" class.

                                   *Chooser..tkinter.colorchooser.pyx*
class tkinter.colorchooser.Chooser(master=None, **options)

                                *askcolor()..tkinter.colorchooser.pyx*
tkinter.colorchooser.askcolor(color=None, **options)

   Create a color choosing dialog. A call to this method will show the
   window, wait for the user to make a selection, and return the
   selected color (or "None") to the caller.

See also:

  Module "tkinter.commondialog"
     Tkinter standard dialog module

vim:tw=78:ts=8:ft=help:norl: