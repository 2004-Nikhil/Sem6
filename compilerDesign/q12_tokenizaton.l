%{
#include <stdio.h>
#include <string.h>
int other=0, key=0, iden=0, num=0, oper=0, sepa=0, deli=0;
char st[7][50][50];  // [category][max_tokens][max_length_of_each_token]
%}

/* Patterns */
%%
int|float|while|if|else	{strcpy(st[0][key], yytext); key++;}
[a-zA-Z_][a-zA-Z0-9_]*  {strcpy(st[1][iden], yytext); iden++;}
[0-9]+(\.[0-9]+)? 		{strcpy(st[2][num], yytext); num++;}
[\+\-\*\/=<>] 			{strcpy(st[3][oper], yytext); oper++;}
[,;] 					{strcpy(st[4][sepa], yytext); sepa++;}
[\(\)\{\}] 			{strcpy(st[5][deli], yytext); deli++;}
[ \t\n]+ ;  			// Ignore whitespace
. 					{strcpy(st[6][other], yytext); other++;}
%%

/* Main Function */
int main() 
{
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Summary of Tokens:\n");
    
    printf("Keywords (%d): ", key);
    for (int i = 0; i < key; i++) {printf("%s ", st[0][i]);}printf("\n");
    printf("Identifiers (%d): ", iden);
    for (int i = 0; i < iden; i++) {printf("%s ", st[1][i]);}printf("\n");

    printf("Numbers (%d): ", num);
    for (int i = 0; i < num; i++) {
        printf("%s ", st[2][i]);
    }
    printf("\n");

    printf("Operators (%d): ", oper);
    for (int i = 0; i < oper; i++) {
        printf("%s ", st[3][i]);
    }
    printf("\n");

    printf("Separators (%d): ", sepa);
    for (int i = 0; i < sepa; i++) {
        printf("%s ", st[4][i]);
    }
    printf("\n");

    printf("Delimiters (%d): ", deli);
    for (int i = 0; i < deli; i++) {
        printf("%s ", st[5][i]);
    }
    printf("\n");

    printf("Unidentified tokens (%d): ", other);
    for (int i = 0; i < other; i++) {
        printf("%s ", st[6][i]);
    }
    printf("\n");

    fclose(yyin);
    return 0;
}

/* Required by Lex */
int yywrap() {
    return 1;
}

