%{
#include "y.tab.h"
#include <string.h>
%}

%%

"{"             { return BLOCK_START; }
"}"             { return BLOCK_END; }

[a-zA-Z_][a-zA-Z0-9_]*   {
                            yylval.str = strdup(yytext);
                            return ID;
                         }

"="             { return '='; }
";"             { return ';'; }

[ \t\n]         ;
.               ;

%%
