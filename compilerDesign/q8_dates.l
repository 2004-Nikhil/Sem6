%{
#include<stdio.h>
int l , year , day;
%}

%%
^([0][1-9]|[1-2][0-9]|3[0-1])[-/](01|03|05|07|08|10|12)[-/][0-9]{4}   { printf("Valid date with 31 days: %s\n", yytext); }

^([0][1-9]|[1-2][0-9]|30)[-/](04|06|09|11)[-/][0-9]{4}       { printf("Valid date with 30 days: %s\n", yytext); }


^([0][1-9]|[1-2][0-9])[-/]02[-/][0-9]{4} {
        l = yyleng;
        year = 0;
        day = 0;
        for(int i = l-4;i<=l-1;i++) year = year * 10 + (yytext[i]-'0');
        for(int i=0;i<2;i++) day = day * 10  + (yytext[i]-'0');
        if((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)){
                if(day<=29) printf("Valid date for feb leap year");
                else printf("InValid date for feb");
        }
        else if(day<=28) printf("Valid date for feb non leap year");
        else printf("InValid date for feb");
}

.*      { printf("Invalid date: %s\n", yytext); }
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();

}
