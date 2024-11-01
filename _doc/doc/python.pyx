*python.pyx*                                  Last change: 2023 Sep 15

Python Runtime Services
***********************

The modules described in this chapter provide a wide range of services
related to the Python interpreter and its interaction with its
environment.  Here’s an overview:

* "sys" — System-specific parameters and functions

  * "abiflags"

  * "addaudithook()"

  * "argv"

  * "audit()"

  * "base_exec_prefix"

  * "base_prefix"

  * "byteorder"

  * "builtin_module_names"

  * "call_tracing()"

  * "copyright"

  * "_clear_type_cache()"

  * "_current_frames()"

  * "_current_exceptions()"

  * "breakpointhook()"

  * "_debugmallocstats()"

  * "dllhandle"

  * "displayhook()"

  * "dont_write_bytecode"

  * "_emscripten_info"

    * "_emscripten_info.emscripten_version"

    * "_emscripten_info.runtime"

    * "_emscripten_info.pthreads"

    * "_emscripten_info.shared_memory"

  * "pycache_prefix"

  * "excepthook()"

  * "__breakpointhook__"

  * "__displayhook__"

  * "__excepthook__"

  * "__unraisablehook__"

  * "exception()"

  * "exc_info()"

  * "exec_prefix"

  * "executable"

  * "exit()"

  * "flags"

    * "flags.debug"

    * "flags.inspect"

    * "flags.interactive"

    * "flags.isolated"

    * "flags.optimize"

    * "flags.dont_write_bytecode"

    * "flags.no_user_site"

    * "flags.no_site"

    * "flags.ignore_environment"

    * "flags.verbose"

    * "flags.bytes_warning"

    * "flags.quiet"

    * "flags.hash_randomization"

    * "flags.dev_mode"

    * "flags.utf8_mode"

    * "flags.safe_path"

    * "flags.int_max_str_digits"

    * "flags.warn_default_encoding"

  * "float_info"

    * "float_info.epsilon"

    * "float_info.dig"

    * "float_info.mant_dig"

    * "float_info.max"

    * "float_info.max_exp"

    * "float_info.max_10_exp"

    * "float_info.min"

    * "float_info.min_exp"

    * "float_info.min_10_exp"

    * "float_info.radix"

    * "float_info.rounds"

  * "float_repr_style"

  * "getallocatedblocks()"

  * "getunicodeinternedsize()"

  * "getandroidapilevel()"

  * "getdefaultencoding()"

  * "getdlopenflags()"

  * "getfilesystemencoding()"

  * "getfilesystemencodeerrors()"

  * "get_int_max_str_digits()"

  * "getrefcount()"

  * "getrecursionlimit()"

  * "getsizeof()"

  * "getswitchinterval()"

  * "_getframe()"

  * "_getframemodulename()"

  * "getprofile()"

  * "gettrace()"

  * "getwindowsversion()"

  * "get_asyncgen_hooks()"

  * "get_coroutine_origin_tracking_depth()"

  * "hash_info"

    * "hash_info.width"

    * "hash_info.modulus"

    * "hash_info.inf"

    * "hash_info.nan"

    * "hash_info.imag"

    * "hash_info.algorithm"

    * "hash_info.hash_bits"

    * "hash_info.seed_bits"

  * "hexversion"

  * "implementation"

  * "int_info"

    * "int_info.bits_per_digit"

    * "int_info.sizeof_digit"

    * "int_info.default_max_str_digits"

    * "int_info.str_digits_check_threshold"

  * "__interactivehook__"

  * "intern()"

  * "is_finalizing()"

  * "last_exc"

  * "last_type"

  * "last_value"

  * "last_traceback"

  * "maxsize"

  * "maxunicode"

  * "meta_path"

  * "modules"

  * "orig_argv"

  * "path"

  * "path_hooks"

  * "path_importer_cache"

  * "platform"

  * "platlibdir"

  * "prefix"

  * "ps1"

  * "ps2"

  * "setdlopenflags()"

  * "set_int_max_str_digits()"

  * "setprofile()"

  * "setrecursionlimit()"

  * "setswitchinterval()"

  * "settrace()"

  * "set_asyncgen_hooks()"

  * "set_coroutine_origin_tracking_depth()"

  * "activate_stack_trampoline()"

  * "deactivate_stack_trampoline()"

  * "is_stack_trampoline_active()"

  * "_enablelegacywindowsfsencoding()"

  * "stdin"

  * "stdout"

  * "stderr"

  * "__stdin__"

  * "__stdout__"

  * "__stderr__"

  * "stdlib_module_names"

  * "thread_info"

    * "thread_info.name"

    * "thread_info.lock"

    * "thread_info.version"

  * "tracebacklimit"

  * "unraisablehook()"

  * "version"

  * "api_version"

  * "version_info"

  * "warnoptions"

  * "winver"

  * "_xoptions"

