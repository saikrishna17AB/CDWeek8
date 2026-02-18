%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 100

/* symbol table stack */
char *scope_stack[10][MAX];
int top = -1;
int count[10];

/* function declarations */
void push_scope();
void pop_scope();
void insert(char *name);
int lookup(char *name);

void yyerror(const char *s);
int yylex();
%}

%union {
    char *str;
}

%token <str> ID
%token BLOCK_START BLOCK_END

%%

S : S Stmt
  | /* empty */
  ;

Stmt : ID '=' ID ';'
      {
          if(!lookup($3))
              printf("Error: %s undeclared\n", $3);

          insert($1);
      }
     | BLOCK_START
        {
            push_scope();
        }
       S
       BLOCK_END
        {
            pop_scope();
        }
     ;

%%

/* ----- Scope Handling ----- */

void push_scope()
{
    top++;
    count[top] = 0;
}

void pop_scope()
{
    top--;
}

void insert(char *name)
{
    scope_stack[top][count[top]++] = strdup(name);
}

int lookup(char *name)
{
    for(int i = top; i >= 0; i--)
        for(int j = 0; j < count[i]; j++)
            if(strcmp(scope_stack[i][j], name) == 0)
                return 1;
    return 0;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    push_scope();   /* global scope */
    yyparse();
    return 0;
}
