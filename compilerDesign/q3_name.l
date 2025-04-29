%{

%}

%%
.*   { printf("Your name is : %s\nmy name is: Nikhil Nawani\n",yytext); }
%%

int yywrap()
{
	return 1;
}

int main() {
    printf("What is your name: ");
    yylex();  // Start the lexical analysis
    return 0;
}


