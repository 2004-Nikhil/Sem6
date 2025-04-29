%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}[\n] {printf("Valid email address.\n");}

.*	{ printf("Invalid email address.\n");}
%%

int yywrap(){return 1;}

int main()
{
	yylex();
	return 0;
}
