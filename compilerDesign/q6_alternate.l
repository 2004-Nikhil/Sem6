%{
    #include <stdio.h>
    int flag = 0;
%}

%%
[0-9a-zA-Z]    { 
                    if (flag) {
                        printf("%c", yytext[0]); 
                    }
                    flag = !flag; 
                }
.               ; 
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();  // Start lexing
    return 0;
}

