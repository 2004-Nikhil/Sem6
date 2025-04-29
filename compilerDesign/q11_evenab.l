%{
#include <stdio.h>
FILE *yyin; 
%}

%%
^(aa|bb|(ab|ba)(aa|bb)*(ab|ba))*$   { printf("Accepted: Even number of 'a' and 'b'\n"); }
.*  { printf("Rejected: Odd occurrences found\n"); }

%%

int main() {
    yyin = fopen("input6.txt", "r");  
    if (!yyin) {
        perror("Error opening input file");
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}

int yywrap() {
    return 1;
}
