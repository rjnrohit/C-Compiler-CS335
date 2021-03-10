#!/usr/bin/python3
"""This Script for lexical Analysis of C code
provided by user"""


import sys
import ply.lex as lex
import argparse
import re



class Tokens:
    """This class object will give all types of tokens
    required for lexical analysis"""

    #init function specification
    def __init__(self):
        self.reserved = self.get_reserved()
        self.tokens = self.get_tokens()

    def get_tokens(self):
        """function to return all type
        of tokens"""
        return self.operators + self.separators + self.other_tokens + list(self.get_reserved().values())

    def get_reserved(self):
        """function to get reserved keywords
        including data_types and keywords"""
        return dict(list(self.data_types.items()) + list(self.reserved_keywords.items()))

    #bag of datatypes in dictionary form
    data_types ={
        'int':'INT',
        'long':'LONG',
        'char':'CHAR',
        'float':'FLOAT',
        'double':'DOUBLE',
        'void':'VOID',
        'bool': 'BOOL',
        'short':'SHORT',
        'signed':'SIGNED',
        'unsigned':'UNSIGNED',
        'enum':'ENUM',
        'register':'REGISTER',
    }

    #reserved keyword in dicitionary form
    reserved_keywords={
        'auto':'AUTO',
        'break':'BREAK',
        'case':'CASE',
        'const':'CONST',
        'continue':'CONTINUE',
        'default':'DEFAULT',
        'do':'DO',
        'long':'LONG',
        'return':'RETURN',
        'sizeof':'SIZEOF',
        'static':'STATIC',
        'struct':'STRUCT',
        'switch':'SWITCH',
        'typedef':'TYPEDEF',
        'union':'UNION',
        'volatile':'VOLATILE',
        'while':'WHILE',
        'else':'ELSE',
        'extern':'EXTERN',
        'for':'FOR',
        'goto':'GOTO',
        'if':'IF',
        'NULL' : 'NULL',
        'true' : 'TRUE',
        'false' : 'FALSE',
    }

    #list of operators
    operators =[
        'ARROW',
        'ADD',
        'SUBSTRACT',
        'MULTIPLY',
        'DIVIDE',
        'MODULUS',
        'INCREMENT',
        'DECREMENT',
        'EQUALS',
        'NOT_EQUALS',
        'GREATER',
        'LESS',
        'GREATER_EQUALS',
        'LESS_EQUALS',
        'LOGICAL_AND',
        'LOGICAL_OR',
        'LOGICAL_NOT',
        'BITWISE_AND',
        'BITWISE_OR',
        'BITWISE_XOR',
        'BITWISE_ONE_COMPLEMENT',
        'LEFT_SHIFT',
        'RIGHT_SHIFT',
        'ASSIGNMENT',
        'ADD_ASSIGNMENT',
        'SUBSTRACT_ASSIGNMENT',
        'MULTIPLY_ASSIGNMENT',
        'DIVIDE_ASSIGNMENT',
        'MODULUS_ASSIGNMENT',
        'LEFT_SHIFT_ASSIGNMENT',
        'RIGHT_SHIFT_ASSIGNMENT',
        'BITWISE_AND_ASSIGNMENT',
        'BITWISE_XOR_ASSIGNMENT',
        'BITWISE_OR_ASSIGNMENT',
        'QUES_MARK',
        'DOT'
    ]

    #List of separators
    separators =[
        'SEMI_COLON',
        'COMMA',
        'L_PAREN',
        'R_PAREN',
        'L_BRACES',
        'R_BRACES',
        'L_SQBR',
        'R_SQBR',
        'COLON',
    ]

    #list of other miscllaneous tokens
    other_tokens = [
        'IDENTIFIER',
        'INT_CONSTANT',
        'HEX_CONSTANT',
        'OCTAL_CONSTANT',
        'EXPONENT_CONSTANT',
        'REAL_CONSTANT',
        'CHAR_CONSTANT',
        'STR_CONSTANT',
        'INLINE_COMMENT',
        'BLOCK_COMMENT',
    ]

reserved = Tokens().reserved    #dict of reserved keywords
tokens = Tokens().tokens        #list of all tokens
lex.LexToken.lexeme=""          #create a new attribute for token class
lex.Lexer.filename=""           #create a new attribute for Lexer class
######## regular expressions ###################
"""
Regular expression defined using the prefix 't_' followed by token name
It can be functions or regular expression(string represntation)
"""

# All tokens defined by functions are added in the same order as they appear in the lexer file.
def t_EXPONENT_CONSTANT(t):
    r'((\d*\.\d+)|(\d+\.\d*)|(\d+))[Ee][+-]?\d+(f|F|l|L)?'
    t.lexeme = t.value
    t.value = re.match(r'((\d*\.\d+)|(\d+\.\d*)|(\d+))[Ee][+-]?\d+',t.value).group(0)
    t.value = float(t.value)
    return t

def t_REAL_CONSTANT(t):
    r'((\d*\.\d+)|(\d+\.\d*))(f|F|l|L)?'
    t.lexeme = t.value
    t.value = re.match(r'((\d*\.\d+)|(\d+\.\d*))',t.value).group(0)
    t.value = float(t.value)
    return t

