%{
#include<stdio.h>
#include<stdlib.h>      

extern int pos;
int errorflag=0;

void yyerror(const char *s);
int yylex();
%}

%token LP RP

%%

S: '(' S ')' S
 |
 ;

%%

void yyerror(const char *s){
    if(!errorflag){
        printf("Unmatched parenthesis at position %d\n",pos);
        errorflag=1;
    }
}

int main(){
    printf("enter parenthesis:\n");
    yyparse();

    if(!errorflag){
        printf("Parenthesis are balanced");
    }
    return 0;
}
