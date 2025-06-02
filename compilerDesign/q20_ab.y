%{
    #include <stdio.h>
    #include <stdlib.h>
    int yyerror();
    int yylex();
%}

%token A B NL

%%
stmt: S NL  {printf("Valid String\n");exit(0);};
S: A S B
| ;
%%

int yyerror()
{
    printf("Invalid String\n");exit(0);
}

void main()
{
    printf("Enter a String\n");
    yyparse();
}
