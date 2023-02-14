(* file: lexer.mll *)

{
  open Parser
  
}

let digit = ['0'-'9']
rule token = parse
  | [' ' '\t'] { token lexbuf }
  | '\n' { NEWLINE }
  | digit+
  | "." digit+
  | digit+ "." digit* as num
  { NUM (float_of_string num) }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { MULTIPLY }
  | '/' { DIVIDE }
  | '^' { CARET }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | _ { token lexbuf }
  | eof { raise End_of_file }


