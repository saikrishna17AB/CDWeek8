%{
#include "y.tab.h"
#include<stdio.h>

int pos=0;
%}

%%

"("     {pos++; return '(';}
")"     {pos++; return ')';}

\n      {return 0;}
[ \t]   ;

.   {pos++; return yytext[0];}

%%

int yywrap(){
    return 1;
}
