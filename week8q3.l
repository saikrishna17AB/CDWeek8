%{
#include "y.tab.h"
#include<stdlib.h>
%}

%%

[0-9]+      {yylval=atoi(yytext);   return NUM;}
[a-zA-Z]+   {return ID;}
"["         {return '[';}
"]"         {return ']';}
"+"         {return '+';}
[ \t\n]     ;
.           ;

%%

int yywrap(){
    return 1;
}