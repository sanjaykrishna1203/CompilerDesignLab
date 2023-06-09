%{
	#include<stdio.h>
	#include "y.tab.h"
	void yyerror(char *);
	extern int yylval;
%}

%%
[0-9]+ {yylval = atoi(yytext); return INT;}
[-*+/\n(\)] {return *yytext;}
.  {yyerror("Syntax Error");}
%%
int yywrap()
{
	return 1;
}