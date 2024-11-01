*array.pyx*                                   Last change: 2023 Sep 15

"array" — Efficient arrays of numeric values
********************************************

======================================================================

This module defines an object type which can compactly represent an
array of basic values: characters, integers, floating point numbers.
Arrays are sequence types and behave very much like lists, except that
the type of objects stored in them is constrained.  The type is
specified at object creation time by using a _type code_, which is a
single character.  The following type codes are defined:

+-------------+----------------------+---------------------+-------------------------+---------+
| Type code   | C Type               | Python Type         | Minimum size in bytes   | Notes   |
|=============|======================|=====================|=========================|=========|
| "'b'"       | signed char          | int                 | 1                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'B'"       | unsigned char        | int                 | 1                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'u'"       | wchar_t              | Unicode character   | 2                       | (1)     |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'w'"       | Py_UCS4              | Unicode character   | 4                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'h'"       | signed short         | int                 | 2                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'H'"       | unsigned short       | int                 | 2                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'i'"       | signed int           | int                 | 2                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'I'"       | unsigned int         | int                 | 2                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'l'"       | signed long          | int                 | 4                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'L'"       | unsigned long        | int                 | 4                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'q'"       | signed long long     | int                 | 8                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'Q'"       | unsigned long long   | int                 | 8                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'f'"       | float                | float               | 4                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+
| "'d'"       | double               | float               | 8                       |         |
+-------------+----------------------+---------------------+-------------------------+---------+

Notes:

1. It can be 16 bits or 32 bits depending on the platform.

   Changed in version 3.9: "array('u')" now uses "wchar_t" as C type
   instead of deprecated "Py_UNICODE". This change doesn’t affect its
   behavior because "Py_UNICODE" is alias of "wchar_t" since Python
   3.3.

   Deprecated since version 3.3, will be removed in version 3.16:
   Please migrate to "'w'" typecode.

The actual representation of values is determined by the machine
architecture (strictly speaking, by the C implementation).  The actual
size can be accessed through the "array.itemsize" attribute.

The module defines the following item:

array.typecodes                                 *typecodes..array.pyx*

   A string with all available type codes.

The module defines the following type:

class array.array(typecode[, initializer])          *array..array.pyx*

   A new array whose items are restricted by _typecode_, and
   initialized from the optional _initializer_ value, which must be a
   list, a _bytes-like object_, or iterable over elements of the
   appropriate type.

   If given a list or string, the initializer is passed to the new
   array’s "fromlist()", "frombytes()", or "fromunicode()" method (see
   below) to add initial items to the array.  Otherwise, the iterable
   initializer is passed to the "extend()" method.

   Array objects support the ordinary sequence operations of indexing,
   slicing, concatenation, and multiplication.  When using slice
   assignment, the assigned value must be an array object with the
   same type code; in all other cases, "TypeError" is raised. Array
   objects also implement the buffer interface, and may be used
   wherever _bytes-like objects_ are supported.

   Raises an auditing event "array.__new__" with arguments "typecode",
   "initializer".

   typecode                                   *array.typecode..array.pyx*

      The typecode character used to create the array.

   itemsize                                   *array.itemsize..array.pyx*

      The length in bytes of one array item in the internal
      representation.

   append(x)                                  *array.append()..array.pyx*

      Append a new item with value _x_ to the end of the array.

   buffer_info()                         *array.buffer_info()..array.pyx*

      Return a tuple "(address, length)" giving the current memory
      address and the length in elements of the buffer used to hold
      array’s contents.  The size of the memory buffer in bytes can be
      computed as "array.buffer_info()[1] * array.itemsize".  This is
      occasionally useful when working with low-level (and inherently
      unsafe) I/O interfaces that require memory addresses, such as
      certain "ioctl()" operations.  The returned numbers are valid as
      long as the array exists and no length-changing operations are
      applied to it.

      Note:

        When using array objects from code written in C or C++ (the
        only way to effectively make use of this information), it
        makes more sense to use the buffer interface supported by
        array objects.  This method is maintained for backward
        compatibility and should be avoided in new code.  The buffer
        interface is documented in Buffer Protocol.

   byteswap()                               *array.byteswap()..array.pyx*

      “Byteswap” all items of the array.  This is only supported for
      values which are 1, 2, 4, or 8 bytes in size; for other types of
      values, "RuntimeError" is raised.  It is useful when reading
      data from a file written on a machine with a different byte
      order.

   count(x)                                    *array.count()..array.pyx*

      Return the number of occurrences of _x_ in the array.

   extend(iterable)                           *array.extend()..array.pyx*

      Append items from _iterable_ to the end of the array.  If
      _iterable_ is another array, it must have _exactly_ the same
      type code; if not, "TypeError" will be raised.  If _iterable_ is
      not an array, it must be iterable and its elements must be the
      right type to be appended to the array.

   frombytes(s)                            *array.frombytes()..array.pyx*

      Appends items from the string, interpreting the string as an
      array of machine values (as if it had been read from a file
      using the "fromfile()" method).

      New in version 3.2: "fromstring()" is renamed to "frombytes()"
      for clarity.

   fromfile(f, n)                           *array.fromfile()..array.pyx*

      Read _n_ items (as machine values) from the _file object_ _f_
      and append them to the end of the array.  If less than _n_ items
      are available, "EOFError" is raised, but the items that were
      available are still inserted into the array.

   fromlist(list)                           *array.fromlist()..array.pyx*

      Append items from the list.  This is equivalent to "for x in
      list: a.append(x)" except that if there is a type error, the
      array is unchanged.

   fromunicode(s)                        *array.fromunicode()..array.pyx*

      Extends this array with data from the given unicode string. The
      array must have type code "'u'" or "'w'"; otherwise a
      "ValueError" is raised. Use
      "array.frombytes(unicodestring.encode(enc))" to append Unicode
      data to an array of some other type.

   index(x[, start[, stop]])                   *array.index()..array.pyx*

      Return the smallest _i_ such that _i_ is the index of the first
      occurrence of _x_ in the array.  The optional arguments _start_
      and _stop_ can be specified to search for _x_ within a
      subsection of the array.  Raise "ValueError" if _x_ is not
      found.

      Changed in version 3.10: Added optional _start_ and _stop_
      parameters.

   insert(i, x)                               *array.insert()..array.pyx*

      Insert a new item with value _x_ in the array before position
      _i_. Negative values are treated as being relative to the end of
      the array.

   pop([i])                                      *array.pop()..array.pyx*

      Removes the item with the index _i_ from the array and returns
      it. The optional argument defaults to "-1", so that by default
      the last item is removed and returned.

   remove(x)                                  *array.remove()..array.pyx*

      Remove the first occurrence of _x_ from the array.

   reverse()                                 *array.reverse()..array.pyx*

      Reverse the order of the items in the array.

   tobytes()                                 *array.tobytes()..array.pyx*

      Convert the array to an array of machine values and return the
      bytes representation (the same sequence of bytes that would be
      written to a file by the "tofile()" method.)

      New in version 3.2: "tostring()" is renamed to "tobytes()" for
      clarity.

   tofile(f)                                  *array.tofile()..array.pyx*

      Write all items (as machine values) to the _file object_ _f_.

   tolist()                                   *array.tolist()..array.pyx*

      Convert the array to an ordinary list with the same items.

   tounicode()                             *array.tounicode()..array.pyx*

      Convert the array to a unicode string.  The array must have a
      type "'u'" or "'w'"; otherwise a "ValueError" is raised. Use
      "array.tobytes().decode(enc)" to obtain a unicode string from an
      array of some other type.

When an array object is printed or converted to a string, it is
represented as "array(typecode, initializer)".  The _initializer_ is
omitted if the array is empty, otherwise it is a string if the
_typecode_ is "'u'" or "'w'", otherwise it is a list of numbers. The
string is guaranteed to be able to be converted back to an array with
the same type and value using "eval()", so long as the "array" class
has been imported using "from array import array". Examples:
>
   array('l')
   array('w', 'hello \u2641')
   array('l', [1, 2, 3, 4, 5])
   array('d', [1.0, 2.0, 3.14])
<
See also:

  Module "struct"
     Packing and unpacking of heterogeneous binary data.

  NumPy
     The NumPy package defines another array type.

vim:tw=78:ts=8:ft=help:norl: