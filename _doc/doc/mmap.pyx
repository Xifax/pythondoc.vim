*mmap.pyx*                                    Last change: 2023 Sep 15

"mmap" — Memory-mapped file support
***********************************

======================================================================

Availability: not Emscripten, not WASI.

This module does not work or is not available on WebAssembly platforms
"wasm32-emscripten" and "wasm32-wasi". See WebAssembly platforms for
more information.

Memory-mapped file objects behave like both "bytearray" and like _file
objects_.  You can use mmap objects in most places where "bytearray"
are expected; for example, you can use the "re" module to search
through a memory-mapped file.  You can also change a single byte by
doing "obj[index] = 97", or change a subsequence by assigning to a
slice: "obj[i1:i2] = b'...'".  You can also read and write data
starting at the current file position, and "seek()" through the file
to different positions.

A memory-mapped file is created by the "mmap" constructor, which is
different on Unix and on Windows.  In either case you must provide a
file descriptor for a file opened for update. If you wish to map an
existing Python file object, use its "fileno()" method to obtain the
correct value for the _fileno_ parameter.  Otherwise, you can open the
file using the "os.open()" function, which returns a file descriptor
directly (the file still needs to be closed when done).

Note:

  If you want to create a memory-mapping for a writable, buffered
  file, you should "flush()" the file first.  This is necessary to
  ensure that local modifications to the buffers are actually
  available to the mapping.

For both the Unix and Windows versions of the constructor, _access_
may be specified as an optional keyword parameter. _access_ accepts
one of four values: "ACCESS_READ", "ACCESS_WRITE", or "ACCESS_COPY" to
specify read-only, write-through or copy-on-write memory respectively,
or "ACCESS_DEFAULT" to defer to _prot_.  _access_ can be used on both
Unix and Windows.  If _access_ is not specified, Windows mmap returns
a write-through mapping.  The initial memory values for all three
access types are taken from the specified file.  Assignment to an
"ACCESS_READ" memory map raises a "TypeError" exception.  Assignment
to an "ACCESS_WRITE" memory map affects both memory and the underlying
file. Assignment to an "ACCESS_COPY" memory map affects memory but
does not update the underlying file.

Changed in version 3.7: Added "ACCESS_DEFAULT" constant.

To map anonymous memory, -1 should be passed as the fileno along with
the length.

                                                      *mmap..mmap.pyx*
class mmap.mmap(fileno, length, tagname=None, access=ACCESS_DEFAULT[, offset])

   **(Windows version)** Maps _length_ bytes from the file specified
   by the file handle _fileno_, and creates a mmap object.  If
   _length_ is larger than the current size of the file, the file is
   extended to contain _length_ bytes.  If _length_ is "0", the
   maximum length of the map is the current size of the file, except
   that if the file is empty Windows raises an exception (you cannot
   create an empty mapping on Windows).

   _tagname_, if specified and not "None", is a string giving a tag
   name for the mapping.  Windows allows you to have many different
   mappings against the same file.  If you specify the name of an
   existing tag, that tag is opened, otherwise a new tag of this name
   is created.  If this parameter is omitted or "None", the mapping is
   created without a name.  Avoiding the use of the tag parameter will
   assist in keeping your code portable between Unix and Windows.

   _offset_ may be specified as a non-negative integer offset. mmap
   references will be relative to the offset from the beginning of the
   file. _offset_ defaults to 0.  _offset_ must be a multiple of the
   "ALLOCATIONGRANULARITY".

   Raises an auditing event "mmap.__new__" with arguments "fileno",
   "length", "access", "offset".

class mmap.mmap(fileno, length, flags=MAP_SHARED, prot=PROT_WRITE|PROT_READ, access=ACCESS_DEFAULT[, offset])

   **(Unix version)** Maps _length_ bytes from the file specified by
   the file descriptor _fileno_, and returns a mmap object.  If
   _length_ is "0", the maximum length of the map will be the current
   size of the file when "mmap" is called.

   _flags_ specifies the nature of the mapping. "MAP_PRIVATE" creates
   a private copy-on-write mapping, so changes to the contents of the
   mmap object will be private to this process, and "MAP_SHARED"
   creates a mapping that’s shared with all other processes mapping
   the same areas of the file.  The default value is "MAP_SHARED".
   Some systems have additional possible flags with the full list
   specified in MAP_* constants.

   _prot_, if specified, gives the desired memory protection; the two
   most useful values are "PROT_READ" and "PROT_WRITE", to specify
   that the pages may be read or written.  _prot_ defaults to
   "PROT_READ | PROT_WRITE".

   _access_ may be specified in lieu of _flags_ and _prot_ as an
   optional keyword parameter.  It is an error to specify both
   _flags_, _prot_ and _access_.  See the description of _access_
   above for information on how to use this parameter.

   _offset_ may be specified as a non-negative integer offset. mmap
   references will be relative to the offset from the beginning of the
   file. _offset_ defaults to 0. _offset_ must be a multiple of
   "ALLOCATIONGRANULARITY" which is equal to "PAGESIZE" on Unix
   systems.

   To ensure validity of the created memory mapping the file specified
   by the descriptor _fileno_ is internally automatically synchronized
   with the physical backing store on macOS.

   This example shows a simple way of using "mmap":
>
      import mmap

      # write a simple example file
      with open("hello.txt", "wb") as f:
          f.write(b"Hello Python!\n")

      with open("hello.txt", "r+b") as f:
          # memory-map the file, size 0 means whole file
          mm = mmap.mmap(f.fileno(), 0)
          # read content via standard file methods
          print(mm.readline())  # prints b"Hello Python!\n"
          # read content via slice notation
          print(mm[:5])  # prints b"Hello"
          # update content using slice notation;
          # note that new content must have same size
          mm[6:] = b" world!\n"
          # ... and read again using standard file methods
          mm.seek(0)
          print(mm.readline())  # prints b"Hello  world!\n"
          # close the map
          mm.close()
<
   "mmap" can also be used as a context manager in a "with" statement:
>
      import mmap

      with mmap.mmap(-1, 13) as mm:
          mm.write(b"Hello world!")
<
   New in version 3.2: Context manager support.

   The next example demonstrates how to create an anonymous map and
   exchange data between the parent and child processes:
>
      import mmap
      import os

      mm = mmap.mmap(-1, 13)
      mm.write(b"Hello world!")

      pid = os.fork()

      if pid == 0:  # In a child process
          mm.seek(0)
          print(mm.readline())

          mm.close()
<
   Raises an auditing event "mmap.__new__" with arguments "fileno",
   "length", "access", "offset".

   Memory-mapped file objects support the following methods:

   close()                                       *mmap.close()..mmap.pyx*

      Closes the mmap. Subsequent calls to other methods of the object
      will result in a ValueError exception being raised. This will
      not close the open file.

   closed                                         *mmap.closed..mmap.pyx*

      "True" if the file is closed.

      New in version 3.2.

   find(sub[, start[, end]])                      *mmap.find()..mmap.pyx*

      Returns the lowest index in the object where the subsequence
      _sub_ is found, such that _sub_ is contained in the range
      [_start_, _end_]. Optional arguments _start_ and _end_ are
      interpreted as in slice notation. Returns "-1" on failure.

      Changed in version 3.5: Writable _bytes-like object_ is now
      accepted.

   flush([offset[, size]])                       *mmap.flush()..mmap.pyx*

      Flushes changes made to the in-memory copy of a file back to
      disk. Without use of this call there is no guarantee that
      changes are written back before the object is destroyed.  If
      _offset_ and _size_ are specified, only changes to the given
      range of bytes will be flushed to disk; otherwise, the whole
      extent of the mapping is flushed.  _offset_ must be a multiple
      of the "PAGESIZE" or "ALLOCATIONGRANULARITY".

      "None" is returned to indicate success.  An exception is raised
      when the call failed.

      Changed in version 3.8: Previously, a nonzero value was returned
      on success; zero was returned on error under Windows.  A zero
      value was returned on success; an exception was raised on error
      under Unix.

   madvise(option[, start[, length]])          *mmap.madvise()..mmap.pyx*

      Send advice _option_ to the kernel about the memory region
      beginning at _start_ and extending _length_ bytes.  _option_
      must be one of the MADV_* constants available on the system.  If
      _start_ and _length_ are omitted, the entire mapping is spanned.
      On some systems (including Linux), _start_ must be a multiple of
      the "PAGESIZE".

      Availability: Systems with the "madvise()" system call.

      New in version 3.8.

   move(dest, src, count)                         *mmap.move()..mmap.pyx*

      Copy the _count_ bytes starting at offset _src_ to the
      destination index _dest_.  If the mmap was created with
      "ACCESS_READ", then calls to move will raise a "TypeError"
      exception.

   read([n])                                      *mmap.read()..mmap.pyx*

      Return a "bytes" containing up to _n_ bytes starting from the
      current file position. If the argument is omitted, "None" or
      negative, return all bytes from the current file position to the
      end of the mapping. The file position is updated to point after
      the bytes that were returned.

      Changed in version 3.3: Argument can be omitted or "None".

   read_byte()                               *mmap.read_byte()..mmap.pyx*

      Returns a byte at the current file position as an integer, and
      advances the file position by 1.

   readline()                                 *mmap.readline()..mmap.pyx*

      Returns a single line, starting at the current file position and
      up to the next newline. The file position is updated to point
      after the bytes that were returned.

   resize(newsize)                              *mmap.resize()..mmap.pyx*

      Resizes the map and the underlying file, if any. If the mmap was
      created with "ACCESS_READ" or "ACCESS_COPY", resizing the map
      will raise a "TypeError" exception.

      **On Windows**: Resizing the map will raise an "OSError" if
      there are other maps against the same named file. Resizing an
      anonymous map (ie against the pagefile) will silently create a
      new map with the original data copied over up to the length of
      the new size.

      Changed in version 3.11: Correctly fails if attempting to resize
      when another map is held Allows resize against an anonymous map
      on Windows

   rfind(sub[, start[, end]])                    *mmap.rfind()..mmap.pyx*

      Returns the highest index in the object where the subsequence
      _sub_ is found, such that _sub_ is contained in the range
      [_start_, _end_]. Optional arguments _start_ and _end_ are
      interpreted as in slice notation. Returns "-1" on failure.

      Changed in version 3.5: Writable _bytes-like object_ is now
      accepted.

   seek(pos[, whence])                            *mmap.seek()..mmap.pyx*

      Set the file’s current position.  _whence_ argument is optional
      and defaults to "os.SEEK_SET" or "0" (absolute file
      positioning); other values are "os.SEEK_CUR" or "1" (seek
      relative to the current position) and "os.SEEK_END" or "2" (seek
      relative to the file’s end).

   size()                                         *mmap.size()..mmap.pyx*

      Return the length of the file, which can be larger than the size
      of the memory-mapped area.

   tell()                                         *mmap.tell()..mmap.pyx*

      Returns the current position of the file pointer.

   write(bytes)                                  *mmap.write()..mmap.pyx*

      Write the bytes in _bytes_ into memory at the current position
      of the file pointer and return the number of bytes written
      (never less than "len(bytes)", since if the write fails, a
      "ValueError" will be raised).  The file position is updated to
      point after the bytes that were written.  If the mmap was
      created with "ACCESS_READ", then writing to it will raise a
      "TypeError" exception.

      Changed in version 3.5: Writable _bytes-like object_ is now
      accepted.

      Changed in version 3.6: The number of bytes written is now
      returned.

   write_byte(byte)                         *mmap.write_byte()..mmap.pyx*

      Write the integer _byte_ into memory at the current position of
      the file pointer; the file position is advanced by "1". If the
      mmap was created with "ACCESS_READ", then writing to it will
      raise a "TypeError" exception.


MADV_* Constants
================

mmap.MADV_NORMAL                               *MADV_NORMAL..mmap.pyx*
mmap.MADV_RANDOM                               *MADV_RANDOM..mmap.pyx*
mmap.MADV_SEQUENTIAL                       *MADV_SEQUENTIAL..mmap.pyx*
mmap.MADV_WILLNEED                           *MADV_WILLNEED..mmap.pyx*
mmap.MADV_DONTNEED                           *MADV_DONTNEED..mmap.pyx*
mmap.MADV_REMOVE                               *MADV_REMOVE..mmap.pyx*
mmap.MADV_DONTFORK                           *MADV_DONTFORK..mmap.pyx*
mmap.MADV_DOFORK                               *MADV_DOFORK..mmap.pyx*
mmap.MADV_HWPOISON                           *MADV_HWPOISON..mmap.pyx*
mmap.MADV_MERGEABLE                         *MADV_MERGEABLE..mmap.pyx*
mmap.MADV_UNMERGEABLE                     *MADV_UNMERGEABLE..mmap.pyx*
mmap.MADV_SOFT_OFFLINE                   *MADV_SOFT_OFFLINE..mmap.pyx*
mmap.MADV_HUGEPAGE                           *MADV_HUGEPAGE..mmap.pyx*
mmap.MADV_NOHUGEPAGE                       *MADV_NOHUGEPAGE..mmap.pyx*
mmap.MADV_DONTDUMP                           *MADV_DONTDUMP..mmap.pyx*
mmap.MADV_DODUMP                               *MADV_DODUMP..mmap.pyx*
mmap.MADV_FREE                                   *MADV_FREE..mmap.pyx*
mmap.MADV_NOSYNC                               *MADV_NOSYNC..mmap.pyx*
mmap.MADV_AUTOSYNC                           *MADV_AUTOSYNC..mmap.pyx*
mmap.MADV_NOCORE                               *MADV_NOCORE..mmap.pyx*
mmap.MADV_CORE                                   *MADV_CORE..mmap.pyx*
mmap.MADV_PROTECT                             *MADV_PROTECT..mmap.pyx*
mmap.MADV_FREE_REUSABLE                 *MADV_FREE_REUSABLE..mmap.pyx*
mmap.MADV_FREE_REUSE                       *MADV_FREE_REUSE..mmap.pyx*

   These options can be passed to "mmap.madvise()".  Not every option
   will be present on every system.

   Availability: Systems with the madvise() system call.

   New in version 3.8.


MAP_* Constants
===============

mmap.MAP_SHARED                                 *MAP_SHARED..mmap.pyx*
mmap.MAP_PRIVATE                               *MAP_PRIVATE..mmap.pyx*
mmap.MAP_DENYWRITE                           *MAP_DENYWRITE..mmap.pyx*
mmap.MAP_EXECUTABLE                         *MAP_EXECUTABLE..mmap.pyx*
mmap.MAP_ANON                                     *MAP_ANON..mmap.pyx*
mmap.MAP_ANONYMOUS                           *MAP_ANONYMOUS..mmap.pyx*
mmap.MAP_POPULATE                             *MAP_POPULATE..mmap.pyx*
mmap.MAP_STACK                                   *MAP_STACK..mmap.pyx*
mmap.MAP_ALIGNED_SUPER                   *MAP_ALIGNED_SUPER..mmap.pyx*
mmap.MAP_CONCEAL                               *MAP_CONCEAL..mmap.pyx*

   These are the various flags that can be passed to "mmap.mmap()".
   "MAP_ALIGNED_SUPER" is only available at FreeBSD and "MAP_CONCEAL"
   is only available at OpenBSD.  Note that some options might not be
   present on some systems.

   Changed in version 3.10: Added "MAP_POPULATE" constant.

   New in version 3.11: Added "MAP_STACK" constant.

   New in version 3.12: Added "MAP_ALIGNED_SUPER" constant. Added
   "MAP_CONCEAL" constant.

vim:tw=78:ts=8:ft=help:norl: