%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

/* Tokens */
%token ID NUM IF ELSE WHILE
%token LE GE EQ NE

/* Operator precedence */
%left '+' '-'
%left '*' '/'
%left '<' '>' LE GE EQ NE

%%

program : stmt_list
        ;

stmt_list : stmt_list stmt
          | /* empty */
          ;

stmt : ID '=' expr ';'
     | IF '(' expr ')' stmt
     | IF '(' expr ')' stmt ELSE stmt
     | WHILE '(' expr ')' stmt
     | '{' stmt_list '}'
     ;

expr : expr '+' expr
     | expr '-' expr
     | expr '*' expr
     | expr '/' expr
     | expr '<' expr
     | expr '>' expr
     | expr LE expr
     | expr GE expr
     | expr EQ expr
     | expr NE expr
     | '(' expr ')'
     | ID
     | NUM
     ;

%%

void yyerror(const char *s)
{
    printf("Syntax Error: %s\n", s);
}

int main()
{
    printf("Enter program:\n");
    yyparse();
    printf("Parsing completed successfully\n");
    return 0;
}
