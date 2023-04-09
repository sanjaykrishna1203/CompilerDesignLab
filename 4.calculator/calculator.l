%option noyywrap
%{
	#include<stdio.h>
	#include "y.tab.h"
	void yyerror(char*);
	extern int yylval;
%}


%%
[0-9]+ {yylval = atoi(yytext); return NUM;}
[a-z] {yylval = toascii(*yytext)-97; return ID;}
[A-Z] {yylval = toascii(*yytext)-65; return ID;}
[-*+/=\n\(\)] {return *yytext;}
. {yyerror("Syntax error");}
%%