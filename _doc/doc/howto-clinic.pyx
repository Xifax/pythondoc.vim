*howto-clinic.pyx*                            Last change: 2023 Sep 15

Argument Clinic How-To
**********************

author:
   Larry Hastings

**Source code:** Tools/clinic/clinic.py.


Abstract
^^^^^^^^

Argument Clinic is a preprocessor for CPython C files. It was
introduced in Python 3.4 with **PEP 436**, in order to provide
introspection signatures, and to generate performant and tailor-made
boilerplate code for argument parsing in CPython builtins, module
level functions, and class methods. This document is divided in four
major sections:

* Background talks about the basic concepts and goals of Argument
  Clinic.

* Reference describes the command-line interface and Argument Clinic
  terminology.

* Tutorial guides you through all the steps required to adapt an
  existing C function to Argument Clinic.

* How-to guides details how to handle specific tasks.

Note:

  Argument Clinic is considered internal-only for CPython.  Its use is
  not supported for files outside CPython, and no guarantees are made
  regarding backwards compatibility for future versions.  In other
  words: if you maintain an external C extension for CPython, you’re
  welcome to experiment with Argument Clinic in your own code.  But
  the version of Argument Clinic that ships with the next version of
  CPython _could_ be totally incompatible and break all your code.


Background
==========


Basic concepts
--------------

When Argument Clinic is run on a file, either via the Command-line
interface or via "make clinic", it will scan over the input files
looking for _start lines_:
>
   /*[clinic input]
<
When it finds one, it reads everything up to the _end line_:
>
   [clinic start generated code]*/
<
Everything in between these two lines is Argument Clinic _input_. When
Argument Clinic parses input, it generates _output_. The output is
rewritten into the C file immediately after the input, followed by a
_checksum line_. All of these lines, including the _start line_ and
_checksum line_, are collectively called an Argument Clinic _block_:
>
   /*[clinic input]
   ... clinic input goes here ...
   [clinic start generated code]*/
   ... clinic output goes here ...
   /*[clinic end generated code: ...]*/
<
If you run Argument Clinic on the same file a second time, Argument
Clinic will discard the old _output_ and write out the new output with
a fresh _checksum line_. If the _input_ hasn’t changed, the output
won’t change either.

Note:

  You should never modify the output of an Argument Clinic block, as
  any change will be lost in future Argument Clinic runs; Argument
  Clinic will detect an output checksum mismatch and regenerate the
  correct output. If you are not happy with the generated output, you
  should instead change the input until it produces the output you
  want.


Reference
=========


Terminology
-----------

start line
   The line "/*[clinic input]". This line marks the beginning of
   Argument Clinic input. Note that the _start line_ opens a C block
   comment.

end line
   The line "[clinic start generated code]*/". The _end line_ marks
   the _end_ of Argument Clinic _input_, but at the same time marks
   the _start_ of Argument Clinic _output_, thus the text _“clinic
   start start generated code”_ Note that the _end line_ closes the C
   block comment opened by the _start line_.

checksum
   A hash to distinguish unique _inputs_ and _outputs_.

checksum line
   A line that looks like "/*[clinic end generated code: ...]*/". The
   three dots will be replaced by a _checksum_ generated from the
   _input_, and a _checksum_ generated from the _output_. The checksum
   line marks the end of Argument Clinic generated code, and is used
   by Argument Clinic to determine if it needs to regenerate output.

input
   The text between the _start line_ and the _end line_. Note that the
   start and end lines open and close a C block comment; the _input_
   is thus a part of that same C block comment.

output
   The text between the _end line_ and the _checksum line_.

block
   All text from the _start line_ to the _checksum line_ inclusively.


Command-line interface
----------------------

The Argument Clinic CLI (Command-Line Interface) is typically used to
process a single source file, like this:
>
   $ python3 ./Tools/clinic/clinic.py foo.c
<
The CLI supports the following options:

-h, --help

   Print CLI usage.

-f, --force

   Force output regeneration.

-o, --output OUTPUT

   Redirect file output to OUTPUT

-v, --verbose

   Enable verbose mode.

--converters

   Print a list of all supported converters and return converters.

--make

   Walk "--srcdir" to run over all relevant files.

--srcdir SRCDIR

   The directory tree to walk in "--make" mode.

--exclude EXCLUDE

   A file to exclude in "--make" mode. This option can be given
   multiple times.

--limited

   Use the Limited API to parse arguments in the generated C code. See
   How to use the Limited C API.

FILE ...

   The list of files to process.


Classes for extending Argument Clinic
-------------------------------------

class clinic.CConverter                 *CConverter..howto-clinic.pyx*

   The base class for all converters. See How to write a custom
   converter for how to subclass this class.

   type                               *CConverter.type..howto-clinic.pyx*

      The C type to use for this variable. "type" should be a Python
      string specifying the type, e.g. "'int'". If this is a pointer
      type, the type string should end with "' *'".

   default                         *CConverter.default..howto-clinic.pyx*

      The Python default value for this parameter, as a Python value.
      Or the magic value "unspecified" if there is no default.

   py_default                   *CConverter.py_default..howto-clinic.pyx*

      "default" as it should appear in Python code, as a string. Or
      "None" if there is no default.

   c_default                     *CConverter.c_default..howto-clinic.pyx*

      "default" as it should appear in C code, as a string. Or "None"
      if there is no default.

   c_ignored_default     *CConverter.c_ignored_default..howto-clinic.pyx*

      The default value used to initialize the C variable when there
      is no default, but not specifying a default may result in an
      “uninitialized variable” warning.  This can easily happen when
      using option groups—although properly written code will never
      actually use this value, the variable does get passed in to the
      impl, and the C compiler will complain about the “use” of the
      uninitialized value.  This value should always be a non-empty
      string.

   converter                     *CConverter.converter..howto-clinic.pyx*

      The name of the C converter function, as a string.

   impl_by_reference     *CConverter.impl_by_reference..howto-clinic.pyx*

      A boolean value.  If true, Argument Clinic will add a "&" in
      front of the name of the variable when passing it into the impl
      function.

   parse_by_reference   *CConverter.parse_by_reference..howto-clinic.pyx*

      A boolean value.  If true, Argument Clinic will add a "&" in
      front of the name of the variable when passing it into
      "PyArg_ParseTuple()".


Tutorial
========

The best way to get a sense of how Argument Clinic works is to convert
a function to work with it.  Here, then, are the bare minimum steps
you’d need to follow to convert a function to work with Argument
Clinic.  Note that for code you plan to check in to CPython, you
really should take the conversion farther, using some of the advanced
concepts you’ll see later on in the document, like How to use return
converters and How to use the “self converter”. But we’ll keep it
simple for this walkthrough so you can learn.

First, make sure you’re working with a freshly updated checkout of the
CPython trunk.

Next, find a Python builtin that calls either "PyArg_ParseTuple()" or
"PyArg_ParseTupleAndKeywords()", and hasn’t been converted to work
with Argument Clinic yet. For this tutorial, we’ll be using
"_pickle.Pickler.dump".

If the call to the "PyArg_Parse*()" function uses any of the following
format units…:

      O&
      O!
      es
      es#
      et
      et#
<
… or if it has multiple calls to "PyArg_ParseTuple()", you should
choose a different function. (See How to use advanced converters for
those scenarios.)

Also, if the function has multiple calls to "PyArg_ParseTuple()" or
"PyArg_ParseTupleAndKeywords()" where it supports different types for
the same argument, or if the function uses something besides
"PyArg_Parse*()" functions to parse its arguments, it probably isn’t
suitable for conversion to Argument Clinic.  Argument Clinic doesn’t
support generic functions or polymorphic parameters.

Next, add the following boilerplate above the function, creating our
input block:
>
   /*[clinic input]
   [clinic start generated code]*/
<
Cut the docstring and paste it in between the "[clinic]" lines,
removing all the junk that makes it a properly quoted C string. When
you’re done you should have just the text, based at the left margin,
with no line wider than 80 characters. Argument Clinic will preserve
indents inside the docstring.

If the old docstring had a first line that looked like a function
signature, throw that line away; The docstring doesn’t need it anymore
— when you use "help()" on your builtin in the future, the first line
will be built automatically based on the function’s signature.

Example docstring summary line:
>
   /*[clinic input]
   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
If your docstring doesn’t have a “summary” line, Argument Clinic will
complain, so let’s make sure it has one.  The “summary” line should be
a paragraph consisting of a single 80-column line at the beginning of
the docstring. (See **PEP 257** regarding docstring conventions.)

Our example docstring consists solely of a summary line, so the sample
code doesn’t have to change for this step.

Now, above the docstring, enter the name of the function, followed by
a blank line.  This should be the Python name of the function, and
should be the full dotted path to the function — it should start with
the name of the module, include any sub-modules, and if the function
is a method on a class it should include the class name too.

In our example, "_pickle" is the module, "Pickler" is the class, and
"dump()" is the method, so the name becomes "_pickle.Pickler.dump()":
>
   /*[clinic input]
   _pickle.Pickler.dump

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
If this is the first time that module or class has been used with
Argument Clinic in this C file, you must declare the module and/or
class.  Proper Argument Clinic hygiene prefers declaring these in a
separate block somewhere near the top of the C file, in the same way
that include files and statics go at the top. In our sample code we’ll
just show the two blocks next to each other.

The name of the class and module should be the same as the one seen by
Python.  Check the name defined in the "PyModuleDef" or "PyTypeObject"
as appropriate.

When you declare a class, you must also specify two aspects of its
type in C: the type declaration you’d use for a pointer to an instance
of this class, and a pointer to the "PyTypeObject" for this class:
>
   /*[clinic input]
   module _pickle
   class _pickle.Pickler "PicklerObject *" "&Pickler_Type"
   [clinic start generated code]*/

   /*[clinic input]
   _pickle.Pickler.dump

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
Declare each of the parameters to the function.  Each parameter should
get its own line.  All the parameter lines should be indented from the
function name and the docstring. The general form of these parameter
lines is as follows:
>
   name_of_parameter: converter
<
If the parameter has a default value, add that after the converter:
>
   name_of_parameter: converter = default_value
<
Argument Clinic’s support for “default values” is quite sophisticated;
see How to assign default values to parameter for more information.

Next, add a blank line below the parameters.

What’s a “converter”? It establishes both the type of the variable
used in C, and the method to convert the Python value into a C value
at runtime. For now you’re going to use what’s called a “legacy
converter” — a convenience syntax intended to make porting old code
into Argument Clinic easier.

For each parameter, copy the “format unit” for that parameter from the
"PyArg_Parse()" format argument and specify _that_ as its converter,
as a quoted string. The “format unit” is the formal name for the one-
to-three character substring of the _format_ parameter that tells the
argument parsing function what the type of the variable is and how to
convert it. For more on format units please see Parsing arguments and
building values.

For multicharacter format units like "z#", use the entire two-or-three
character string.

Sample:
>
   /*[clinic input]
   module _pickle
   class _pickle.Pickler "PicklerObject *" "&Pickler_Type"
   [clinic start generated code]*/

   /*[clinic input]
   _pickle.Pickler.dump

       obj: 'O'

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
If your function has "|" in the format string, meaning some parameters
have default values, you can ignore it. Argument Clinic infers which
parameters are optional based on whether or not they have default
values.

If your function has "$" in the format string, meaning it takes
keyword-only arguments, specify "*" on a line by itself before the
first keyword-only argument, indented the same as the parameter lines.

"_pickle.Pickler.dump()" has neither, so our sample is unchanged.

Next, if the existing C function calls "PyArg_ParseTuple()" (as
opposed to "PyArg_ParseTupleAndKeywords()"), then all its arguments
are positional-only.

To mark parameters as positional-only in Argument Clinic, add a "/" on
a line by itself after the last positional-only parameter, indented
the same as the parameter lines.

Sample:
>
   /*[clinic input]
   module _pickle
   class _pickle.Pickler "PicklerObject *" "&Pickler_Type"
   [clinic start generated code]*/

   /*[clinic input]
   _pickle.Pickler.dump

       obj: 'O'
       /

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
It can be helpful to write a per-parameter docstring for each
parameter. Since per-parameter docstrings are optional, you can skip
this step if you prefer.

Nevertheless, here’s how to add a per-parameter docstring. The first
line of the per-parameter docstring must be indented further than the
parameter definition. The left margin of this first line establishes
the left margin for the whole per-parameter docstring; all the text
you write will be outdented by this amount. You can write as much text
as you like, across multiple lines if you wish.

Sample:
>
   /*[clinic input]
   module _pickle
   class _pickle.Pickler "PicklerObject *" "&Pickler_Type"
   [clinic start generated code]*/

   /*[clinic input]
   _pickle.Pickler.dump

       obj: 'O'
           The object to be pickled.
       /

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
Save and close the file, then run "Tools/clinic/clinic.py" on it. With
luck everything worked—your block now has output, and a ".c.h" file
has been generated! Reload the file in your text editor to see the
generated code:
>
   /*[clinic input]
   _pickle.Pickler.dump

       obj: 'O'
           The object to be pickled.
       /

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/

   static PyObject *
   _pickle_Pickler_dump(PicklerObject *self, PyObject *obj)
   /*[clinic end generated code: output=87ecad1261e02ac7 input=552eb1c0f52260d9]*/
<
Obviously, if Argument Clinic didn’t produce any output, it’s because
it found an error in your input. Keep fixing your errors and retrying
until Argument Clinic processes your file without complaint.

For readability, most of the glue code has been generated to a ".c.h"
file.  You’ll need to include that in your original ".c" file,
typically right after the clinic module block:
>
   #include "clinic/_pickle.c.h"
<
Double-check that the argument-parsing code Argument Clinic generated
looks basically the same as the existing code.

First, ensure both places use the same argument-parsing function. The
existing code must call either "PyArg_ParseTuple()" or
"PyArg_ParseTupleAndKeywords()"; ensure that the code generated by
Argument Clinic calls the _exact_ same function.

Second, the format string passed in to "PyArg_ParseTuple()" or
"PyArg_ParseTupleAndKeywords()" should be _exactly_ the same as the
hand-written one in the existing function, up to the colon or semi-
colon.

Argument Clinic always generates its format strings with a ":"
followed by the name of the function. If the existing code’s format
string ends with ";", to provide usage help, this change is harmless —
don’t worry about it.

Third, for parameters whose format units require two arguments, like a
length variable, an encoding string, or a pointer to a conversion
function, ensure that the second argument is _exactly_ the same
between the two invocations.

Fourth, inside the output portion of the block, you’ll find a
preprocessor macro defining the appropriate static "PyMethodDef"
structure for this builtin:
>
   #define __PICKLE_PICKLER_DUMP_METHODDEF    \
   {"dump", (PyCFunction)__pickle_Pickler_dump, METH_O, __pickle_Pickler_dump__doc__},
<
This static structure should be _exactly_ the same as the existing
static "PyMethodDef" structure for this builtin.

If any of these items differ in _any way_, adjust your Argument Clinic
function specification and rerun "Tools/clinic/clinic.py" until they
_are_ the same.

Notice that the last line of its output is the declaration of your
“impl” function.  This is where the builtin’s implementation goes.
Delete the existing prototype of the function you’re modifying, but
leave the opening curly brace.  Now delete its argument parsing code
and the declarations of all the variables it dumps the arguments into.
Notice how the Python arguments are now arguments to this impl
function; if the implementation used different names for these
variables, fix it.

Let’s reiterate, just because it’s kind of weird. Your code should now
look like this:
>
   static return_type
   your_function_impl(...)
   /*[clinic end generated code: input=..., output=...]*/
   {
   ...
<
Argument Clinic generated the checksum line and the function prototype
just above it.  You should write the opening and closing curly braces
for the function, and the implementation inside.

Sample:
>
   /*[clinic input]
   module _pickle
   class _pickle.Pickler "PicklerObject *" "&Pickler_Type"
   [clinic start generated code]*/
   /*[clinic end generated code: checksum=da39a3ee5e6b4b0d3255bfef95601890afd80709]*/

   /*[clinic input]
   _pickle.Pickler.dump

       obj: 'O'
           The object to be pickled.
       /

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/

   PyDoc_STRVAR(__pickle_Pickler_dump__doc__,
   "Write a pickled representation of obj to the open file.\n"
   "\n"
   ...
   static PyObject *
   _pickle_Pickler_dump_impl(PicklerObject *self, PyObject *obj)
   /*[clinic end generated code: checksum=3bd30745bf206a48f8b576a1da3d90f55a0a4187]*/
   {
       /* Check whether the Pickler was initialized correctly (issue3664).
          Developers often forget to call __init__() in their subclasses, which
          would trigger a segfault without this check. */
       if (self->write == NULL) {
           PyErr_Format(PicklingError,
                        "Pickler.__init__() was not called by %s.__init__()",
                        Py_TYPE(self)->tp_name);
           return NULL;
       }

       if (_Pickler_ClearBuffer(self) < 0) {
           return NULL;
       }

       ...
<
Remember the macro with the "PyMethodDef" structure for this function?
Find the existing "PyMethodDef" structure for this function and
replace it with a reference to the macro.  If the builtin is at module
scope, this will probably be very near the end of the file; if the
builtin is a class method, this will probably be below but relatively
near to the implementation.

Note that the body of the macro contains a trailing comma; when you
replace the existing static "PyMethodDef" structure with the macro,
_don’t_ add a comma to the end.

Sample:
>
   static struct PyMethodDef Pickler_methods[] = {
       __PICKLE_PICKLER_DUMP_METHODDEF
       __PICKLE_PICKLER_CLEAR_MEMO_METHODDEF
       {NULL, NULL}                /* sentinel */
   };
<
Argument Clinic may generate new instances of "_Py_ID". For example:
>
   &_Py_ID(new_unique_py_id)
<
If it does, you’ll have to run "make regen-global-objects" to
regenerate the list of precompiled identifiers at this point.

Finally, compile, then run the relevant portions of the regression-
test suite. This change should not introduce any new compile-time
warnings or errors, and there should be no externally visible change
to Python’s behavior, except for one difference: "inspect.signature()"
run on your function should now provide a valid signature!

Congratulations, you’ve ported your first function to work with
Argument Clinic!


How-to guides
=============


How to rename C functions and variables generated by Argument Clinic
--------------------------------------------------------------------

Argument Clinic automatically names the functions it generates for
you. Occasionally this may cause a problem, if the generated name
collides with the name of an existing C function.  There’s an easy
solution: override the names used for the C functions.  Just add the
keyword ""as"" to your function declaration line, followed by the
function name you wish to use. Argument Clinic will use that function
name for the base (generated) function, then add ""_impl"" to the end
and use that for the name of the impl function.

For example, if we wanted to rename the C function names generated for
"pickle.Pickler.dump()", it’d look like this:
>
   /*[clinic input]
   pickle.Pickler.dump as pickler_dumper

   ...
<
The base function would now be named "pickler_dumper()", and the impl
function would now be named "pickler_dumper_impl()".

Similarly, you may have a problem where you want to give a parameter a
specific Python name, but that name may be inconvenient in C.
Argument Clinic allows you to give a parameter different names in
Python and in C, using the same ""as"" syntax:
>
   /*[clinic input]
   pickle.Pickler.dump

       obj: object
       file as file_obj: object
       protocol: object = NULL
       *
       fix_imports: bool = True
<
Here, the name used in Python (in the signature and the "keywords"
array) would be _file_, but the C variable would be named "file_obj".

You can use this to rename the _self_ parameter too!


How to convert functions using "PyArg_UnpackTuple"
--------------------------------------------------

To convert a function parsing its arguments with
"PyArg_UnpackTuple()", simply write out all the arguments, specifying
each as an "object".  You may specify the _type_ argument to cast the
type as appropriate.  All arguments should be marked positional-only
(add a "/" on a line by itself after the last argument).

Currently the generated code will use "PyArg_ParseTuple()", but this
will change soon.


How to use optional groups
--------------------------

Some legacy functions have a tricky approach to parsing their
arguments: they count the number of positional arguments, then use a
"switch" statement to call one of several different
"PyArg_ParseTuple()" calls depending on how many positional arguments
there are.  (These functions cannot accept keyword-only arguments.)
This approach was used to simulate optional arguments back before
"PyArg_ParseTupleAndKeywords()" was created.

While functions using this approach can often be converted to use
"PyArg_ParseTupleAndKeywords()", optional arguments, and default
values, it’s not always possible.  Some of these legacy functions have
behaviors "PyArg_ParseTupleAndKeywords()" doesn’t directly support.
The most obvious example is the builtin function "range()", which has
an optional argument on the _left_ side of its required argument!
Another example is "curses.window.addch()", which has a group of two
arguments that must always be specified together.  (The arguments are
called _x_ and _y_; if you call the function passing in _x_, you must
also pass in _y_ — and if you don’t pass in _x_ you may not pass in
_y_ either.)

In any case, the goal of Argument Clinic is to support argument
parsing for all existing CPython builtins without changing their
semantics. Therefore Argument Clinic supports this alternate approach
to parsing, using what are called _optional groups_. Optional groups
are groups of arguments that must all be passed in together. They can
be to the left or the right of the required arguments.  They can
_only_ be used with positional-only parameters.

Note:

  Optional groups are _only_ intended for use when converting
  functions that make multiple calls to "PyArg_ParseTuple()"!
  Functions that use _any_ other approach for parsing arguments should
  _almost never_ be converted to Argument Clinic using optional
  groups.  Functions using optional groups currently cannot have
  accurate signatures in Python, because Python just doesn’t
  understand the concept.  Please avoid using optional groups wherever
  possible.

To specify an optional group, add a "[" on a line by itself before the
parameters you wish to group together, and a "]" on a line by itself
after these parameters.  As an example, here’s how
"curses.window.addch()" uses optional groups to make the first two
parameters and the last parameter optional:
>
   /*[clinic input]

   curses.window.addch

       [
       x: int
         X-coordinate.
       y: int
         Y-coordinate.
       ]

       ch: object
         Character to add.

       [
       attr: long
         Attributes for the character.
       ]
       /

   ...
<
Notes:

* For every optional group, one additional parameter will be passed
  into the impl function representing the group.  The parameter will
  be an int named "group_{direction}_{number}", where "{direction}" is
  either "right" or "left" depending on whether the group is before or
  after the required parameters, and "{number}" is a monotonically
  increasing number (starting at 1) indicating how far away the group
  is from the required parameters.  When the impl is called, this
  parameter will be set to zero if this group was unused, and set to
  non-zero if this group was used. (By used or unused, I mean whether
  or not the parameters received arguments in this invocation.)

* If there are no required arguments, the optional groups will behave
  as if they’re to the right of the required arguments.

* In the case of ambiguity, the argument parsing code favors
  parameters on the left (before the required parameters).

* Optional groups can only contain positional-only parameters.

* Optional groups are _only_ intended for legacy code.  Please do not
  use optional groups for new code.


How to use real Argument Clinic converters, instead of “legacy converters”
--------------------------------------------------------------------------

To save time, and to minimize how much you need to learn to achieve
your first port to Argument Clinic, the walkthrough above tells you to
use “legacy converters”.  “Legacy converters” are a convenience,
designed explicitly to make porting existing code to Argument Clinic
easier.  And to be clear, their use is acceptable when porting code
for Python 3.4.

However, in the long term we probably want all our blocks to use
Argument Clinic’s real syntax for converters.  Why?  A couple reasons:

* The proper converters are far easier to read and clearer in their
  intent.

* There are some format units that are unsupported as “legacy
  converters”, because they require arguments, and the legacy
  converter syntax doesn’t support specifying arguments.

* In the future we may have a new argument parsing library that isn’t
  restricted to what "PyArg_ParseTuple()" supports; this flexibility
  won’t be available to parameters using legacy converters.

Therefore, if you don’t mind a little extra effort, please use the
normal converters instead of legacy converters.

In a nutshell, the syntax for Argument Clinic (non-legacy) converters
looks like a Python function call.  However, if there are no explicit
arguments to the function (all functions take their default values),
you may omit the parentheses.  Thus "bool" and "bool()" are exactly
the same converters.

All arguments to Argument Clinic converters are keyword-only. All
Argument Clinic converters accept the following arguments:

   _c_default_
      The default value for this parameter when defined in C.
      Specifically, this will be the initializer for the variable
      declared in the “parse function”.  See the section on default
      values for how to use this. Specified as a string.

   _annotation_
      The annotation value for this parameter.  Not currently
      supported, because **PEP 8** mandates that the Python library
      may not use annotations.

   _unused_
      Wrap the argument with "Py_UNUSED" in the impl function
      signature.

In addition, some converters accept additional arguments.  Here is a
list of these arguments, along with their meanings:

   _accept_
      A set of Python types (and possibly pseudo-types); this
      restricts the allowable Python argument to values of these
      types. (This is not a general-purpose facility; as a rule it
      only supports specific lists of types as shown in the legacy
      converter table.)

      To accept "None", add "NoneType" to this set.

   _bitwise_
      Only supported for unsigned integers.  The native integer value
      of this Python argument will be written to the parameter without
      any range checking, even for negative values.

   _converter_
      Only supported by the "object" converter.  Specifies the name of
      a C “converter function” to use to convert this object to a
      native type.

   _encoding_
      Only supported for strings.  Specifies the encoding to use when
      converting this string from a Python str (Unicode) value into a
      C "char *" value.

   _subclass_of_
      Only supported for the "object" converter.  Requires that the
      Python value be a subclass of a Python type, as expressed in C.

   _type_
      Only supported for the "object" and "self" converters.
      Specifies the C type that will be used to declare the variable.
      Default value is ""PyObject *"".

   _zeroes_
      Only supported for strings.  If true, embedded NUL bytes
      ("'\\0'") are permitted inside the value.  The length of the
      string will be passed in to the impl function, just after the
      string parameter, as a parameter named
      "<parameter_name>_length".

Please note, not every possible combination of arguments will work.
Usually these arguments are implemented by specific
"PyArg_ParseTuple()" _format units_, with specific behavior.  For
example, currently you cannot call "unsigned_short" without also
specifying "bitwise=True". Although it’s perfectly reasonable to think
this would work, these semantics don’t map to any existing format
unit.  So Argument Clinic doesn’t support it.  (Or, at least, not
yet.)

Below is a table showing the mapping of legacy converters into real
Argument Clinic converters.  On the left is the legacy converter, on
the right is the text you’d replace it with.

+-----------+-----------------------------------------------------------------------------------+
| "'B'"     | "unsigned_char(bitwise=True)"                                                     |
+-----------+-----------------------------------------------------------------------------------+
| "'b'"     | "unsigned_char"                                                                   |
+-----------+-----------------------------------------------------------------------------------+
| "'c'"     | "char"                                                                            |
+-----------+-----------------------------------------------------------------------------------+
| "'C'"     | "int(accept={str})"                                                               |
+-----------+-----------------------------------------------------------------------------------+
| "'d'"     | "double"                                                                          |
+-----------+-----------------------------------------------------------------------------------+
| "'D'"     | "Py_complex"                                                                      |
+-----------+-----------------------------------------------------------------------------------+
| "'es'"    | "str(encoding='name_of_encoding')"                                                |
+-----------+-----------------------------------------------------------------------------------+
| "'es#'"   | "str(encoding='name_of_encoding', zeroes=True)"                                   |
+-----------+-----------------------------------------------------------------------------------+
| "'et'"    | "str(encoding='name_of_encoding', accept={bytes, bytearray, str})"                |
+-----------+-----------------------------------------------------------------------------------+
| "'et#'"   | "str(encoding='name_of_encoding', accept={bytes, bytearray, str}, zeroes=True)"   |
+-----------+-----------------------------------------------------------------------------------+
| "'f'"     | "float"                                                                           |
+-----------+-----------------------------------------------------------------------------------+
| "'h'"     | "short"                                                                           |
+-----------+-----------------------------------------------------------------------------------+
| "'H'"     | "unsigned_short(bitwise=True)"                                                    |
+-----------+-----------------------------------------------------------------------------------+
| "'i'"     | "int"                                                                             |
+-----------+-----------------------------------------------------------------------------------+
| "'I'"     | "unsigned_int(bitwise=True)"                                                      |
+-----------+-----------------------------------------------------------------------------------+
| "'k'"     | "unsigned_long(bitwise=True)"                                                     |
+-----------+-----------------------------------------------------------------------------------+
| "'K'"     | "unsigned_long_long(bitwise=True)"                                                |
+-----------+-----------------------------------------------------------------------------------+
| "'l'"     | "long"                                                                            |
+-----------+-----------------------------------------------------------------------------------+
| "'L'"     | "long long"                                                                       |
+-----------+-----------------------------------------------------------------------------------+
| "'n'"     | "Py_ssize_t"                                                                      |
+-----------+-----------------------------------------------------------------------------------+
| "'O'"     | "object"                                                                          |
+-----------+-----------------------------------------------------------------------------------+
| "'O!'"    | "object(subclass_of='&PySomething_Type')"                                         |
+-----------+-----------------------------------------------------------------------------------+
| "'O&'"    | "object(converter='name_of_c_function')"                                          |
+-----------+-----------------------------------------------------------------------------------+
| "'p'"     | "bool"                                                                            |
+-----------+-----------------------------------------------------------------------------------+
| "'S'"     | "PyBytesObject"                                                                   |
+-----------+-----------------------------------------------------------------------------------+
| "'s'"     | "str"                                                                             |
+-----------+-----------------------------------------------------------------------------------+
| "'s#'"    | "str(zeroes=True)"                                                                |
+-----------+-----------------------------------------------------------------------------------+
| "'s*'"    | "Py_buffer(accept={buffer, str})"                                                 |
+-----------+-----------------------------------------------------------------------------------+
| "'U'"     | "unicode"                                                                         |
+-----------+-----------------------------------------------------------------------------------+
| "'u'"     | "wchar_t"                                                                         |
+-----------+-----------------------------------------------------------------------------------+
| "'u#'"    | "wchar_t(zeroes=True)"                                                            |
+-----------+-----------------------------------------------------------------------------------+
| "'w*'"    | "Py_buffer(accept={rwbuffer})"                                                    |
+-----------+-----------------------------------------------------------------------------------+
| "'Y'"     | "PyByteArrayObject"                                                               |
+-----------+-----------------------------------------------------------------------------------+
| "'y'"     | "str(accept={bytes})"                                                             |
+-----------+-----------------------------------------------------------------------------------+
| "'y#'"    | "str(accept={robuffer}, zeroes=True)"                                             |
+-----------+-----------------------------------------------------------------------------------+
| "'y*'"    | "Py_buffer"                                                                       |
+-----------+-----------------------------------------------------------------------------------+
| "'Z'"     | "wchar_t(accept={str, NoneType})"                                                 |
+-----------+-----------------------------------------------------------------------------------+
| "'Z#'"    | "wchar_t(accept={str, NoneType}, zeroes=True)"                                    |
+-----------+-----------------------------------------------------------------------------------+
| "'z'"     | "str(accept={str, NoneType})"                                                     |
+-----------+-----------------------------------------------------------------------------------+
| "'z#'"    | "str(accept={str, NoneType}, zeroes=True)"                                        |
+-----------+-----------------------------------------------------------------------------------+
| "'z*'"    | "Py_buffer(accept={buffer, str, NoneType})"                                       |
+-----------+-----------------------------------------------------------------------------------+

As an example, here’s our sample "pickle.Pickler.dump" using the
proper converter:
>
   /*[clinic input]
   pickle.Pickler.dump

       obj: object
           The object to be pickled.
       /

   Write a pickled representation of obj to the open file.
   [clinic start generated code]*/
<
One advantage of real converters is that they’re more flexible than
legacy converters.  For example, the "unsigned_int" converter (and all
the "unsigned_" converters) can be specified without "bitwise=True".
Their default behavior performs range checking on the value, and they
won’t accept negative numbers.  You just can’t do that with a legacy
converter!

Argument Clinic will show you all the converters it has available.
For each converter it’ll show you all the parameters it accepts, along
with the default value for each parameter. Just run
"Tools/clinic/clinic.py --converters" to see the full list.


How to use the "Py_buffer" converter
------------------------------------

When using the "Py_buffer" converter (or the "'s*'", "'w*'", "'*y'",
or "'z*'" legacy converters), you _must_ not call "PyBuffer_Release()"
on the provided buffer. Argument Clinic generates code that does it
for you (in the parsing function).


How to use advanced converters
------------------------------

Remember those format units you skipped for your first time because
they were advanced?  Here’s how to handle those too.

The trick is, all those format units take arguments—either conversion
functions, or types, or strings specifying an encoding. (But “legacy
converters” don’t support arguments.  That’s why we skipped them for
your first function.)  The argument you specified to the format unit
is now an argument to the converter; this argument is either
_converter_ (for "O&"), _subclass_of_ (for "O!"), or _encoding_ (for
all the format units that start with "e").

When using _subclass_of_, you may also want to use the other custom
argument for "object()": _type_, which lets you set the type actually
used for the parameter.  For example, if you want to ensure that the
object is a subclass of "PyUnicode_Type", you probably want to use the
converter "object(type='PyUnicodeObject *',
subclass_of='&PyUnicode_Type')".

One possible problem with using Argument Clinic: it takes away some
possible flexibility for the format units starting with "e".  When
writing a "PyArg_Parse*()" call by hand, you could theoretically
decide at runtime what encoding string to pass to that call.   But now
this string must be hard-coded at Argument-Clinic-preprocessing-time.
This limitation is deliberate; it made supporting this format unit
much easier, and may allow for future optimizations. This restriction
doesn’t seem unreasonable; CPython itself always passes in static
hard-coded encoding strings for parameters whose format units start
with "e".


How to assign default values to parameter
-----------------------------------------

Default values for parameters can be any of a number of values. At
their simplest, they can be string, int, or float literals:
>
   foo: str = "abc"
   bar: int = 123
   bat: float = 45.6
<
They can also use any of Python’s built-in constants:
>
   yep:  bool = True
   nope: bool = False
   nada: object = None
<
There’s also special support for a default value of "NULL", and for
simple expressions, documented in the following sections.


The "NULL" default value
~~~~~~~~~~~~~~~~~~~~~~~~

For string and object parameters, you can set them to "None" to
indicate that there’s no default.  However, that means the C variable
will be initialized to "Py_None".  For convenience’s sakes, there’s a
special value called "NULL" for just this reason: from Python’s
perspective it behaves like a default value of "None", but the C
variable is initialized with "NULL".


Symbolic default values
~~~~~~~~~~~~~~~~~~~~~~~

The default value you provide for a parameter can’t be any arbitrary
expression.  Currently the following are explicitly supported:

* Numeric constants (integer and float)

* String constants

* "True", "False", and "None"

* Simple symbolic constants like "sys.maxsize", which must start with
  the name of the module

(In the future, this may need to get even more elaborate, to allow
full expressions like "CONSTANT - 1".)


Expressions as default values
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The default value for a parameter can be more than just a literal
value. It can be an entire expression, using math operators and
looking up attributes on objects.  However, this support isn’t exactly
simple, because of some non-obvious semantics.

Consider the following example:
>
   foo: Py_ssize_t = sys.maxsize - 1
<
"sys.maxsize" can have different values on different platforms.
Therefore Argument Clinic can’t simply evaluate that expression
locally and hard-code it in C.  So it stores the default in such a way
that it will get evaluated at runtime, when the user asks for the
function’s signature.

What namespace is available when the expression is evaluated?  It’s
evaluated in the context of the module the builtin came from.  So, if
your module has an attribute called "max_widgets", you may simply use
it:
>
   foo: Py_ssize_t = max_widgets
<
If the symbol isn’t found in the current module, it fails over to
looking in "sys.modules".  That’s how it can find "sys.maxsize" for
example. (Since you don’t know in advance what modules the user will
load into their interpreter, it’s best to restrict yourself to modules
that are preloaded by Python itself.)

Evaluating default values only at runtime means Argument Clinic can’t
compute the correct equivalent C default value.  So you need to tell
it explicitly. When you use an expression, you must also specify the
equivalent expression in C, using the _c_default_ parameter to the
converter:
>
   foo: Py_ssize_t(c_default="PY_SSIZE_T_MAX - 1") = sys.maxsize - 1
<
Another complication: Argument Clinic can’t know in advance whether or
not the expression you supply is valid.  It parses it to make sure it
looks legal, but it can’t _actually_ know.  You must be very careful
when using expressions to specify values that are guaranteed to be
valid at runtime!

Finally, because expressions must be representable as static C values,
there are many restrictions on legal expressions.  Here’s a list of
Python features you’re not permitted to use:

* Function calls.

* Inline if statements ("3 if foo else 5").

* Automatic sequence unpacking ("*[1, 2, 3]").

* List/set/dict comprehensions and generator expressions.

* Tuple/list/set/dict literals.


How to use return converters
----------------------------

By default, the impl function Argument Clinic generates for you
returns "PyObject *". But your C function often computes some C type,
then converts it into the "PyObject *" at the last moment.  Argument
Clinic handles converting your inputs from Python types into native C
types—why not have it convert your return value from a native C type
into a Python type too?

That’s what a “return converter” does.  It changes your impl function
to return some C type, then adds code to the generated (non-impl)
function to handle converting that value into the appropriate
"PyObject *".

The syntax for return converters is similar to that of parameter
converters. You specify the return converter like it was a return
annotation on the function itself, using "->" notation.

For example:
>
   /*[clinic input]
   add -> int

       a: int
       b: int
       /

   [clinic start generated code]*/
<
Return converters behave much the same as parameter converters; they
take arguments, the arguments are all keyword-only, and if you’re not
changing any of the default arguments you can omit the parentheses.

(If you use both ""as"" _and_ a return converter for your function,
the ""as"" should come before the return converter.)

There’s one additional complication when using return converters: how
do you indicate an error has occurred?  Normally, a function returns a
valid (non-"NULL") pointer for success, and "NULL" for failure.  But
if you use an integer return converter, all integers are valid.  How
can Argument Clinic detect an error?  Its solution: each return
converter implicitly looks for a special value that indicates an
error.  If you return that value, and an error has been set
(c:func:_PyErr_Occurred_ returns a true value), then the generated
code will propagate the error.  Otherwise it will encode the value you
return like normal.

Currently Argument Clinic supports only a few return converters:
>
   bool
   double
   float
   int
   long
   Py_ssize_t
   size_t
   unsigned int
   unsigned long
<
None of these take parameters. For all of these, return "-1" to
indicate error.

To see all the return converters Argument Clinic supports, along with
their parameters (if any), just run "Tools/clinic/clinic.py
--converters" for the full list.


How to clone existing functions
-------------------------------

If you have a number of functions that look similar, you may be able
to use Clinic’s “clone” feature.  When you clone an existing function,
you reuse:

* its parameters, including

  * their names,

  * their converters, with all parameters,

  * their default values,

  * their per-parameter docstrings,

  * their _kind_ (whether they’re positional only, positional or
    keyword, or keyword only), and

* its return converter.

The only thing not copied from the original function is its docstring;
the syntax allows you to specify a new docstring.

Here’s the syntax for cloning a function:
>
   /*[clinic input]
   module.class.new_function [as c_basename] = module.class.existing_function

   Docstring for new_function goes here.
   [clinic start generated code]*/
<
(The functions can be in different modules or classes.  I wrote
"module.class" in the sample just to illustrate that you must use the
full path to _both_ functions.)

Sorry, there’s no syntax for partially cloning a function, or cloning
a function then modifying it.  Cloning is an all-or nothing
proposition.

Also, the function you are cloning from must have been previously
defined in the current file.


How to call Python code
-----------------------

The rest of the advanced topics require you to write Python code which
lives inside your C file and modifies Argument Clinic’s runtime state.
This is simple: you simply define a Python block.

A Python block uses different delimiter lines than an Argument Clinic
function block.  It looks like this:
>
   /*[python input]
   # python code goes here
   [python start generated code]*/
<
All the code inside the Python block is executed at the time it’s
parsed.  All text written to stdout inside the block is redirected
into the “output” after the block.

As an example, here’s a Python block that adds a static integer
variable to the C code:
>
   /*[python input]
   print('static int __ignored_unused_variable__ = 0;')
   [python start generated code]*/
   static int __ignored_unused_variable__ = 0;
   /*[python checksum:...]*/
<

How to use the “self converter”
-------------------------------

Argument Clinic automatically adds a “self” parameter for you using a
default converter.  It automatically sets the "type" of this parameter
to the “pointer to an instance” you specified when you declared the
type.  However, you can override Argument Clinic’s converter and
specify one yourself. Just add your own _self_ parameter as the first
parameter in a block, and ensure that its converter is an instance of
"self_converter" or a subclass thereof.

What’s the point?  This lets you override the type of "self", or give
it a different default name.

How do you specify the custom type you want to cast "self" to? If you
only have one or two functions with the same type for "self", you can
directly use Argument Clinic’s existing "self" converter, passing in
the type you want to use as the _type_ parameter:
>
   /*[clinic input]

   _pickle.Pickler.dump

     self: self(type="PicklerObject *")
     obj: object
     /

   Write a pickled representation of the given object to the open file.
   [clinic start generated code]*/
<
On the other hand, if you have a lot of functions that will use the
same type for "self", it’s best to create your own converter,
subclassing "self_converter" but overwriting the "type" member:
>
   /*[python input]
   class PicklerObject_converter(self_converter):
       type = "PicklerObject *"
   [python start generated code]*/

   /*[clinic input]

   _pickle.Pickler.dump

     self: PicklerObject
     obj: object
     /

   Write a pickled representation of the given object to the open file.
   [clinic start generated code]*/
<

How to use the “defining class” converter
-----------------------------------------

Argument Clinic facilitates gaining access to the defining class of a
method. This is useful for heap type methods that need to fetch module
level state.  Use "PyType_FromModuleAndSpec()" to associate a new heap
type with a module.  You can now use "PyType_GetModuleState()" on the
defining class to fetch the module state, for example from a module
method.

Example from Modules/zlibmodule.c. First, "defining_class" is added to
the clinic input:
>
   /*[clinic input]
   zlib.Compress.compress

     cls: defining_class
     data: Py_buffer
       Binary data to be compressed.
     /
<
After running the Argument Clinic tool, the following function
signature is generated:
>
   /*[clinic start generated code]*/
   static PyObject *
   zlib_Compress_compress_impl(compobject *self, PyTypeObject *cls,
                               Py_buffer *data)
   /*[clinic end generated code: output=6731b3f0ff357ca6 input=04d00f65ab01d260]*/
<
The following code can now use "PyType_GetModuleState(cls)" to fetch
the module state:
>
   zlibstate *state = PyType_GetModuleState(cls);
<
Each method may only have one argument using this converter, and it
must appear after "self", or, if "self" is not used, as the first
argument.  The argument will be of type "PyTypeObject *".  The
argument will not appear in the "__text_signature__".

The "defining_class" converter is not compatible with "__init__()" and
"__new__()" methods, which cannot use the "METH_METHOD" convention.

It is not possible to use "defining_class" with slot methods.  In
order to fetch the module state from such methods, use
"PyType_GetModuleByDef()" to look up the module and then
"PyModule_GetState()" to fetch the module state.  Example from the
"setattro" slot method in Modules/_threadmodule.c:
>
   static int
   local_setattro(localobject *self, PyObject *name, PyObject *v)
   {
       PyObject *module = PyType_GetModuleByDef(Py_TYPE(self), &thread_module);
       thread_module_state *state = get_thread_state(module);
       ...
   }
<
See also **PEP 573**.


How to write a custom converter
-------------------------------

A converter is a Python class that inherits from "CConverter". The
main purpose of a custom converter, is for parameters parsed with the
"O&" format unit — parsing such a parameter means calling a
"PyArg_ParseTuple()" “converter function”.

Your converter class should be named "_ConverterName__converter". By
following this convention, your converter class will be automatically
registered with Argument Clinic, with its _converter name_ being the
name of your converter class with the "_converter" suffix stripped
off.

Instead of subclassing "CConverter.__init__()", write a
"converter_init()" method. "converter_init()" always accepts a _self_
parameter. After _self_, all additional parameters **must** be
keyword-only. Any arguments passed to the converter in Argument Clinic
will be passed along to your "converter_init()" method. See
"CConverter" for a list of members you may wish to specify in your
subclass.

Here’s the simplest example of a custom converter, from
Modules/zlibmodule.c:
>
   /*[python input]

   class ssize_t_converter(CConverter):
       type = 'Py_ssize_t'
       converter = 'ssize_t_converter'

   [python start generated code]*/
   /*[python end generated code: output=da39a3ee5e6b4b0d input=35521e4e733823c7]*/
<
This block adds a converter named "ssize_t" to Argument Clinic.
Parameters declared as "ssize_t" will be declared with type
"Py_ssize_t", and will be parsed by the "'O&'" format unit, which will
call the "ssize_t_converter()" converter C function. "ssize_t"
variables automatically support default values.

More sophisticated custom converters can insert custom C code to
handle initialization and cleanup. You can see more examples of custom
converters in the CPython source tree; grep the C files for the string
"CConverter".


How to write a custom return converter
--------------------------------------

Writing a custom return converter is much like writing a custom
converter.  Except it’s somewhat simpler, because return converters
are themselves much simpler.

Return converters must subclass "CReturnConverter". There are no
examples yet of custom return converters, because they are not widely
used yet.  If you wish to write your own return converter, please read
Tools/clinic/clinic.py, specifically the implementation of
"CReturnConverter" and all its subclasses.


How to convert "METH_O" and "METH_NOARGS" functions
---------------------------------------------------

To convert a function using "METH_O", make sure the function’s single
argument is using the "object" converter, and mark the arguments as
positional-only:
>
   /*[clinic input]
   meth_o_sample

        argument: object
        /
   [clinic start generated code]*/
<
To convert a function using "METH_NOARGS", just don’t specify any
arguments.

You can still use a self converter, a return converter, and specify a
_type_ argument to the object converter for "METH_O".


How to convert "tp_new" and "tp_init" functions
-----------------------------------------------

You can convert "tp_new" and "tp_init" functions. Just name them
"__new__" or "__init__" as appropriate.  Notes:

* The function name generated for "__new__" doesn’t end in "__new__"
  like it would by default.  It’s just the name of the class,
  converted into a valid C identifier.

* No "PyMethodDef" "#define" is generated for these functions.

* "__init__" functions return "int", not "PyObject *".

* Use the docstring as the class docstring.

* Although "__new__" and "__init__" functions must always accept both
  the "args" and "kwargs" objects, when converting you may specify any
  signature for these functions that you like. (If your function
  doesn’t support keywords, the parsing function generated will throw
  an exception if it receives any.)


How to change and redirect Clinic’s output
------------------------------------------

It can be inconvenient to have Clinic’s output interspersed with your
conventional hand-edited C code.  Luckily, Clinic is configurable: you
can buffer up its output for printing later (or earlier!), or write
its output to a separate file.  You can also add a prefix or suffix to
every line of Clinic’s generated output.

While changing Clinic’s output in this manner can be a boon to
readability, it may result in Clinic code using types before they are
defined, or your code attempting to use Clinic-generated code before
it is defined. These problems can be easily solved by rearranging the
declarations in your file, or moving where Clinic’s generated code
goes.  (This is why the default behavior of Clinic is to output
everything into the current block; while many people consider this
hampers readability, it will never require rearranging your code to
fix definition-before-use problems.)

Let’s start with defining some terminology:

_field_
   A field, in this context, is a subsection of Clinic’s output. For
   example, the "#define" for the "PyMethodDef" structure is a field,
   called "methoddef_define".  Clinic has seven different fields it
   can output per function definition:
>
      docstring_prototype
      docstring_definition
      methoddef_define
      impl_prototype
      parser_prototype
      parser_definition
      impl_definition
<
   All the names are of the form ""<a>_<b>"", where ""<a>"" is the
   semantic object represented (the parsing function, the impl
   function, the docstring, or the methoddef structure) and ""<b>""
   represents what kind of statement the field is.  Field names that
   end in ""_prototype"" represent forward declarations of that thing,
   without the actual body/data of the thing; field names that end in
   ""_definition"" represent the actual definition of the thing, with
   the body/data of the thing.  (""methoddef"" is special, it’s the
   only one that ends with ""_define"", representing that it’s a
   preprocessor #define.)

_destination_
   A destination is a place Clinic can write output to.  There are
   five built-in destinations:

   "block"
      The default destination: printed in the output section of the
      current Clinic block.

   "buffer"
      A text buffer where you can save text for later.  Text sent here
      is appended to the end of any existing text.  It’s an error to
      have any text left in the buffer when Clinic finishes processing
      a file.

   "file"
      A separate “clinic file” that will be created automatically by
      Clinic. The filename chosen for the file is
      "{basename}.clinic{extension}", where "basename" and "extension"
      were assigned the output from "os.path.splitext()" run on the
      current file.  (Example: the "file" destination for "_pickle.c"
      would be written to "_pickle.clinic.c".)

      **Important: When using a** "file" **destination, you** _must
      check in_ **the generated file!**

   "two-pass"
      A buffer like "buffer".  However, a two-pass buffer can only be
      dumped once, and it prints out all text sent to it during all
      processing, even from Clinic blocks _after_ the dumping point.

   "suppress"
      The text is suppressed—thrown away.

Clinic defines five new directives that let you reconfigure its
output.

The first new directive is "dump":
>
   dump <destination>
<
This dumps the current contents of the named destination into the
output of the current block, and empties it.  This only works with
"buffer" and "two-pass" destinations.

The second new directive is "output".  The most basic form of "output"
is like this:
>
   output <field> <destination>
<
This tells Clinic to output _field_ to _destination_.  "output" also
supports a special meta-destination, called "everything", which tells
Clinic to output _all_ fields to that _destination_.

"output" has a number of other functions:
>
   output push
   output pop
   output preset <preset>
<
"output push" and "output pop" allow you to push and pop
configurations on an internal configuration stack, so that you can
temporarily modify the output configuration, then easily restore the
previous configuration.  Simply push before your change to save the
current configuration, then pop when you wish to restore the previous
configuration.

"output preset" sets Clinic’s output to one of several built-in preset
configurations, as follows:

   "block"
      Clinic’s original starting configuration.  Writes everything
      immediately after the input block.

      Suppress the "parser_prototype" and "docstring_prototype", write
      everything else to "block".

   "file"
      Designed to write everything to the “clinic file” that it can.
      You then "#include" this file near the top of your file. You may
      need to rearrange your file to make this work, though usually
      this just means creating forward declarations for various
      "typedef" and "PyTypeObject" definitions.

      Suppress the "parser_prototype" and "docstring_prototype", write
      the "impl_definition" to "block", and write everything else to
      "file".

      The default filename is ""{dirname}/clinic/{basename}.h"".

   "buffer"
      Save up most of the output from Clinic, to be written into your
      file near the end.  For Python files implementing modules or
      builtin types, it’s recommended that you dump the buffer just
      above the static structures for your module or builtin type;
      these are normally very near the end.  Using "buffer" may
      require even more editing than "file", if your file has static
      "PyMethodDef" arrays defined in the middle of the file.

      Suppress the "parser_prototype", "impl_prototype", and
      "docstring_prototype", write the "impl_definition" to "block",
      and write everything else to "file".

   "two-pass"
      Similar to the "buffer" preset, but writes forward declarations
      to the "two-pass" buffer, and definitions to the "buffer". This
      is similar to the "buffer" preset, but may require less editing
      than "buffer".  Dump the "two-pass" buffer near the top of your
      file, and dump the "buffer" near the end just like you would
      when using the "buffer" preset.

      Suppresses the "impl_prototype", write the "impl_definition" to
      "block", write "docstring_prototype", "methoddef_define", and
      "parser_prototype" to "two-pass", write everything else to
      "buffer".

   "partial-buffer"
      Similar to the "buffer" preset, but writes more things to
      "block", only writing the really big chunks of generated code to
      "buffer". This avoids the definition-before-use problem of
      "buffer" completely, at the small cost of having slightly more
      stuff in the block’s output. Dump the "buffer" near the end,
      just like you would when using the "buffer" preset.

      Suppresses the "impl_prototype", write the
      "docstring_definition" and "parser_definition" to "buffer",
      write everything else to "block".

The third new directive is "destination":
>
   destination <name> <command> [...]
<
This performs an operation on the destination named "name".

There are two defined subcommands: "new" and "clear".

The "new" subcommand works like this:
>
   destination <name> new <type>
<
This creates a new destination with name "<name>" and type "<type>".

There are five destination types:

   "suppress"
      Throws the text away.

   "block"
      Writes the text to the current block.  This is what Clinic
      originally did.

   "buffer"
      A simple text buffer, like the “buffer” builtin destination
      above.

   "file"
      A text file.  The file destination takes an extra argument, a
      template to use for building the filename, like so:

         destination <name> new <type> <file_template>

      The template can use three strings internally that will be
      replaced by bits of the filename:

         {path}
            The full path to the file, including directory and full
            filename.

         {dirname}
            The name of the directory the file is in.

         {basename}
            Just the name of the file, not including the directory.

         {basename_root}
            Basename with the extension clipped off (everything up to
            but not including the last ‘.’).

         {basename_extension}
            The last ‘.’ and everything after it.  If the basename
            does not contain a period, this will be the empty string.

      If there are no periods in the filename, {basename} and
      {filename} are the same, and {extension} is empty.
      “{basename}{extension}” is always exactly the same as
      “{filename}”.”

   "two-pass"
      A two-pass buffer, like the “two-pass” builtin destination
      above.

The "clear" subcommand works like this:
>
   destination <name> clear
<
It removes all the accumulated text up to this point in the
destination. (I don’t know what you’d need this for, but I thought
maybe it’d be useful while someone’s experimenting.)

The fourth new directive is "set":
>
   set line_prefix "string"
   set line_suffix "string"
<
"set" lets you set two internal variables in Clinic. "line_prefix" is
a string that will be prepended to every line of Clinic’s output;
"line_suffix" is a string that will be appended to every line of
Clinic’s output.

Both of these support two format strings:

   "{block comment start}"
      Turns into the string "/*", the start-comment text sequence for
      C files.

   "{block comment end}"
      Turns into the string "*/", the end-comment text sequence for C
      files.

The final new directive is one you shouldn’t need to use directly,
called "preserve":
>
   preserve
<
This tells Clinic that the current contents of the output should be
kept, unmodified. This is used internally by Clinic when dumping
output into "file" files; wrapping it in a Clinic block lets Clinic
use its existing checksum functionality to ensure the file was not
modified by hand before it gets overwritten.


How to use the "#ifdef" trick
-----------------------------

If you’re converting a function that isn’t available on all platforms,
there’s a trick you can use to make life a little easier.  The
existing code probably looks like this:
>
   #ifdef HAVE_FUNCTIONNAME
   static module_functionname(...)
   {
   ...
   }
   #endif /* HAVE_FUNCTIONNAME */
<
And then in the "PyMethodDef" structure at the bottom the existing
code will have:
>
   #ifdef HAVE_FUNCTIONNAME
   {'functionname', ... },
   #endif /* HAVE_FUNCTIONNAME */
<
In this scenario, you should enclose the body of your impl function
inside the "#ifdef", like so:
>
   #ifdef HAVE_FUNCTIONNAME
   /*[clinic input]
   module.functionname
   ...
   [clinic start generated code]*/
   static module_functionname(...)
   {
   ...
   }
   #endif /* HAVE_FUNCTIONNAME */
<
Then, remove those three lines from the "PyMethodDef" structure,
replacing them with the macro Argument Clinic generated:
>
   MODULE_FUNCTIONNAME_METHODDEF
<
(You can find the real name for this macro inside the generated code.
Or you can calculate it yourself: it’s the name of your function as
defined on the first line of your block, but with periods changed to
underscores, uppercased, and ""_METHODDEF"" added to the end.)

Perhaps you’re wondering: what if "HAVE_FUNCTIONNAME" isn’t defined?
The "MODULE_FUNCTIONNAME_METHODDEF" macro won’t be defined either!

Here’s where Argument Clinic gets very clever.  It actually detects
that the Argument Clinic block might be deactivated by the "#ifdef".
When that happens, it generates a little extra code that looks like
this:
>
   #ifndef MODULE_FUNCTIONNAME_METHODDEF
       #define MODULE_FUNCTIONNAME_METHODDEF
   #endif /* !defined(MODULE_FUNCTIONNAME_METHODDEF) */
<
That means the macro always works.  If the function is defined, this
turns into the correct structure, including the trailing comma.  If
the function is undefined, this turns into nothing.

However, this causes one ticklish problem: where should Argument
Clinic put this extra code when using the “block” output preset?  It
can’t go in the output block, because that could be deactivated by the
"#ifdef".  (That’s the whole point!)

In this situation, Argument Clinic writes the extra code to the
“buffer” destination. This may mean that you get a complaint from
Argument Clinic:
>
   Warning in file "Modules/posixmodule.c" on line 12357:
   Destination buffer 'buffer' not empty at end of file, emptying.
<
When this happens, just open your file, find the "dump buffer" block
that Argument Clinic added to your file (it’ll be at the very bottom),
then move it above the "PyMethodDef" structure where that macro is
used.


How to use Argument Clinic in Python files
------------------------------------------

It’s actually possible to use Argument Clinic to preprocess Python
files. There’s no point to using Argument Clinic blocks, of course, as
the output wouldn’t make any sense to the Python interpreter.  But
using Argument Clinic to run Python blocks lets you use Python as a
Python preprocessor!

Since Python comments are different from C comments, Argument Clinic
blocks embedded in Python files look slightly different.  They look
like this:
>
   #/*[python input]
   #print("def foo(): pass")
   #[python start generated code]*/
   def foo(): pass
   #/*[python checksum:...]*/
<

How to use the Limited C API
----------------------------

If Argument Clinic _input_ is located within a C source file that
contains "#define Py_LIMITED_API", Argument Clinic will generate C
code that uses the Limited API to parse arguments. The advantage of
this is that the generated code will not use private functions.
However, this _can_ result in Argument Clinic generating less
efficient code in some cases. The extent of the performance penalty
will depend on the parameters (types, number, etc.).

New in version 3.13.


How to override the generated signature
---------------------------------------

You can use the "@text_signature" directive to override the default
generated signature in the docstring. This can be useful for complex
signatures that Argument Clinic cannot handle. The "@text_signature"
directive takes one argument: the custom signature as a string. The
provided signature is copied verbatim to the generated docstring.

Example from Objects/codeobject.c:
>
   /*[clinic input]
   @text_signature "($self, /, **changes)"
   code.replace
       *
       co_argcount: int(c_default="self->co_argcount") = unchanged
       co_posonlyargcount: int(c_default="self->co_posonlyargcount") = unchanged
       # etc ...

       Return a copy of the code object with new values for the specified fields.
   [clinic start generated output]*/
<
The generated docstring ends up looking like this:
>
   replace($self, /, **changes)
   --

   Return a copy of the code object with new values for the specified fields.
<

How to deprecate passing parameters positionally or by keyword
--------------------------------------------------------------

Argument Clinic provides syntax that makes it possible to generate
code that deprecates passing _arguments_ for positional-or-keyword
_parameters_ positionally or by keyword. For example, say we’ve got a
module-level function "foo.myfunc()" that has five parameters: a
positional-only parameter _a_, three positional-or-keyword parameters
_b_, _c_ and _d_, and a keyword-only parameter _e_:
>
   /*[clinic input]
   module foo
   myfunc
       a: int
       /
       b: int
       c: int
       d: int
       *
       e: int
   [clinic start generated output]*/
<
We now want to make the _b_ parameter positional-only and the _d_
parameter keyword-only; however, we’ll have to wait two releases
before making these changes, as mandated by Python’s backwards-
compatibility policy (see **PEP 387**). For this example, imagine
we’re in the development phase for Python 3.12: that means we’ll be
allowed to introduce deprecation warnings in Python 3.12 whenever an
argument for the _b_ parameter is passed by keyword or an argument for
the _d_ parameter is passed positionally, and we’ll be allowed to make
them positional-only and keyword-only respectively in Python 3.14 at
the earliest.

We can use Argument Clinic to emit the desired deprecation warnings
using the "[from ...]" syntax, by adding the line "/ [from 3.14]"
right below the _b_ parameter and adding the line "* [from 3.14]"
right above the _d_ parameter:
>
   /*[clinic input]
   module foo
   myfunc
       a: int
       /
       b: int
       / [from 3.14]
       c: int
       * [from 3.14]
       d: int
       *
       e: int
   [clinic start generated output]*/
<
Next, regenerate Argument Clinic code ("make clinic"), and add unit
tests for the new behaviour.

The generated code will now emit a "DeprecationWarning" when an
_argument_ for the _parameter_ _d_ is passed positionally (e.g
"myfunc(1, 2, 3, 4, e=5)") or an argument for the parameter _b_ is
passed by keyword (e.g "myfunc(1, b=2, c=3, d=4, e=5)"). C
preprocessor directives are also generated for emitting compiler
warnings if the "[from ...]" lines have not been removed from the
Argument Clinic input when the deprecation period is over, which means
when the alpha phase of the specified Python version kicks in.

Let’s return to our example and skip ahead two years: Python 3.14
development has now entered the alpha phase, but we forgot all about
updating the Argument Clinic code for "myfunc()"! Luckily for us,
compiler warnings are now generated:
>
   In file included from Modules/foomodule.c:139:
   Modules/clinic/foomodule.c.h:139:8: warning: In 'foomodule.c', update the clinic input of 'mymod.myfunc'. [-W#warnings]
    #    warning "In 'foomodule.c', update the clinic input of 'mymod.myfunc'. [-W#warnings]"
         ^
<
We now close the deprecation phase by making _a_ positional-only and
_c_ keyword-only; replace the "/ [from ...]" line below _b_ with the
"/" from the line below _a_ and the "* [from ...]" line above _d_ with
the "*" from the line above _e_:
>
   /*[clinic input]
   module foo
   myfunc
       a: int
       b: int
       /
       c: int
       *
       d: int
       e: int
   [clinic start generated output]*/
<
Finally, run "make clinic" to regenerate the Argument Clinic code, and
update your unit tests to reflect the new behaviour.

Note:

  If you forget to update your input block during the alpha and beta
  phases, the compiler warning will turn into a compiler error when
  the release candidate phase begins.

vim:tw=78:ts=8:ft=help:norl: