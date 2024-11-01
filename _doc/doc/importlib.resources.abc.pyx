*importlib.resources.abc.pyx*                 Last change: 2023 Sep 15

"importlib.resources.abc" – Abstract base classes for resources
***************************************************************

**Source code:** Lib/importlib/resources/abc.py

======================================================================

New in version 3.11.

                         *ResourceReader..importlib.resources.abc.pyx*
class importlib.resources.abc.ResourceReader

   _Superseded by TraversableResources_

   An _abstract base class_ to provide the ability to read
   _resources_.

   From the perspective of this ABC, a _resource_ is a binary artifact
   that is shipped within a package. Typically this is something like
   a data file that lives next to the "__init__.py" file of the
   package. The purpose of this class is to help abstract out the
   accessing of such data files so that it does not matter if the
   package and its data file(s) are stored in a e.g. zip file versus
   on the file system.

   For any of methods of this class, a _resource_ argument is expected
   to be a _path-like object_ which represents conceptually just a
   file name. This means that no subdirectory paths should be included
   in the _resource_ argument. This is because the location of the
   package the reader is for, acts as the “directory”. Hence the
   metaphor for directories and file names is packages and resources,
   respectively. This is also why instances of this class are expected
   to directly correlate to a specific package (instead of potentially
   representing multiple packages or a module).

   Loaders that wish to support resource reading are expected to
   provide a method called "get_resource_reader(fullname)" which
   returns an object implementing this ABC’s interface. If the module
   specified by fullname is not a package, this method should return
   "None". An object compatible with this ABC should only be returned
   when the specified module is a package.

   New in version 3.7.

   Deprecated since version 3.12, will be removed in version 3.14: Use
   "importlib.resources.abc.TraversableResources" instead.

         *ResourceReader.open_resource()..importlib.resources.abc.pyx*
   abstractmethod open_resource(resource)

      Returns an opened, _file-like object_ for binary reading of the
      _resource_.

      If the resource cannot be found, "FileNotFoundError" is raised.

         *ResourceReader.resource_path()..importlib.resources.abc.pyx*
   abstractmethod resource_path(resource)

      Returns the file system path to the _resource_.

      If the resource does not concretely exist on the file system,
      raise "FileNotFoundError".

           *ResourceReader.is_resource()..importlib.resources.abc.pyx*
   abstractmethod is_resource(name)

      Returns "True" if the named _name_ is considered a resource.
      "FileNotFoundError" is raised if _name_ does not exist.

              *ResourceReader.contents()..importlib.resources.abc.pyx*
   abstractmethod contents()

      Returns an _iterable_ of strings over the contents of the
      package. Do note that it is not required that all names returned
      by the iterator be actual resources, e.g. it is acceptable to
      return names for which "is_resource()" would be false.

      Allowing non-resource names to be returned is to allow for
      situations where how a package and its resources are stored are
      known a priori and the non-resource names would be useful. For
      instance, returning subdirectory names is allowed so that when
      it is known that the package and resources are stored on the
      file system then those subdirectory names can be used directly.

      The abstract method returns an iterable of no items.

                            *Traversable..importlib.resources.abc.pyx*
class importlib.resources.abc.Traversable

   An object with a subset of "pathlib.Path" methods suitable for
   traversing directories and opening files.

   For a representation of the object on the file-system, use
   "importlib.resources.as_file()".

   New in version 3.9.

   Deprecated since version 3.12, will be removed in version 3.14: Use
   "importlib.resources.abc.Traversable" instead.

   name                   *Traversable.name..importlib.resources.abc.pyx*

      Abstract. The base name of this object without any parent
      references.

                  *Traversable.iterdir()..importlib.resources.abc.pyx*
   abstractmethod iterdir()

      Yield Traversable objects in self.

                   *Traversable.is_dir()..importlib.resources.abc.pyx*
   abstractmethod is_dir()

      Return True if self is a directory.

                  *Traversable.is_file()..importlib.resources.abc.pyx*
   abstractmethod is_file()

      Return True if self is a file.

                 *Traversable.joinpath()..importlib.resources.abc.pyx*
   abstractmethod joinpath(child)

      Return Traversable child in self.

              *Traversable.__truediv__()..importlib.resources.abc.pyx*
   abstractmethod __truediv__(child)

      Return Traversable child in self.

                     *Traversable.open()..importlib.resources.abc.pyx*
   abstractmethod open(mode='r', *args, **kwargs)

      _mode_ may be ‘r’ or ‘rb’ to open as text or binary. Return a
      handle suitable for reading (same as "pathlib.Path.open").

      When opening as text, accepts encoding parameters such as those
      accepted by "io.TextIOWrapper".

   read_bytes()   *Traversable.read_bytes()..importlib.resources.abc.pyx*

      Read contents of self as bytes.

                *Traversable.read_text()..importlib.resources.abc.pyx*
   read_text(encoding=None)

      Read contents of self as text.

                   *TraversableResources..importlib.resources.abc.pyx*
class importlib.resources.abc.TraversableResources

   An abstract base class for resource readers capable of serving the
   "importlib.resources.files()" interface. Subclasses
   "ResourceReader" and provides concrete implementations of the
   "ResourceReader"’s abstract methods. Therefore, any loader
   supplying "TraversableResources" also supplies "ResourceReader".

   Loaders that wish to support resource reading are expected to
   implement this interface.

   New in version 3.9.

   Deprecated since version 3.12, will be removed in version 3.14: Use
   "importlib.resources.abc.TraversableResources" instead.

           *TraversableResources.files()..importlib.resources.abc.pyx*
   abstractmethod files()

      Returns a "importlib.resources.abc.Traversable" object for the
      loaded package.

vim:tw=78:ts=8:ft=help:norl: