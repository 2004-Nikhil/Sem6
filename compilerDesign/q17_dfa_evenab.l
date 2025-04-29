%{
%}

%s OA OB OAB INV

%%
<INITIAL>a BEGIN OA;
<INITIAL>b BEGIN OB;
<INITIAL>[^a|^b|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("Accepted\n");}

<OA>a BEGIN INITIAL;
<OA>b BEGIN OAB;
<OA>[^a|^b|^\n] BEGIN INV;
<OA>\n {BEGIN INITIAL; printf("not Accepted\n");}

<OB>a BEGIN OAB;
<OB>b BEGIN INITIAL;
<OB>[^a|^b|^\n] BEGIN INV;
<OB>\n {BEGIN INITIAL; printf("not Accepted\n");}

<OAB>a BEGIN OB;
<OAB>b BEGIN OA;
<OAB>[^a|^b|^\n] BEGIN INV;
<OAB>\n {BEGIN INITIAL; printf("not Accepted\n");}

<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("invalid\n");}

%%
int yywrap(){return 1;}
int main()
{
	yylex();//Design a dfa in lex to accept even a and even b
}
