#!/usr/local/bin/python3
import sys
import argparse
from cparser import get_grammar
from structure import Errors, Node,sym_table
from threeaddr import remove_label,remove_none
from codegen import print_asm
from utils import draw_ast, print_csv,print_code
from clexer import print_lexeme
import os


def main():
    """Driver code for Abstract syntax tree 
    Generation"""

    #read source code provided by user
    arg_parser = argparse.ArgumentParser(description="C compiler for x86_64")
    arg_parser.add_argument('source_code',help="location of source code file")
    arg_parser.add_argument('-o',help="output file name, \{default a.out\}", default="a.out")
    arg_parser.add_argument('-f',help="name of file for additional files, \{default a\}",default="a")
    arg_parser.add_argument('-c',action='store_true',help="output object file")
    arg_parser.add_argument('-d',action='store_true',help="output assembly")
    arg_parser.add_argument('-a',action='store_true',help="output ast")
    arg_parser.add_argument('-s',action='store_true',help="output symbol table")
    arg_parser.add_argument('-t',action='store_true',help="output 3 address code")
    arg_parser.add_argument('-l',action='store_true',help="output lexeme table")
    arg_parser.add_argument('-stdc',action='store_true',help="linker method, if specified it'll uses custom elf entry else from standard X86-64-linux.so")
    arg_parser.add_argument('-n',action="store_false",help="only create till asm, , do not create executable")
    args = arg_parser.parse_args()

    try:
        source_code = open(args.source_code,"r").read()
    except FileNotFoundError:
        print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
        sys.exit(-1)

    source_file = args.source_code
    file_name = args.f
    grammar = get_grammar(source_file,source_code,debug=1)
    if len(Errors.get_all_error()):
        for error in Errors.get_all_error():
            print(error)
        return
    tac_code = grammar.code
    tac_code = remove_none(tac_code)
    #to remove redundant labels
    tac_code = remove_label(tac_code)
    if args.n: 
        print_asm(tac_code,stdc=args.stdc)
        asm_file = "temp.asm"
        os.system('yasm -g dwarf2 -f elf64 temp.asm 2> temp')
        os.system('touch temp')
        if args.c:
            os.system("cp temp.o "+file_name+".o")
        if args.stdc:
            os.system("ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o {} temp.o -lc -lm 2> temp".format(args.o))
        else:
            os.system("ld -o {} -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o -lc temp.o /usr/lib/x86_64-linux-gnu/crtn.o -lm 2> temp".format(args.o))
        os.system("rm -rf temp.asm temp.o temp")
        
    #assembly
    if args.d:
        print_asm(tac_code,file_name+".asm",args.stdc)
    # ast
    if args.a:
        Graph = draw_ast(grammar)
        Graph.draw(file_name+'.png', format='png')
    # symbol table
    if args.s:
        print_csv(sym_table=sym_table,filename=file_name+".csv")
    # 3AC
    if args.t:
        print_code(tac_code,filename =file_name+".3ac")
    # lexeme
    if args.l:
        print_lexeme(source_code,file_name+".lex")


if __name__ == "__main__":
    main()
