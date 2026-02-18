%{
#include "y.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }
","                      { return ','; }
"("                      { return '('; }
")"                      { return ')'; }
[ \t\n]                  ;
.                        ;

%%
