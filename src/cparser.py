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
    p[0] = p[1]

def p_translation_unit(p):
    '''
    translation_unit : external_declaration
                     | translation_unit external_declaration
    '''
    if len(p) == 1:
        p[0] = Node(type="program",children = [p[1]])
    else:
        p[0] = Node(type="program",children=p[1].children + [p[2]])

def p_external_declaration(p):
    '''
    external_declaration : function_definition
                         | declaration
    '''

def p_function_definition(p):
    '''
    function_definition : declaration_specifiers declarator declaration_list compound_statement
			            | declaration_specifiers declarator compound_statement
			            | declarator declaration_list compound_statement
			            | declarator compound_statement
    
    '''
def p_primary_expression(p):
    '''
    primary_expression : IDENTIFIER
                       | CONSTANT
                       | STRING_LITERAL    
                       | L_PAREN expression R_PAREN
    '''
def p_postfix_expression(p):
    '''
    postfix_expression : primary_expression
                       | postfix_expression L_SQBR expression R_SQBR
                       | postfix_expression L_PAREN R_PAREN
                       | postfix_expression L_PAREN argument_expression_list R_PAREN
                       | postfix_expression DOT IDENTIFIER
                       | postfix_expression ARROW IDENTIFIER
                       | postfix_expression INCREMENT
                       | postfix_expression DECREMENT

    '''
def p_argument_expression_list(p):
    '''
    argument_expression_list : assignment_expression
	                         | argument_expression_list COMMA assignment_expression
    '''
def p_unary_expression(p):
    '''
    unary_expression : postfix_expression
                     | INCREMENT unary_expression
                     | DECREMENT unary_expression
                     | unary_operator cast_expression
                     | SIZEOF unary_expression
                     | SIZEOF L_PAREN type_name R_PAREN
    '''
def p_unary_operator(p):
    '''
    unary_operator : BITWISE_AND
                   | MULTIPLY
                   | ADD
                   | SUBSTRACT
                   | BITWISE_ONE_COMPLEMENT
                   | LOGICAL_NOT
    '''
def p_cast_expression(p):
    '''
    cast_expression : unary_expression
	                | L_PAREN type_name R_PAREN cast_expression
    '''
def p_multiplicative_expression(p):
    '''
    multiplicative_expression : cast_expression
                              | multiplicative_expression MULTIPLY cast_expression
                              | multiplicative_expression DIVIDE cast_expression
                              | multiplicative_expression MODULUS cast_expression
    '''
def p_additive_expression(p):
    '''
    additive_expression : multiplicative_expression
                        | additive_expression ADD multiplicative_expression
                        | additive_expression SUBSTRACT multiplicative_expression
    '''
def p_shift_expression(p):
    '''
    shift_expression : additive_expression
                     | shift_expression LEFT_SHIFT additive_expression
                     | shift_expression RIGHT_SHIFT additive_expression
    '''
def p_relational_expression(p):
    '''
    relational_expression : shift_expression
                          | relational_expression LESS shift_expression
                          | relational_expression GREATER shift_expression
                          | relational_expression LESS_EQUALS shift_expression
                          | relational_expression GREATER_EQUALS shift_expression
    '''
def p_equality_expression(p):
    '''
    equality_expression : relational_expression
                        | equality_expression EQUALS relational_expression
                        | equality_expression NOT_EQUALS relational_expression
    '''
def p_and_expression(p):
    '''
    and_expression : equality_expression
	               | and_expression BITWISE_AND equality_expression
    '''
def p_exclusive_or_expression(p):
    '''
    exclusive_or_expression : and_expression
	                        | exclusive_or_expression BITWISE_XOR and_expression
    '''
def p_inclusive_or_expression(p):
    '''
    inclusive_or_expression : exclusive_or_expression
	                        | inclusive_or_expression BITWISE_OR exclusive_or_expression
    '''
def p_logical_and_expression(p):
    '''
    logical_and_expression : inclusive_or_expression
	                       | logical_and_expression LOGICAL_AND inclusive_or_expression
    '''
def p_logical_or_expression(p):
    '''
    logical_or_expression : logical_and_expression
	                      | logical_or_expression LOGICAL_OR logical_and_expression
    '''
def p_conditional_expression(p):
    '''
    conditional_expression : logical_or_expression
	                       | logical_or_expression QUES_MARK expression COLON conditional_expression
    '''
