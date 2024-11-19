(* Step 1: Tokenizing (Lexer)
Define Tokens
Tokens represent numbers, operators, and parentheses. *)
type token =
  | ROMAN_NUM of int  (* Cat-themed numbers, e.g., "meow" -> 1 *)
  | PLUS              (* "~" *)
  | MINUS             (* "..." *)
  | MULT              (* "!" *)
  | DIV               (* "?" *)
  | LPAREN            (* "?!" for "(" *)
  | RPAREN            (* "!?" for ")" *)
  | EOF               (* End of input *)