* "sys.monitoring" — Execution event monitoring

  * Tool identifiers

    * Registering and using tools

      * "use_tool_id()"

      * "free_tool_id()"

      * "get_tool()"

  * Events

    * Local events

    * Ancillary events

    * Other events

    * The STOP_ITERATION event

  * Turning events on and off

    * Setting events globally

      * "get_events()"

      * "set_events()"

    * Per code object events

      * "get_local_events()"

      * "set_local_events()"

    * Disabling events

  * Registering callback functions

    * "register_callback()"

    * Callback function arguments

* "sysconfig" — Provide access to Python’s configuration information

  * Configuration variables

    * "get_config_vars()"

    * "get_config_var()"

  * Installation paths

    * "get_scheme_names()"

    * "get_default_scheme()"

    * "get_preferred_scheme()"

    * "_get_preferred_schemes()"

    * "get_path_names()"

    * "get_path()"

    * "get_paths()"

  * Other functions

    * "get_python_version()"

    * "get_platform()"

    * "is_python_build()"

    * "parse_config_h()"

    * "get_config_h_filename()"

    * "get_makefile_filename()"

  * Using "sysconfig" as a script

* "builtins" — Built-in objects

* "__main__" — Top-level code environment

  * "__name__ == '__main__'"

    * What is the “top-level code environment”?

    * Idiomatic Usage

    * Packaging Considerations

  * "__main__.py" in Python Packages

    * Idiomatic Usage

  * "import __main__"

* "warnings" — Warning control

  * Warning Categories

  * The Warnings Filter

    * Describing Warning Filters

    * Default Warning Filter

    * Overriding the default filter

  * Temporarily Suppressing Warnings

  * Testing Warnings

  * Updating Code For New Versions of Dependencies

  * Available Functions

    * "warn()"

    * "warn_explicit()"

    * "showwarning()"

    * "formatwarning()"

    * "filterwarnings()"

    * "simplefilter()"

    * "resetwarnings()"

  * Available Context Managers

    * "catch_warnings"

* "dataclasses" — Data Classes

  * Module contents

    * "dataclass()"

    * "field()"

    * "Field"

    * "fields()"

    * "asdict()"

    * "astuple()"

    * "make_dataclass()"

    * "replace()"

    * "is_dataclass()"

    * "MISSING"

    * "KW_ONLY"

    * "FrozenInstanceError"

  * Post-init processing

    * "__post_init__()"

  * Class variables

  * Init-only variables

  * Frozen instances

  * Inheritance

  * Re-ordering of keyword-only parameters in "__init__()"

  * Default factory functions

  * Mutable default values

  * Descriptor-typed fields

* "contextlib" — Utilities for "with"-statement contexts

  * Utilities

    * "AbstractContextManager"

    * "AbstractAsyncContextManager"

    * "contextmanager()"

    * "asynccontextmanager()"

    * "closing()"

    * "aclosing()"

    * "nullcontext()"

    * "suppress()"

    * "redirect_stdout()"

    * "redirect_stderr()"

    * "chdir()"

    * "ContextDecorator"

    * "AsyncContextDecorator"

    * "ExitStack"

      * "ExitStack.enter_context()"

      * "ExitStack.push()"

      * "ExitStack.callback()"

      * "ExitStack.pop_all()"

      * "ExitStack.close()"

    * "AsyncExitStack"

      * "AsyncExitStack.enter_async_context()"

      * "AsyncExitStack.push_async_exit()"

      * "AsyncExitStack.push_async_callback()"

      * "AsyncExitStack.aclose()"

  * Examples and Recipes

    * Supporting a variable number of context managers

    * Catching exceptions from "__enter__" methods

    * Cleaning up in an "__enter__" implementation

    * Replacing any use of "try-finally" and flag variables

    * Using a context manager as a function decorator

  * Single use, reusable and reentrant context managers

    * Reentrant context managers

    * Reusable context managers

* "abc" — Abstract Base Classes

  * "ABC"

  * "ABCMeta"

    * "ABCMeta.register()"

    * "ABCMeta.__subclasshook__()"

  * "abstractmethod()"

  * "abstractclassmethod()"

  * "abstractstaticmethod()"

  * "abstractproperty()"

  * "get_cache_token()"

  * "update_abstractmethods()"

* "atexit" — Exit handlers

  * "register()"

  * "unregister()"

  * "atexit" Example

* "traceback" — Print or retrieve a stack traceback

  * "print_tb()"

  * "print_exception()"

  * "print_exc()"

  * "print_last()"

  * "print_stack()"

  * "extract_tb()"

  * "extract_stack()"

  * "format_list()"

  * "format_exception_only()"

  * "format_exception()"

  * "format_exc()"

  * "format_tb()"

  * "format_stack()"

  * "clear_frames()"

  * "walk_stack()"

  * "walk_tb()"

  * "TracebackException" Objects

    * "TracebackException"

      * "TracebackException.__cause__"

      * "TracebackException.__context__"

      * "TracebackException.exceptions"

      * "TracebackException.__suppress_context__"

      * "TracebackException.__notes__"

      * "TracebackException.stack"

      * "TracebackException.exc_type"

      * "TracebackException.filename"

      * "TracebackException.lineno"

      * "TracebackException.end_lineno"

      * "TracebackException.text"

      * "TracebackException.offset"

      * "TracebackException.end_offset"

      * "TracebackException.msg"

      * "TracebackException.from_exception()"

      * "TracebackException.print()"

      * "TracebackException.format()"

      * "TracebackException.format_exception_only()"

  * "StackSummary" Objects

    * "StackSummary"

      * "StackSummary.extract()"

      * "StackSummary.from_list()"

      * "StackSummary.format()"

      * "StackSummary.format_frame_summary()"

  * "FrameSummary" Objects

    * "FrameSummary"

  * Traceback Examples

* "__future__" — Future statement definitions

* "gc" — Garbage Collector interface

  * "enable()"

  * "disable()"

  * "isenabled()"

  * "collect()"

  * "set_debug()"

  * "get_debug()"

  * "get_objects()"

  * "get_stats()"

  * "set_threshold()"

  * "get_count()"

  * "get_threshold()"

  * "get_referrers()"

  * "get_referents()"

  * "is_tracked()"

  * "is_finalized()"

  * "freeze()"

  * "unfreeze()"

  * "get_freeze_count()"

  * "garbage"

  * "callbacks"

  * "DEBUG_STATS"

  * "DEBUG_COLLECTABLE"

  * "DEBUG_UNCOLLECTABLE"

  * "DEBUG_SAVEALL"

  * "DEBUG_LEAK"

* "inspect" — Inspect live objects

  * Types and members

    * "getmembers()"

    * "getmembers_static()"

    * "getmodulename()"

    * "ismodule()"

    * "isclass()"

    * "ismethod()"

    * "isfunction()"

    * "isgeneratorfunction()"

    * "isgenerator()"

    * "iscoroutinefunction()"

    * "markcoroutinefunction()"

    * "iscoroutine()"

    * "isawaitable()"

    * "isasyncgenfunction()"

    * "isasyncgen()"

    * "istraceback()"

    * "isframe()"

    * "iscode()"

    * "isbuiltin()"

    * "ismethodwrapper()"

    * "isroutine()"

    * "isabstract()"

    * "ismethoddescriptor()"

    * "isdatadescriptor()"

    * "isgetsetdescriptor()"

    * "ismemberdescriptor()"

  * Retrieving source code

    * "getdoc()"

    * "getcomments()"

    * "getfile()"

    * "getmodule()"

    * "getsourcefile()"

    * "getsourcelines()"

    * "getsource()"

    * "cleandoc()"

  * Introspecting callables with the Signature object

    * "signature()"

    * "Signature"

      * "Signature.empty"

      * "Signature.parameters"

      * "Signature.return_annotation"

      * "Signature.bind()"

      * "Signature.bind_partial()"

      * "Signature.replace()"

      * "Signature.from_callable()"

    * "Parameter"

      * "Parameter.empty"

      * "Parameter.name"

      * "Parameter.default"

      * "Parameter.annotation"

      * "Parameter.kind"

        * "Parameter.kind.description"

      * "Parameter.replace()"

    * "BoundArguments"

      * "BoundArguments.arguments"

      * "BoundArguments.args"

      * "BoundArguments.kwargs"

      * "BoundArguments.signature"

      * "BoundArguments.apply_defaults()"

  * Classes and functions

    * "getclasstree()"

    * "getfullargspec()"

    * "getargvalues()"

    * "formatargvalues()"

    * "getmro()"

    * "getcallargs()"

    * "getclosurevars()"

    * "unwrap()"

    * "get_annotations()"

  * The interpreter stack

    * "FrameInfo"

      * "FrameInfo.frame"

      * "FrameInfo.filename"

      * "FrameInfo.lineno"

      * "FrameInfo.function"

      * "FrameInfo.code_context"

      * "FrameInfo.index"

      * "FrameInfo.positions"

    * "Traceback"

      * "Traceback.filename"

      * "Traceback.lineno"

      * "Traceback.function"

      * "Traceback.code_context"

      * "Traceback.index"

      * "Traceback.positions"

    * "getframeinfo()"

    * "getouterframes()"

    * "getinnerframes()"

    * "currentframe()"

    * "stack()"

    * "trace()"

  * Fetching attributes statically

    * "getattr_static()"

  * Current State of Generators, Coroutines, and Asynchronous
    Generators

    * "getgeneratorstate()"

    * "getcoroutinestate()"

    * "getasyncgenstate()"

    * "getgeneratorlocals()"

    * "getcoroutinelocals()"

    * "getasyncgenlocals()"

  * Code Objects Bit Flags

    * "CO_OPTIMIZED"

    * "CO_NEWLOCALS"

    * "CO_VARARGS"

    * "CO_VARKEYWORDS"

    * "CO_NESTED"

    * "CO_GENERATOR"

    * "CO_COROUTINE"

    * "CO_ITERABLE_COROUTINE"

    * "CO_ASYNC_GENERATOR"

  * Buffer flags

    * "BufferFlags"

      * "BufferFlags.SIMPLE"

      * "BufferFlags.WRITABLE"

      * "BufferFlags.FORMAT"

      * "BufferFlags.ND"

      * "BufferFlags.STRIDES"

      * "BufferFlags.C_CONTIGUOUS"

      * "BufferFlags.F_CONTIGUOUS"

      * "BufferFlags.ANY_CONTIGUOUS"

      * "BufferFlags.INDIRECT"

      * "BufferFlags.CONTIG"

      * "BufferFlags.CONTIG_RO"

      * "BufferFlags.STRIDED"

      * "BufferFlags.STRIDED_RO"

      * "BufferFlags.RECORDS"

      * "BufferFlags.RECORDS_RO"

      * "BufferFlags.FULL"

      * "BufferFlags.FULL_RO"

      * "BufferFlags.READ"

      * "BufferFlags.WRITE"

  * Command Line Interface

* "site" — Site-specific configuration hook

  * Readline configuration

  * Module contents

    * "PREFIXES"

    * "ENABLE_USER_SITE"

    * "USER_SITE"

    * "USER_BASE"

    * "main()"

    * "addsitedir()"

    * "getsitepackages()"

    * "getuserbase()"

    * "getusersitepackages()"

  * Command Line Interface

vim:tw=78:ts=8:ft=help:norl: