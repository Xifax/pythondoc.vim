*debug.pyx*                                   Last change: 2023 Sep 15

Debugging and Profiling
***********************

These libraries help you with Python development: the debugger enables
you to step through code, analyze stack frames and set breakpoints
etc., and the profilers run code and give you a detailed breakdown of
execution times, allowing you to identify bottlenecks in your
programs. Auditing events provide visibility into runtime behaviors
that would otherwise require intrusive debugging or patching.

* Audit events table

* "bdb" — Debugger framework

  * "BdbQuit"

  * "Breakpoint"

    * "Breakpoint.deleteMe()"

    * "Breakpoint.enable()"

    * "Breakpoint.disable()"

    * "Breakpoint.bpformat()"

    * "Breakpoint.bpprint()"

    * "Breakpoint.file"

    * "Breakpoint.line"

    * "Breakpoint.temporary"

    * "Breakpoint.cond"

    * "Breakpoint.funcname"

    * "Breakpoint.enabled"

    * "Breakpoint.bpbynumber"

    * "Breakpoint.bplist"

    * "Breakpoint.ignore"

    * "Breakpoint.hits"

  * "Bdb"

    * "Bdb.canonic()"

    * "Bdb.reset()"

    * "Bdb.trace_dispatch()"

    * "Bdb.dispatch_line()"

    * "Bdb.dispatch_call()"

    * "Bdb.dispatch_return()"

    * "Bdb.dispatch_exception()"

    * "Bdb.is_skipped_line()"

    * "Bdb.stop_here()"

    * "Bdb.break_here()"

    * "Bdb.break_anywhere()"

    * "Bdb.user_call()"

    * "Bdb.user_line()"

    * "Bdb.user_return()"

    * "Bdb.user_exception()"

    * "Bdb.do_clear()"

    * "Bdb.set_step()"

    * "Bdb.set_next()"

    * "Bdb.set_return()"

    * "Bdb.set_until()"

    * "Bdb.set_trace()"

    * "Bdb.set_continue()"

    * "Bdb.set_quit()"

    * "Bdb.set_break()"

    * "Bdb.clear_break()"

    * "Bdb.clear_bpbynumber()"

    * "Bdb.clear_all_file_breaks()"

    * "Bdb.clear_all_breaks()"

    * "Bdb.get_bpbynumber()"

    * "Bdb.get_break()"

    * "Bdb.get_breaks()"

    * "Bdb.get_file_breaks()"

    * "Bdb.get_all_breaks()"

    * "Bdb.get_stack()"

    * "Bdb.format_stack_entry()"

    * "Bdb.run()"

    * "Bdb.runeval()"

    * "Bdb.runctx()"

    * "Bdb.runcall()"

  * "checkfuncname()"

  * "effective()"

  * "set_trace()"

* "faulthandler" — Dump the Python traceback

  * Dumping the traceback

    * "dump_traceback()"

  * Fault handler state

    * "enable()"

    * "disable()"

    * "is_enabled()"

  * Dumping the tracebacks after a timeout

    * "dump_traceback_later()"

    * "cancel_dump_traceback_later()"

  * Dumping the traceback on a user signal

    * "register()"

    * "unregister()"

  * Issue with file descriptors

  * Example

* "pdb" — The Python Debugger

  * "run()"

  * "runeval()"

  * "runcall()"

  * "set_trace()"

  * "post_mortem()"

  * "pm()"

  * "Pdb"

    * "Pdb.run()"

    * "Pdb.runeval()"

    * "Pdb.runcall()"

    * "Pdb.set_trace()"

  * Debugger Commands

* The Python Profilers

  * Introduction to the profilers

  * Instant User’s Manual

  * "profile" and "cProfile" Module Reference

    * "run()"

    * "runctx()"

    * "Profile"

      * "Profile.enable()"

      * "Profile.disable()"

      * "Profile.create_stats()"

      * "Profile.print_stats()"

      * "Profile.dump_stats()"

      * "Profile.run()"

      * "Profile.runctx()"

      * "Profile.runcall()"

  * The "Stats" Class

    * "Stats"

      * "Stats.strip_dirs()"

      * "Stats.add()"

      * "Stats.dump_stats()"

      * "Stats.sort_stats()"

      * "Stats.reverse_order()"

      * "Stats.print_stats()"

      * "Stats.print_callers()"

      * "Stats.print_callees()"

      * "Stats.get_stats_profile()"

  * What Is Deterministic Profiling?

  * Limitations

  * Calibration

  * Using a custom timer

* "timeit" — Measure execution time of small code snippets

  * Basic Examples

  * Python Interface

    * "timeit()"

    * "repeat()"

    * "default_timer()"

    * "Timer"

      * "Timer.timeit()"

      * "Timer.autorange()"

      * "Timer.repeat()"

      * "Timer.print_exc()"

  * Command-Line Interface

  * Examples

* "trace" — Trace or track Python statement execution

  * Command-Line Usage

    * Main options

    * Modifiers

    * Filters

  * Programmatic Interface

    * "Trace"

      * "Trace.run()"

      * "Trace.runctx()"

      * "Trace.runfunc()"

      * "Trace.results()"

    * "CoverageResults"

      * "CoverageResults.update()"

      * "CoverageResults.write_results()"

* "tracemalloc" — Trace memory allocations

  * Examples

    * Display the top 10

    * Compute differences

    * Get the traceback of a memory block

    * Pretty top

      * Record the current and peak size of all traced memory blocks

  * API

    * Functions

      * "clear_traces()"

      * "get_object_traceback()"

      * "get_traceback_limit()"

      * "get_traced_memory()"

      * "reset_peak()"

      * "get_tracemalloc_memory()"

      * "is_tracing()"

      * "start()"

      * "stop()"

      * "take_snapshot()"

    * DomainFilter

      * "DomainFilter"

        * "DomainFilter.inclusive"

        * "DomainFilter.domain"

    * Filter

      * "Filter"

        * "Filter.domain"

        * "Filter.inclusive"

        * "Filter.lineno"

        * "Filter.filename_pattern"

        * "Filter.all_frames"

    * Frame

      * "Frame"

        * "Frame.filename"

        * "Frame.lineno"

    * Snapshot

      * "Snapshot"

        * "Snapshot.compare_to()"

        * "Snapshot.dump()"

        * "Snapshot.filter_traces()"

        * "Snapshot.load()"

        * "Snapshot.statistics()"

        * "Snapshot.traceback_limit"

        * "Snapshot.traces"

    * Statistic

      * "Statistic"

        * "Statistic.count"

        * "Statistic.size"

        * "Statistic.traceback"

    * StatisticDiff

      * "StatisticDiff"

        * "StatisticDiff.count"

        * "StatisticDiff.count_diff"

        * "StatisticDiff.size"

        * "StatisticDiff.size_diff"

        * "StatisticDiff.traceback"

    * Trace

      * "Trace"

        * "Trace.domain"

        * "Trace.size"

        * "Trace.traceback"

    * Traceback

      * "Traceback"

        * "Traceback.total_nframe"

        * "Traceback.format()"

vim:tw=78:ts=8:ft=help:norl: