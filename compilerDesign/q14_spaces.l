%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%
[ \t\n]+   { fprintf(yyout, " "); }
.          { fprintf(yyout, "%s", yytext); }
%%
int yywrap() {return 1;}

int main() 
{
    FILE *f1, *f2;
    f1 = fopen("input3.txt", "r");
    yyin = f1;  
    f2 = fopen("output.txt", "w");
    yyout = f2;  
    yylex();
    fclose(f1);
    fclose(f2);
    return 0;
}


