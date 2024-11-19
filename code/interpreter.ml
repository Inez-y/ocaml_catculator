(* Evaluates the AST to compute results. *)
open Ast

let rec eval expr =
  match expr with
  | Int n -> n
  | Add (left, right) -> eval left + eval right
  | Sub (left, right) -> eval left - eval right
  | Mul (left, right) -> eval left * eval right
  | Div (left, right) -> eval left / eval right
  | Paren e -> eval e
