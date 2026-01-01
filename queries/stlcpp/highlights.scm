; Tree-sitter highlight queries for stlcpp
; Updated to match the grammar's node names:
;   - term identifiers: (term_identifier)
;   - type identifiers: (type_identifier)

; -----------------------------------------------------------------------------
; Comments
; -----------------------------------------------------------------------------
((comment) @comment)

; -----------------------------------------------------------------------------
; Identifiers / variables
; -----------------------------------------------------------------------------
((term_identifier) @variable)

; -----------------------------------------------------------------------------
; Types
; -----------------------------------------------------------------------------
((type_identifier) @type)

; Common built-in type names (based on the upstream stlcpp examples)
((type_identifier) @type.builtin
  (#match? @type.builtin "^(Boolean|Integer|Character|Unit|List|IO|Type)$"))

; -----------------------------------------------------------------------------
; Literals
; -----------------------------------------------------------------------------
((integer) @number)

; -----------------------------------------------------------------------------
; Operators & punctuation (best-effort)
; -----------------------------------------------------------------------------
":" @punctuation.delimiter
"=" @operator
"->" @operator
"+" @operator
"-" @operator
"*" @operator
"/" @operator

"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket

"," @punctuation.delimiter
";" @punctuation.delimiter

; -----------------------------------------------------------------------------
; Declarations / definitions
; -----------------------------------------------------------------------------
((type_declaration
   name: (term_identifier) @variable.definition
   type: (_) @type))

((value_definition
   name: (term_identifier) @variable.definition
   value: (_) @variable))

; -----------------------------------------------------------------------------
; Keywords (best-effort)
; -----------------------------------------------------------------------------
((term_identifier) @keyword
  (#match? @keyword "^(let|in|fun|if|then|else|case|of|lcase|nil|cons|fst|snd|inl|inr|forall|import)$"))
