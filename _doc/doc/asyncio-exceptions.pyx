*asyncio-exceptions.pyx*                      Last change: 2023 Sep 15

Exceptions
**********

**Source code:** Lib/asyncio/exceptions.py

======================================================================

                                *TimeoutError..asyncio-exceptions.pyx*
exception asyncio.TimeoutError

   A deprecated alias of "TimeoutError", raised when the operation has
   exceeded the given deadline.

   Changed in version 3.11: This class was made an alias of
   "TimeoutError".

                              *CancelledError..asyncio-exceptions.pyx*
exception asyncio.CancelledError

   The operation has been cancelled.

   This exception can be caught to perform custom operations when
   asyncio Tasks are cancelled.  In almost all situations the
   exception must be re-raised.

   Changed in version 3.8: "CancelledError" is now a subclass of
   "BaseException" rather than "Exception".

                           *InvalidStateError..asyncio-exceptions.pyx*
exception asyncio.InvalidStateError

   Invalid internal state of "Task" or "Future".

   Can be raised in situations like setting a result value for a
   _Future_ object that already has a result value set.

                   *SendfileNotAvailableError..asyncio-exceptions.pyx*
exception asyncio.SendfileNotAvailableError

   The “sendfile” syscall is not available for the given socket or
   file type.

   A subclass of "RuntimeError".

                         *IncompleteReadError..asyncio-exceptions.pyx*
exception asyncio.IncompleteReadError

   The requested read operation did not complete fully.

   Raised by the asyncio stream APIs.

   This exception is a subclass of "EOFError".

   expected        *IncompleteReadError.expected..asyncio-exceptions.pyx*

      The total number ("int") of expected bytes.

   partial          *IncompleteReadError.partial..asyncio-exceptions.pyx*

      A string of "bytes" read before the end of stream was reached.

                           *LimitOverrunError..asyncio-exceptions.pyx*
exception asyncio.LimitOverrunError

   Reached the buffer size limit while looking for a separator.

   Raised by the asyncio stream APIs.

   consumed          *LimitOverrunError.consumed..asyncio-exceptions.pyx*

      The total number of to be consumed bytes.

vim:tw=78:ts=8:ft=help:norl: