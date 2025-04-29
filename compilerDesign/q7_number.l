%{
#include <stdio.h>
%}

%%
[0-9]* {printf("Intiger\n");}
[0-9]+[.][0-9]+	{printf("Float\n");}
.*	{printf("Invalid number \n");}
%%

int yywrap(){return 1;}

int main()
{
	yylex();
	return 0;
}
