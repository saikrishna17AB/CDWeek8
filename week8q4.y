%{
#include <stdio.h>
#include <stdlib.h>

int count = 0;

void yyerror(const char *s);
int yylex();
%}

/* Tokens */
%token ID

%%

F : ID '(' A ')'
    {
        printf("Number of arguments = %d\n", count);
    }
  ;

A : A ',' ID
    {
        count++;
    }
  | ID
    {
        count = 1;
    }
  | /* empty */
    {
        count = 0;
    }
  ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter function call:\n");
    yyparse();
    return 0;
}
