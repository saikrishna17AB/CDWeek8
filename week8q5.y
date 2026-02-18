%{
#include <stdio.h>
#include <stdlib.h>

int width;   /* stores size of type */
int r, c;    /* array dimensions */

void yyerror(const char *s);
int yylex();
%}

%token INT FLOAT ID NUM

%%

D : T ID '[' NUM ']' '[' NUM ']'
    {
        r = $4;
        c = $7;
        printf("Total memory required = %d bytes\n",
                r * c * width);
    }
  ;

T : INT
    {
        width = 4;
    }
  | FLOAT
    {
        width = 8;
    }
  ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter declaration:\n");
    yyparse();
    return 0;
}
