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
ArithmeticExpression: E NL {printf("\nValid and result is %d\n",$$);exit(0);};

E: E'+'E  {$$ = $1 + $3;}
|  E'-'E  {$$ = $1 - $3;}
|  E'*'E  {$$ = $1 * $3;}
|  E'/'E  {$$ = $1 / $3;}
|  E'%'E  {$$ = $1 % $3;}
|  '('E')'  {$$ = $2;}
| NUMBER {$$=$1;};
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
