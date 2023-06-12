%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"


%}


%%

[ \t\n]                 ;   
"if"                    { printf("if\n"); return IF; }
"else"                  { printf("else\n"); return ELSE; }
"while"                 { printf("while\n"); return WHILE; }
"item"                  { printf("item\n"); return ITEM;}


"print"                 { printf("print\n"); return PRINT; }
"buy"                   { printf("buy\n"); return BUY; }

"def"                   { printf("function\n"); return FUNCTION; }
"use"                   { printf("function call\n"); return FUNCTION_CALL; }


[a-zA-Z][0-9]+          { printf("Serial Number\n"); return SERIAL; }
[a-zA-Z_][_a-zA-Z0-9]*  { printf("identifier\n"); return IDENTIFIER; }
[0-9]+                  { printf("int\n"); return INTEGER; }
\"(\\.|[^\"\n])*\"      { printf("str\n"); return STRING; }


"+"                     { printf("PLUS\n"); return PLUS; }
"-"                     { printf("MINUS\n"); return MINUS; }
"*"                     { printf("MULT\n"); return MULT; }
"/"                     { printf("DIV\n"); return DIV; }
">"                     { printf("GT\n"); return GT; }
"<"                     { printf("LT\n"); return LT; }
"="                     { printf("EQUAL\n"); return EQUAL; }
"=="                    { printf("EQUAL_TO\n"); return EQUAL_TO; }
"!"                     { printf("NOT\n"); return NOT; }
"&&"                    { printf("AND\n"); return AND; }
"||"                    { printf("OR\n"); return OR; }


"("                     { printf("LPAREN\n"); return LPAREN; }
")"                     { printf("RPAREN\n"); return RPAREN; }
"{"                     { printf("LKEY\n"); return LKEY; }
"}"                     { printf("RKEY\n"); return RKEY; }
":"                     { printf("COLON\n"); return COLON; }
","                     { printf("COMMA\n"); return COMMA; }

.                       printf("Unknown token\n"); yyterminate();


%%