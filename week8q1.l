%{
#include "y.tab.h"
%}

%%

[0-9a-zA-Z]+   { printf("%s ", yytext); return ID; }  // print operand

"+"             { return '+'; }
"*"             { return '*'; }
"^"             { return '^'; }
"("             { return '('; }
")"             { return ')'; }

[ \t\n]         ;     // ignore spaces

.               { return yytext[0]; }

%%

int yywrap()
{
    return 1;
}
