(* Parses the tokens into an Abstract Syntax Tree (AST). *)

open Tokens
open Ast

let rec parse_expr tokens =
  let rec parse_primary tokens =
    match tokens with
    | ROMAN_NUM n :: rest -> (Int n, rest)
    | LPAREN :: rest ->
        let (expr, rest') = parse_expr rest in
        (match rest' with
        | RPAREN :: rest'' -> (Paren expr, rest'')  (* Successfully match parentheses *)
        | _ -> failwith "Unmatched opening parenthesis: expected closing `!?`")
    | RPAREN :: _ -> failwith "Unexpected token: unmatched closing parenthesis"
    | _ -> failwith "Unexpected token in primary expression"
  and parse_term tokens =
    let (left, rest) = parse_primary tokens in
    match rest with
    | MULT :: rest' ->
        let (right, rest'') = parse_term rest' in
        (Mul (left, right), rest'')
    | DIV :: rest' ->
        let (right, rest'') = parse_term rest' in
        (Div (left, right), rest'')
    | _ -> (left, rest)
  and parse_addition tokens =
    let (left, rest) = parse_term tokens in
    match rest with
    | PLUS :: rest' ->
        let (right, rest'') = parse_addition rest' in
        (Add (left, right), rest'')
    | MINUS :: rest' ->
        let (right, rest'') = parse_addition rest' in
        (Sub (left, right), rest'')
    | _ -> (left, rest)
  in
  parse_addition tokens
