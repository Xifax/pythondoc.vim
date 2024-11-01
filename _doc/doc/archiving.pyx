*archiving.pyx*                               Last change: 2023 Sep 15

Data Compression and Archiving
******************************

The modules described in this chapter support data compression with
the zlib, gzip, bzip2 and lzma algorithms, and the creation of ZIP-
and tar-format archives.  See also Archiving operations provided by
the "shutil" module.

* "zlib" — Compression compatible with **gzip**

  * "error"

  * "adler32()"

  * "compress()"

  * "compressobj()"

  * "crc32()"

  * "decompress()"

  * "decompressobj()"

  * "Compress.compress()"

  * "Compress.flush()"

  * "Compress.copy()"

  * "Decompress.unused_data"

  * "Decompress.unconsumed_tail"

  * "Decompress.eof"

  * "Decompress.decompress()"

  * "Decompress.flush()"

  * "Decompress.copy()"

  * "ZLIB_VERSION"

  * "ZLIB_RUNTIME_VERSION"

* "gzip" — Support for **gzip** files

  * "open()"

  * "BadGzipFile"

  * "GzipFile"

    * "GzipFile.peek()"

    * "GzipFile.mtime"

    * "GzipFile.name"

  * "compress()"

  * "decompress()"

  * Examples of usage

  * Command Line Interface

    * Command line options

* "bz2" — Support for **bzip2** compression

  * (De)compression of files

    * "open()"

    * "BZ2File"

      * "BZ2File.peek()"

  * Incremental (de)compression

    * "BZ2Compressor"

      * "BZ2Compressor.compress()"

      * "BZ2Compressor.flush()"

    * "BZ2Decompressor"

      * "BZ2Decompressor.decompress()"

      * "BZ2Decompressor.eof"

      * "BZ2Decompressor.unused_data"

      * "BZ2Decompressor.needs_input"

  * One-shot (de)compression

    * "compress()"

    * "decompress()"

  * Examples of usage

* "lzma" — Compression using the LZMA algorithm

  * "LZMAError"

  * Reading and writing compressed files

    * "open()"

    * "LZMAFile"

      * "LZMAFile.peek()"

  * Compressing and decompressing data in memory

    * "LZMACompressor"

      * "LZMACompressor.compress()"

      * "LZMACompressor.flush()"

    * "LZMADecompressor"

      * "LZMADecompressor.decompress()"

      * "LZMADecompressor.check"

      * "LZMADecompressor.eof"

      * "LZMADecompressor.unused_data"

      * "LZMADecompressor.needs_input"

    * "compress()"

    * "decompress()"

  * Miscellaneous

    * "is_check_supported()"

  * Specifying custom filter chains

  * Examples

* "zipfile" — Work with ZIP archives

  * "BadZipFile"

  * "BadZipfile"

  * "LargeZipFile"

  * "ZipInfo"

  * "is_zipfile()"

  * "ZIP_STORED"

  * "ZIP_DEFLATED"

  * "ZIP_BZIP2"

  * "ZIP_LZMA"

  * ZipFile Objects

    * "ZipFile"

      * "ZipFile.close()"

      * "ZipFile.getinfo()"

      * "ZipFile.infolist()"

      * "ZipFile.namelist()"

      * "ZipFile.open()"

      * "ZipFile.extract()"

      * "ZipFile.extractall()"

      * "ZipFile.printdir()"

      * "ZipFile.setpassword()"

      * "ZipFile.read()"

      * "ZipFile.testzip()"

      * "ZipFile.write()"

      * "ZipFile.writestr()"

      * "ZipFile.mkdir()"

      * "ZipFile.filename"

      * "ZipFile.debug"

      * "ZipFile.comment"

  * Path Objects

    * "Path"

      * "Path.name"

      * "Path.open()"

      * "Path.iterdir()"

      * "Path.is_dir()"

      * "Path.is_file()"

      * "Path.exists()"

      * "Path.suffix"

      * "Path.stem"

      * "Path.suffixes"

      * "Path.read_text()"

      * "Path.read_bytes()"

      * "Path.joinpath()"

  * PyZipFile Objects

    * "PyZipFile"

      * "PyZipFile.writepy()"

  * ZipInfo Objects

    * "ZipInfo.from_file()"

    * "ZipInfo.is_dir()"

    * "ZipInfo.filename"

    * "ZipInfo.date_time"

    * "ZipInfo.compress_type"

    * "ZipInfo.comment"

    * "ZipInfo.extra"

    * "ZipInfo.create_system"

    * "ZipInfo.create_version"

    * "ZipInfo.extract_version"

    * "ZipInfo.reserved"

    * "ZipInfo.flag_bits"

    * "ZipInfo.volume"

    * "ZipInfo.internal_attr"

    * "ZipInfo.external_attr"

    * "ZipInfo.header_offset"

    * "ZipInfo.CRC"

    * "ZipInfo.compress_size"

    * "ZipInfo.file_size"

  * Command-Line Interface

    * Command-line options

  * Decompression pitfalls

    * From file itself

    * File System limitations

    * Resources limitations

    * Interruption

    * Default behaviors of extraction

* "tarfile" — Read and write tar archive files

  * "open()"

  * "is_tarfile()"

  * "TarError"

  * "ReadError"

  * "CompressionError"

  * "StreamError"

  * "ExtractError"

  * "HeaderError"

  * "FilterError"

    * "FilterError.tarinfo"

  * "AbsolutePathError"

  * "OutsideDestinationError"

  * "SpecialFileError"

  * "AbsoluteLinkError"

  * "LinkOutsideDestinationError"

  * "ENCODING"

  * "USTAR_FORMAT"

  * "GNU_FORMAT"

  * "PAX_FORMAT"

  * "DEFAULT_FORMAT"

  * TarFile Objects

    * "TarFile"

      * "TarFile.open()"

      * "TarFile.getmember()"

      * "TarFile.getmembers()"

      * "TarFile.getnames()"

      * "TarFile.list()"

      * "TarFile.next()"

      * "TarFile.extractall()"

      * "TarFile.extract()"

      * "TarFile.extractfile()"

      * "TarFile.errorlevel"

      * "TarFile.extraction_filter"

      * "TarFile.add()"

      * "TarFile.addfile()"

      * "TarFile.gettarinfo()"

      * "TarFile.close()"

      * "TarFile.pax_headers"

  * TarInfo Objects

    * "TarInfo"

      * "TarInfo.frombuf()"

      * "TarInfo.fromtarfile()"

      * "TarInfo.tobuf()"

      * "TarInfo.name"

      * "TarInfo.size"

      * "TarInfo.mtime"

      * "TarInfo.mode"

      * "TarInfo.type"

      * "TarInfo.linkname"

      * "TarInfo.uid"

      * "TarInfo.gid"

      * "TarInfo.uname"

      * "TarInfo.gname"

      * "TarInfo.pax_headers"

      * "TarInfo.isfile()"

      * "TarInfo.isreg()"

      * "TarInfo.isdir()"

      * "TarInfo.issym()"

      * "TarInfo.islnk()"

      * "TarInfo.ischr()"

      * "TarInfo.isblk()"

      * "TarInfo.isfifo()"

      * "TarInfo.isdev()"

  * Extraction filters

    * Default named filters

      * "fully_trusted_filter()"

      * "tar_filter()"

      * "data_filter()"

    * Filter errors

    * Hints for further verification

    * Supporting older Python versions

    * Stateful extraction filter example

  * Command-Line Interface

    * Command-line options

  * Examples

  * Supported tar formats

  * Unicode issues

vim:tw=78:ts=8:ft=help:norl: