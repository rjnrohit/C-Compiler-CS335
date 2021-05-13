Token                 Lexeme                          Line#  Column#
INT                   int                             62     1      
IDENTIFIER            printf                          62     5      
L_PAREN               (                               62     11     
CHAR                  char                            62     12     
IDENTIFIER            s                               62     17     
L_SQBR                [                               62     18     
INT_CONSTANT          20                              62     19     
R_SQBR                ]                               62     21     
COMMA                 ,                               62     22     
INT                   int                             62     23     
IDENTIFIER            a                               62     27     
R_PAREN               )                               62     28     
SEMI_COLON            ;                               62     29     
INT                   int                             63     1      
IDENTIFIER            printf1                         63     5      
L_PAREN               (                               63     12     
CHAR                  char                            63     13     
IDENTIFIER            s                               63     18     
L_SQBR                [                               63     19     
INT_CONSTANT          20                              63     20     
R_SQBR                ]                               63     22     
R_PAREN               )                               63     23     
SEMI_COLON            ;                               63     24     
INT                   int                             64     1      
IDENTIFIER            printf2                         64     5      
L_PAREN               (                               64     12     
CHAR                  char                            64     13     
IDENTIFIER            s                               64     18     
L_SQBR                [                               64     19     
INT_CONSTANT          20                              64     20     
R_SQBR                ]                               64     22     
COMMA                 ,                               64     23     
INT                   int                             64     24     
IDENTIFIER            a                               64     28     
COMMA                 ,                               64     29     
INT                   int                             64     30     
IDENTIFIER            b                               64     34     
R_PAREN               )                               64     35     
SEMI_COLON            ;                               64     36     
INT                   int                             65     1      
IDENTIFIER            scanf                           65     5      
L_PAREN               (                               65     10     
CHAR                  char                            65     11     
IDENTIFIER            s                               65     16     
L_SQBR                [                               65     17     
INT_CONSTANT          20                              65     18     
R_SQBR                ]                               65     20     
COMMA                 ,                               65     21     
INT                   int                             65     22     
MULTIPLY              *                               65     26     
IDENTIFIER            a                               65     27     
R_PAREN               )                               65     28     
SEMI_COLON            ;                               65     29     
VOID                  void                            68     1      
IDENTIFIER            dfs                             68     6      
L_PAREN               (                               68     9      
INT                   int                             68     10     
IDENTIFIER            adj                             68     14     
L_SQBR                [                               68     17     
INT_CONSTANT          11                              68     18     
R_SQBR                ]                               68     20     
L_SQBR                [                               68     21     
INT_CONSTANT          11                              68     22     
R_SQBR                ]                               68     24     
COMMA                 ,                               68     25     
INT                   int                             68     26     
IDENTIFIER            visited                         68     30     
L_SQBR                [                               68     37     
INT_CONSTANT          11                              68     38     
R_SQBR                ]                               68     40     
COMMA                 ,                               68     41     
INT                   int                             68     42     
IDENTIFIER            u                               68     46     
COMMA                 ,                               68     47     
INT                   int                             68     48     
IDENTIFIER            n                               68     52     
COMMA                 ,                               68     53     
INT                   int                             68     54     
IDENTIFIER            p                               68     58     
R_PAREN               )                               68     59     
L_BRACES              {                               68     60     
IF                    if                              69     5      
L_PAREN               (                               69     8      
IDENTIFIER            p                               69     9      
EQUALS                ==                              69     11     
SUBSTRACT             -                               69     14     
INT_CONSTANT          1                               69     15     
R_PAREN               )                               69     16     
IDENTIFIER            printf                          69     18     
L_PAREN               (                               69     24     
STR_CONSTANT          "Node %ld: new tree\n"          69     25     
COMMA                 ,                               69     47     
IDENTIFIER            u                               69     48     
ADD                   +                               69     49     
INT_CONSTANT          1                               69     50     
R_PAREN               )                               69     51     
SEMI_COLON            ;                               69     52     
ELSE                  else                            70     5      
IDENTIFIER            printf2                         70     10     
L_PAREN               (                               70     17     
STR_CONSTANT          "Node %ld: Parent: %ld\n"       70     18     
COMMA                 ,                               70     43     
IDENTIFIER            u                               70     44     
ADD                   +                               70     45     
INT_CONSTANT          1                               70     46     
COMMA                 ,                               70     47     
IDENTIFIER            p                               70     48     
ADD                   +                               70     49     
INT_CONSTANT          1                               70     50     
R_PAREN               )                               70     51     
SEMI_COLON            ;                               70     52     
INT                   int                             72     5      
IDENTIFIER            i                               72     9      
SEMI_COLON            ;                               72     10     
FOR                   for                             73     5      
L_PAREN               (                               73     8      
IDENTIFIER            i                               73     9      
ASSIGNMENT            =                               73     11     
INT_CONSTANT          0                               73     13     
SEMI_COLON            ;                               73     14     
IDENTIFIER            i                               73     15     
LESS                  <                               73     16     
IDENTIFIER            n                               73     17     
SEMI_COLON            ;                               73     18     
IDENTIFIER            i                               73     19     
INCREMENT             ++                              73     20     
R_PAREN               )                               73     22     
L_BRACES              {                               73     23     
IF                    if                              74     9      
L_PAREN               (                               74     11     
IDENTIFIER            adj                             74     12     
L_SQBR                [                               74     15     
IDENTIFIER            u                               74     16     
R_SQBR                ]                               74     17     
L_SQBR                [                               74     18     
IDENTIFIER            i                               74     19     
R_SQBR                ]                               74     20     
EQUALS                ==                              74     22     
INT_CONSTANT          1                               74     25     
LOGICAL_AND           &&                              74     27     
IDENTIFIER            visited                         74     30     
L_SQBR                [                               74     37     
IDENTIFIER            i                               74     38     
R_SQBR                ]                               74     39     
EQUALS                ==                              74     41     
INT_CONSTANT          0                               74     44     
R_PAREN               )                               74     45     
L_BRACES              {                               74     46     
IDENTIFIER            visited                         75     13     
L_SQBR                [                               75     20     
IDENTIFIER            i                               75     21     
R_SQBR                ]                               75     22     
ASSIGNMENT            =                               75     24     
INT_CONSTANT          1                               75     26     
SEMI_COLON            ;                               75     27     
IDENTIFIER            dfs                             76     13     
L_PAREN               (                               76     16     
IDENTIFIER            adj                             76     17     
COMMA                 ,                               76     20     
IDENTIFIER            visited                         76     21     
COMMA                 ,                               76     28     
IDENTIFIER            i                               76     29     
COMMA                 ,                               76     30     
IDENTIFIER            n                               76     31     
COMMA                 ,                               76     32     
IDENTIFIER            u                               76     33     
R_PAREN               )                               76     34     
SEMI_COLON            ;                               76     35     
R_BRACES              }                               77     9      
R_BRACES              }                               78     5      
R_BRACES              }                               79     1      
INT                   int                             81     1      
IDENTIFIER            main                            81     5      
L_PAREN               (                               81     9      
R_PAREN               )                               81     10     
L_BRACES              {                               81     11     
INT                   int                             82     5      
IDENTIFIER            adj                             82     9      
L_SQBR                [                               82     12     
INT_CONSTANT          11                              82     13     
R_SQBR                ]                               82     15     
L_SQBR                [                               82     16     
INT_CONSTANT          11                              82     17     
R_SQBR                ]                               82     19     
SEMI_COLON            ;                               82     20     
INT                   int                             83     5      
IDENTIFIER            visited                         83     9      
L_SQBR                [                               83     16     
INT_CONSTANT          11                              83     17     
R_SQBR                ]                               83     19     
SEMI_COLON            ;                               83     20     
INT                   int                             84     5      
IDENTIFIER            i                               84     9      
COMMA                 ,                               84     10     
IDENTIFIER            j                               84     11     
SEMI_COLON            ;                               84     12     
FOR                   for                             85     5      
L_PAREN               (                               85     8      
IDENTIFIER            i                               85     9      
ASSIGNMENT            =                               85     11     
INT_CONSTANT          0                               85     13     
SEMI_COLON            ;                               85     14     
IDENTIFIER            i                               85     15     
LESS                  <                               85     16     
INT_CONSTANT          11                              85     17     
SEMI_COLON            ;                               85     19     
IDENTIFIER            i                               85     20     
INCREMENT             ++                              85     21     
R_PAREN               )                               85     23     
L_BRACES              {                               85     24     
IDENTIFIER            visited                         86     9      
L_SQBR                [                               86     16     
IDENTIFIER            i                               86     17     
R_SQBR                ]                               86     18     
ASSIGNMENT            =                               86     20     
INT_CONSTANT          0                               86     22     
SEMI_COLON            ;                               86     23     
FOR                   for                             87     9      
L_PAREN               (                               87     12     
IDENTIFIER            j                               87     13     
ASSIGNMENT            =                               87     15     
INT_CONSTANT          0                               87     17     
SEMI_COLON            ;                               87     18     
IDENTIFIER            j                               87     19     
LESS                  <                               87     20     
INT_CONSTANT          11                              87     21     
SEMI_COLON            ;                               87     23     
IDENTIFIER            j                               87     24     
INCREMENT             ++                              87     25     
R_PAREN               )                               87     27     
L_BRACES              {                               87     28     
IDENTIFIER            adj                             88     13     
L_SQBR                [                               88     16     
IDENTIFIER            i                               88     17     
R_SQBR                ]                               88     18     
L_SQBR                [                               88     19     
IDENTIFIER            j                               88     20     
R_SQBR                ]                               88     21     
ASSIGNMENT            =                               88     23     
INT_CONSTANT          0                               88     25     
SEMI_COLON            ;                               88     26     
R_BRACES              }                               89     9      
R_BRACES              }                               90     5      
INT                   int                             91     5      
IDENTIFIER            n                               91     9      
SEMI_COLON            ;                               91     10     
IDENTIFIER            printf1                         92     5      
L_PAREN               (                               92     12     
STR_CONSTANT          "Enter number of vertice (<=10)\n"  92     13     
R_PAREN               )                               92     47     
SEMI_COLON            ;                               92     48     
IDENTIFIER            scanf                           93     5      
L_PAREN               (                               93     10     
STR_CONSTANT          "%ld"                           93     11     
COMMA                 ,                               93     16     
BITWISE_AND           &                               93     17     
IDENTIFIER            n                               93     18     
R_PAREN               )                               93     19     
SEMI_COLON            ;                               93     20     
IF                    if                              94     5      
L_PAREN               (                               94     7      
IDENTIFIER            n                               94     8      
GREATER               >                               94     9      
INT_CONSTANT          10                              94     10     
LOGICAL_OR            ||                              94     13     
IDENTIFIER            n                               94     16     
LESS                  <                               94     17     
INT_CONSTANT          1                               94     18     
R_PAREN               )                               94     19     
L_BRACES              {                               94     20     
IDENTIFIER            printf1                         95     9      
L_PAREN               (                               95     16     
STR_CONSTANT          "invalid number\n"              95     17     
R_PAREN               )                               95     35     
SEMI_COLON            ;                               95     36     
RETURN                return                          96     9      
SUBSTRACT             -                               96     16     
INT_CONSTANT          1                               96     17     
SEMI_COLON            ;                               96     18     
R_BRACES              }                               97     5      
FOR                   for                             98     5      
L_PAREN               (                               98     8      
IDENTIFIER            i                               98     9      
ASSIGNMENT            =                               98     11     
INT_CONSTANT          0                               98     13     
SEMI_COLON            ;                               98     14     
IDENTIFIER            i                               98     15     
LESS                  <                               98     17     
IDENTIFIER            n                               98     18     
SEMI_COLON            ;                               98     19     
IDENTIFIER            i                               98     20     
INCREMENT             ++                              98     21     
R_PAREN               )                               98     23     
L_BRACES              {                               98     24     
INT                   int                             99     9      
IDENTIFIER            v                               99     13     
SEMI_COLON            ;                               99     14     
DO                    do                              100    9      
L_BRACES              {                               100    11     
IDENTIFIER            scanf                           101    13     
L_PAREN               (                               101    18     
STR_CONSTANT          "%ld"                           101    19     
COMMA                 ,                               101    24     
BITWISE_AND           &                               101    25     
IDENTIFIER            v                               101    26     
R_PAREN               )                               101    27     
SEMI_COLON            ;                               101    28     
IF                    if                              102    13     
L_PAREN               (                               102    15     
IDENTIFIER            v                               102    16     
EQUALS                ==                              102    18     
SUBSTRACT             -                               102    21     
INT_CONSTANT          1                               102    22     
R_PAREN               )                               102    23     
L_BRACES              {                               102    24     
BREAK                 break                           103    17     
SEMI_COLON            ;                               103    22     
R_BRACES              }                               104    13     
IF                    if                              105    13     
L_PAREN               (                               105    15     
IDENTIFIER            v                               105    16     
GREATER               >                               105    18     
IDENTIFIER            n                               105    20     
LOGICAL_OR            ||                              105    22     
IDENTIFIER            v                               105    25     
LESS_EQUALS           <=                              105    27     
INT_CONSTANT          0                               105    30     
R_PAREN               )                               105    31     
L_BRACES              {                               105    32     
IDENTIFIER            printf1                         106    17     
L_PAREN               (                               106    24     
STR_CONSTANT          "invalid number\n"              106    25     
R_PAREN               )                               106    43     
SEMI_COLON            ;                               106    44     
RETURN                return                          107    17     
SUBSTRACT             -                               107    24     
INT_CONSTANT          1                               107    25     
SEMI_COLON            ;                               107    26     
R_BRACES              }                               108    13     
IDENTIFIER            adj                             109    13     
L_SQBR                [                               109    16     
IDENTIFIER            i                               109    17     
R_SQBR                ]                               109    18     
L_SQBR                [                               109    19     
IDENTIFIER            v                               109    20     
SUBSTRACT             -                               109    21     
INT_CONSTANT          1                               109    22     
R_SQBR                ]                               109    23     
ASSIGNMENT            =                               109    25     
INT_CONSTANT          1                               109    27     
SEMI_COLON            ;                               109    28     
R_BRACES              }                               110    9      
WHILE                 while                           110    10     
L_PAREN               (                               110    15     
TRUE                  true                            110    16     
R_PAREN               )                               110    20     
SEMI_COLON            ;                               110    21     
R_BRACES              }                               111    5      
FOR                   for                             112    5      
L_PAREN               (                               112    8      
IDENTIFIER            i                               112    9      
ASSIGNMENT            =                               112    11     
INT_CONSTANT          0                               112    13     
SEMI_COLON            ;                               112    14     
IDENTIFIER            i                               112    15     
LESS                  <                               112    16     
IDENTIFIER            n                               112    17     
SEMI_COLON            ;                               112    18     
IDENTIFIER            i                               112    19     
INCREMENT             ++                              112    20     
R_PAREN               )                               112    22     
L_BRACES              {                               112    23     
IF                    if                              113    9      
L_PAREN               (                               113    11     
LOGICAL_NOT           !                               113    12     
IDENTIFIER            visited                         113    13     
L_SQBR                [                               113    20     
IDENTIFIER            i                               113    21     
R_SQBR                ]                               113    22     
R_PAREN               )                               113    23     
L_BRACES              {                               113    24     
IDENTIFIER            visited                         114    13     
L_SQBR                [                               114    20     
IDENTIFIER            i                               114    21     
R_SQBR                ]                               114    22     
ASSIGNMENT            =                               114    24     
INT_CONSTANT          1                               114    26     
SEMI_COLON            ;                               114    27     
IDENTIFIER            dfs                             115    13     
L_PAREN               (                               115    16     
IDENTIFIER            adj                             115    17     
COMMA                 ,                               115    20     
IDENTIFIER            visited                         115    21     
COMMA                 ,                               115    28     
IDENTIFIER            i                               115    29     
COMMA                 ,                               115    30     
IDENTIFIER            n                               115    31     
COMMA                 ,                               115    32     
SUBSTRACT             -                               115    33     
INT_CONSTANT          1                               115    34     
R_PAREN               )                               115    35     
SEMI_COLON            ;                               115    36     
R_BRACES              }                               116    9      
R_BRACES              }                               117    5      
R_BRACES              }                               119    1      