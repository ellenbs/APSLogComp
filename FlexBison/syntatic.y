%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  extern int yylex();
  void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%token IDENTIFIER STRING INTEGER SERIAL BUY ITEM
%token IF ELSE WHILE PRINT FUNCTION FUNCTION_CALL
%token MINUS MULT EQUAL NOT PLUS DIV AND OR
%token LPAREN RPAREN LKEY RKEY COMMA COLON
%token EQUAL_TO GT LT

%start program

%%

program : statement_list 
        ;

block : LKEY statement_list RKEY
      | LKEY RKEY
      ;
        
statement_list : statement
               | statement_list statement
               ;
        
statement : ITEM IDENTIFIER COLON relexpression
          | IDENTIFIER EQUAL relexpression
          | PRINT LPAREN print_list RPAREN
          | IF LPAREN relexpression RPAREN block
          | IF LPAREN relexpression RPAREN block ELSE block
          | WHILE LPAREN relexpression RPAREN block 
          | FUNCTION IDENTIFIER LPAREN parameter_list RPAREN block
          | FUNCTION_CALL IDENTIFIER LPAREN parameter_list RPAREN
          | BUY relexpression
          ;

parameter_list : IDENTIFIER
               | parameter_list COMMA IDENTIFIER
               ;

print_list : relexpression
           | print_list COMMA relexpression
           ;

relexpression: expression EQUAL_TO expression
             | expression GT expression
             | expression LT expression
             | expression
             ;

expression: term PLUS term
          | term MINUS term
          | term OR term
          | term
          ;
          
term: factor
    | term MULT factor
    | term DIV factor
    | term AND factor
    ;

factor: INTEGER 
    | STRING 
    | SERIAL
    | IDENTIFIER 
    | PLUS factor
    | MINUS factor
    | NOT factor
    | LPAREN relexpression RPAREN
    ;


%%

int main(){
  yyparse();
  return 0;
}
