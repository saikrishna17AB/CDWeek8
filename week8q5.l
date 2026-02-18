%{
#include "y.tab.h"
%}

%%

"int"      { return INT; }
"float"    { return FLOAT; }

[0-9]+     { yylval = atoi(yytext); return NUM; }

[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }

"["        { return '['; }
"]"        { return ']'; }

[ \t\n]    ;
.          ;

%%
