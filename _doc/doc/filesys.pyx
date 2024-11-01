*filesys.pyx*                                 Last change: 2023 Sep 15

File and Directory Access
*************************

The modules described in this chapter deal with disk files and
directories.  For example, there are modules for reading the
properties of files, manipulating paths in a portable way, and
creating temporary files.  The full list of modules in this chapter
is:

* "pathlib" — Object-oriented filesystem paths

  * Basic use

  * Exceptions

    * "UnsupportedOperation"

  * Pure paths

    * "PurePath"

    * "PurePosixPath"

    * "PureWindowsPath"

    * General properties

    * Operators

    * Accessing individual parts

      * "PurePath.parts"

    * Methods and properties

      * "PurePath.pathmod"

      * "PurePath.drive"

      * "PurePath.root"

      * "PurePath.anchor"

      * "PurePath.parents"

      * "PurePath.parent"

      * "PurePath.name"

      * "PurePath.suffix"

      * "PurePath.suffixes"

      * "PurePath.stem"

      * "PurePath.as_posix()"

      * "PurePath.as_uri()"

      * "PurePath.is_absolute()"

      * "PurePath.is_relative_to()"

      * "PurePath.is_reserved()"

      * "PurePath.joinpath()"

      * "PurePath.match()"

      * "PurePath.relative_to()"

      * "PurePath.with_name()"

      * "PurePath.with_stem()"

      * "PurePath.with_suffix()"

      * "PurePath.with_segments()"

  * Concrete paths

    * "Path"

    * "PosixPath"

    * "WindowsPath"

    * Methods

      * "Path.cwd()"

      * "Path.home()"

      * "Path.stat()"

      * "Path.chmod()"

      * "Path.exists()"

      * "Path.expanduser()"

      * "Path.glob()"

      * "Path.group()"

      * "Path.is_dir()"

      * "Path.is_file()"

      * "Path.is_junction()"

      * "Path.is_mount()"

      * "Path.is_symlink()"

      * "Path.is_socket()"

      * "Path.is_fifo()"

      * "Path.is_block_device()"

      * "Path.is_char_device()"

      * "Path.iterdir()"

      * "Path.walk()"

      * "Path.lchmod()"

      * "Path.lstat()"

      * "Path.mkdir()"

      * "Path.open()"

      * "Path.owner()"

      * "Path.read_bytes()"

      * "Path.read_text()"

      * "Path.readlink()"

      * "Path.rename()"

      * "Path.replace()"

      * "Path.absolute()"

      * "Path.resolve()"

      * "Path.rglob()"

      * "Path.rmdir()"

      * "Path.samefile()"

      * "Path.symlink_to()"

      * "Path.hardlink_to()"

      * "Path.touch()"

      * "Path.unlink()"

      * "Path.write_bytes()"

      * "Path.write_text()"

  * Correspondence to tools in the "os" module

* "os.path" — Common pathname manipulations

  * "abspath()"

  * "basename()"

  * "commonpath()"

  * "commonprefix()"

  * "dirname()"

  * "exists()"

  * "lexists()"

  * "expanduser()"

  * "expandvars()"

  * "getatime()"

  * "getmtime()"

  * "getctime()"

  * "getsize()"

  * "isabs()"

  * "isfile()"

  * "isdir()"

  * "isjunction()"

  * "islink()"

  * "ismount()"

  * "isdevdrive()"

  * "join()"

  * "normcase()"

  * "normpath()"

  * "realpath()"

  * "relpath()"

  * "samefile()"

  * "sameopenfile()"

  * "samestat()"

  * "split()"

  * "splitdrive()"

  * "splitroot()"

  * "splitext()"

  * "supports_unicode_filenames"

* "fileinput" — Iterate over lines from multiple input streams

  * "input()"

  * "filename()"

  * "fileno()"

  * "lineno()"

  * "filelineno()"

  * "isfirstline()"

  * "isstdin()"

  * "nextfile()"

  * "close()"

  * "FileInput"

  * "hook_compressed()"

  * "hook_encoded()"

* "stat" — Interpreting "stat()" results

  * "S_ISDIR()"

  * "S_ISCHR()"

  * "S_ISBLK()"

  * "S_ISREG()"

  * "S_ISFIFO()"

  * "S_ISLNK()"

  * "S_ISSOCK()"

  * "S_ISDOOR()"

  * "S_ISPORT()"

  * "S_ISWHT()"

  * "S_IMODE()"

  * "S_IFMT()"

  * "filemode()"

  * "ST_MODE"

  * "ST_INO"

  * "ST_DEV"

  * "ST_NLINK"

  * "ST_UID"

  * "ST_GID"

  * "ST_SIZE"

  * "ST_ATIME"

  * "ST_MTIME"

  * "ST_CTIME"

  * "S_IFSOCK"

  * "S_IFLNK"

  * "S_IFREG"

  * "S_IFBLK"

  * "S_IFDIR"

  * "S_IFCHR"

  * "S_IFIFO"

  * "S_IFDOOR"

  * "S_IFPORT"

  * "S_IFWHT"

  * "S_ISUID"

  * "S_ISGID"

  * "S_ISVTX"

  * "S_IRWXU"

  * "S_IRUSR"

  * "S_IWUSR"

  * "S_IXUSR"

  * "S_IRWXG"

  * "S_IRGRP"

  * "S_IWGRP"

  * "S_IXGRP"

  * "S_IRWXO"

  * "S_IROTH"

  * "S_IWOTH"

  * "S_IXOTH"

  * "S_ENFMT"

  * "S_IREAD"

  * "S_IWRITE"

  * "S_IEXEC"

  * "UF_NODUMP"

  * "UF_IMMUTABLE"

  * "UF_APPEND"

  * "UF_OPAQUE"

  * "UF_NOUNLINK"

  * "UF_COMPRESSED"

  * "UF_HIDDEN"

  * "SF_ARCHIVED"

  * "SF_IMMUTABLE"

  * "SF_APPEND"

  * "SF_NOUNLINK"

  * "SF_SNAPSHOT"

  * "FILE_ATTRIBUTE_ARCHIVE"

  * "FILE_ATTRIBUTE_COMPRESSED"

  * "FILE_ATTRIBUTE_DEVICE"

  * "FILE_ATTRIBUTE_DIRECTORY"

  * "FILE_ATTRIBUTE_ENCRYPTED"

  * "FILE_ATTRIBUTE_HIDDEN"

  * "FILE_ATTRIBUTE_INTEGRITY_STREAM"

  * "FILE_ATTRIBUTE_NORMAL"

  * "FILE_ATTRIBUTE_NOT_CONTENT_INDEXED"

  * "FILE_ATTRIBUTE_NO_SCRUB_DATA"

  * "FILE_ATTRIBUTE_OFFLINE"

  * "FILE_ATTRIBUTE_READONLY"

  * "FILE_ATTRIBUTE_REPARSE_POINT"

  * "FILE_ATTRIBUTE_SPARSE_FILE"

  * "FILE_ATTRIBUTE_SYSTEM"

  * "FILE_ATTRIBUTE_TEMPORARY"

  * "FILE_ATTRIBUTE_VIRTUAL"

  * "IO_REPARSE_TAG_SYMLINK"

  * "IO_REPARSE_TAG_MOUNT_POINT"

  * "IO_REPARSE_TAG_APPEXECLINK"

* "filecmp" — File and Directory Comparisons

  * "cmp()"

  * "cmpfiles()"

  * "clear_cache()"

  * The "dircmp" class

    * "dircmp"

      * "dircmp.report()"

      * "dircmp.report_partial_closure()"

      * "dircmp.report_full_closure()"

      * "dircmp.left"

      * "dircmp.right"

      * "dircmp.left_list"

      * "dircmp.right_list"

      * "dircmp.common"

      * "dircmp.left_only"

      * "dircmp.right_only"

      * "dircmp.common_dirs"

      * "dircmp.common_files"

      * "dircmp.common_funny"

      * "dircmp.same_files"

      * "dircmp.diff_files"

      * "dircmp.funny_files"

      * "dircmp.subdirs"

    * "DEFAULT_IGNORES"

* "tempfile" — Generate temporary files and directories

  * "TemporaryFile()"

  * "NamedTemporaryFile()"

  * "SpooledTemporaryFile"

  * "TemporaryDirectory"

  * "mkstemp()"

  * "mkdtemp()"

  * "gettempdir()"

  * "gettempdirb()"

  * "gettempprefix()"

  * "gettempprefixb()"

  * "tempdir"

  * Examples

  * Deprecated functions and variables

    * "mktemp()"

* "glob" — Unix style pathname pattern expansion

  * "glob()"

  * "iglob()"

  * "escape()"

* "fnmatch" — Unix filename pattern matching

  * "fnmatch()"

  * "fnmatchcase()"

  * "filter()"

  * "translate()"

* "linecache" — Random access to text lines

  * "getline()"

  * "clearcache()"

  * "checkcache()"

  * "lazycache()"

* "shutil" — High-level file operations

  * Directory and files operations

    * "copyfileobj()"

    * "copyfile()"

    * "SameFileError"

    * "copymode()"

    * "copystat()"

    * "copy()"

    * "copy2()"

    * "ignore_patterns()"

    * "copytree()"

    * "rmtree()"

      * "rmtree.avoids_symlink_attacks"

    * "move()"

    * "disk_usage()"

    * "chown()"

    * "which()"

    * "Error"

    * Platform-dependent efficient copy operations

    * copytree example

    * rmtree example

  * Archiving operations

    * "make_archive()"

    * "get_archive_formats()"

    * "register_archive_format()"

    * "unregister_archive_format()"

    * "unpack_archive()"

    * "register_unpack_format()"

    * "unregister_unpack_format()"

    * "get_unpack_formats()"

    * Archiving example

    * Archiving example with _base_dir_

  * Querying the size of the output terminal

    * "get_terminal_size()"

See also:

  Module "os"
     Operating system interfaces, including functions to work with
     files at a lower level than Python _file objects_.

  Module "io"
     Python’s built-in I/O library, including both abstract classes
     and some concrete classes such as file I/O.

  Built-in function "open()"
     The standard way to open files for reading and writing with
     Python.

vim:tw=78:ts=8:ft=help:norl: