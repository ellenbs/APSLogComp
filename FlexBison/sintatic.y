%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sintatic.tab.h"

extern int yylex();
void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%token MAKEUP FINAL_LOOK REPEAT IF IN THEN ELSE DEF 
%token FOUNDATION BLUSH EYESHADOW EYELINER MASCARA LIPSTICK LIPGLOSS LIPBALM 
%token<color> COLOR_IDENTIFIER 
%token<foundation_type> FOUDANTION_IDENTIFIER 
%token<blush_type> BLUSH_IDENTIFIER 
%token<lipstick_type> LIPSTICK_IDENTIFIER 
%token<lipgloss_type> LIPGLOSS_IDENTIFIER 
%token<lipbalm_type> LIPBALM_IDENTIFIER 
%token DIGIT IDENTIFIER LKEY RKEY COLON

%%

program:
    makeup_statement
    | makeup_statement program
    ;

makeup_statement:
    MAKEUP LKEY statement_list RKEY FINAL_LOOK
    ;

statement_list:
    statement
    | statement statement_list
    ;

statement:
    repeat_statement
    | if_statement
    | in_statement
    | def_statement
    ;

repeat_statement:
    REPEAT DIGIT LKEY statement_list RKEY
    ;

if_statement:
    IF IDENTIFIER IN COLOR_IDENTIFIER THEN LKEY statement_list RKEY ELSE LKEY statement_list RKEY
    ;

in_statement:
    IN FOUNDATION COLOR_IDENTIFIER
    | IN BLUSH COLOR_IDENTIFIER
    | IN EYESHADOW COLOR_IDENTIFIER
    | IN EYELINER COLOR_IDENTIFIER
    | IN MASCARA COLOR_IDENTIFIER
    | IN LIPSTICK COLOR_IDENTIFIER
    | IN LIPGLOSS COLOR_IDENTIFIER
    | IN LIPBALM COLOR_IDENTIFIER
    ;

def_statement:
    DEF FOUNDATION COLON FOUDANTION_IDENTIFIER
    | DEF BLUSH COLON BLUSH_IDENTIFIER
    | DEF EYESHADOW COLON COLOR_IDENTIFIER
    | DEF EYELINER COLON COLOR_IDENTIFIER
    | DEF MASCARA COLON COLOR_IDENTIFIER
    | DEF LIPSTICK COLON LIPSTICK_IDENTIFIER
    | DEF LIPGLOSS COLON LIPGLOSS_IDENTIFIER
    | DEF LIPBALM COLON LIPBALM_IDENTIFIER
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char const *s) {
    printf("error: %s\n", s);
}
