%{
int num=0,ch=0,tot=0;
%}

%%
[a-zA-Z]        { ch++; tot++; }
[0-9]           { num++;tot++; }
.		;
%%

int yywrap()
{
	return 1;
}
int main() 
{
    yylex();
    printf("Alphabets: %d\n", ch);
    printf("Numbers: %d\n", num);
    printf("Total: %d\n", tot);
    return 0;
}

