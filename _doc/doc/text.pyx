*text.pyx*                                    Last change: 2023 Sep 15

Text Processing Services
************************

The modules described in this chapter provide a wide range of string
manipulation operations and other text processing services.

The "codecs" module described under Binary Data Services is also
highly relevant to text processing. In addition, see the documentation
for Python’s built-in string type in Text Sequence Type — str.

* "string" — Common string operations

  * String constants

    * "ascii_letters"

    * "ascii_lowercase"

    * "ascii_uppercase"

    * "digits"

    * "hexdigits"

    * "octdigits"

    * "punctuation"

    * "printable"

    * "whitespace"

  * Custom String Formatting

    * "Formatter"

      * "Formatter.format()"

      * "Formatter.vformat()"

      * "Formatter.parse()"

      * "Formatter.get_field()"

      * "Formatter.get_value()"

      * "Formatter.check_unused_args()"

      * "Formatter.format_field()"

      * "Formatter.convert_field()"

  * Format String Syntax

    * Format Specification Mini-Language

    * Format examples

  * Template strings

    * "Template"

      * "Template.substitute()"

      * "Template.safe_substitute()"

      * "Template.is_valid()"

      * "Template.get_identifiers()"

      * "Template.template"

  * Helper functions

    * "capwords()"

* "re" — Regular expression operations

  * Regular Expression Syntax

  * Module Contents

    * Flags

      * "RegexFlag"

      * "A"

      * "ASCII"

      * "DEBUG"

      * "I"

      * "IGNORECASE"

      * "L"

      * "LOCALE"

      * "M"

      * "MULTILINE"

      * "NOFLAG"

      * "S"

      * "DOTALL"

      * "U"

      * "UNICODE"

      * "X"

      * "VERBOSE"

    * Functions

      * "compile()"

      * "search()"

      * "match()"

      * "fullmatch()"

      * "split()"

      * "findall()"

      * "finditer()"

      * "sub()"

      * "subn()"

      * "escape()"

      * "purge()"

    * Exceptions

      * "error"

        * "error.msg"

        * "error.pattern"

        * "error.pos"

        * "error.lineno"

        * "error.colno"

  * Regular Expression Objects

    * "Pattern"

      * "Pattern.search()"

      * "Pattern.match()"

      * "Pattern.fullmatch()"

      * "Pattern.split()"

      * "Pattern.findall()"

      * "Pattern.finditer()"

      * "Pattern.sub()"

      * "Pattern.subn()"

      * "Pattern.flags"

      * "Pattern.groups"

      * "Pattern.groupindex"

      * "Pattern.pattern"

  * Match Objects

    * "Match"

      * "Match.expand()"

      * "Match.group()"

      * "Match.__getitem__()"

      * "Match.groups()"

      * "Match.groupdict()"

      * "Match.start()"

      * "Match.end()"

      * "Match.span()"

      * "Match.pos"

      * "Match.endpos"

      * "Match.lastindex"

      * "Match.lastgroup"

      * "Match.re"

      * "Match.string"

  * Regular Expression Examples

    * Checking for a Pair

    * Simulating scanf()

    * search() vs. match()

    * Making a Phonebook

    * Text Munging

    * Finding all Adverbs

    * Finding all Adverbs and their Positions

    * Raw String Notation

    * Writing a Tokenizer

* "difflib" — Helpers for computing deltas

  * "Differ"

  * "HtmlDiff"

    * "HtmlDiff.__init__()"

    * "HtmlDiff.make_file()"

    * "HtmlDiff.make_table()"

  * "context_diff()"

  * "get_close_matches()"

  * "ndiff()"

  * "restore()"

  * "unified_diff()"

  * "diff_bytes()"

  * "IS_LINE_JUNK()"

  * "IS_CHARACTER_JUNK()"

  * SequenceMatcher Objects

    * "SequenceMatcher"

      * "SequenceMatcher.set_seqs()"

      * "SequenceMatcher.set_seq1()"

      * "SequenceMatcher.set_seq2()"

      * "SequenceMatcher.find_longest_match()"

      * "SequenceMatcher.get_matching_blocks()"

      * "SequenceMatcher.get_opcodes()"

      * "SequenceMatcher.get_grouped_opcodes()"

      * "SequenceMatcher.ratio()"

      * "SequenceMatcher.quick_ratio()"

      * "SequenceMatcher.real_quick_ratio()"

  * SequenceMatcher Examples

  * Differ Objects

    * "Differ.compare()"

  * Differ Example

  * A command-line interface to difflib

  * ndiff example

* "textwrap" — Text wrapping and filling

  * "wrap()"

  * "fill()"

  * "shorten()"

  * "dedent()"

  * "indent()"

  * "TextWrapper"

    * "TextWrapper.width"

    * "TextWrapper.expand_tabs"

    * "TextWrapper.tabsize"

    * "TextWrapper.replace_whitespace"

    * "TextWrapper.drop_whitespace"

    * "TextWrapper.initial_indent"

    * "TextWrapper.subsequent_indent"

    * "TextWrapper.fix_sentence_endings"

    * "TextWrapper.break_long_words"

    * "TextWrapper.break_on_hyphens"

    * "TextWrapper.max_lines"

    * "TextWrapper.placeholder"

    * "TextWrapper.wrap()"

    * "TextWrapper.fill()"

* "unicodedata" — Unicode Database

  * "lookup()"

  * "name()"

  * "decimal()"

  * "digit()"

  * "numeric()"

  * "category()"

  * "bidirectional()"

  * "combining()"

  * "east_asian_width()"

  * "mirrored()"

  * "decomposition()"

  * "normalize()"

  * "is_normalized()"

  * "unidata_version"

  * "ucd_3_2_0"

* "stringprep" — Internet String Preparation

  * "in_table_a1()"

  * "in_table_b1()"

  * "map_table_b2()"

  * "map_table_b3()"

  * "in_table_c11()"

  * "in_table_c12()"

  * "in_table_c11_c12()"

  * "in_table_c21()"

  * "in_table_c22()"

  * "in_table_c21_c22()"

  * "in_table_c3()"

  * "in_table_c4()"

  * "in_table_c5()"

  * "in_table_c6()"

  * "in_table_c7()"

  * "in_table_c8()"

  * "in_table_c9()"

  * "in_table_d1()"

  * "in_table_d2()"

* "readline" — GNU readline interface

  * Init file

    * "parse_and_bind()"

    * "read_init_file()"

  * Line buffer

    * "get_line_buffer()"

    * "insert_text()"

    * "redisplay()"

  * History file

    * "read_history_file()"

    * "write_history_file()"

    * "append_history_file()"

    * "get_history_length()"

    * "set_history_length()"

  * History list

    * "clear_history()"

    * "get_current_history_length()"

    * "get_history_item()"

    * "remove_history_item()"

    * "replace_history_item()"

    * "add_history()"

    * "set_auto_history()"

  * Startup hooks

    * "set_startup_hook()"

    * "set_pre_input_hook()"

  * Completion

    * "set_completer()"

    * "get_completer()"

    * "get_completion_type()"

    * "get_begidx()"

    * "get_endidx()"

    * "set_completer_delims()"

    * "get_completer_delims()"

    * "set_completion_display_matches_hook()"

  * Example

* "rlcompleter" — Completion function for GNU readline

  * Completer Objects

    * "Completer.complete()"

vim:tw=78:ts=8:ft=help:norl: