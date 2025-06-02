%{
    #include <stdio.h>
    #include <stdlib.h>
    int yyerror();
    int yylex();
%}

%token NUMBER NL

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
ArithmeticExpression: E NL {printf("\nValid arthimetic expression\n");exit(0);};
E: E'+'E | E'-'E | E'*'E | E'/'E | E'%'E | '('E')' | NUMBER;
%%

int yyerror()
{
    printf("Invalid String\n");exit(0);
}

void main()
{
    printf("Enter a Arithemetic Expression\n");
    yyparse();
}