def p_assignment_expression(p):
    '''
    assignment_expression : conditional_expression
	                      | unary_expression assignment_operator assignment_expression
    '''
def p_assignment_operator(p):
    '''
    assignment_operator : ASSIGNMENT
                        | MULTIPLY_ASSIGNMENT
                        | DIVIDE_ASSIGNMENT
                        | MODULUS_ASSIGNMENT
                        | ADD_ASSIGNMENT
                        | SUBSTRACT_ASSIGNMENT
                        | LEFT_SHIFT_ASSIGNMENT
                        | RIGHT_SHIFT_ASSIGNMENT
                        | BITWISE_AND_ASSIGNMENT
                        | BITWISE_XOR_ASSIGNMENT
                        | BITWISE_OR_ASSIGNMENT
    '''
def p_expression(p):
    '''
    expression : assignment_expression
	           | expression COMMA assignment_expression
    '''
def p_constant_expression(p):
    '''
    constant_expression : conditional_expression
    '''
def p_declaration(p):
    '''
    declaration : declaration_specifiers SEMI_COLON
	            | declaration_specifiers init_declarator_list SEMI_COLON
    '''
def p_declaration_specifiers(p):
    '''
    declaration_specifiers : storage_class_specifier
                           | storage_class_specifier declaration_specifiers
                           | type_specifier
                           | type_specifier declaration_specifiers
                           | type_qualifier
                           | type_qualifier declaration_specifiers
    '''
def p_init_declarator_list(p):
    '''
    init_declarator_list : init_declarator
	                     | init_declarator_list COMMA init_declarator
    '''
def p_init_declarator(p):
    '''
    init_declarator : declarator
	                | declarator ASSIGNMENT initializer
    '''
def p_storage_class_specifier(p):
    '''
    storage_class_specifier : TYPEDEF
                            | EXTERN
                            | STATIC
                            | AUTO
                            | REGISTER
    '''
def p_type_specifier(p):
    '''
    type_specifier : VOID
                   | CHAR
                   | SHORT
                   | INT
                   | LONG
                   | FLOAT
                   | DOUBLE
                   | SIGNED
                   | UNSIGNED
                   | struct_or_union_specifier
                   | enum_specifier
                   | TYPE_NAME
    '''
def p_struct_or_union_specifier(p):
    '''
    struct_or_union_specifier : struct_or_union IDENTIFIER L_BRACES struct_declaration_list R_BRACES
	                          | struct_or_union L_BRACES struct_declaration_list R_BRACES
	                          | struct_or_union IDENTIFIER
    '''
def p_struct_or_union(p):
    '''
    struct_or_union : STRUCT
	                | UNION
    '''
def p_struct_declaration_list(p):
    '''
    struct_declaration_list : struct_declaration
	                        | struct_declaration_list struct_declaration
    '''
def p_struct_declaration(p):
    '''
    struct_declaration : specifier_qualifier_list struct_declarator_list SEMI_COLON
    '''
def p_specifier_qualifier_list(p):
    '''
    specifier_qualifier_list : type_specifier specifier_qualifier_list
                             | type_specifier
                             | type_qualifier specifier_qualifier_list
                             | type_qualifier
    '''
def p_struct_declarator_list(p):
    '''
    struct_declarator_list : struct_declarator
	                       | struct_declarator_list COMMA struct_declarator
    '''
def p_struct_declarator(p):
    '''
    struct_declarator : declarator
                      | COLON constant_expression
                      | declarator COLON constant_expression
    '''
def p_enum_specifier(p):
    '''
    enum_specifier : ENUM L_BRACES enumerator_list R_BRACES
                   | ENUM IDENTIFIER L_BRACES enumerator_list R_BRACES
                   | ENUM IDENTIFIER
    '''
def p_enumerator_list(p):
    '''
    enumerator_list : enumerator
	                | enumerator_list COMMA enumerator
    '''
def p_enumerator(p):
    '''
    enumerator : IDENTIFIER
	           | IDENTIFIER ASSIGNMENT constant_expression
    '''
def p_type_qualifier(p):
    '''
    type_qualifier : CONST
	               | VOLATILE
    '''
def p_declarator(p):
    '''
    declarator : pointer direct_declarator
	           | direct_declarator
    '''
