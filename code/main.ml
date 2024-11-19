(* Entry point to the program. *)

open Lexer
open Parser
open Interpreter

let () =
  print_endline "How many treats do you want?:";
  let input = read_line () in
  let tokens = tokenize input in
  let (ast, _) = parse_expr tokens in
  let result = eval ast in
  Printf.printf "Result: %d\n" result

  (* 
ocamlc -c tokens.ml
ocamlc -c ast.ml
ocamlc -c lexer.ml
ocamlc -c parser.ml
ocamlc -c interpreter.ml
ocamlc -o main.byte tokens.cmo ast.cmo lexer.cmo parser.cmo interpreter.cmo main.ml

 *)

 (* 
#load "tokens.cmo";;
#load "ast.cmo";;
#load "lexer.cmo";;
#load "parser.cmo";;
#load "interpreter.cmo";;
#load "main.cmo";;

 
 
 *)