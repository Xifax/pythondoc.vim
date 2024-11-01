*persistence.pyx*                             Last change: 2023 Sep 15

Data Persistence
****************

The modules described in this chapter support storing Python data in a
persistent form on disk.  The "pickle" and "marshal" modules can turn
many Python data types into a stream of bytes and then recreate the
objects from the bytes.  The various DBM-related modules support a
family of hash-based file formats that store a mapping of strings to
other strings.

The list of modules described in this chapter is:

* "pickle" — Python object serialization

  * Relationship to other Python modules

    * Comparison with "marshal"

    * Comparison with "json"

  * Data stream format

  * Module Interface

    * "HIGHEST_PROTOCOL"

    * "DEFAULT_PROTOCOL"

    * "dump()"

    * "dumps()"

    * "load()"

    * "loads()"

    * "PickleError"

    * "PicklingError"

    * "UnpicklingError"

    * "Pickler"

      * "Pickler.dump()"

      * "Pickler.persistent_id()"

      * "Pickler.dispatch_table"

      * "Pickler.reducer_override()"

      * "Pickler.fast"

    * "Unpickler"

      * "Unpickler.load()"

      * "Unpickler.persistent_load()"

      * "Unpickler.find_class()"

    * "PickleBuffer"

      * "PickleBuffer.raw()"

      * "PickleBuffer.release()"

  * What can be pickled and unpickled?

  * Pickling Class Instances

    * "object.__getnewargs_ex__()"

    * "object.__getnewargs__()"

    * "object.__getstate__()"

    * "object.__setstate__()"

    * "object.__reduce__()"

    * "object.__reduce_ex__()"

    * Persistence of External Objects

    * Dispatch Tables

    * Handling Stateful Objects

  * Custom Reduction for Types, Functions, and Other Objects

  * Out-of-band Buffers

    * Provider API

    * Consumer API

    * Example

  * Restricting Globals

  * Performance

  * Examples

* "copyreg" — Register "pickle" support functions

  * "constructor()"

  * "pickle()"

  * Example

* "shelve" — Python object persistence

  * "open()"

  * "Shelf.sync()"

  * "Shelf.close()"

  * Restrictions

    * "Shelf"

    * "BsdDbShelf"

    * "DbfilenameShelf"

  * Example

* "marshal" — Internal Python object serialization

  * "dump()"

  * "load()"

  * "dumps()"

  * "loads()"

  * "version"

* "dbm" — Interfaces to Unix “databases”

  * "error"

  * "whichdb()"

  * "open()"

  * "dbm.gnu" — GNU’s reinterpretation of dbm

    * "error"

    * "open()"

    * "gdbm.firstkey()"

    * "gdbm.nextkey()"

    * "gdbm.reorganize()"

    * "gdbm.sync()"

    * "gdbm.close()"

    * "gdbm.clear()"

  * "dbm.ndbm" — Interface based on ndbm

    * "error"

    * "library"

    * "open()"

    * "ndbm.close()"

    * "ndbm.clear()"

  * "dbm.dumb" — Portable DBM implementation

    * "error"

    * "open()"

    * "dumbdbm.sync()"

    * "dumbdbm.close()"

* "sqlite3" — DB-API 2.0 interface for SQLite databases

  * Tutorial

  * Reference

    * Module functions

      * "connect()"

      * "complete_statement()"

      * "enable_callback_tracebacks()"

      * "register_adapter()"

      * "register_converter()"

    * Module constants

      * "LEGACY_TRANSACTION_CONTROL"

      * "PARSE_COLNAMES"

      * "PARSE_DECLTYPES"

      * "SQLITE_OK"

      * "SQLITE_DENY"

      * "SQLITE_IGNORE"

      * "apilevel"

      * "paramstyle"

      * "sqlite_version"

      * "sqlite_version_info"

      * "threadsafety"

      * "version"

      * "version_info"

      * "SQLITE_DBCONFIG_DEFENSIVE"

      * "SQLITE_DBCONFIG_DQS_DDL"

      * "SQLITE_DBCONFIG_DQS_DML"

      * "SQLITE_DBCONFIG_ENABLE_FKEY"

      * "SQLITE_DBCONFIG_ENABLE_FTS3_TOKENIZER"

      * "SQLITE_DBCONFIG_ENABLE_LOAD_EXTENSION"

      * "SQLITE_DBCONFIG_ENABLE_QPSG"

      * "SQLITE_DBCONFIG_ENABLE_TRIGGER"

      * "SQLITE_DBCONFIG_ENABLE_VIEW"

      * "SQLITE_DBCONFIG_LEGACY_ALTER_TABLE"

      * "SQLITE_DBCONFIG_LEGACY_FILE_FORMAT"

      * "SQLITE_DBCONFIG_NO_CKPT_ON_CLOSE"

      * "SQLITE_DBCONFIG_RESET_DATABASE"

      * "SQLITE_DBCONFIG_TRIGGER_EQP"

      * "SQLITE_DBCONFIG_TRUSTED_SCHEMA"

      * "SQLITE_DBCONFIG_WRITABLE_SCHEMA"

    * Connection objects

      * "Connection"

        * "Connection.cursor()"

        * "Connection.blobopen()"

        * "Connection.commit()"

        * "Connection.rollback()"

        * "Connection.close()"

        * "Connection.execute()"

        * "Connection.executemany()"

        * "Connection.executescript()"

        * "Connection.create_function()"

        * "Connection.create_aggregate()"

        * "Connection.create_window_function()"

        * "Connection.create_collation()"

        * "Connection.interrupt()"

        * "Connection.set_authorizer()"

        * "Connection.set_progress_handler()"

        * "Connection.set_trace_callback()"

        * "Connection.enable_load_extension()"

        * "Connection.load_extension()"

        * "Connection.iterdump()"

        * "Connection.backup()"

        * "Connection.getlimit()"

        * "Connection.setlimit()"

        * "Connection.getconfig()"

        * "Connection.setconfig()"

        * "Connection.serialize()"

        * "Connection.deserialize()"

        * "Connection.autocommit"

        * "Connection.in_transaction"

        * "Connection.isolation_level"

        * "Connection.row_factory"

        * "Connection.text_factory"

        * "Connection.total_changes"

    * Cursor objects

      * "Cursor"

        * "Cursor.execute()"

        * "Cursor.executemany()"

        * "Cursor.executescript()"

        * "Cursor.fetchone()"

        * "Cursor.fetchmany()"

        * "Cursor.fetchall()"

        * "Cursor.close()"

        * "Cursor.setinputsizes()"

        * "Cursor.setoutputsize()"

        * "Cursor.arraysize"

        * "Cursor.connection"

        * "Cursor.description"

        * "Cursor.lastrowid"

        * "Cursor.rowcount"

        * "Cursor.row_factory"

    * Row objects

      * "Row"

        * "Row.keys()"

    * Blob objects

      * "Blob"

        * "Blob.close()"

        * "Blob.read()"

        * "Blob.write()"

        * "Blob.tell()"

        * "Blob.seek()"

    * PrepareProtocol objects

      * "PrepareProtocol"

    * Exceptions

      * "Warning"

      * "Error"

        * "Error.sqlite_errorcode"

        * "Error.sqlite_errorname"

      * "InterfaceError"

      * "DatabaseError"

      * "DataError"

      * "OperationalError"

      * "IntegrityError"

      * "InternalError"

      * "ProgrammingError"

      * "NotSupportedError"

    * SQLite and Python types

    * Default adapters and converters (deprecated)

    * Command-line interface

  * How-to guides

    * How to use placeholders to bind values in SQL queries

    * How to adapt custom Python types to SQLite values

      * How to write adaptable objects

      * How to register adapter callables

    * How to convert SQLite values to custom Python types

    * Adapter and converter recipes

    * How to use connection shortcut methods

    * How to use the connection context manager

    * How to work with SQLite URIs

    * How to create and use row factories

  * Explanation

    * Transaction control

      * Transaction control via the "autocommit" attribute

      * Transaction control via the "isolation_level" attribute

vim:tw=78:ts=8:ft=help:norl: