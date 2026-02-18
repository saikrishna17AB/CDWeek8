%{
#include "y.tab.h"
%}

%%

"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }

"<="        { return LE; }
">="        { return GE; }
"=="        { return EQ; }
"!="        { return NE; }

[0-9]+      { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }

"+"|"-"|"*"|"/"|"="|";"|"("|")"|"{"|"}"|"<"|">"
            { return yytext[0]; }

[ \t\n]     ;
.           ;

%%
