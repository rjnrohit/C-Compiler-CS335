#!/usr/bin/env python
"""This Script for lexical Analysis of C code
provided by user"""


import sys
import ply.lex as lex

#read source code provided by user
try:
    source_code = open(sys.argv[1],"r").read()
except FileNotFoundError:
    print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
    sys.exit(-1)

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
        'if':'IF'
    }

    #list of operators
    operators =[
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
        'BITWISE_EXCLUSIVE_OR_ASSIGNMENT',
        'BITWISE_INCLUSIVE_OR_ASSIGNMENT',
        'TERNARY',
        'ARROW',
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
        'SINGLE_QUOTE',
        'DOUBLE_QUOTE',
        'COLON'
    ]

    #list of other miscllaneous tokens
    other_tokens = [
        'IDENTIFIER',
        'INT_CONSTANT',
        'REAL_CONSTANT',
        'CHAR_CONSTANT',
        'STR_CONSTANT',
        'INLINE_COMMENT',
        'BLOCK_COMMENT',
        'NULL'
    ]

reversed = Tokens().reserved #dict of reserved keywords
tokens = Tokens().tokens #list of all tokens

######## regular expressions ###################
"""
Regular expression defined using the prefix 't_' followed by token name
It can be functions or regular expression(string represntation)
"""


####### end of regular expressions #############

######### building lexer ##########
lexer = lex.lex()
lexer.input(source_code)
###################################


def main():
    """
    Driver code goes here
    """
    pass


if __name__ == "__main__":
    main()


"""
#refrences: https://www.dabeaz.com/ply/ply.html
            https://www.lysator.liu.se/c/ANSI-C-grammar-l.html
"""
