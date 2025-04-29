%{
#include <stdio.h>
extern FILE *yyin,*yyout;
%}

%%
"<"[^<>]*">" { fprintf(yyout, "%s\n", yytext); }
.      ;  
%%

int main() {

    yyin = fopen("input5.txt", "r");
    yyout = fopen("output2.txt","w");
    
    yylex();

    fclose(yyin);
    fclose(yyout);
    return 0;
}

int yywrap() {return 1;}