def t_HEX_CONSTANT(t):
    r'0[xX][a-fA-F0-9]+(u|U|l|L)*'
    t.lexeme = t.value
    t.value = re.match(r'0[xX][a-fA-F0-9]+',t.value).group(0)
    t.value = int(t.value,base=16)
    return t

def t_OCTAL_CONSTANT(t):
    r'0\d+(u|U|l|L)*'
    t.lexeme = t.value
    t.value = re.match(r'0\d+',t.value).group(0)
    t.value = int(t.value,base=8)
    return t

def t_INT_CONSTANT(t):
    r'\d+(u|U|l|L)*'
    t.lexeme = t.value
    t.value = re.match(r'\d+',t.value).group(0)
    t.value = int(t.value)
    return t


t_CHAR_CONSTANT = r"\'([^\\\n]|(\\.))?\'"
t_STR_CONSTANT = r"[a-zA-Z_]?\"([^\\\n]|(\\.))*?\""

#seperators
t_SEMI_COLON = r';'
t_COMMA = r','
t_L_PAREN = r'\('
t_R_PAREN = r'\)'
t_L_BRACES = r'\{'
t_R_BRACES = r'\}'
t_L_SQBR = r'\['
t_R_SQBR = r'\]'
t_COLON = r':'

#operators
t_ARROW = r'->'
t_ADD = r'\+'
t_SUBSTRACT = r'-' 
t_MULTIPLY = r'\*'
t_DIVIDE = r'/'
t_MODULUS = r'%'
t_INCREMENT = r'\+\+'
t_DECREMENT = r'--'
t_EQUALS = r'=='
t_NOT_EQUALS = r'!='
t_GREATER = r'>'
t_LESS = r'<'
t_GREATER_EQUALS = r'>='
t_LESS_EQUALS = r'<='
t_LOGICAL_AND = r'&&'
t_LOGICAL_OR = r'\|\|'
t_LOGICAL_NOT = r'!'
t_BITWISE_AND = r'&'
t_BITWISE_OR = r'\|'
t_BITWISE_XOR = r'\^'
t_BITWISE_ONE_COMPLEMENT = r'~' 
t_LEFT_SHIFT = r'<<'
t_RIGHT_SHIFT = r'>>'
t_ASSIGNMENT = r'='
t_ADD_ASSIGNMENT = r'\+='
t_SUBSTRACT_ASSIGNMENT = r'-=' 
t_MULTIPLY_ASSIGNMENT = r'\*='
t_DIVIDE_ASSIGNMENT = r'/='
t_MODULUS_ASSIGNMENT = r'%='
t_LEFT_SHIFT_ASSIGNMENT = r'<<='
t_RIGHT_SHIFT_ASSIGNMENT = r'>>='
t_BITWISE_AND_ASSIGNMENT = r'&='
t_BITWISE_XOR_ASSIGNMENT = r'^=' 
t_BITWISE_OR_ASSIGNMENT = r'\|='
t_QUES_MARK = r'\?'
t_DOT = r'\.'

def t_IDENTIFIER(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*'
    t.type = reserved.get(t.value,'IDENTIFIER')
    return t

def t_newline(t):
    r'\n+'
    t.lexer.lineno += len(t.value)

# t_INLINE_COMMENT = r'//.*'

def t_ignore_INLINE_COMMENT(t):
    r'//.*'
    t.lexer.lineno += t.value.count('\n')
    pass

def t_ignore_BLOCK_COMMENT(t):
    r'/\*(.|\n)*?\*/'
    t.lexer.lineno += t.value.count('\n')
    pass

t_ignore = ' \t'

def t_error(t):
    print("Invalid Token: \""+t.value[0]+"\" at line "+str(t.lexer.lineno))
    t.lexer.skip(1)
    
####### end of regular expressions #############

def find_column(token, input):
    """function to compute the column 
    position of any token"""
    line_start = input.rfind('\n', 0, token.lexpos) + 1
    return (token.lexpos - line_start) + 1

######### building lexer ##########
lexer = lex.lex()
###################################

def print_lexeme(code):
    
    lexer.input(code)                   #read input from file
    print('{:20s}  {:30s}  {:5s}  {:7s}'.format("Token","Lexeme","Line#","Column#"))
    for tok in lexer:
        if not tok:
            continue
        if tok.lexeme:
            print('{:20s}  {:30s}  {:5s}  {:7s}'.format(tok.type,tok.lexeme, str(tok.lineno), str(find_column(tok,code))))
        else:
            print('{:20s}  {:30s}  {:5s}  {:7s}'.format(tok.type,tok.value, str(tok.lineno), str(find_column(tok,code))))



def main():
    """The Driver function will print
    the tokens with lexeme, line number and 
    column number"""
    #read source code provided by user
    parser = argparse.ArgumentParser(description="Lexer for Source Language C")
    parser.add_argument('source_code',help="source code file location")
    parser.add_argument('-t',action='store_false',help=" not print tokens")
    args = parser.parse_args()

    try:
        # source_code = open(sys.argv[1],"r").read()
        source_code = open(args.source_code,"r").read()
        lexer.filename = args.source_code
    except FileNotFoundError:
        print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
        sys.exit(-1)
    if(args.t): print_lexeme(source_code)

    
if __name__ == "__main__":
    main()


"""
#refrences: https://www.dabeaz.com/ply/ply.html
            https://www.lysator.liu.se/c/ANSI-C-grammar-l.html
"""
