# Linguagem sobre Etapas de Maquiagem

## Feito por:

- Ellen Shen

## EBNF

``` 

DIGIT = ( "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" );

LETTER = ( "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z" | "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" );

PROGRAM =  "makeup gwrm", { STATEMENT , LOOP_STATEMENT, CONDITIONAL, FUNCTION}, , "final look";

STATEMENT = (FACE_LOOP | EYE_LOOP | LIP_LOOP);

TYPE = ("foundation" | "blush" | "eyeshadow" | "eyeliner" | "mascara" | "lipstick" | "lipgloss" | "lipbalm" );

FACE_LOOP = FOUDANTION_STATEMENT, BLUSH_STATEMENT;

EYE_LOOP = EYESHADOW_STATEMENT, EYELINER_STATEMENT, MASCARA_STATEMENT;

LIP_LOOP = LIPSTICK_STATEMENT, LIPGLOSS_STATEMENT, LIPBALM_STATEMENT;

LOOP_STATEMENT = "repeat", DIGIT, "times" { STATEMENT };

CONDITIONAL = "if", COLOR_IDENTIFIER "in", TYPE, "then" , { STATEMENT }, "else" { STATEMENT };

COLOR_IDENTIFIER = ("neutral" | "pink" | "red" | "purple" | "brown" | "glittery");

FUNCTION = "def",  FUNCTION_NAME, "(" , { VARIABLES } , ")" , { STATEMENT };

FUNCTION_NAME = IDENTIFIER;



FOUDANTION_STATEMENT = "foudantion: ", FOUDANTION_IDENTIFIER;

BLUSH_STATEMENT = "blush: ", BLUSH_IDENTIFIER;

EYESHADOW_STATEMENT = "eyeshadow: ", EYESHADOW_IDENTIFIER;

EYELINER_STATEMENT = "eyeliner: ", EYELINER_IDENTIFIER;

MASCARA_STATEMENT = "mascara: ", MASCARA_IDENTIFIER;

LIPSTICK_STATEMENT = "lipstick: ", LIPSTICK_IDENTIFIER;

LIPGLOSS_STATEMENT = "lipgloss: ", LIPGLOSS_IDENTIFIER;

LIPBALM_STATEMENT = "lipbalm: ", LIPBALM_IDENTIFIER;



VARIABLES = COLOR_IDENTIFIER, { "," COLOR_IDENTIFIER };

IDENTIFIER = LETTER, { LETTER | DIGIT | "_" };

FOUDANTION_IDENTIFIER = ("liquid" | "powder" | "bb-cream" | "cc-cream");

BLUSH_IDENTIFIER = COLOR_IDENTIFIER, ("cream" | "blush_powder");

EYESHADOW_IDENTIFIER = COLOR_IDENTIFIER;

EYELINER_IDENTIFIER = ("liquid" | "pencil" | "gel");

MASCARA_IDENTIFIER = ("volumizing" | "lengthening" | "curling");

LIPSTICK_IDENTIFIER = COLOR_IDENTIFIER, ( "matte" | "lipstick_cream" | "satin" );

LIPGLOSS_IDENTIFIER= ("clear" | "colored");

LIPBALM_IDENTIFIER = ("tinted" | "flavored");

```

## Exemplo do uso da linguagem

```
makeup gwrm

makeup gwrm
foudantion: powder
blush: pink cream
eyeshadow: purple
if pink in blush then {
    lipstick: red matte
    }
else{
    lipstick: neutral satin
}
    
repeat 2 times {
    eyeliner: gel
    mascara: lengthening
}

final look

```

```
makeup gwrm

def natural_look(foundation, blush, eyeshadow, mascara, lipstick):
    foundation: foundation
    blush: blush
    eyeshadow: eyeshadow
    eyeliner: liquid
    mascara: mascara
    lipstick: lipstick cream

    if blush in blush then {
        eyeliner: pencil
        eyeshadow: neutral
    }
    else {
        eyeliner: liquid
        eyeshadow: colorful
    }

repeat 2 times {
    natural_look(cc-cream, pink powder, neutral, lengthening, pink satin)
}

final look

```


