*tk.pyx*                                      Last change: 2023 Sep 15

Graphical User Interfaces with Tk
*********************************

Tk/Tcl has long been an integral part of Python.  It provides a robust
and platform independent windowing toolkit, that is available to
Python programmers using the "tkinter" package, and its extension, the
"tkinter.ttk" module.

The "tkinter" package is a thin object-oriented layer on top of
Tcl/Tk. To use "tkinter", you don’t need to write Tcl code, but you
will need to consult the Tk documentation, and occasionally the Tcl
documentation. "tkinter" is a set of wrappers that implement the Tk
widgets as Python classes.

"tkinter"’s chief virtues are that it is fast, and that it usually
comes bundled with Python. Although its standard documentation is
weak, good material is available, which includes: references,
tutorials, a book and others. "tkinter" is also famous for having an
outdated look and feel, which has been vastly improved in Tk 8.5.
Nevertheless, there are many other GUI libraries that you could be
interested in. The Python wiki lists several alternative GUI
frameworks and tools.

* "tkinter" — Python interface to Tcl/Tk

  * Architecture

  * Tkinter Modules

    * "Tk"

      * "Tk.tk"

      * "Tk.master"

      * "Tk.children"

    * "Tcl()"

  * Tkinter Life Preserver

    * A Hello World Program

    * Important Tk Concepts

    * Understanding How Tkinter Wraps Tcl/Tk

    * How do I…? What option does…?

    * Navigating the Tcl/Tk Reference Manual

  * Threading model

  * Handy Reference

    * Setting Options

    * The Packer

    * Packer Options

    * Coupling Widget Variables

    * The Window Manager

    * Tk Option Data Types

    * Bindings and Events

    * The index Parameter

    * Images

  * File Handlers

    * "Widget.tk.createfilehandler()"

    * "Widget.tk.deletefilehandler()"

    * "READABLE"

    * "WRITABLE"

    * "EXCEPTION"

* "tkinter.colorchooser" — Color choosing dialog

  * "Chooser"

  * "askcolor()"

* "tkinter.font" — Tkinter font wrapper

  * "NORMAL"

  * "BOLD"

  * "ITALIC"

  * "ROMAN"

  * "Font"

    * "Font.actual()"

    * "Font.cget()"

    * "Font.config()"

    * "Font.copy()"

    * "Font.measure()"

    * "Font.metrics()"

  * "families()"

  * "names()"

  * "nametofont()"

* Tkinter Dialogs

  * "tkinter.simpledialog" — Standard Tkinter input dialogs

    * "askfloat()"

    * "askinteger()"

    * "askstring()"

    * "Dialog"

      * "Dialog.body()"

      * "Dialog.buttonbox()"

  * "tkinter.filedialog" — File selection dialogs

    * Native Load/Save Dialogs

      * "askopenfile()"

      * "askopenfiles()"

      * "asksaveasfile()"

      * "askopenfilename()"

      * "askopenfilenames()"

      * "asksaveasfilename()"

      * "askdirectory()"

      * "Open"

      * "SaveAs"

      * "Directory"

      * "FileDialog"

        * "FileDialog.cancel_command()"

        * "FileDialog.dirs_double_event()"

        * "FileDialog.dirs_select_event()"

        * "FileDialog.files_double_event()"

        * "FileDialog.files_select_event()"

        * "FileDialog.filter_command()"

        * "FileDialog.get_filter()"

        * "FileDialog.get_selection()"

        * "FileDialog.go()"

        * "FileDialog.ok_event()"

        * "FileDialog.quit()"

        * "FileDialog.set_filter()"

        * "FileDialog.set_selection()"

      * "LoadFileDialog"

        * "LoadFileDialog.ok_command()"

      * "SaveFileDialog"

        * "SaveFileDialog.ok_command()"

  * "tkinter.commondialog" — Dialog window templates

    * "Dialog"

      * "Dialog.show()"

* "tkinter.messagebox" — Tkinter message prompts

  * "Message"

  * "showinfo()"

  * "showwarning()"

  * "showerror()"

  * "askquestion()"

  * "askokcancel()"

  * "askretrycancel()"

  * "askyesno()"

  * "askyesnocancel()"

* "tkinter.scrolledtext" — Scrolled Text Widget

  * "ScrolledText"

    * "ScrolledText.frame"

    * "ScrolledText.vbar"

* "tkinter.dnd" — Drag and drop support

  * "DndHandler"

    * "DndHandler.cancel()"

    * "DndHandler.finish()"

    * "DndHandler.on_motion()"

    * "DndHandler.on_release()"

  * "dnd_start()"

* "tkinter.ttk" — Tk themed widgets

  * Using Ttk

  * Ttk Widgets

  * Widget

    * Standard Options

    * Scrollable Widget Options

    * Label Options

    * Compatibility Options

    * Widget States

    * ttk.Widget

      * "Widget"

        * "Widget.identify()"

        * "Widget.instate()"

        * "Widget.state()"

  * Combobox

    * Options

    * Virtual events

    * ttk.Combobox

      * "Combobox"

        * "Combobox.current()"

        * "Combobox.get()"

        * "Combobox.set()"

  * Spinbox

    * Options

    * Virtual events

    * ttk.Spinbox

      * "Spinbox"

        * "Spinbox.get()"

        * "Spinbox.set()"

  * Notebook

    * Options

    * Tab Options

    * Tab Identifiers

    * Virtual Events

    * ttk.Notebook

      * "Notebook"

        * "Notebook.add()"

        * "Notebook.forget()"

        * "Notebook.hide()"

        * "Notebook.identify()"

        * "Notebook.index()"

        * "Notebook.insert()"

        * "Notebook.select()"

        * "Notebook.tab()"

        * "Notebook.tabs()"

        * "Notebook.enable_traversal()"

  * Progressbar

    * Options

    * ttk.Progressbar

      * "Progressbar"

        * "Progressbar.start()"

        * "Progressbar.step()"

        * "Progressbar.stop()"

  * Separator

    * Options

  * Sizegrip

    * Platform-specific notes

    * Bugs

  * Treeview

    * Options

    * Item Options

    * Tag Options

    * Column Identifiers

    * Virtual Events

    * ttk.Treeview

      * "Treeview"

        * "Treeview.bbox()"

        * "Treeview.get_children()"

        * "Treeview.set_children()"

        * "Treeview.column()"

        * "Treeview.delete()"

        * "Treeview.detach()"

        * "Treeview.exists()"

        * "Treeview.focus()"

        * "Treeview.heading()"

        * "Treeview.identify()"

        * "Treeview.identify_row()"

        * "Treeview.identify_column()"

        * "Treeview.identify_region()"

        * "Treeview.identify_element()"

        * "Treeview.index()"

        * "Treeview.insert()"

        * "Treeview.item()"

        * "Treeview.move()"

        * "Treeview.next()"

        * "Treeview.parent()"

        * "Treeview.prev()"

        * "Treeview.reattach()"

        * "Treeview.see()"

        * "Treeview.selection()"

        * "Treeview.selection_set()"

        * "Treeview.selection_add()"

        * "Treeview.selection_remove()"

        * "Treeview.selection_toggle()"

        * "Treeview.set()"

        * "Treeview.tag_bind()"

        * "Treeview.tag_configure()"

        * "Treeview.tag_has()"

        * "Treeview.xview()"

        * "Treeview.yview()"

  * Ttk Styling

    * "Style"

      * "Style.configure()"

      * "Style.map()"

      * "Style.lookup()"

      * "Style.layout()"

      * "Style.element_create()"

      * "Style.element_names()"

      * "Style.element_options()"

      * "Style.theme_create()"

      * "Style.theme_settings()"

      * "Style.theme_names()"

      * "Style.theme_use()"

    * Layouts

* IDLE

  * Menus

    * File menu (Shell and Editor)

    * Edit menu (Shell and Editor)

    * Format menu (Editor window only)

    * Run menu (Editor window only)

    * Shell menu (Shell window only)

    * Debug menu (Shell window only)

    * Options menu (Shell and Editor)

    * Window menu (Shell and Editor)

    * Help menu (Shell and Editor)

    * Context menus

  * Editing and Navigation

    * Editor windows

    * Key bindings

    * Automatic indentation

    * Search and Replace

    * Completions

    * Calltips

    * Code Context

    * Shell window

    * Text colors

  * Startup and Code Execution

    * Command line usage

    * Startup failure

    * Running user code

    * User output in Shell

    * Developing tkinter applications

    * Running without a subprocess

  * Help and Preferences

    * Help sources

    * Setting preferences

    * IDLE on macOS

    * Extensions

  * idlelib

vim:tw=78:ts=8:ft=help:norl: