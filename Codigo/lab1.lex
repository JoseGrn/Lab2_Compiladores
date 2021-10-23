true_ TRUE
false_ FALSE
or_ OR
and_ AND
not_ NOT

%%
[ \t]	; {/* espacios en blanco */};
{true_}	{ 
	yylval = 1;
	return TRUE; 
}
{false_} { 
	yylval = 0;
	return FALSE; 
}
{and_} {return AND;}
{or_} {return OR;}
{not_} {return NOT;}
[\)\(\n] return yytext[0];
. printf("Error\n");
%%

int yywrap(void) {
	return 0;
}