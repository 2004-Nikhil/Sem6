%{
#include <stdio.h>
%}

%%
"<"[^<>]*">" ;  
.      { putchar(yytext[0]); }  

%%

int main() {

    yyin = fopen("input4.txt", "r");

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap() {return 1;}
