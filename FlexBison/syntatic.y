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
%token DIGIT IDENTIFIER LKEY RKEY COLON

%start program

%%

program:
    MAKEUP statements FINAL_LOOK { printf("Parsing complete.\n"); }
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
    FOUNDATION COLON FOUNDATION_IDENTIFIER { printf("Found foundation statement: %s %s\n", $1, $3); }
    ;

blush_statement:
    BLUSH COLON BLUSH_IDENTIFIER { printf("Found blush statement: %s %s\n", $1, $3); }
    ;

eyeshadow_statement:
    EYESHADOW COLON COLOR_IDENTIFIER { printf("Found eyeshadow statement: %s %s\n", $1, $3); }
    ;

eyeliner_statement:
    EYELINER COLON EYELINER_IDENTIFIER { printf("Found eyeliner statement: %s %s\n", $1, $3); }
    ;

mascara_statement:
    MASCARA COLON MASCARA_IDENTIFIER { printf("Found mascara statement: %s %s\n", $1, $3); }
    ;

lipstick_statement:
    LIPSTICK COLON LIPSTICK_IDENTIFIER { printf("Found lipstick statement: %s %s\n", $1, $3); }
    ;

lipgloss_statement:
    LIPGLOSS COLON LIPGLOSS_IDENTIFIER { printf("Found lipgloss statement: %s %s\n", $1, $3); }
    ;

lipbalm_statement:
    LIPBALM COLON LIPBALM_IDENTIFIER { printf("Found lipbalm statement: %s %s\n", $1, $3); }
    ;

if_statement:
    IF BLUSH_IDENTIFIER IN BLUSH THEN LKEY statements RKEY ELSE LKEY statements RKEY
    | IF FOUNDATION_IDENTIFIER IN FOUNDATION THEN LKEY statements RKEY ELSE LKEY statements RKEY 
    | IF EYESHADOW_IDENTIFIER IN EYESHADOW THEN LKEY statements RKEY ELSE LKEY statements RKEY
    | IF EYELINER_IDENTIFIER IN EYELINER THEN LKEY statements RKEY ELSE LKEY statements RKEY 
    | IF MASCARA_IDENTIFIER IN MASCARA THEN LKEY statements RKEY ELSE LKEY statements RKEY 
    | IF LIPSTICK_IDENTIFIER IN LIPSTICK THEN LKEY statements RKEY ELSE LKEY statements RKEY  
    | IF LIPGLOSS_IDENTIFIER IN LIPGLOSS THEN LKEY statements RKEY ELSE LKEY statements RKEY  
    | IF LIPBALM_IDENTIFIER IN LIPBALM THEN LKEY statements RKEY ELSE LKEY statements RKEY   
    ;

repeat_statement:
    REPEAT DIGIT TIMES LKEY statements RKEY { printf("Found repeat statement.\n"); }
    ;

%%

int main(void) {
    yyparse();
    return 0;
}
