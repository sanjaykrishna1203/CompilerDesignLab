%option noyywrap
%{
	#include<stdio.h>
%}
letter [A-Za-z]
number [0-9]
operator[+-*]
%%
void|main|int|float|while|do|for {printf("%s is a keyword \n", yytext);}
%s|%d|%f {printf("%s is a Format Specifier \n", yytext);}
{number}({number})* {printf("%s is a number\n", yytext);}
{letter}({number}|{letter})* {printf("%s is an Identifier\n", yytext);}
\( {printf("%s is a Open Paranthesis\n", yytext);}
\) {printf("%s is a Close Paranthesis\n", yytext);}
\{ {printf("%s is a Open Braces\n", yytext);}
\} {printf("%s is a Close Braces\n", yytext);}
\= {printf("%s is a Assignment Operator\n", yytext);}
\. {printf("%s is a Dot Opeator\n", yytext);}
\, {printf("%s is a Comma\n", yytext);}
%%
int main(int argc, char* argv[])
{
	
	FILE *fn;
	fn = fopen(argv[1], "r");
	if(fn == NULL) printf("File Does Not exist");
	yyin = fn;
	yylex();
	return 0;
}