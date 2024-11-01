*tkinter.font.pyx*                            Last change: 2023 Sep 15

"tkinter.font" — Tkinter font wrapper
*************************************

**Source code:** Lib/tkinter/font.py

======================================================================

The "tkinter.font" module provides the "Font" class for creating and
using named fonts.

The different font weights and slants are:

tkinter.font.NORMAL                         *NORMAL..tkinter.font.pyx*
tkinter.font.BOLD                             *BOLD..tkinter.font.pyx*
tkinter.font.ITALIC                         *ITALIC..tkinter.font.pyx*
tkinter.font.ROMAN                           *ROMAN..tkinter.font.pyx*

                                              *Font..tkinter.font.pyx*
class tkinter.font.Font(root=None, font=None, name=None, exists=False, **options)

   The "Font" class represents a named font. _Font_ instances are
   given unique names and can be specified by their family, size, and
   style configuration. Named fonts are Tk’s method of creating and
   identifying fonts as a single object, rather than specifying a font
   by its attributes with each occurrence.

      arguments:

            _font_ - font specifier tuple (family, size, options)
            _name_ - unique font name
            _exists_ - self points to existing named font if true

      additional keyword options (ignored if _font_ is specified):

            _family_ - font family i.e. Courier, Times
            _size_ - font size
               If _size_ is positive it is interpreted as size in points.
               If _size_ is a negative number its absolute value is treated
               as size in pixels.
            _weight_ - font emphasis (NORMAL, BOLD)
            _slant_ - ROMAN, ITALIC
            _underline_ - font underlining (0 - none, 1 - underline)
            _overstrike_ - font strikeout (0 - none, 1 - strikeout)

                                     *Font.actual()..tkinter.font.pyx*
   actual(option=None, displayof=None)

      Return the attributes of the font.

   cget(option)                           *Font.cget()..tkinter.font.pyx*

      Retrieve an attribute of the font.

   config(**options)                    *Font.config()..tkinter.font.pyx*

      Modify attributes of the font.

   copy()                                 *Font.copy()..tkinter.font.pyx*

      Return new instance of the current font.

   measure(text, displayof=None)       *Font.measure()..tkinter.font.pyx*

      Return amount of space the text would occupy on the specified
      display when formatted in the current font. If no display is
      specified then the main application window is assumed.

   metrics(*options, **kw)             *Font.metrics()..tkinter.font.pyx*

      Return font-specific data. Options include:

      _ascent_ - distance between baseline and highest point that a
         character of the font can occupy

      _descent_ - distance between baseline and lowest point that a
         character of the font can occupy

      _linespace_ - minimum vertical separation necessary between any
      two
         characters of the font that ensures no vertical overlap
         between lines.

      _fixed_ - 1 if font is fixed-width else 0

                                        *families()..tkinter.font.pyx*
tkinter.font.families(root=None, displayof=None)

   Return the different font families.

tkinter.font.names(root=None)              *names()..tkinter.font.pyx*

   Return the names of defined fonts.

                                      *nametofont()..tkinter.font.pyx*
tkinter.font.nametofont(name, root=None)

   Return a "Font" representation of a tk named font.

   Changed in version 3.10: The _root_ parameter was added.

vim:tw=78:ts=8:ft=help:norl: