%{
%}

%s AAA AAB ABA ABB BAA BAB BBA BBB INV

%%
<INITIAL>a BEGIN BBA;
<INITIAL>b BEGIN BBB;
<INITIAL>[^a|^b|^\n] BEGIN INV;
<INITIAL>\n {BEGIN INITIAL; printf("not Accepted\n");}

<AAA>a { BEGIN AAA; }           
<AAA>b { BEGIN AAB; }           
<AAA>[^a|^b|^\n] { BEGIN INV; }
<AAA>\n { BEGIN INITIAL; printf("Accepted\n"); }

<AAB>a { BEGIN ABA; }           
<AAB>b { BEGIN ABB; }          
<AAB>[^a|^b|^\n] { BEGIN INV; }
<AAB>\n { BEGIN INITIAL; printf("Accepted\n"); }

<ABA>a { BEGIN BAA; }           
<ABA>b { BEGIN BAB; }           
<ABA>[^a|^b|^\n] { BEGIN INV; }
<ABA>\n { BEGIN INITIAL; printf("Accepted\n"); }

<ABB>a { BEGIN BBA; }           
<ABB>b { BEGIN BBB; }           
<ABB>[^a|^b|^\n] { BEGIN INV; }
<ABB>\n { BEGIN INITIAL; printf("Accepted\n"); }

<BAA>a { BEGIN AAA; }           
<BAA>b { BEGIN AAB; }           
<BAA>[^a|^b|^\n] { BEGIN INV; }
<BAA>\n { BEGIN INITIAL; printf("not Accepted\n"); }

<BAB>a { BEGIN ABA; }           
<BAB>b { BEGIN ABB; }           
<BAB>[^a|^b|^\n] { BEGIN INV; }
<BAB>\n { BEGIN INITIAL; printf("not Accepted\n"); }

<BBA>a { BEGIN BAA; }           
<BBA>b { BEGIN BAB; }           
<BBA>[^a|^b|^\n]  { BEGIN INV; }
<BBA>\n { BEGIN INITIAL; printf("not Accepted\n"); }

<BBB>a { BEGIN BBA; }           
<BBB>b { BEGIN BBB; }           
<BBB>[^a|^b|^\n]  { BEGIN INV; }
<BBB>\n { BEGIN INITIAL; printf("not Accepted\n"); }


<INV>[^\n] BEGIN INV;
<INV>\n {BEGIN INITIAL; printf("invalid\n");}

%%
int yywrap(){return 1;}
int main()
{
	yylex();//Design a dfa in lex to accept strings with a at third last position
}
