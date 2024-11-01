*binary.pyx*                                  Last change: 2023 Sep 15

Binary Data Services
********************

The modules described in this chapter provide some basic services
operations for manipulation of binary data. Other operations on binary
data, specifically in relation to file formats and network protocols,
are described in the relevant sections.

Some libraries described under Text Processing Services also work with
either ASCII-compatible binary formats (for example, "re") or all
binary data (for example, "difflib").

In addition, see the documentation for Python’s built-in binary data
types in Binary Sequence Types — bytes, bytearray, memoryview.

* "struct" — Interpret bytes as packed binary data

  * Functions and Exceptions

    * "error"

    * "pack()"

    * "pack_into()"

    * "unpack()"

    * "unpack_from()"

    * "iter_unpack()"

    * "calcsize()"

  * Format Strings

    * Byte Order, Size, and Alignment

    * Format Characters

    * Examples

  * Applications

    * Native Formats

    * Standard Formats

  * Classes

    * "Struct"

      * "Struct.pack()"

      * "Struct.pack_into()"

      * "Struct.unpack()"

      * "Struct.unpack_from()"

      * "Struct.iter_unpack()"

      * "Struct.format"

      * "Struct.size"

* "codecs" — Codec registry and base classes

  * "encode()"

  * "decode()"

  * "lookup()"

  * "CodecInfo"

    * "CodecInfo.name"

    * "CodecInfo.encode"

    * "CodecInfo.decode"

    * "CodecInfo.incrementalencoder"

    * "CodecInfo.incrementaldecoder"

    * "CodecInfo.streamwriter"

    * "CodecInfo.streamreader"

  * "getencoder()"

  * "getdecoder()"

  * "getincrementalencoder()"

  * "getincrementaldecoder()"

  * "getreader()"

  * "getwriter()"

  * "register()"

  * "unregister()"

  * "open()"

  * "EncodedFile()"

  * "iterencode()"

  * "iterdecode()"

  * "BOM"

  * "BOM_BE"

  * "BOM_LE"

  * "BOM_UTF8"

  * "BOM_UTF16"

  * "BOM_UTF16_BE"

  * "BOM_UTF16_LE"

  * "BOM_UTF32"

  * "BOM_UTF32_BE"

  * "BOM_UTF32_LE"

  * Codec Base Classes

    * Error Handlers

      * "register_error()"

      * "lookup_error()"

      * "strict_errors()"

      * "ignore_errors()"

      * "replace_errors()"

      * "backslashreplace_errors()"

      * "xmlcharrefreplace_errors()"

      * "namereplace_errors()"

    * Stateless Encoding and Decoding

      * "Codec.encode()"

      * "Codec.decode()"

    * Incremental Encoding and Decoding

      * IncrementalEncoder Objects

        * "IncrementalEncoder"

          * "IncrementalEncoder.encode()"

          * "IncrementalEncoder.reset()"

          * "IncrementalEncoder.getstate()"

          * "IncrementalEncoder.setstate()"

      * IncrementalDecoder Objects

        * "IncrementalDecoder"

          * "IncrementalDecoder.decode()"

          * "IncrementalDecoder.reset()"

          * "IncrementalDecoder.getstate()"

          * "IncrementalDecoder.setstate()"

    * Stream Encoding and Decoding

      * StreamWriter Objects

        * "StreamWriter"

          * "StreamWriter.write()"

          * "StreamWriter.writelines()"

          * "StreamWriter.reset()"

      * StreamReader Objects

        * "StreamReader"

          * "StreamReader.read()"

          * "StreamReader.readline()"

          * "StreamReader.readlines()"

          * "StreamReader.reset()"

      * StreamReaderWriter Objects

        * "StreamReaderWriter"

      * StreamRecoder Objects

        * "StreamRecoder"

  * Encodings and Unicode

  * Standard Encodings

  * Python Specific Encodings

    * Text Encodings

    * Binary Transforms

    * Text Transforms

  * "encodings.idna" — Internationalized Domain Names in Applications

    * "nameprep()"

    * "ToASCII()"

    * "ToUnicode()"

  * "encodings.mbcs" — Windows ANSI codepage

  * "encodings.utf_8_sig" — UTF-8 codec with BOM signature

vim:tw=78:ts=8:ft=help:norl: