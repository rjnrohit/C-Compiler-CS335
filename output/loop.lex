Token                 Lexeme                          Line#  Column#
INT                   int                             31     1      
IDENTIFIER            printf                          31     5      
L_PAREN               (                               31     11     
CHAR                  char                            31     12     
IDENTIFIER            s                               31     17     
L_SQBR                [                               31     18     
INT_CONSTANT          50                              31     19     
R_SQBR                ]                               31     21     
R_PAREN               )                               31     22     
SEMI_COLON            ;                               31     23     
INT                   int                             32     1      
IDENTIFIER            printf1                         32     5      
L_PAREN               (                               32     12     
CHAR                  char                            32     13     
IDENTIFIER            s                               32     18     
L_SQBR                [                               32     19     
INT_CONSTANT          50                              32     20     
R_SQBR                ]                               32     22     
COMMA                 ,                               32     23     
INT                   int                             32     24     
IDENTIFIER            a                               32     28     
R_PAREN               )                               32     29     
SEMI_COLON            ;                               32     30     
INT                   int                             34     1      
IDENTIFIER            main                            34     5      
L_PAREN               (                               34     9      
R_PAREN               )                               34     10     
L_BRACES              {                               34     11     
INT                   int                             35     5      
IDENTIFIER            i                               35     9      
ASSIGNMENT            =                               35     11     
INT_CONSTANT          0                               35     13     
SEMI_COLON            ;                               35     14     
FOR                   for                             37     5      
L_PAREN               (                               37     8      
SEMI_COLON            ;                               37     9      
SEMI_COLON            ;                               37     10     
R_PAREN               )                               37     11     
L_BRACES              {                               37     12     
IDENTIFIER            i                               38     9      
INCREMENT             ++                              38     10     
SEMI_COLON            ;                               38     12     
IF                    if                              39     9      
L_PAREN               (                               39     11     
IDENTIFIER            i                               39     12     
LESS                  <                               39     13     
INT_CONSTANT          5                               39     14     
R_PAREN               )                               39     15     
CONTINUE              continue                        39     17     
SEMI_COLON            ;                               39     25     
IF                    if                              40     9      
L_PAREN               (                               40     11     
IDENTIFIER            i                               40     12     
GREATER               >                               40     13     
INT_CONSTANT          10                              40     14     
R_PAREN               )                               40     16     
BREAK                 break                           40     18     
SEMI_COLON            ;                               40     23     
IDENTIFIER            printf1                         41     9      
L_PAREN               (                               41     16     
STR_CONSTANT          "%ld "                          41     17     
COMMA                 ,                               41     23     
IDENTIFIER            i                               41     24     
R_PAREN               )                               41     25     
SEMI_COLON            ;                               41     26     
R_BRACES              }                               42     5      
IDENTIFIER            printf                          43     5      
L_PAREN               (                               43     11     
STR_CONSTANT          "\n"                            43     12     
R_PAREN               )                               43     16     
SEMI_COLON            ;                               43     17     
WHILE                 while                           46     5      
L_PAREN               (                               46     10     
TRUE                  true                            46     11     
R_PAREN               )                               46     15     
L_BRACES              {                               46     16     
DO                    do                              48     9      
L_BRACES              {                               48     11     
IF                    if                              49     13     
L_PAREN               (                               49     15     
LOGICAL_NOT           !                               49     16     
L_PAREN               (                               49     17     
IDENTIFIER            i                               49     18     
MODULUS               %                               49     19     
INT_CONSTANT          5                               49     20     
R_PAREN               )                               49     21     
R_PAREN               )                               49     22     
BREAK                 break                           49     24     
SEMI_COLON            ;                               49     29     
R_BRACES              }                               50     9      
WHILE                 while                           50     10     
L_PAREN               (                               50     15     
IDENTIFIER            i                               50     16     
INCREMENT             ++                              50     17     
R_PAREN               )                               50     19     
SEMI_COLON            ;                               50     20     
IDENTIFIER            printf1                         52     9      
L_PAREN               (                               52     16     
STR_CONSTANT          "%ld "                          52     17     
COMMA                 ,                               52     23     
IDENTIFIER            i                               52     24     
R_PAREN               )                               52     25     
SEMI_COLON            ;                               52     26     
IF                    if                              53     9      
L_PAREN               (                               53     11     
LOGICAL_NOT           !                               53     12     
L_PAREN               (                               53     13     
IDENTIFIER            i                               53     14     
MODULUS               %                               53     15     
INT_CONSTANT          7                               53     16     
R_PAREN               )                               53     17     
R_PAREN               )                               53     18     
L_BRACES              {                               53     19     
IDENTIFIER            printf                          54     13     
L_PAREN               (                               54     19     
STR_CONSTANT          "\n"                            54     20     
R_PAREN               )                               54     24     
SEMI_COLON            ;                               54     25     
BREAK                 break                           55     13     
SEMI_COLON            ;                               55     18     
R_BRACES              }                               56     9      
IDENTIFIER            i                               57     9      
INCREMENT             ++                              57     10     
SEMI_COLON            ;                               57     12     
R_BRACES              }                               58     5      
R_BRACES              }                               59     1      