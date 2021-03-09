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



#####################AST Section#####################
class Node:
    count_nodes = 0
    nodes = []
    def __init__(self,type,children=None,leaf=None,value=None):
        self.id = Node.count_nodes
        Node.count_nodes += 1
        Node.nodes.append(self)
        self.type = type
        if children:
            self.children = children
        else:
            self.children = []
        self.leaf = leaf
        self.value = value
        
#####################################################



#####################Grammar section #################


start = 'program' #start action

def p_program(p):
    'program : translation_unit'

def p_translation_unit(p):
    '''
    translation_unit : external_declaration
                     | translation_unit external_declaration
    '''

def p_external_declaration(p):
    '''
    external_declaration : function_definition
                         | declaration
    '''

def p_function_definition(p):
    pass


######################################################

def main():
    """Driver code for Abstract syntax tree 
    Generation"""

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



    parser = yacc.yacc()
    parser.parse(source_code, lexer = lexer.lexer)
    print(parser)

if __name__ == "__main__":
    main()


"""
#refrences: https://www.dabeaz.com/ply/ply.html
            https://www.lysator.liu.se/c/ANSI-C-grammar-y.html
"""