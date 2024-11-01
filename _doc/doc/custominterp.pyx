*custominterp.pyx*                            Last change: 2023 Sep 15

Custom Python Interpreters
**************************

The modules described in this chapter allow writing interfaces similar
to Python’s interactive interpreter.  If you want a Python interpreter
that supports some special feature in addition to the Python language,
you should look at the "code" module.  (The "codeop" module is lower-
level, used to support compiling a possibly incomplete chunk of Python
code.)

The full list of modules described in this chapter is:

* "code" — Interpreter base classes

  * "InteractiveInterpreter"

  * "InteractiveConsole"

  * "interact()"

  * "compile_command()"

  * Interactive Interpreter Objects

    * "InteractiveInterpreter.runsource()"

    * "InteractiveInterpreter.runcode()"

    * "InteractiveInterpreter.showsyntaxerror()"

    * "InteractiveInterpreter.showtraceback()"

    * "InteractiveInterpreter.write()"

  * Interactive Console Objects

    * "InteractiveConsole.interact()"

    * "InteractiveConsole.push()"

    * "InteractiveConsole.resetbuffer()"

    * "InteractiveConsole.raw_input()"

* "codeop" — Compile Python code

  * "compile_command()"

  * "Compile"

  * "CommandCompiler"

vim:tw=78:ts=8:ft=help:norl: