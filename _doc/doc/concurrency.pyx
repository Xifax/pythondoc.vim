*concurrency.pyx*                             Last change: 2023 Sep 15

Concurrent Execution
********************

The modules described in this chapter provide support for concurrent
execution of code. The appropriate choice of tool will depend on the
task to be executed (CPU bound vs IO bound) and preferred style of
development (event driven cooperative multitasking vs preemptive
multitasking). Here’s an overview:

* "threading" — Thread-based parallelism

  * "active_count()"

  * "current_thread()"

  * "excepthook()"

  * "__excepthook__"

  * "get_ident()"

  * "get_native_id()"

  * "enumerate()"

  * "main_thread()"

  * "settrace()"

  * "settrace_all_threads()"

  * "gettrace()"

  * "setprofile()"

  * "setprofile_all_threads()"

  * "getprofile()"

  * "stack_size()"

  * "TIMEOUT_MAX"

  * Thread-Local Data

    * "local"

  * Thread Objects

    * "Thread"

      * "Thread.start()"

      * "Thread.run()"

      * "Thread.join()"

      * "Thread.name"

      * "Thread.getName()"

      * "Thread.setName()"

      * "Thread.ident"

      * "Thread.native_id"

      * "Thread.is_alive()"

      * "Thread.daemon"

      * "Thread.isDaemon()"

      * "Thread.setDaemon()"

  * Lock Objects

    * "Lock"

      * "Lock.acquire()"

      * "Lock.release()"

      * "Lock.locked()"

  * RLock Objects

    * "RLock"

      * "RLock.acquire()"

      * "RLock.release()"

  * Condition Objects

    * "Condition"

      * "Condition.acquire()"

      * "Condition.release()"

      * "Condition.wait()"

      * "Condition.wait_for()"

      * "Condition.notify()"

      * "Condition.notify_all()"

  * Semaphore Objects

    * "Semaphore"

      * "Semaphore.acquire()"

      * "Semaphore.release()"

    * "BoundedSemaphore"

    * "Semaphore" Example

  * Event Objects

    * "Event"

      * "Event.is_set()"

      * "Event.set()"

      * "Event.clear()"

      * "Event.wait()"

  * Timer Objects

    * "Timer"

      * "Timer.cancel()"

  * Barrier Objects

    * "Barrier"

      * "Barrier.wait()"

      * "Barrier.reset()"

      * "Barrier.abort()"

      * "Barrier.parties"

      * "Barrier.n_waiting"

      * "Barrier.broken"

    * "BrokenBarrierError"

  * Using locks, conditions, and semaphores in the "with" statement

* "multiprocessing" — Process-based parallelism

  * Introduction

    * The "Process" class

    * Contexts and start methods

    * Exchanging objects between processes

    * Synchronization between processes

    * Sharing state between processes

    * Using a pool of workers

  * Reference

    * "Process" and exceptions

      * "Process"

        * "Process.run()"

        * "Process.start()"

        * "Process.join()"

        * "Process.name"

        * "Process.is_alive()"

        * "Process.daemon"

        * "Process.pid"

        * "Process.exitcode"

        * "Process.authkey"

        * "Process.sentinel"

        * "Process.terminate()"

        * "Process.kill()"

        * "Process.close()"

      * "ProcessError"

      * "BufferTooShort"

      * "AuthenticationError"

      * "TimeoutError"

    * Pipes and Queues

      * "Pipe()"

      * "Queue"

        * "Queue.qsize()"

        * "Queue.empty()"

        * "Queue.full()"

        * "Queue.put()"

        * "Queue.put_nowait()"

        * "Queue.get()"

        * "Queue.get_nowait()"

        * "Queue.close()"

        * "Queue.join_thread()"

        * "Queue.cancel_join_thread()"

      * "SimpleQueue"

        * "SimpleQueue.close()"

        * "SimpleQueue.empty()"

        * "SimpleQueue.get()"

        * "SimpleQueue.put()"

      * "JoinableQueue"

        * "JoinableQueue.task_done()"

        * "JoinableQueue.join()"

    * Miscellaneous

      * "active_children()"

      * "cpu_count()"

      * "current_process()"

      * "parent_process()"

      * "freeze_support()"

      * "get_all_start_methods()"

      * "get_context()"

      * "get_start_method()"

      * "set_executable()"

      * "set_forkserver_preload()"

      * "set_start_method()"

    * Connection Objects

      * "Connection"

        * "Connection.send()"

        * "Connection.recv()"

        * "Connection.fileno()"

        * "Connection.close()"

        * "Connection.poll()"

        * "Connection.send_bytes()"

        * "Connection.recv_bytes()"

        * "Connection.recv_bytes_into()"

    * Synchronization primitives

      * "Barrier"

      * "BoundedSemaphore"

      * "Condition"

      * "Event"

      * "Lock"

        * "Lock.acquire()"

        * "Lock.release()"

      * "RLock"

        * "RLock.acquire()"

        * "RLock.release()"

      * "Semaphore"

    * Shared "ctypes" Objects

      * "Value()"

      * "Array()"

      * The "multiprocessing.sharedctypes" module

        * "RawArray()"

        * "RawValue()"

        * "Array()"

        * "Value()"

        * "copy()"

        * "synchronized()"

    * Managers

      * "multiprocessing.Manager()"

      * "BaseManager"

        * "BaseManager.start()"

        * "BaseManager.get_server()"

        * "BaseManager.connect()"

        * "BaseManager.shutdown()"

        * "BaseManager.register()"

        * "BaseManager.address"

      * "SyncManager"

        * "SyncManager.Barrier()"

        * "SyncManager.BoundedSemaphore()"

        * "SyncManager.Condition()"

        * "SyncManager.Event()"

        * "SyncManager.Lock()"

        * "SyncManager.Namespace()"

        * "SyncManager.Queue()"

        * "SyncManager.RLock()"

        * "SyncManager.Semaphore()"

        * "SyncManager.Array()"

        * "SyncManager.Value()"

        * "SyncManager.dict()"

        * "SyncManager.list()"

      * "Namespace"

      * Customized managers

      * Using a remote manager

    * Proxy Objects

      * "BaseProxy"

        * "BaseProxy._callmethod()"

        * "BaseProxy._getvalue()"

        * "BaseProxy.__repr__()"

        * "BaseProxy.__str__()"

      * Cleanup

    * Process Pools

      * "Pool"

        * "Pool.apply()"

        * "Pool.apply_async()"

        * "Pool.map()"

        * "Pool.map_async()"

        * "Pool.imap()"

        * "Pool.imap_unordered()"

        * "Pool.starmap()"

        * "Pool.starmap_async()"

        * "Pool.close()"

        * "Pool.terminate()"

        * "Pool.join()"

      * "AsyncResult"

        * "AsyncResult.get()"

        * "AsyncResult.wait()"

        * "AsyncResult.ready()"

        * "AsyncResult.successful()"

    * Listeners and Clients

      * "deliver_challenge()"

      * "answer_challenge()"

      * "Client()"

      * "Listener"

        * "Listener.accept()"

        * "Listener.close()"

        * "Listener.address"

        * "Listener.last_accepted"

      * "wait()"

      * Address Formats

    * Authentication keys

    * Logging

      * "get_logger()"

      * "log_to_stderr()"

    * The "multiprocessing.dummy" module

      * "ThreadPool"

  * Programming guidelines

    * All start methods

    * The _spawn_ and _forkserver_ start methods

  * Examples

* "multiprocessing.shared_memory" — Shared memory for direct access
  across processes

  * "SharedMemory"

    * "SharedMemory.close()"

    * "SharedMemory.unlink()"

    * "SharedMemory.buf"

    * "SharedMemory.name"

    * "SharedMemory.size"

  * "SharedMemoryManager"

    * "SharedMemoryManager.SharedMemory()"

    * "SharedMemoryManager.ShareableList()"

  * "ShareableList"

    * "ShareableList.count()"

    * "ShareableList.index()"

    * "ShareableList.format"

    * "ShareableList.shm"

* The "concurrent" package

* "concurrent.futures" — Launching parallel tasks

  * Executor Objects

    * "Executor"

      * "Executor.submit()"

      * "Executor.map()"

      * "Executor.shutdown()"

  * ThreadPoolExecutor

    * "ThreadPoolExecutor"

    * ThreadPoolExecutor Example

  * ProcessPoolExecutor

    * "ProcessPoolExecutor"

    * ProcessPoolExecutor Example

  * Future Objects

    * "Future"

      * "Future.cancel()"

      * "Future.cancelled()"

      * "Future.running()"

      * "Future.done()"

      * "Future.result()"

      * "Future.exception()"

      * "Future.add_done_callback()"

      * "Future.set_running_or_notify_cancel()"

      * "Future.set_result()"

      * "Future.set_exception()"

  * Module Functions

    * "wait()"

    * "as_completed()"

  * Exception classes

    * "CancelledError"

    * "TimeoutError"

    * "BrokenExecutor"

    * "InvalidStateError"

    * "BrokenThreadPool"

    * "BrokenProcessPool"

* "subprocess" — Subprocess management

  * Using the "subprocess" Module

    * "run()"

    * "CompletedProcess"

      * "CompletedProcess.args"

      * "CompletedProcess.returncode"

      * "CompletedProcess.stdout"

      * "CompletedProcess.stderr"

      * "CompletedProcess.check_returncode()"

    * "DEVNULL"

    * "PIPE"

    * "STDOUT"

    * "SubprocessError"

    * "TimeoutExpired"

      * "TimeoutExpired.cmd"

      * "TimeoutExpired.timeout"

      * "TimeoutExpired.output"

      * "TimeoutExpired.stdout"

      * "TimeoutExpired.stderr"

    * "CalledProcessError"

      * "CalledProcessError.returncode"

      * "CalledProcessError.cmd"

      * "CalledProcessError.output"

      * "CalledProcessError.stdout"

      * "CalledProcessError.stderr"

    * Frequently Used Arguments

    * Popen Constructor

      * "Popen"

    * Exceptions

  * Security Considerations

  * Popen Objects

    * "Popen.poll()"

    * "Popen.wait()"

    * "Popen.communicate()"

    * "Popen.send_signal()"

    * "Popen.terminate()"

    * "Popen.kill()"

    * "Popen.args"

    * "Popen.stdin"

    * "Popen.stdout"

    * "Popen.stderr"

    * "Popen.pid"

    * "Popen.returncode"

  * Windows Popen Helpers

    * "STARTUPINFO"

      * "STARTUPINFO.dwFlags"

      * "STARTUPINFO.hStdInput"

      * "STARTUPINFO.hStdOutput"

      * "STARTUPINFO.hStdError"

      * "STARTUPINFO.wShowWindow"

      * "STARTUPINFO.lpAttributeList"

    * Windows Constants

      * "STD_INPUT_HANDLE"

      * "STD_OUTPUT_HANDLE"

      * "STD_ERROR_HANDLE"

      * "SW_HIDE"

      * "STARTF_USESTDHANDLES"

      * "STARTF_USESHOWWINDOW"

      * "CREATE_NEW_CONSOLE"

      * "CREATE_NEW_PROCESS_GROUP"

      * "ABOVE_NORMAL_PRIORITY_CLASS"

      * "BELOW_NORMAL_PRIORITY_CLASS"

      * "HIGH_PRIORITY_CLASS"

      * "IDLE_PRIORITY_CLASS"

      * "NORMAL_PRIORITY_CLASS"

      * "REALTIME_PRIORITY_CLASS"

      * "CREATE_NO_WINDOW"

      * "DETACHED_PROCESS"

      * "CREATE_DEFAULT_ERROR_MODE"

      * "CREATE_BREAKAWAY_FROM_JOB"

  * Older high-level API

    * "call()"

    * "check_call()"

    * "check_output()"

  * Replacing Older Functions with the "subprocess" Module

    * Replacing **/bin/sh** shell command substitution

    * Replacing shell pipeline

    * Replacing "os.system()"

    * Replacing the "os.spawn" family

    * Replacing "os.popen()", "os.popen2()", "os.popen3()"

    * Replacing functions from the "popen2" module

  * Legacy Shell Invocation Functions

    * "getstatusoutput()"

    * "getoutput()"

  * Notes

    * Converting an argument sequence to a string on Windows

    * Disabling use of "vfork()" or "posix_spawn()"

* "sched" — Event scheduler

  * "scheduler"

  * Scheduler Objects

    * "scheduler.enterabs()"

    * "scheduler.enter()"

    * "scheduler.cancel()"

    * "scheduler.empty()"

    * "scheduler.run()"

    * "scheduler.queue"

* "queue" — A synchronized queue class

  * "Queue"

  * "LifoQueue"

  * "PriorityQueue"

  * "SimpleQueue"

  * "Empty"

  * "Full"

  * Queue Objects

    * "Queue.qsize()"

    * "Queue.empty()"

    * "Queue.full()"

    * "Queue.put()"

    * "Queue.put_nowait()"

    * "Queue.get()"

    * "Queue.get_nowait()"

    * "Queue.task_done()"

    * "Queue.join()"

  * SimpleQueue Objects

    * "SimpleQueue.qsize()"

    * "SimpleQueue.empty()"

    * "SimpleQueue.put()"

    * "SimpleQueue.put_nowait()"

    * "SimpleQueue.get()"

    * "SimpleQueue.get_nowait()"

* "contextvars" — Context Variables

  * Context Variables

    * "ContextVar"

      * "ContextVar.name"

      * "ContextVar.get()"

      * "ContextVar.set()"

      * "ContextVar.reset()"

    * "Token"

      * "Token.var"

      * "Token.old_value"

      * "Token.MISSING"

  * Manual Context Management

    * "copy_context()"

    * "Context"

      * "Context.run()"

      * "Context.copy()"

      * "Context.get()"

      * "Context.keys()"

      * "Context.values()"

      * "Context.items()"

  * asyncio support

The following are support modules for some of the above services:

* "_thread" — Low-level threading API

  * "error"

  * "LockType"

  * "start_new_thread()"

  * "interrupt_main()"

  * "exit()"

  * "allocate_lock()"

  * "get_ident()"

  * "get_native_id()"

  * "stack_size()"

  * "TIMEOUT_MAX"

  * "lock.acquire()"

  * "lock.release()"

  * "lock.locked()"

vim:tw=78:ts=8:ft=help:norl: