%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token ID

%%

E : E '+' T    { printf("+ "); }
  | T
  ;

T : T '*' F    { printf("* "); }
  | F
  ;

F : P '^' F    { printf("^ "); }
  | P
  ;

P : '(' E ')'
  | ID
  ;

%%

void yyerror(const char *s){
    printf("Syntax Error\n");
}

int main(){
    printf("Enter expression:\n");
    yyparse();
    printf("\nPostfix generated\n");
    return 0;
}
