%{
#include <stdio.h>

int words = 0, characters = 0, spaces = 0;
%}

%%

[ \t\n]     { spaces++;}  // Count spaces, tabs, and newlines as whitespace
[a-zA-Z0-9]+ { words++; characters += yyleng; } // Count words (alphanumeric sequences)
.           { characters++; }  // Count all other characters

%%

int yywrap() {
    return 1;
}

int main() {
    yyin = fopen("input2.txt", "r");
    yylex();

    printf("Words: %d\nCharacters: %d\nWhite spaces: %d\n", words, characters, spaces);

    return 0;
}
