#!/usr/bin/env python

import ply.lex as lex
import sys

#read source code provided by user
try:
    source_code = open(sys.argv[1],"r").read()
except:
    print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
    exit(-1)

class Tokens:
    #init function specification
    def __init__(self):
        pass

    #bag of datatypes in dictionary form
    dataTypes ={
        
    }

    #reserved keyword in dicitionary form
    reserved_keywords={

    }

    #list of operators
    operators =[

    ]

    #List of separators
    separators =[

    ]

    #list of other miscllaneous tokens
    other_tokens = [

    ]

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