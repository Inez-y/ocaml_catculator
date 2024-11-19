(* Tokenizes the input string into meaningful units (tokens). *)

open Tokens

let tokenize input =
  let length = String.length input in
  let rec aux pos acc =
    if pos >= length then List.rev (EOF :: acc)
    else
      let remaining = String.sub input pos (length - pos) in
      if String.length remaining >= 4 && String.sub remaining 0 4 = "meow" then
        (* Count consecutive "meow", ignoring spaces *)
        let rec count_meows p count =
          if p + 4 <= length && String.sub input p 4 = "meow" then
            (* Skip spaces after "meow" *)
            let next_pos = if p + 4 < length && input.[p + 4] = ' ' then p + 5 else p + 4 in
            count_meows next_pos (count + 1)
          else (count, p)
        in
        let (count, next_pos) = count_meows pos 0 in
        aux next_pos (ROMAN_NUM count :: acc)
      else if String.length remaining >= 3 && String.sub remaining 0 3 = "huh" then
        aux (pos + 3) (ROMAN_NUM 0 :: acc)
      else if String.length remaining >= 4 && String.sub remaining 0 4 = "myoo" then
        aux (pos + 4) (ROMAN_NUM 5 :: acc)
      else if String.sub remaining 0 1 = "~" then
        aux (pos + 1) (PLUS :: acc)
      else if String.length remaining >= 3 && String.sub remaining 0 3 = "..." then
        aux (pos + 3) (MINUS :: acc)
      else if String.sub remaining 0 1 = "!" then
        aux (pos + 1) (MULT :: acc)
      else if String.sub remaining 0 1 = "?" then
        if pos + 2 <= length && String.sub input (pos + 1) 1 = "!" then
          aux (pos + 2) (LPAREN :: acc)
        else
          aux (pos + 1) (DIV :: acc)
      else if input.[pos] = ' ' then
        aux (pos + 1) acc  (* Skip spaces *)
      else failwith ("Unknown token: " ^ String.make 1 input.[pos])
  in
  aux 0 []
