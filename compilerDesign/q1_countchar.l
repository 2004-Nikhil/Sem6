%{
	int newlines = 0,spaces = 0,tabs = 0, characters=0;
%}

%%
\n              { newlines++; }
" "             { spaces++; }
\t              { tabs++; }
.               { characters++; }
%%

int yywrap()
{
	return 1;
}
int main() 
{
    yylex();
    printf("Newlines: %d\n", newlines);
    printf("Spaces: %d\n", spaces);
    printf("Tabs: %d\n", tabs);
    printf("Other Charactes: %d\n", characters);
    return 0;
}

