%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "syntatic.tab.h"

extern int yylex();
void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%token MAKEUP FINAL_LOOK REPEAT TIMES IF IN THEN ELSE DEF FOUNDATION BLUSH EYESHADOW EYELINER MASCARA LIPSTICK LIPGLOSS LIPBALM
%token COLOR_IDENTIFIER FOUNDATION_IDENTIFIER BLUSH_IDENTIFIER EYESHADOW_IDENTIFIER LIPSTICK_IDENTIFIER LIPGLOSS_IDENTIFIER LIPBALM_IDENTIFIER MASCARA_IDENTIFIER EYELINER_IDENTIFIER
%token DIGIT IDENTIFIER LKEY RKEY COLON FUNCTION_NAME

%start program

%%

program:
    MAKEUP statements FINAL_LOOK { printf("\nParsing complete.\n\n"); }
    ;

statements:
    statement
    | statements statement
    ;

statement:
    foundation_statement
    | blush_statement
    | eyeshadow_statement
    | eyeliner_statement
    | mascara_statement
    | lipstick_statement
    | lipgloss_statement
    | lipbalm_statement
    | if_statement
    | repeat_statement
    ;

foundation_statement:
    FOUNDATION COLON FOUNDATION_IDENTIFIER { printf("\nFound foundation statement.\n\n"); }
    ;

blush_statement:
    BLUSH COLON BLUSH_IDENTIFIER { printf("\nFound blush statement.\n\n"); }
    ;

eyeshadow_statement:
    EYESHADOW COLON COLOR_IDENTIFIER { printf("\nFound eyeshadow statement.\n\n"); }
    ;

eyeliner_statement:
    EYELINER COLON EYELINER_IDENTIFIER { printf("\nFound eyeliner statement.\n\n"); }
    ;

mascara_statement:
    MASCARA COLON MASCARA_IDENTIFIER { printf("\nFound mascara statement.\n\n"); }
    ;

lipstick_statement:
    LIPSTICK COLON LIPSTICK_IDENTIFIER { printf("\nFound lipstick statement.\n\n"); }
    ;

lipgloss_statement:
    LIPGLOSS COLON LIPGLOSS_IDENTIFIER { printf("\nFound lipgloss statement.\n\n"); }
    ;

lipbalm_statement:
    LIPBALM COLON LIPBALM_IDENTIFIER { printf("\nFound lipbalm statement.\n\n"); }
    ;

if_statement:
    IF BLUSH_IDENTIFIER IN BLUSH THEN LKEY statements RKEY ELSE LKEY statements RKEY { printf("\nFound IF statement.\n\n"); }
    | IF FOUNDATION_IDENTIFIER IN FOUNDATION THEN LKEY statements RKEY ELSE LKEY statements RKEY { printf("\nFound IF statement.\n\n"); }
    | IF EYESHADOW_IDENTIFIER IN EYESHADOW THEN LKEY statements RKEY ELSE LKEY statements RKEY { printf("\nFound IF statement.\n\n"); }
    | IF EYELINER_IDENTIFIER IN EYELINER THEN LKEY statements RKEY ELSE LKEY statements RKEY { printf("\nFound IF statement.\n\n"); }
    | IF MASCARA_IDENTIFIER IN MASCARA THEN LKEY statements RKEY ELSE LKEY statements RKEY { printf("\nFound IF statement.\n\n"); }
    | IF LIPSTICK_IDENTIFIER IN LIPSTICK THEN LKEY statements RKEY ELSE LKEY statements RKEY  { printf("\nFound IF statement.\n\n"); }
    | IF LIPGLOSS_IDENTIFIER IN LIPGLOSS THEN LKEY statements RKEY ELSE LKEY statements RKEY  { printf("\nFound IF statement.\n\n"); }
    | IF LIPBALM_IDENTIFIER IN LIPBALM THEN LKEY statements RKEY ELSE LKEY statements RKEY   { printf("\nFound IF statement.\n\n"); }
    ;

repeat_statement:
    REPEAT DIGIT TIMES LKEY statements RKEY { printf("\nFound repeat statement.\n\n"); }
    ;

function_statement:
    DEF FUNCTION_NAME LKEY statements RKEY { printf("\nFound function statement.\n\n"); }
    ;

%%

int main(void) {
    yyparse();
    return 0;
}
