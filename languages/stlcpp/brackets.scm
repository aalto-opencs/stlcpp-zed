; Bracket matching / rainbow delimiters queries for STLC++
;
; Zed computes rainbow delimiter nesting from @open/@close captures.
; Capture bracket tokens *individually* so nesting works across all constructs
; (terms, types, lists, pairs, etc.) without relying on a specific parent node.
;
; NOTE:
; We match the named token nodes emitted by the tree-sitter-stlcpp grammar.

; Parentheses
(lparen) @open
(rparen) @close

; Square brackets
(lbrack) @open
(rbrack) @close

; Braces
(lbrace) @open
(rbrace) @close
