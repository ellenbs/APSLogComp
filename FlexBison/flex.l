%{
#include <stdio.h>
#include <stdlib.h>
#include "sintatic.tab.h"
%}

%%

[ \t\n]                 ;

"makeup gwrm"           { printf("MAKEUP\n"); return MAKEUP;}
"final look"            { printf("FINAL_LOOK\n"); return FINAL_LOOK;}

"repeat"                { printf("REPEAT\n"); return REPEAT;}
"times"			{ printf("TIMES\n"); return TIMES;}
"if"                    { printf("IF\n"); return IF;}
"in"                    { printf("IN\n"); return IN;}
"then"                  { printf("THEN\n"); return THEN;}
"else"                  { printf("ELSE\n"); return ELSE;}
"def"                   { printf("DEF\n"); return DEF;}

"foundation"           { printf("FOUNDATION\n"); return FOUNDATION;}
"blush"                { printf("BLUSH\n"); return BLUSH;}
"eyeshadow"            { printf("EYESHADOW\n"); return EYESHADOW;}
"eyeliner"             { printf("EYELINER\n"); return EYELINER;}
"mascara"              { printf("MASCARA\n"); return MASCARA;}
"lipstick"             { printf("LIPSTICK\n"); return LIPSTICK;}
"lipgloss"             { printf("LIPGLOSS\n"); return LIPGLOSS;}
"lipbalm"              { printf("LIPBALM\n"); return LIPBALM;}

"neutral"               { printf("neutral\n"); return COLOR_IDENTIFIER; }
"pink"                  { printf("pink\n"); return COLOR_IDENTIFIER; }
"red"                   { printf("red\n"); return COLOR_IDENTIFIER; }
"purple"                { printf("purple\n"); return COLOR_IDENTIFIER; }
"brown"                 { printf("brown\n"); return COLOR_IDENTIFIER; }
"glittery"              { printf("glittery\n"); return COLOR_IDENTIFIER; }

"fliquid"               { printf("fliquid\n"); return FOUDANTION_IDENTIFIER; }
"fpowder"               { printf("fpowder\n"); return FOUDANTION_IDENTIFIER; }
"fbbcream"              { printf("fbbcream\n"); return FOUDANTION_IDENTIFIER; }
"fcccream"              { printf("fcccream\n"); return FOUDANTION_IDENTIFIER; }

"bcream"                { printf("bcream\n"); return BLUSH_IDENTIFIER; }
"bpowder"               { printf("bpowder\n"); return BLUSH_IDENTIFIER; }

"lpmatte"               { printf("lpmatte\n"); return LIPSTICK_IDENTIFIER; }
"lpcream"               { printf("lpcream\n"); return LIPSTICK_IDENTIFIER; }
"lpsatin"               { printf("lpsatin\n"); return LIPSTICK_IDENTIFIER; }

"lgclear"               { printf("lgclear\n"); return LIPGLOSS_IDENTIFIER; }
"lgcolored"             { printf("colored\n"); return LIPGLOSS_IDENTIFIER; }

"lbtinted"              { printf("lbcolored\n"); return LIPBALM_IDENTIFIER; }
"lbflavored"            { printf("lbflavored\n"); return LIPBALM_IDENTIFIER; }

"liquid"                { printf("liquid\n"); return EYELINER_IDENTIFIER; }
"pencil"                { printf("pencil\n"); return EYELINER_IDENTIFIER; }
"gel"                   { printf("gel\n"); return EYELINER_IDENTIFIER; }

"volumizing"            { printf("volumizing\n"); return MASCARA_IDENTIFIER; }
"lengthening"           { printf("lengthening\n"); return MASCARA_IDENTIFIER; }
"curling"               { printf("curling\n"); return MASCARA_IDENTIFIER; }

[0-9]+                  { printf("DIGIT\n"); return DIGIT; }
[a-zA-Z][a-zA-Z0-9_]*   { printf("IDENTIFIER\n"); return IDENTIFIER; }

"{"                     { printf("LKEY\n"); return LKEY; }
"}"                     { printf("RKEY\n"); return RKEY; }
":"                     { printf("COLON\n"); return COLON; }

.                       printf("Unknown token!\n"); yyterminate();

%%
