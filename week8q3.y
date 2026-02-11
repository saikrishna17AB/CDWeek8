%{
#include<stdio.h>
#include<stdlib.h>
int base=1000;
int width=4;

void yyerror(const char *s);
int yylex();
%}

%token ID NUM

%%

S : ID '[' E ']'
    {
        int addr=base+($3*width);
        printf("Effective address = %d\n",addr);
    }
    ;

E : E '+' T 
    {
        $$=$1+$3;
    }
    | T
    {
        $$ = $1;
    }
  ;

T : NUM
    {
        $$ = $1;
    }
  | ID
    {
        $$ = 1;   /* assumed value of id */
    }
  ;

%%

void yyerror(const char *s)
{
    printf("Invalid expression\n");
}

int main()
{
    printf("Enter expression (example: A[3+2]):\n");
    yyparse();
    return 0;
}