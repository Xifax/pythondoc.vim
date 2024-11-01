*curses.panel.pyx*                            Last change: 2023 Sep 15

"curses.panel" — A panel stack extension for curses
***************************************************

======================================================================

Panels are windows with the added feature of depth, so they can be
stacked on top of each other, and only the visible portions of each
window will be displayed.  Panels can be added, moved up or down in
the stack, and removed.


Functions
=========

The module "curses.panel" defines the following functions:

curses.panel.bottom_panel()         *bottom_panel()..curses.panel.pyx*

   Returns the bottom panel in the panel stack.

curses.panel.new_panel(win)            *new_panel()..curses.panel.pyx*

   Returns a panel object, associating it with the given window _win_.
   Be aware that you need to keep the returned panel object referenced
   explicitly.  If you don’t, the panel object is garbage collected
   and removed from the panel stack.

curses.panel.top_panel()               *top_panel()..curses.panel.pyx*

   Returns the top panel in the panel stack.

curses.panel.update_panels()       *update_panels()..curses.panel.pyx*

   Updates the virtual screen after changes in the panel stack. This
   does not call "curses.doupdate()", so you’ll have to do this
   yourself.


Panel Objects
=============

Panel objects, as returned by "new_panel()" above, are windows with a
stacking order. There’s always a window associated with a panel which
determines the content, while the panel methods are responsible for
the window’s depth in the panel stack.

Panel objects have the following methods:

Panel.above()                        *Panel.above()..curses.panel.pyx*

   Returns the panel above the current panel.

Panel.below()                        *Panel.below()..curses.panel.pyx*

   Returns the panel below the current panel.

Panel.bottom()                      *Panel.bottom()..curses.panel.pyx*

   Push the panel to the bottom of the stack.

Panel.hidden()                      *Panel.hidden()..curses.panel.pyx*

   Returns "True" if the panel is hidden (not visible), "False"
   otherwise.

Panel.hide()                          *Panel.hide()..curses.panel.pyx*

   Hide the panel. This does not delete the object, it just makes the
   window on screen invisible.

Panel.move(y, x)                      *Panel.move()..curses.panel.pyx*

   Move the panel to the screen coordinates "(y, x)".

Panel.replace(win)                 *Panel.replace()..curses.panel.pyx*

   Change the window associated with the panel to the window _win_.

Panel.set_userptr(obj)         *Panel.set_userptr()..curses.panel.pyx*

   Set the panel’s user pointer to _obj_. This is used to associate an
   arbitrary piece of data with the panel, and can be any Python
   object.

Panel.show()                          *Panel.show()..curses.panel.pyx*

   Display the panel (which might have been hidden).

Panel.top()                            *Panel.top()..curses.panel.pyx*

   Push panel to the top of the stack.

Panel.userptr()                    *Panel.userptr()..curses.panel.pyx*

   Returns the user pointer for the panel.  This might be any Python
   object.

Panel.window()                      *Panel.window()..curses.panel.pyx*

   Returns the window object associated with the panel.

vim:tw=78:ts=8:ft=help:norl: