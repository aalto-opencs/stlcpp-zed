; STLC++ highlights for Zed
;
; Important:
; - Do NOT use literal punctuation tokens in this file (e.g. ".", ",", "[", "]").
;   Zed will validate node types against the grammar's *named nodes*, and literal
;   punctuation can trigger "Invalid node type ..." errors for custom grammars.
; - Only reference named nodes that are emitted by the tree-sitter-stlcpp grammar.

; -----------------------------------------------------------------------------
; Comments
; -----------------------------------------------------------------------------
(comment) @comment

; -----------------------------------------------------------------------------
; Literals
; -----------------------------------------------------------------------------
(integer) @number
(char_literal) @string.special
(string_literal) @string

; -----------------------------------------------------------------------------
; Identifiers
; -----------------------------------------------------------------------------
(term_identifier) @variable
(type_identifier) @type

; Common builtin / reserved type name (if your language has it as an identifier)
((type_identifier) @keyword
  (#match? @keyword "^(Type)$"))

; -----------------------------------------------------------------------------
; Keywords
; -----------------------------------------------------------------------------
; STLC++ disallows keywords as identifiers, so keywords should be highlighted by
; their dedicated token nodes (kw_*).
;
; If any of these nodes don't exist in your grammar, Zed will error on load — so
; make sure your tree-sitter grammar emits them as named tokens.

(kw_import) @keyword
(kw_fun) @keyword
(kw_forall) @keyword
(kw_Type) @keyword

(kw_let) @keyword
(kw_in) @keyword

(kw_if) @keyword
(kw_then) @keyword
(kw_else) @keyword

; Custom syntax declarations
(kw_infixl) @keyword
(kw_infixr) @keyword
(kw_prefix) @keyword

(kw_case) @keyword
(kw_lcase) @keyword
(kw_of) @keyword

(kw_nil) @keyword
(kw_cons) @keyword

(kw_inl) @keyword
(kw_inr) @keyword

; NOTE: These keywords are defined in grammar.js but are not currently emitted by
; the compiled grammar (they don't appear in node-types.json), so capturing them
; causes Zed to fail loading the highlights query.
; (kw_fst) @keyword
; (kw_snd) @keyword
; (kw_fix) @keyword

(kw_true) @boolean
(kw_false) @boolean

(kw_panic) @keyword
(kw_trace) @keyword

(kw___print) @function.builtin
(kw___pure) @function.builtin
(kw___bind) @function.builtin
(kw___readline) @function.builtin

; -----------------------------------------------------------------------------
; Definitions (Zed / current grammar node names)
; -----------------------------------------------------------------------------
; NOTE:
; - Zed will refuse to load the whole highlights query if *any* node type is invalid.
; - The current grammar uses `declaration` for typed value declarations, and
;   `type_alias_declaration` for `State : Type` alias declarations.
; - There is no `type_declaration` node in the current grammar.

; Typed value declaration like: x : Integer   (optionally followed by x = expr)
((declaration
   name: (term_identifier) @variable.definition
   type: (_) @type))

; Value definition like: x = expr
((value_definition
   name: (term_identifier) @variable.definition
   value: (_) @variable))

; Type alias like: State : Type   (optionally followed by State = type)
((type_alias_declaration
   name: (type_identifier) @type.definition))

; -----------------------------------------------------------------------------
; Punctuation / Operators
; -----------------------------------------------------------------------------
; Capture the *named token nodes* emitted by the grammar (not literal strings).

; Punctuation nodes
; NOTE: In upstream stlcpp, '.' is part of term identifiers, not punctuation.
; Do not treat it as a delimiter token in queries.
(comma) @punctuation.delimiter
(colon) @punctuation.delimiter
; NOTE: STLC++ does not use semicolons; do not capture `semicolon`.
(bar) @punctuation.delimiter

(lparen) @punctuation.bracket
(rparen) @punctuation.bracket
(lbrack) @punctuation.bracket
(rbrack) @punctuation.bracket
(lbrace) @punctuation.bracket
(rbrace) @punctuation.bracket

; Operator nodes
;
; NOTE:
; - `=` / `->` / `=>` are structural tokens in the grammar.
; - Custom infix operators should be emitted as a generic `(operator)` token node
;   after the grammar refactor.
(equals) @operator
(arrow) @operator
(fat_arrow) @operator
(operator) @operator
