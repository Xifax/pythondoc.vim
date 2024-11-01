*datatypes.pyx*                               Last change: 2023 Sep 15

Data Types
**********

The modules described in this chapter provide a variety of specialized
data types such as dates and times, fixed-type arrays, heap queues,
double-ended queues, and enumerations.

Python also provides some built-in data types, in particular, "dict",
"list", "set" and "frozenset", and "tuple".  The "str" class is used
to hold Unicode strings, and the "bytes" and "bytearray" classes are
used to hold binary data.

The following modules are documented in this chapter:

* "datetime" — Basic date and time types

  * Aware and Naive Objects

  * Constants

    * "MINYEAR"

    * "MAXYEAR"

    * "UTC"

  * Available Types

    * Common Properties

    * Determining if an Object is Aware or Naive

  * "timedelta" Objects

    * "timedelta"

      * "timedelta.min"

      * "timedelta.max"

      * "timedelta.resolution"

      * "timedelta.total_seconds()"

    * Examples of usage: "timedelta"

  * "date" Objects

    * "date"

      * "date.today()"

      * "date.fromtimestamp()"

      * "date.fromordinal()"

      * "date.fromisoformat()"

      * "date.fromisocalendar()"

      * "date.min"

      * "date.max"

      * "date.resolution"

      * "date.year"

      * "date.month"

      * "date.day"

      * "date.replace()"

      * "date.timetuple()"

      * "date.toordinal()"

      * "date.weekday()"

      * "date.isoweekday()"

      * "date.isocalendar()"

      * "date.isoformat()"

      * "date.__str__()"

      * "date.ctime()"

      * "date.strftime()"

      * "date.__format__()"

    * Examples of Usage: "date"

  * "datetime" Objects

    * "datetime"

      * "datetime.today()"

      * "datetime.now()"

      * "datetime.utcnow()"

      * "datetime.fromtimestamp()"

      * "datetime.utcfromtimestamp()"

      * "datetime.fromordinal()"

      * "datetime.combine()"

      * "datetime.fromisoformat()"

      * "datetime.fromisocalendar()"

      * "datetime.strptime()"

      * "datetime.min"

      * "datetime.max"

      * "datetime.resolution"

      * "datetime.year"

      * "datetime.month"

      * "datetime.day"

      * "datetime.hour"

      * "datetime.minute"

      * "datetime.second"

      * "datetime.microsecond"

      * "datetime.tzinfo"

      * "datetime.fold"

      * "datetime.date()"

      * "datetime.time()"

      * "datetime.timetz()"

      * "datetime.replace()"

      * "datetime.astimezone()"

      * "datetime.utcoffset()"

      * "datetime.dst()"

      * "datetime.tzname()"

      * "datetime.timetuple()"

      * "datetime.utctimetuple()"

      * "datetime.toordinal()"

      * "datetime.timestamp()"

      * "datetime.weekday()"

      * "datetime.isoweekday()"

      * "datetime.isocalendar()"

      * "datetime.isoformat()"

      * "datetime.__str__()"

      * "datetime.ctime()"

      * "datetime.strftime()"

      * "datetime.__format__()"

    * Examples of Usage: "datetime"

  * "time" Objects

    * "time"

      * "time.min"

      * "time.max"

      * "time.resolution"

      * "time.hour"

      * "time.minute"

      * "time.second"

      * "time.microsecond"

      * "time.tzinfo"

      * "time.fold"

      * "time.fromisoformat()"

      * "time.replace()"

      * "time.isoformat()"

      * "time.__str__()"

      * "time.strftime()"

      * "time.__format__()"

      * "time.utcoffset()"

      * "time.dst()"

      * "time.tzname()"

    * Examples of Usage: "time"

  * "tzinfo" Objects

    * "tzinfo"

      * "tzinfo.utcoffset()"

      * "tzinfo.dst()"

      * "tzinfo.tzname()"

      * "tzinfo.fromutc()"

  * "timezone" Objects

    * "timezone"

      * "timezone.utcoffset()"

      * "timezone.tzname()"

      * "timezone.dst()"

      * "timezone.fromutc()"

      * "timezone.utc"

  * "strftime()" and "strptime()" Behavior

    * "strftime()" and "strptime()" Format Codes

    * Technical Detail

* "zoneinfo" — IANA time zone support

  * Using "ZoneInfo"

  * Data sources

    * Configuring the data sources

      * Compile-time configuration

      * Environment configuration

      * Runtime configuration

  * The "ZoneInfo" class

    * "ZoneInfo"

      * "ZoneInfo.from_file()"

      * "ZoneInfo.no_cache()"

      * "ZoneInfo.clear_cache()"

      * "ZoneInfo.key"

    * String representations

    * Pickle serialization

  * Functions

    * "available_timezones()"

    * "reset_tzpath()"

  * Globals

    * "TZPATH"

  * Exceptions and warnings

    * "ZoneInfoNotFoundError"

    * "InvalidTZPathWarning"

* "calendar" — General calendar-related functions

  * "Calendar"

    * "Calendar.iterweekdays()"

    * "Calendar.itermonthdates()"

    * "Calendar.itermonthdays()"

    * "Calendar.itermonthdays2()"

    * "Calendar.itermonthdays3()"

    * "Calendar.itermonthdays4()"

    * "Calendar.monthdatescalendar()"

    * "Calendar.monthdays2calendar()"

    * "Calendar.monthdayscalendar()"

    * "Calendar.yeardatescalendar()"

    * "Calendar.yeardays2calendar()"

    * "Calendar.yeardayscalendar()"

  * "TextCalendar"

    * "TextCalendar.formatmonth()"

    * "TextCalendar.prmonth()"

    * "TextCalendar.formatyear()"

    * "TextCalendar.pryear()"

  * "HTMLCalendar"

    * "HTMLCalendar.formatmonth()"

    * "HTMLCalendar.formatyear()"

    * "HTMLCalendar.formatyearpage()"

    * "HTMLCalendar.cssclasses"

    * "HTMLCalendar.cssclass_noday"

    * "HTMLCalendar.cssclasses_weekday_head"

    * "HTMLCalendar.cssclass_month_head"

    * "HTMLCalendar.cssclass_month"

    * "HTMLCalendar.cssclass_year"

    * "HTMLCalendar.cssclass_year_head"

  * "LocaleTextCalendar"

  * "LocaleHTMLCalendar"

  * "setfirstweekday()"

  * "firstweekday()"

  * "isleap()"

  * "leapdays()"

  * "weekday()"

  * "weekheader()"

  * "monthrange()"

  * "monthcalendar()"

  * "prmonth()"

  * "month()"

  * "prcal()"

  * "calendar()"

  * "timegm()"

  * "day_name"

  * "day_abbr"

  * "MONDAY"

  * "TUESDAY"

  * "WEDNESDAY"

  * "THURSDAY"

  * "FRIDAY"

  * "SATURDAY"

  * "SUNDAY"

  * "Day"

  * "month_name"

  * "month_abbr"

  * "JANUARY"

  * "FEBRUARY"

  * "MARCH"

  * "APRIL"

  * "MAY"

  * "JUNE"

  * "JULY"

  * "AUGUST"

  * "SEPTEMBER"

  * "OCTOBER"

  * "NOVEMBER"

  * "DECEMBER"

  * "Month"

  * "IllegalMonthError"

    * "IllegalMonthError.month"

  * "IllegalWeekdayError"

    * "IllegalWeekdayError.weekday"

  * Command-Line Usage

* "collections" — Container datatypes

  * "ChainMap" objects

    * "ChainMap"

      * "ChainMap.maps"

      * "ChainMap.new_child()"

      * "ChainMap.parents"

    * "ChainMap" Examples and Recipes

  * "Counter" objects

    * "Counter"

      * "Counter.elements()"

      * "Counter.most_common()"

      * "Counter.subtract()"

      * "Counter.total()"

      * "Counter.fromkeys()"

      * "Counter.update()"

  * "deque" objects

    * "deque"

      * "deque.append()"

      * "deque.appendleft()"

      * "deque.clear()"

      * "deque.copy()"

      * "deque.count()"

      * "deque.extend()"

      * "deque.extendleft()"

      * "deque.index()"

      * "deque.insert()"

      * "deque.pop()"

      * "deque.popleft()"

      * "deque.remove()"

      * "deque.reverse()"

      * "deque.rotate()"

      * "deque.maxlen"

    * "deque" Recipes

  * "defaultdict" objects

    * "defaultdict"

      * "defaultdict.__missing__()"

      * "defaultdict.default_factory"

    * "defaultdict" Examples

  * "namedtuple()" Factory Function for Tuples with Named Fields

    * "namedtuple()"

    * "somenamedtuple._make()"

    * "somenamedtuple._asdict()"

    * "somenamedtuple._replace()"

    * "somenamedtuple._fields"

    * "somenamedtuple._field_defaults"

  * "OrderedDict" objects

    * "OrderedDict"

      * "OrderedDict.popitem()"

      * "OrderedDict.move_to_end()"

    * "OrderedDict" Examples and Recipes

  * "UserDict" objects

    * "UserDict"

      * "UserDict.data"

  * "UserList" objects

    * "UserList"

      * "UserList.data"

  * "UserString" objects

    * "UserString"

      * "UserString.data"

* "collections.abc" — Abstract Base Classes for Containers

  * Collections Abstract Base Classes

  * Collections Abstract Base Classes – Detailed Descriptions

    * "Container"

    * "Hashable"

    * "Sized"

    * "Callable"

    * "Iterable"

    * "Collection"

    * "Iterator"

    * "Reversible"

    * "Generator"

    * "Sequence"

    * "MutableSequence"

    * "ByteString"

    * "Set"

    * "MutableSet"

    * "Mapping"

    * "MutableMapping"

    * "MappingView"

    * "ItemsView"

    * "KeysView"

    * "ValuesView"

    * "Awaitable"

    * "Coroutine"

    * "AsyncIterable"

    * "AsyncIterator"

    * "AsyncGenerator"

    * "Buffer"

  * Examples and Recipes

* "heapq" — Heap queue algorithm

  * "heappush()"

  * "heappop()"

  * "heappushpop()"

  * "heapify()"

  * "heapreplace()"

  * "merge()"

  * "nlargest()"

  * "nsmallest()"

  * Basic Examples

  * Priority Queue Implementation Notes

  * Theory

* "bisect" — Array bisection algorithm

  * "bisect_left()"

  * "bisect_right()"

  * "bisect()"

  * "insort_left()"

  * "insort_right()"

  * "insort()"

  * Performance Notes

  * Searching Sorted Lists

  * Examples

* "array" — Efficient arrays of numeric values

  * "typecodes"

  * "array"

    * "array.typecode"

    * "array.itemsize"

    * "array.append()"

    * "array.buffer_info()"

    * "array.byteswap()"

    * "array.count()"

    * "array.extend()"

    * "array.frombytes()"

    * "array.fromfile()"

    * "array.fromlist()"

    * "array.fromunicode()"

    * "array.index()"

    * "array.insert()"

    * "array.pop()"

    * "array.remove()"

    * "array.reverse()"

    * "array.tobytes()"

    * "array.tofile()"

    * "array.tolist()"

    * "array.tounicode()"

* "weakref" — Weak references

  * "ref"

    * "ref.__callback__"

  * "proxy()"

  * "getweakrefcount()"

  * "getweakrefs()"

  * "WeakKeyDictionary"

    * "WeakKeyDictionary.keyrefs()"

  * "WeakValueDictionary"

    * "WeakValueDictionary.valuerefs()"

  * "WeakSet"

  * "WeakMethod"

  * "finalize"

    * "finalize.__call__()"

    * "finalize.detach()"

    * "finalize.peek()"

    * "finalize.alive"

    * "finalize.atexit"

  * "ReferenceType"

  * "ProxyType"

  * "CallableProxyType"

  * "ProxyTypes"

  * Weak Reference Objects

  * Example

  * Finalizer Objects

  * Comparing finalizers with "__del__()" methods

* "types" — Dynamic type creation and names for built-in types

  * Dynamic Type Creation

    * "new_class()"

    * "prepare_class()"

    * "resolve_bases()"

    * "get_original_bases()"

  * Standard Interpreter Types

    * "NoneType"

    * "FunctionType"

    * "LambdaType"

    * "GeneratorType"

    * "CoroutineType"

    * "AsyncGeneratorType"

    * "CodeType"

      * "CodeType.replace()"

    * "CellType"

    * "MethodType"

    * "BuiltinFunctionType"

    * "BuiltinMethodType"

    * "WrapperDescriptorType"

    * "MethodWrapperType"

    * "NotImplementedType"

    * "MethodDescriptorType"

    * "ClassMethodDescriptorType"

    * "ModuleType"

      * "ModuleType.__doc__"

      * "ModuleType.__loader__"

      * "ModuleType.__name__"

      * "ModuleType.__package__"

      * "ModuleType.__spec__"

    * "EllipsisType"

    * "GenericAlias"

    * "UnionType"

    * "TracebackType"

    * "FrameType"

    * "GetSetDescriptorType"

    * "MemberDescriptorType"

    * "MappingProxyType"

      * "MappingProxyType.copy()"

      * "MappingProxyType.get()"

      * "MappingProxyType.items()"

      * "MappingProxyType.keys()"

      * "MappingProxyType.values()"

  * Additional Utility Classes and Functions

    * "SimpleNamespace"

    * "DynamicClassAttribute()"

  * Coroutine Utility Functions

    * "coroutine()"

* "copy" — Shallow and deep copy operations

  * "copy()"

  * "deepcopy()"

  * "replace()"

  * "Error"

* "pprint" — Data pretty printer

  * "PrettyPrinter"

  * "pformat()"

  * "pp()"

  * "pprint()"

  * "isreadable()"

  * "isrecursive()"

  * "saferepr()"

  * PrettyPrinter Objects

    * "PrettyPrinter.pformat()"

    * "PrettyPrinter.pprint()"

    * "PrettyPrinter.isreadable()"

    * "PrettyPrinter.isrecursive()"

    * "PrettyPrinter.format()"

  * Example

* "reprlib" — Alternate "repr()" implementation

  * "Repr"

  * "aRepr"

  * "repr()"

  * "recursive_repr()"

  * Repr Objects

    * "Repr.fillvalue"

    * "Repr.maxlevel"

    * "Repr.maxdict"

    * "Repr.maxlist"

    * "Repr.maxtuple"

    * "Repr.maxset"

    * "Repr.maxfrozenset"

    * "Repr.maxdeque"

    * "Repr.maxarray"

    * "Repr.maxlong"

    * "Repr.maxstring"

    * "Repr.maxother"

    * "Repr.indent"

    * "Repr.repr()"

    * "Repr.repr1()"

  * Subclassing Repr Objects

* "enum" — Support for enumerations

  * Module Contents

  * Data Types

    * "EnumType"

      * "EnumType.__call__()"

      * "EnumType.__contains__()"

      * "EnumType.__dir__()"

      * "EnumType.__getitem__()"

      * "EnumType.__iter__()"

      * "EnumType.__len__()"

      * "EnumType.__reversed__()"

    * "Enum"

      * "Enum.name"

      * "Enum.value"

      * "Enum._ignore_"

      * "Enum.__dir__()"

      * "Enum._generate_next_value_()"

      * "Enum.__init_subclass__()"

      * "Enum._missing_()"

      * "Enum.__repr__()"

      * "Enum.__str__()"

      * "Enum.__format__()"

    * "IntEnum"

    * "StrEnum"

    * "Flag"

      * "Flag.__contains__()"

      * "Flag.__or__()"

      * "Flag.__and__()"

      * "Flag.__xor__()"

      * "Flag._numeric_repr_()"

    * "IntFlag"

    * "ReprEnum"

    * "EnumCheck"

      * "EnumCheck.UNIQUE"

      * "EnumCheck.CONTINUOUS"

      * "EnumCheck.NAMED_FLAGS"

    * "FlagBoundary"

      * "FlagBoundary.STRICT"

      * "FlagBoundary.CONFORM"

      * "FlagBoundary.EJECT"

      * "FlagBoundary.KEEP"

    * Supported "__dunder__" names

    * Supported "_sunder_" names

  * Utilities and Decorators

    * "auto"

    * "property()"

    * "unique()"

    * "verify()"

    * "member()"

    * "nonmember()"

    * "global_enum()"

    * "show_flag_values()"

  * Notes

* "graphlib" — Functionality to operate with graph-like structures

  * "TopologicalSorter"

    * "TopologicalSorter.add()"

    * "TopologicalSorter.prepare()"

    * "TopologicalSorter.is_active()"

    * "TopologicalSorter.done()"

    * "TopologicalSorter.get_ready()"

    * "TopologicalSorter.static_order()"

  * Exceptions

    * "CycleError"

vim:tw=78:ts=8:ft=help:norl: