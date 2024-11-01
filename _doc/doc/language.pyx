*language.pyx*                                Last change: 2023 Sep 15

Python Language Services
************************

Python provides a number of modules to assist in working with the
Python language.  These modules support tokenizing, parsing, syntax
analysis, bytecode disassembly, and various other facilities.

These modules include:

* "ast" — Abstract Syntax Trees

  * Abstract Grammar

  * Node classes

    * "AST"

      * "AST._fields"

      * "AST.lineno"

      * "AST.col_offset"

      * "AST.end_lineno"

      * "AST.end_col_offset"

    * Root nodes

      * "Module"

      * "Expression"

      * "Interactive"

      * "FunctionType"

    * Literals

      * "Constant"

      * "FormattedValue"

      * "JoinedStr"

      * "List"

      * "Tuple"

      * "Set"

      * "Dict"

    * Variables

      * "Name"

      * "Load"

      * "Store"

      * "Del"

      * "Starred"

    * Expressions

      * "Expr"

      * "UnaryOp"

      * "UAdd"

      * "USub"

      * "Not"

      * "Invert"

      * "BinOp"

      * "Add"

      * "Sub"

      * "Mult"

      * "Div"

      * "FloorDiv"

      * "Mod"

      * "Pow"

      * "LShift"

      * "RShift"

      * "BitOr"

      * "BitXor"

      * "BitAnd"

      * "MatMult"

      * "BoolOp"

      * "And"

      * "Or"

      * "Compare"

      * "Eq"

      * "NotEq"

      * "Lt"

      * "LtE"

      * "Gt"

      * "GtE"

      * "Is"

      * "IsNot"

      * "In"

      * "NotIn"

      * "Call"

      * "keyword"

      * "IfExp"

      * "Attribute"

      * "NamedExpr"

      * Subscripting

        * "Subscript"

        * "Slice"

      * Comprehensions

        * "ListComp"

        * "SetComp"

        * "GeneratorExp"

        * "DictComp"

        * "comprehension"

    * Statements

      * "Assign"

        * "Assign.type_comment"

      * "AnnAssign"

      * "AugAssign"

      * "Raise"

      * "Assert"

      * "Delete"

      * "Pass"

      * "TypeAlias"

      * Imports

        * "Import"

        * "ImportFrom"

        * "alias"

    * Control flow

      * "If"

      * "For"

        * "For.type_comment"

      * "While"

      * "Break"

      * "Continue"

      * "Try"

      * "TryStar"

      * "ExceptHandler"

      * "With"

        * "With.type_comment"

      * "withitem"

    * Pattern matching

      * "Match"

      * "match_case"

      * "MatchValue"

      * "MatchSingleton"

      * "MatchSequence"

      * "MatchStar"

      * "MatchMapping"

      * "MatchClass"

      * "MatchAs"

      * "MatchOr"

    * Type parameters

      * "TypeVar"

      * "ParamSpec"

      * "TypeVarTuple"

    * Function and class definitions

      * "FunctionDef"

        * "FunctionDef.type_comment"

      * "Lambda"

      * "arguments"

      * "arg"

        * "arg.type_comment"

      * "Return"

      * "Yield"

      * "YieldFrom"

      * "Global"

      * "Nonlocal"

      * "ClassDef"

    * Async and await

      * "AsyncFunctionDef"

      * "Await"

      * "AsyncFor"

      * "AsyncWith"

  * "ast" Helpers

    * "parse()"

    * "unparse()"

    * "literal_eval()"

    * "get_docstring()"

    * "get_source_segment()"

    * "fix_missing_locations()"

    * "increment_lineno()"

    * "copy_location()"

    * "iter_fields()"

    * "iter_child_nodes()"

    * "walk()"

    * "NodeVisitor"

      * "NodeVisitor.visit()"

      * "NodeVisitor.generic_visit()"

    * "NodeTransformer"

    * "dump()"

  * Compiler Flags

    * "PyCF_ALLOW_TOP_LEVEL_AWAIT"

    * "PyCF_ONLY_AST"

    * "PyCF_TYPE_COMMENTS"

  * Command-Line Usage

* "symtable" — Access to the compiler’s symbol tables

  * Generating Symbol Tables

    * "symtable()"

  * Examining Symbol Tables

    * "SymbolTable"

      * "SymbolTable.get_type()"

      * "SymbolTable.get_id()"

      * "SymbolTable.get_name()"

      * "SymbolTable.get_lineno()"

      * "SymbolTable.is_optimized()"

      * "SymbolTable.is_nested()"

      * "SymbolTable.has_children()"

      * "SymbolTable.get_identifiers()"

      * "SymbolTable.lookup()"

      * "SymbolTable.get_symbols()"

      * "SymbolTable.get_children()"

    * "Function"

      * "Function.get_parameters()"

      * "Function.get_locals()"

      * "Function.get_globals()"

      * "Function.get_nonlocals()"

      * "Function.get_frees()"

    * "Class"

      * "Class.get_methods()"

    * "Symbol"

      * "Symbol.get_name()"

      * "Symbol.is_referenced()"

      * "Symbol.is_imported()"

      * "Symbol.is_parameter()"

      * "Symbol.is_global()"

      * "Symbol.is_nonlocal()"

      * "Symbol.is_declared_global()"

      * "Symbol.is_local()"

      * "Symbol.is_annotated()"

      * "Symbol.is_free()"

      * "Symbol.is_assigned()"

      * "Symbol.is_namespace()"

      * "Symbol.get_namespaces()"

      * "Symbol.get_namespace()"

* "token" — Constants used with Python parse trees

  * "tok_name"

  * "ISTERMINAL()"

  * "ISNONTERMINAL()"

  * "ISEOF()"

  * "ENDMARKER"

  * "NAME"

  * "NUMBER"

  * "STRING"

  * "NEWLINE"

  * "INDENT"

  * "DEDENT"

  * "LPAR"

  * "RPAR"

  * "LSQB"

  * "RSQB"

  * "COLON"

  * "COMMA"

  * "SEMI"

  * "PLUS"

  * "MINUS"

  * "STAR"

  * "SLASH"

  * "VBAR"

  * "AMPER"

  * "LESS"

  * "GREATER"

  * "EQUAL"

  * "DOT"

  * "PERCENT"

  * "LBRACE"

  * "RBRACE"

  * "EQEQUAL"

  * "NOTEQUAL"

  * "LESSEQUAL"

  * "GREATEREQUAL"

  * "TILDE"

  * "CIRCUMFLEX"

  * "LEFTSHIFT"

  * "RIGHTSHIFT"

  * "DOUBLESTAR"

  * "PLUSEQUAL"

  * "MINEQUAL"

  * "STAREQUAL"

  * "SLASHEQUAL"

  * "PERCENTEQUAL"

  * "AMPEREQUAL"

  * "VBAREQUAL"

  * "CIRCUMFLEXEQUAL"

  * "LEFTSHIFTEQUAL"

  * "RIGHTSHIFTEQUAL"

  * "DOUBLESTAREQUAL"

  * "DOUBLESLASH"

  * "DOUBLESLASHEQUAL"

  * "AT"

  * "ATEQUAL"

  * "RARROW"

  * "ELLIPSIS"

  * "COLONEQUAL"

  * "EXCLAMATION"

  * "OP"

  * "TYPE_IGNORE"

  * "TYPE_COMMENT"

  * "SOFT_KEYWORD"

  * "FSTRING_START"

  * "FSTRING_MIDDLE"

  * "FSTRING_END"

  * "COMMENT"

  * "NL"

  * "ERRORTOKEN"

  * "N_TOKENS"

  * "NT_OFFSET"

  * "ENCODING"

* "keyword" — Testing for Python keywords

  * "iskeyword()"

  * "kwlist"

  * "issoftkeyword()"

  * "softkwlist"

* "tokenize" — Tokenizer for Python source

  * Tokenizing Input

    * "tokenize()"

    * "generate_tokens()"

    * "untokenize()"

    * "detect_encoding()"

    * "open()"

    * "TokenError"

  * Command-Line Usage

  * Examples

* "tabnanny" — Detection of ambiguous indentation

  * "check()"

  * "verbose"

  * "filename_only"

  * "NannyNag"

  * "process_tokens()"

* "pyclbr" — Python module browser support

  * "readmodule()"

  * "readmodule_ex()"

  * Function Objects

    * "Function.file"

    * "Function.module"

    * "Function.name"

    * "Function.lineno"

    * "Function.parent"

    * "Function.children"

    * "Function.is_async"

  * Class Objects

    * "Class.file"

    * "Class.module"

    * "Class.name"

    * "Class.lineno"

    * "Class.parent"

    * "Class.children"

    * "Class.super"

    * "Class.methods"

* "py_compile" — Compile Python source files

  * "PyCompileError"

  * "compile()"

  * "PycInvalidationMode"

    * "PycInvalidationMode.TIMESTAMP"

    * "PycInvalidationMode.CHECKED_HASH"

    * "PycInvalidationMode.UNCHECKED_HASH"

  * Command-Line Interface

* "compileall" — Byte-compile Python libraries

  * Command-line use

  * Public functions

    * "compile_dir()"

    * "compile_file()"

    * "compile_path()"

* "dis" — Disassembler for Python bytecode

  * Bytecode analysis

    * "Bytecode"

      * "Bytecode.from_traceback()"

      * "Bytecode.codeobj"

      * "Bytecode.first_line"

      * "Bytecode.dis()"

      * "Bytecode.info()"

  * Analysis functions

    * "code_info()"

    * "show_code()"

    * "dis()"

    * "distb()"

    * "disassemble()"

    * "disco()"

    * "get_instructions()"

    * "findlinestarts()"

    * "findlabels()"

    * "stack_effect()"

  * Python Bytecode Instructions

    * "Instruction"

      * "Instruction.opcode"

      * "Instruction.opname"

      * "Instruction.baseopcode"

      * "Instruction.baseopname"

      * "Instruction.arg"

      * "Instruction.oparg"

      * "Instruction.argval"

      * "Instruction.argrepr"

      * "Instruction.offset"

      * "Instruction.start_offset"

      * "Instruction.cache_offset"

      * "Instruction.end_offset"

      * "Instruction.starts_line"

      * "Instruction.line_number"

      * "Instruction.is_jump_target"

      * "Instruction.jump_target"

      * "Instruction.positions"

    * "Positions"

      * "Positions.lineno"

      * "Positions.end_lineno"

      * "Positions.col_offset"

      * "Positions.end_col_offset"

  * Opcode collections

    * "opname"

    * "opmap"

    * "cmp_op"

    * "hasarg"

    * "hasconst"

    * "hasfree"

    * "hasname"

    * "hasjump"

    * "haslocal"

    * "hascompare"

    * "hasexc"

    * "hasjrel"

    * "hasjabs"

* "pickletools" — Tools for pickle developers

  * Command line usage

    * Command line options

  * Programmatic Interface

    * "dis()"

    * "genops()"

    * "optimize()"

vim:tw=78:ts=8:ft=help:norl: