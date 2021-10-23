%{
	#include <ctype.h>
	#include <stdio.h>
	extern int yylex();
	void yyerror(char *msg);
%}

%token NOT
%token OR
%token AND
%token TRUE
%token FALSE

%%
lines	:	lines bexpr '\n' {
	  if ($2 == 1){ printf("TRUE(1)\n",$2) ;} 
	  else{ printf("FALSE(0)\n",$2) ;}
	  } 
	  | lines '\n' 
	  | ;

bexpr	:	bexpr OR bterm { $$ = $1 || $3 } 
	    | bterm;

bterm	:	bterm AND bfactor { $$ = $1 && $3 } 
	    | bfactor;

bfactor	:	NOT bfactor { $$ = !$2 } 
		| '(' bexpr ')' { $$ = $2 } 
		| TRUE
		| FALSE;
%%

#include "lex.yy.c"

void yyerror(char *msg){
	printf("Error");
	exit(0);
}

int main(){
	yyparse();
	return 0;
}