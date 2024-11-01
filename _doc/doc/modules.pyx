*modules.pyx*                                 Last change: 2023 Sep 15

Importing Modules
*****************

The modules described in this chapter provide new ways to import other
Python modules and hooks for customizing the import process.

The full list of modules described in this chapter is:

* "zipimport" — Import modules from Zip archives

  * "ZipImportError"

  * zipimporter Objects

    * "zipimporter"

      * "zipimporter.create_module()"

      * "zipimporter.exec_module()"

      * "zipimporter.find_spec()"

      * "zipimporter.get_code()"

      * "zipimporter.get_data()"

      * "zipimporter.get_filename()"

      * "zipimporter.get_source()"

      * "zipimporter.is_package()"

      * "zipimporter.load_module()"

      * "zipimporter.invalidate_caches()"

      * "zipimporter.archive"

      * "zipimporter.prefix"

  * Examples

* "pkgutil" — Package extension utility

  * "ModuleInfo"

  * "extend_path()"

  * "find_loader()"

  * "get_importer()"

  * "get_loader()"

  * "iter_importers()"

  * "iter_modules()"

  * "walk_packages()"

  * "get_data()"

  * "resolve_name()"

* "modulefinder" — Find modules used by a script

  * "AddPackagePath()"

  * "ReplacePackage()"

  * "ModuleFinder"

    * "ModuleFinder.report()"

    * "ModuleFinder.run_script()"

    * "ModuleFinder.modules"

  * Example usage of "ModuleFinder"

* "runpy" — Locating and executing Python modules

  * "run_module()"

  * "run_path()"

* "importlib" — The implementation of "import"

  * Introduction

  * Functions

    * "__import__()"

    * "import_module()"

    * "invalidate_caches()"

    * "reload()"

  * "importlib.abc" – Abstract base classes related to import

    * "MetaPathFinder"

      * "MetaPathFinder.find_spec()"

      * "MetaPathFinder.invalidate_caches()"

    * "PathEntryFinder"

      * "PathEntryFinder.find_spec()"

      * "PathEntryFinder.invalidate_caches()"

    * "Loader"

      * "Loader.create_module()"

      * "Loader.exec_module()"

      * "Loader.load_module()"

    * "ResourceLoader"

      * "ResourceLoader.get_data()"

    * "InspectLoader"

      * "InspectLoader.get_code()"

      * "InspectLoader.get_source()"

      * "InspectLoader.is_package()"

      * "InspectLoader.source_to_code()"

      * "InspectLoader.exec_module()"

      * "InspectLoader.load_module()"

    * "ExecutionLoader"

      * "ExecutionLoader.get_filename()"

    * "FileLoader"

      * "FileLoader.name"

      * "FileLoader.path"

      * "FileLoader.load_module()"

      * "FileLoader.get_filename()"

      * "FileLoader.get_data()"

    * "SourceLoader"

      * "SourceLoader.path_stats()"

      * "SourceLoader.path_mtime()"

      * "SourceLoader.set_data()"

      * "SourceLoader.get_code()"

      * "SourceLoader.exec_module()"

      * "SourceLoader.load_module()"

      * "SourceLoader.get_source()"

      * "SourceLoader.is_package()"

  * "importlib.machinery" – Importers and path hooks

    * "SOURCE_SUFFIXES"

    * "DEBUG_BYTECODE_SUFFIXES"

    * "OPTIMIZED_BYTECODE_SUFFIXES"

    * "BYTECODE_SUFFIXES"

    * "EXTENSION_SUFFIXES"

    * "all_suffixes()"

    * "BuiltinImporter"

    * "FrozenImporter"

    * "WindowsRegistryFinder"

    * "PathFinder"

      * "PathFinder.find_spec()"

      * "PathFinder.invalidate_caches()"

    * "FileFinder"

      * "FileFinder.path"

      * "FileFinder.find_spec()"

      * "FileFinder.invalidate_caches()"

      * "FileFinder.path_hook()"

    * "SourceFileLoader"

      * "SourceFileLoader.name"

      * "SourceFileLoader.path"

      * "SourceFileLoader.is_package()"

      * "SourceFileLoader.path_stats()"

      * "SourceFileLoader.set_data()"

      * "SourceFileLoader.load_module()"

    * "SourcelessFileLoader"

      * "SourcelessFileLoader.name"

      * "SourcelessFileLoader.path"

      * "SourcelessFileLoader.is_package()"

      * "SourcelessFileLoader.get_code()"

      * "SourcelessFileLoader.get_source()"

      * "SourcelessFileLoader.load_module()"

    * "ExtensionFileLoader"

      * "ExtensionFileLoader.name"

      * "ExtensionFileLoader.path"

      * "ExtensionFileLoader.create_module()"

      * "ExtensionFileLoader.exec_module()"

      * "ExtensionFileLoader.is_package()"

      * "ExtensionFileLoader.get_code()"

      * "ExtensionFileLoader.get_source()"

      * "ExtensionFileLoader.get_filename()"

    * "ModuleSpec"

      * "ModuleSpec.name"

      * "ModuleSpec.loader"

      * "ModuleSpec.origin"

      * "ModuleSpec.submodule_search_locations"

      * "ModuleSpec.loader_state"

      * "ModuleSpec.cached"

      * "ModuleSpec.parent"

      * "ModuleSpec.has_location"

  * "importlib.util" – Utility code for importers

    * "MAGIC_NUMBER"

    * "cache_from_source()"

    * "source_from_cache()"

    * "decode_source()"

    * "resolve_name()"

    * "find_spec()"

    * "module_from_spec()"

    * "spec_from_loader()"

    * "spec_from_file_location()"

    * "source_hash()"

    * "_incompatible_extension_module_restrictions()"

    * "LazyLoader"

      * "LazyLoader.factory()"

  * Examples

    * Importing programmatically

    * Checking if a module can be imported

    * Importing a source file directly

    * Implementing lazy imports

    * Setting up an importer

    * Approximating "importlib.import_module()"

* "importlib.resources" – Package resource reading, opening and access

  * "Anchor"

  * "files()"

  * "as_file()"

* "importlib.resources.abc" – Abstract base classes for resources

  * "ResourceReader"

    * "ResourceReader.open_resource()"

    * "ResourceReader.resource_path()"

    * "ResourceReader.is_resource()"

    * "ResourceReader.contents()"

  * "Traversable"

    * "Traversable.name"

    * "Traversable.iterdir()"

    * "Traversable.is_dir()"

    * "Traversable.is_file()"

    * "Traversable.joinpath()"

    * "Traversable.__truediv__()"

    * "Traversable.open()"

    * "Traversable.read_bytes()"

    * "Traversable.read_text()"

  * "TraversableResources"

    * "TraversableResources.files()"

* "importlib.metadata" – Accessing package metadata

  * Overview

  * Functional API

    * Entry points

    * Distribution metadata

    * Distribution versions

    * Distribution files

    * Distribution requirements

    * Mapping import to distribution packages

  * Distributions

  * Distribution Discovery

  * Extending the search algorithm

* The initialization of the "sys.path" module search path

  * Virtual environments

  * _pth files

  * Embedded Python

vim:tw=78:ts=8:ft=help:norl: