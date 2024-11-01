*superseded.pyx*                              Last change: 2023 Sep 15

Superseded Modules
******************

The modules described in this chapter are deprecated and only kept for
backwards compatibility. They have been superseded by other modules.

* "optparse" — Parser for command line options

  * Background

    * Terminology

    * What are options for?

    * What are positional arguments for?

  * Tutorial

    * Understanding option actions

    * The store action

    * Handling boolean (flag) options

    * Other actions

    * Default values

    * Generating help

      * Grouping Options

        * "OptionGroup"

        * "OptionParser.get_option_group()"

    * Printing a version string

      * "OptionParser.print_version()"

      * "OptionParser.get_version()"

    * How "optparse" handles errors

    * Putting it all together

  * Reference Guide

    * Creating the parser

      * "OptionParser"

    * Populating the parser

    * Defining options

      * "OptionParser.add_option()"

      * "Values"

    * Option attributes

      * "Option"

        * "Option.action"

        * "Option.type"

        * "Option.dest"

        * "Option.default"

        * "Option.nargs"

        * "Option.const"

        * "Option.choices"

        * "Option.callback"

        * "Option.callback_args"

        * "Option.callback_kwargs"

        * "Option.help"

        * "Option.metavar"

    * Standard option actions

    * Standard option types

    * Parsing arguments

      * "OptionParser.parse_args()"

    * Querying and manipulating your option parser

      * "OptionParser.disable_interspersed_args()"

      * "OptionParser.enable_interspersed_args()"

      * "OptionParser.get_option()"

      * "OptionParser.has_option()"

      * "OptionParser.remove_option()"

    * Conflicts between options

    * Cleanup

    * Other methods

      * "OptionParser.set_usage()"

      * "OptionParser.print_usage()"

      * "OptionParser.get_usage()"

      * "OptionParser.set_defaults()"

  * Option Callbacks

    * Defining a callback option

    * How callbacks are called

    * Raising errors in a callback

    * Callback example 1: trivial callback

    * Callback example 2: check option order

    * Callback example 3: check option order (generalized)

    * Callback example 4: check arbitrary condition

    * Callback example 5: fixed arguments

    * Callback example 6: variable arguments

  * Extending "optparse"

    * Adding new types

      * "Option.TYPES"

      * "Option.TYPE_CHECKER"

    * Adding new actions

      * "Option.ACTIONS"

      * "Option.STORE_ACTIONS"

      * "Option.TYPED_ACTIONS"

      * "Option.ALWAYS_TYPED_ACTIONS"

  * Exceptions

    * "OptionError"

    * "OptionConflictError"

    * "OptionValueError"

    * "BadOptionError"

    * "AmbiguousOptionError"

vim:tw=78:ts=8:ft=help:norl: