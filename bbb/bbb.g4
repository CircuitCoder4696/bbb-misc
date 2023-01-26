grammar bbb;

basic_binary_buffer :
	hash_
	(whitespace+ member)+
	whitespace*
	EOF
;

//32 hex chars
hash_ :
	hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
		hex_digit hex_digit hex_digit hex_digit
;

whitespace :
	space
	| newline
	| tab
;

member :
	member_name whitespace* colon whitespace* type_
	| at_sign hash_
;

member_name :
	specific_name
	| underscore
;

specific_name :
	(lower_alpha | upper_alpha | decimal_digit)
		(lower_alpha | decimal_digit | underscore)*
;

type_ :
	underscore
	| aggregate_type (whitespace* range_)? whitespace* open_brace whitespace*
			member (whitespace+ member)* whitespace*
		close_brace
	| base_type (whitespace* range_)?
;

/*
'struct' | 'enum' | 'union'
*/
aggregate_type :
	'struct' | 'enum' | 'union';

range_ :
	(open_bracket | open_paren) whitespace*
		canon_natural_num whitespace*
		(comma whitespace* canon_natural_num whitespace*)?
	(close_bracket | close_paren)
;

/*
0 | [1-9][0-9]*
*/
canon_natural_num :
	'0' | '[1-9]' '[0-9]'* ;

/*
'u1' | 'u8' | 'u16' | 'u32' | 'u64'
	| 'i8' | 'i16' | 'i32' | 'i64'
*/
base_type :
    'u1' | 'u8' | 'u16' | 'u32' | 'u64' | 'i8' | 'i16' | 'i32' | 'i64' ;

//building block rules

/*
[0-9]
*/
decimal_digit : '[0-9]' ;

/*
[0-9a-f]
*/
hex_digit : '[0-9a-f]' ;

/*
[a-z]
*/
lower_alpha : '[a-z]';

/*
[A-Z]
*/
upper_alpha : '[A-Z]';

//simplest tokens

open_brace : Open_brace;
Open_brace : '{';

close_brace : Close_brace;
Close_brace : '}';

open_bracket : Open_bracket;
Open_bracket : '[';

close_bracket : Close_bracket;
Close_bracket : ']';

open_paren : Open_paren;
Open_paren : '(';

close_paren : Close_paren;
Close_paren : ')';

at_sign : At_sign;
At_sign : '@';

colon : Colon;
Colon : ':';

comma : Comma;
Comma : ',';

newline : Newline;
Newline : '\n';

space : Space;
Space : ' ';

tab : Tab;
Tab : '\t';

underscore : Underscore;
Underscore : '_';

Char_0 : '0';
Char_1 : '1';
Char_2 : '2';
Char_3 : '3';
Char_4 : '4';
Char_5 : '5';
Char_6 : '6';
Char_7 : '7';
Char_8 : '8';
Char_9 : '9';
Char_A : 'A';
Char_B : 'B';
Char_C : 'C';
Char_D : 'D';
Char_E : 'E';
Char_F : 'F';
Char_G : 'G';
Char_H : 'H';
Char_I : 'I';
Char_J : 'J';
Char_K : 'K';
Char_L : 'L';
Char_M : 'M';
Char_N : 'N';
Char_O : 'O';
Char_P : 'P';
Char_Q : 'Q';
Char_R : 'R';
Char_S : 'S';
Char_T : 'T';
Char_U : 'U';
Char_V : 'V';
Char_W : 'W';
Char_X : 'X';
Char_Y : 'Y';
Char_Z : 'Z';
Char_a : 'a';
Char_b : 'b';
Char_c : 'c';
Char_d : 'd';
Char_e : 'e';
Char_f : 'f';
Char_g : 'g';
Char_h : 'h';
Char_i : 'i';
Char_j : 'j';
Char_k : 'k';
Char_l : 'l';
Char_m : 'm';
Char_n : 'n';
Char_o : 'o';
Char_p : 'p';
Char_q : 'q';
Char_r : 'r';
Char_s : 's';
Char_t : 't';
Char_u : 'u';
Char_v : 'v';
Char_w : 'w';
Char_x : 'x';
Char_y : 'y';
Char_z : 'z';