%{
%}

%s A B INV

%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN B;
<INITIAL>[^0|^1|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("not Accepted\n");}

<A>0 BEGIN A;
<A>1 BEGIN A;
<A>[^0|^1|^\n] BEGIN INV;
<A>\n {BEGIN INITIAL; printf("Accepted\n");}

<B>0 BEGIN B;
<B>1 BEGIN B;
<B>[^0|^1|^\n] BEGIN INV;
<B>\n {BEGIN INITIAL; printf("not Accepted\n");}

<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("invalid\n");}

%%
int yywrap(){return 1;}
int main()
{
	yylex();//Design a dfa in lex to accept all string starting with 1
}