def p_direct_declarator(p):
    '''
    direct_declarator : IDENTIFIER
                      | L_PAREN declarator R_PAREN
                      | direct_declarator L_SQBR constant_expression R_SQBR
                      | direct_declarator L_SQBR R_SQBR
                      | direct_declarator L_PAREN parameter_type_list R_PAREN
                      | direct_declarator L_PAREN identifier_list R_PAREN
                      | direct_declarator L_PAREN R_PAREN
    '''
def p_pointer(p):
    '''
    pointer : MULTIPLY
	        | MULTIPLY type_qualifier_list
            | MULTIPLY pointer
            | MULTIPLY type_qualifier_list pointer
    '''
def p_type_qualifier_list(p):
    '''
    type_qualifier_list : type_qualifier
	                    | type_qualifier_list type_qualifier
    '''

def p_parameter_type_list(p):
    '''
    parameter_type_list : parameter_declaration
	                    | parameter_type_list COMMA parameter_declaration
    '''
    
def p_parameter_declaration(p):
    '''
    parameter_declaration : declaration_specifiers declarator
	                      | declaration_specifiers abstract_declarator
	                      | declaration_specifiers
    '''
def p_identifier_list(p):
    '''
    identifier_list : IDENTIFIER
	                | identifier_list COMMA IDENTIFIER
    '''
def p_type_name(p):
    '''
    type_name : specifier_qualifier_list
	          | specifier_qualifier_list abstract_declarator
    '''
def p_abstract_declarator(p):
    '''
    abstract_declarator : pointer
	                    | direct_abstract_declarator
	                    | pointer direct_abstract_declarator
    '''
def p_direct_abstract_declarator(p):
    '''
    direct_abstract_declarator : L_PAREN abstract_declarator R_PAREN
	                           | L_SQBR R_SQBR
	                           | L_SQBR constant_expression R_SQBR
	                           | direct_abstract_declarator L_SQBR R_SQBR
                               | direct_abstract_declarator L_SQBR constant_expression R_SQBR
                               | L_PAREN R_PAREN
                               | L_PAREN parameter_type_list R_PAREN
                               | direct_abstract_declarator L_PAREN R_PAREN
                               | direct_abstract_declarator L_PAREN parameter_type_list R_PAREN
    '''
def p_initializer(p):
    '''
    initializer : assignment_expression
	            | L_BRACES initializer_list R_BRACES
	            | L_BRACES initializer_list COMMA R_BRACES
    '''
def p_initializer_list(p):
    '''
    initializer_list : initializer
	                 | initializer_list COMMA initializer
    '''
def p_statement(p):
    '''
    statement : labeled_statement
	          | compound_statement
	          | expression_statement
	          | selection_statement
	          | iteration_statement
	          | jump_statement
    '''
def p_labeled_statement(p):
    '''
    labeled_statement : IDENTIFIER COLON statement
	                  | CASE constant_expression COLON statement
	                  | DEFAULT COLON statement
    
    '''
def p_compound_statement(p):
    '''
    compound_statement : L_BRACES R_BRACES
	                   | L_BRACES statement_list R_BRACES
	                   | L_BRACES declaration_list R_BRACES
	                   | L_BRACES declaration_list statement_list R_BRACES
    '''
def p_declaration_list(p):
    '''
    declaration_list : declaration
	                 | declaration_list declaration
    '''
def p_statement_list(p):
    '''
    statement_list : statement
	               | statement_list statement
    '''
def p_expression_statement(p):
    '''
    expression_statement : SEMI_COLON
	                     | expression SEMI_COLON
    '''

def p_selection_statement(p):
    '''
    selection_statement : IF L_PAREN expression R_PAREN statement
	                    | IF L_PAREN expression R_PAREN statement ELSE statement
	                    | SWITCH L_PAREN expression R_PAREN statement
    '''
def p_iteration_statement(p):
    '''
    iteration_statement : WHILE L_PAREN expression R_PAREN statement
	                    | DO statement WHILE L_PAREN expression R_PAREN SEMI_COLON
	                    | FOR L_PAREN expression_statement expression_statement R_PAREN statement
	                    | FOR L_PAREN expression_statement expression_statement expression R_PAREN statement
    
    '''
def p_jump_statement(p):
    '''
    jump_statement : GOTO IDENTIFIER SEMI_COLON
	               | CONTINUE SEMI_COLON
	               | BREAK SEMI_COLON
	               | RETURN SEMI_COLON
	               | RETURN expression SEMI_COLON
	                 
    '''
 
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
