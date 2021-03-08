#!/usr/bin/python3
"""This Script for Syntax Analysis of C code
provided by user"""

import sys
import ply.lex as lex
import ply.yacc as yacc
import clexer as lexer
import argparse
import pygraphviz as pgv

from clexer import tokens

#read source code provided by user
arg_parser = argparse.ArgumentParser(description="Lexer for Source Language C")
arg_parser.add_argument('source_code',help="source code file location")
arg_parser.add_argument('-t',action='store_false',help=" not print tokens")
args = arg_parser.parse_args()

try:
    # source_code = open(sys.argv[1],"r").read()
    source_code = open(args.source_code,"r").read()
except FileNotFoundError:
    print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
    sys.exit(-1)




#####################AST Section#####################
class Node:
    def __init__(self,type,children=None,leaf=None):
        self.type = type
        if children:
            self.children = children
        else:
            self.children = [ ]
        self.leaf = leaf
#####################################################



#####################Grammar section #################


######################################################

def main():
    """Driver code for Abstract syntax tree 
    Generation"""
    parser = yacc.yacc()
    parser.parse(source_code, lexer = lexer.lexer)
    print(parser)

if __name__ == "__main__":
    main()


"""
#refrences: https://www.dabeaz.com/ply/ply.html
            https://www.lysator.liu.se/c/ANSI-C-grammar-y.html
"""