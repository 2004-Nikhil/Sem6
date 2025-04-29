%{
%}

%s N1 N2 N3 I1 INV 

%%
<INITIAL>[0-9] BEGIN N1;
<INITIAL>[_a-zA-Z] BEGIN I1;
<INITIAL>[^_0-9a-zA-Z\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("Empty\n");}

<N1>[0-9] BEGIN N1;
<N1>[.] BEGIN N2;
<N1>[^0-9\n] BEGIN INV;
<N1>\n {BEGIN INITIAL; printf("Integer\n");}

<N2>[0-9] BEGIN N3;
<N2>[^0-9\n] BEGIN INV;
<N2>\n {BEGIN INITIAL; printf("Invalid number\n");}

<N3>[0-9] BEGIN N3;
<N3>[^0-9\n] BEGIN INV;
<N3>\n {BEGIN INITIAL; printf("Float\n");}

<I1>[_a-zA-Z0-9] BEGIN I1;
<I1>[^_0-9a-zA-Z\n] BEGIN INV;
<I1>\n {BEGIN INITIAL; printf("Identifier\n");}

<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("invalid\n");}

%%
int yywrap(){return 1;}
int main()
{
	yylex();//Design a dfa in lex to identify and print integer and float, constants and identifier
}
