%{
#include <stdio.h>
%}

%%
[a-zA-Z][a-zA-Z0-9_]* {printf("Valid identifiers %s\n",yytext);}
.*	{printf("Invalid identifiers %s\n",yytext);}
%%

int yywrap(){return 1;}

int main()
{
	yylex();
	return 0;
}
