Token                 Lexeme                          Line#  Column#
INT                   int                             37     1      
IDENTIFIER            printf                          37     5      
L_PAREN               (                               37     11     
CHAR                  char                            37     12     
IDENTIFIER            s                               37     17     
L_SQBR                [                               37     18     
INT_CONSTANT          20                              37     19     
R_SQBR                ]                               37     21     
COMMA                 ,                               37     22     
INT                   int                             37     23     
IDENTIFIER            a                               37     27     
R_PAREN               )                               37     28     
SEMI_COLON            ;                               37     29     
INT                   int                             38     1      
IDENTIFIER            printf1                         38     5      
L_PAREN               (                               38     12     
CHAR                  char                            38     13     
IDENTIFIER            s                               38     18     
L_SQBR                [                               38     19     
INT_CONSTANT          200                             38     20     
R_SQBR                ]                               38     23     
R_PAREN               )                               38     24     
SEMI_COLON            ;                               38     25     
INT                   int                             39     1      
IDENTIFIER            scanf                           39     5      
L_PAREN               (                               39     10     
CHAR                  char                            39     11     
IDENTIFIER            s                               39     16     
L_SQBR                [                               39     17     
INT_CONSTANT          20                              39     18     
R_SQBR                ]                               39     20     
COMMA                 ,                               39     21     
INT                   int                             39     22     
MULTIPLY              *                               39     26     
IDENTIFIER            a                               39     27     
R_PAREN               )                               39     28     
SEMI_COLON            ;                               39     29     
VOID                  void                            40     1      
IDENTIFIER            puts                            40     6      
L_PAREN               (                               40     10     
CHAR                  char                            40     11     
MULTIPLY              *                               40     15     
IDENTIFIER            str                             40     16     
R_PAREN               )                               40     19     
SEMI_COLON            ;                               40     20     
INT                   int                             42     1      
IDENTIFIER            main                            42     5      
L_PAREN               (                               42     9      
R_PAREN               )                               42     10     
L_BRACES              {                               42     11     
INT                   int                             43     5      
IDENTIFIER            n                               43     9      
SEMI_COLON            ;                               43     10     
IDENTIFIER            printf1                         44     5      
L_PAREN               (                               44     12     
STR_CONSTANT          "enter a integer: "             44     13     
R_PAREN               )                               44     32     
SEMI_COLON            ;                               44     33     
IDENTIFIER            scanf                           45     5      
L_PAREN               (                               45     10     
STR_CONSTANT          "%ld"                           45     11     
COMMA                 ,                               45     16     
BITWISE_AND           &                               45     18     
IDENTIFIER            n                               45     19     
R_PAREN               )                               45     20     
SEMI_COLON            ;                               45     21     
IF                    if                              46     5      
L_PAREN               (                               46     7      
IDENTIFIER            n                               46     8      
MODULUS               %                               46     9      
INT_CONSTANT          2                               46     10     
EQUALS                ==                              46     11     
INT_CONSTANT          0                               46     13     
R_PAREN               )                               46     14     
L_BRACES              {                               46     15     
IDENTIFIER            printf1                         47     9      
L_PAREN               (                               47     16     
STR_CONSTANT          "given number is even\n"        47     17     
R_PAREN               )                               47     41     
SEMI_COLON            ;                               47     42     
IF                    if                              48     9      
L_PAREN               (                               48     11     
IDENTIFIER            n                               48     12     
MODULUS               %                               48     13     
INT_CONSTANT          3                               48     14     
EQUALS                ==                              48     15     
INT_CONSTANT          0                               48     17     
R_PAREN               )                               48     18     
L_BRACES              {                               48     19     
IDENTIFIER            puts                            49     13     
L_PAREN               (                               49     17     
STR_CONSTANT          "given no is divisible by 2,3"  49     18     
R_PAREN               )                               49     48     
SEMI_COLON            ;                               49     49     
IF                    if                              50     13     
L_PAREN               (                               50     15     
IDENTIFIER            n                               50     16     
MODULUS               %                               50     17     
INT_CONSTANT          5                               50     18     
EQUALS                ==                              50     19     
INT_CONSTANT          0                               50     21     
R_PAREN               )                               50     22     
L_BRACES              {                               50     23     
IDENTIFIER            puts                            51     17     
L_PAREN               (                               51     21     
STR_CONSTANT          "given no is divisible by 2,3,5"  51     22     
R_PAREN               )                               51     54     
SEMI_COLON            ;                               51     55     
IF                    if                              52     17     
L_PAREN               (                               52     19     
IDENTIFIER            n                               52     20     
MODULUS               %                               52     21     
INT_CONSTANT          7                               52     22     
EQUALS                ==                              52     23     
INT_CONSTANT          0                               52     25     
R_PAREN               )                               52     26     
L_BRACES              {                               52     27     
IDENTIFIER            puts                            53     21     
L_PAREN               (                               53     25     
STR_CONSTANT          "given no is divisible by 2,3,5,7"  53     26     
R_PAREN               )                               53     60     
SEMI_COLON            ;                               53     61     
IF                    if                              54     21     
L_PAREN               (                               54     23     
IDENTIFIER            n                               54     24     
MODULUS               %                               54     25     
INT_CONSTANT          11                              54     26     
EQUALS                ==                              54     28     
INT_CONSTANT          0                               54     30     
R_PAREN               )                               54     31     
L_BRACES              {                               54     32     
IDENTIFIER            printf1                         55     25     
L_PAREN               (                               55     32     
STR_CONSTANT          "given no is divisible by 2,3,5,7,11\n"  55     33     
R_PAREN               )                               55     72     
SEMI_COLON            ;                               55     73     
R_BRACES              }                               56     21     
ELSE                  else                            56     22     
L_BRACES              {                               56     26     
IDENTIFIER            printf1                         57     25     
L_PAREN               (                               57     32     
STR_CONSTANT          "given no is div by 2,3,5,7 but not by 11\n"  57     33     
R_PAREN               )                               57     77     
SEMI_COLON            ;                               57     78     
R_BRACES              }                               58     21     
R_BRACES              }                               59     17     
ELSE                  else                            59     18     
L_BRACES              {                               59     22     
IDENTIFIER            puts                            60     21     
L_PAREN               (                               60     25     
STR_CONSTANT          "given no is div by 2,3,5 but not by 7"  60     26     
R_PAREN               )                               60     65     
SEMI_COLON            ;                               60     66     
R_BRACES              }                               61     17     
R_BRACES              }                               62     13     
ELSE                  else                            62     14     
L_BRACES              {                               62     18     
IDENTIFIER            puts                            63     17     
L_PAREN               (                               63     21     
STR_CONSTANT          "given no is div by 2,3 but not by 5"  63     22     
R_PAREN               )                               63     59     
SEMI_COLON            ;                               63     60     
R_BRACES              }                               64     13     
R_BRACES              }                               65     9      
ELSE                  else                            65     10     
L_BRACES              {                               65     14     
IDENTIFIER            puts                            66     13     
L_PAREN               (                               66     17     
STR_CONSTANT          "given no is div by 2 but not by 3"  66     18     
R_PAREN               )                               66     53     
SEMI_COLON            ;                               66     54     
R_BRACES              }                               67     9      
R_BRACES              }                               68     5      
ELSE                  else                            68     6      
L_BRACES              {                               68     10     
IDENTIFIER            printf1                         69     9      
L_PAREN               (                               69     16     
STR_CONSTANT          "given number is odd\n"         69     17     
R_PAREN               )                               69     40     
SEMI_COLON            ;                               69     41     
R_BRACES              }                               70     5      
R_BRACES              }                               71     1      