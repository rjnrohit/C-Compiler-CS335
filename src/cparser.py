#!/usr/bin/python3
"""This Script for Syntax Analysis of C code
provided by user"""

import sys
import ply.lex as lex
import ply.yacc as yacc
import clexer as lexer
import argparse
import pygraphviz as pgv


from visualize import draw_ast
from clexer import tokens



#####################AST Section#####################
class Node:
    count_nodes = 0
    nodes = []
    def __init__(self,type,value=None,children=None):
        self.id = Node.count_nodes
        Node.count_nodes += 1
        Node.nodes.append(self)
        self.type = type
        if children:
            self.children = children
        else:
            self.children = []
        self.value = value

    def addChild(self,node):
        self.children.append(node)

    def getChild(self):
        return self.children
        
#####################################################



#####################Grammar section #################


start = 'program' #start action

def p_program(p):
    'program : translation_unit'
    p[0] = Node("program",children=p[1])

def p_translation_unit(p):
    '''
    translation_unit : external_declaration
                     | translation_unit external_declaration
    '''
    p[0] = p[1] if len(p)==2 else p[1]+p[2]

def p_external_declaration(p):
    '''
    external_declaration : function_definition
                         | declaration
    '''
    p[0] = [p[1]]
##########################################
def p_function_definition_1(p):
    '''
    function_definition : declaration_specifiers declarator declaration_list compound_statement
			            | declaration_specifiers declarator compound_statement
    
    '''
    if len(p) == 5:
        p[0] = Node("function_defn",children=[p[2],p[4]])
    else:
        p[0] = Node("function_defn",children=[p[2],p[3]])
    
def p_function_definition_2(p):
    '''
    function_definition : declarator declaration_list compound_statement
			            | declarator compound_statement
    
    '''
    if len(p) == 4:
        p[0] = Node("function_defn",children=[p[1],p[3]])
    else:
        p[0] = Node("function_defn",children=[p[1],p[2]])

# add all constants
def p_primary_expression(p):
    '''
    primary_expression : IDENTIFIER
                       | INT_CONSTANT
                       | HEX_CONSTANT
                       | OCTAL_CONSTANT
                       | EXPONENT_CONSTANT
                       | REAL_CONSTANT
                       | CHAR_CONSTANT
                       | STR_CONSTANT
                       | L_PAREN expression R_PAREN
    '''
    if len(p) == 2:
        p[0] = Node("primary_exp", value = p[1], children=None)
    else:
        p[0] = Node("primary_exp", value="()", children=[p[2]])

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
    if len(p) == 2:
        p[0] = p[1]
    elif p[2] == '[':
        p[0] = Node("array_ref",children=[p[1],p[3]])
    elif p[2] == '(':
        p[0] = Node("func_call",children= [p[1],p[3]] if len(p) == 5 else [p[1]])
    elif len(p) == 4:
        p[0] = Node("struct_ref",p[2],children=[p[1],p[3]])
    else:
        p[0] = Node("unary_op",'p'+p[2],[p[1]])

def p_argument_expression_list(p):
    '''
    argument_expression_list : assignment_expression
	                         | argument_expression_list COMMA assignment_expression
    '''
    if len(p) == 2:
        p[0] = Node("argument_expression_list",children=[p[1]])
    else:
        p[1].addChild(p[2])
        p[0] = p[1]

def p_unary_expression(p):
    '''
    unary_expression : postfix_expression
                     | INCREMENT unary_expression
                     | DECREMENT unary_expression
                     | unary_operator cast_expression
                     | SIZEOF unary_expression
                     | SIZEOF L_PAREN type_name R_PAREN
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("unary_op",p[1],children = [p[2]] if len(p) == 3 else [p[3]])

def p_unary_operator(p):
    '''
    unary_operator : BITWISE_AND
                   | MULTIPLY
                   | ADD
                   | SUBSTRACT
                   | BITWISE_ONE_COMPLEMENT
                   | LOGICAL_NOT
    '''
    p[0] = p[1]

def p_cast_expression(p):
    '''
    cast_expression : unary_expression
	                | L_PAREN type_specifier R_PAREN cast_expression
    '''
    if len(p) == 2:
        p[0] = p[1]
    else p[0] = Node("cast",p[2].type,children=[p[4]])

def p_multiplicative_expression(p):
    '''
    multiplicative_expression : cast_expression
                              | multiplicative_expression MULTIPLY cast_expression
                              | multiplicative_expression DIVIDE cast_expression
                              | multiplicative_expression MODULUS cast_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_additive_expression(p):
    '''
    additive_expression : multiplicative_expression
                        | additive_expression ADD multiplicative_expression
                        | additive_expression SUBSTRACT multiplicative_expression
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

def p_shift_expression(p):
    '''
    shift_expression : additive_expression
                     | shift_expression LEFT_SHIFT additive_expression
                     | shift_expression RIGHT_SHIFT additive_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_relational_expression(p):
    '''
    relational_expression : shift_expression
                          | relational_expression LESS shift_expression
                          | relational_expression GREATER shift_expression
                          | relational_expression LESS_EQUALS shift_expression
                          | relational_expression GREATER_EQUALS shift_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])
        

def p_equality_expression(p):
    '''
    equality_expression : relational_expression
                        | equality_expression EQUALS relational_expression
                        | equality_expression NOT_EQUALS relational_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_and_expression(p):
    '''
    and_expression : equality_expression
	               | and_expression BITWISE_AND equality_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_exclusive_or_expression(p):
    '''
    exclusive_or_expression : and_expression
	                        | exclusive_or_expression BITWISE_XOR and_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_inclusive_or_expression(p):
    '''
    inclusive_or_expression : exclusive_or_expression
	                        | inclusive_or_expression BITWISE_OR exclusive_or_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

def p_logical_and_expression(p):
    '''
    logical_and_expression : inclusive_or_expression
	                       | logical_and_expression LOGICAL_AND inclusive_or_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_logical_or_expression(p):
    '''
    logical_or_expression : logical_and_expression
	                      | logical_or_expression LOGICAL_OR logical_and_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("binary_op",p[2],children = [p[1],p[3]])


def p_conditional_expression(p):
    '''
    conditional_expression : logical_or_expression
	                       | logical_or_expression QUES_MARK expression COLON conditional_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("ternary_op",children = [p[1],p[3],p[5]])

def p_assignment_expression(p):
    '''
    assignment_expression : conditional_expression
	                      | unary_expression assignment_operator assignment_expression
    '''

    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("assignment",p[2],children = [p[1],p[3]])

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
    p[0] = p[1]

def p_expression(p):
    '''
    expression : assignment_expression
	           | expression COMMA assignment_expression
    ''' 
    if len(p) == 2:
        p[0] = p[1]
    else:
        if isinstance(p[1],Node) and p[1].type == "expression":
            p[1].addChild(p[2])
            p[0] = p[1]
        else:
            p[0] = Node("expression",children=[p[1],p[2]])
    

def p_constant_expression(p):
    '''
    constant_expression : conditional_expression
    '''
    p[0] = p[1]

########################################
def p_declaration(p):
    '''
    declaration : declaration_specifiers SEMI_COLON
	            | declaration_specifiers init_declarator_list SEMI_COLON
    '''
    if len(p) == 4 and p[2] != None:
        p[0] = Node("declaration",children=p[2])
    else:
        p[0] = None

def p_declaration_specifiers(p):
    '''
    declaration_specifiers : storage_class_specifier
                           | storage_class_specifier declaration_specifiers
                           | type_specifier
                           | type_specifier declaration_specifiers
                           | type_qualifier
                           | type_qualifier declaration_specifiers
    '''
    # required change in action
    p[0] = p[1]
        

def p_init_declarator_list(p):
    '''
    init_declarator_list : init_declarator
	                     | init_declarator_list COMMA init_declarator
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        if p[3] == None:
            p[0] = p[1]
        else:
            p[0] = p[3] if p[1] == None else p[1] + p[3]

def p_init_declarator(p):
    '''
    init_declarator : declarator
	                | declarator ASSIGNMENT initializer
    '''
    if len(p) == 2:
        p[0] = None
    else:
        p[0] = [Node("assignment",p[2],children = [p[1],p[3]])]

def p_storage_class_specifier(p):
    '''
    storage_class_specifier : TYPEDEF
                            | EXTERN
                            | STATIC
                            | AUTO
                            | REGISTER
    '''
    p[0] = Node("storage_class_specifier",p[1])

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
                   | BOOL
    '''
    p[0] = Node("type_specifier",p[1])


def p_struct_or_union_specifier(p):
    '''
    struct_or_union_specifier : struct_or_union IDENTIFIER L_BRACES struct_declaration_list R_BRACES
	                          | struct_or_union L_BRACES struct_declaration_list R_BRACES
	                          | struct_or_union IDENTIFIER
    '''
    p[0] = p[1]

def p_struct_or_union(p):
    '''
    struct_or_union : STRUCT
	                | UNION
    '''
    p[0] = Node(p[1])


def p_struct_declaration_list(p):
    '''
    struct_declaration_list : struct_declaration
	                        | struct_declaration_list struct_declaration
    '''
    p[0] = None
def p_struct_declaration(p):
    '''
    struct_declaration : specifier_qualifier_list struct_declarator_list SEMI_COLON
    '''
    p[0] = None
def p_specifier_qualifier_list(p):
    '''
    specifier_qualifier_list : type_specifier specifier_qualifier_list
                             | type_specifier
                             | type_qualifier specifier_qualifier_list
                             | type_qualifier
    '''
    if len(p) == 2:
        p[0] = [p[1]]
    else:
        p[0] = [p[1]]+p[2]

def p_struct_declarator_list(p):
    '''
    struct_declarator_list : struct_declarator
	                       | struct_declarator_list COMMA struct_declarator
    '''
    p[0] = None
def p_struct_declarator(p):
    '''
    struct_declarator : declarator
                      | COLON constant_expression
                      | declarator COLON constant_expression
    '''
    p[0] = None
def p_enum_specifier(p):
    '''
    enum_specifier : ENUM L_BRACES enumerator_list R_BRACES
                   | ENUM IDENTIFIER L_BRACES enumerator_list R_BRACES
                   | ENUM IDENTIFIER
    '''
    p[0] = Node("ENUM",p[1])
def p_enumerator_list(p):
    '''
    enumerator_list : enumerator
	                | enumerator_list COMMA enumerator
    '''
    p[0] = None
def p_enumerator(p):
    '''
    enumerator : IDENTIFIER
	           | IDENTIFIER ASSIGNMENT constant_expression
    '''
    p[0] = None
def p_type_qualifier(p):
    '''
    type_qualifier : CONST
	               | VOLATILE
    '''
    p[0] = Node("type_qualifier",p[1])

def p_declarator(p):
    '''
    declarator : pointer direct_declarator
	           | direct_declarator
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("pointer",children=p[1]+[p[2]])

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
    if len(p) == 2:
        p[0] = Node("id",p[1])
    elif p[2] == '(':
        p[0] = p[1]
    elif len(p) == 4:
        p[0] = Node("declarator",p[2]+p[3],children=[p[1]])
    else:
        p[0] = Node("declarator",p[2]+p[4],children=[p[1],p[3]])


def p_pointer(p):
    '''
    pointer : MULTIPLY
	        | MULTIPLY type_qualifier_list
            | MULTIPLY pointer
            | MULTIPLY type_qualifier_list pointer
    '''
    p[0] = [p[1]]
    for i in range(2,len(p)):
        p[0] += p[i]
    
def p_type_qualifier_list(p):
    '''
    type_qualifier_list : type_qualifier
	                    | type_qualifier_list type_qualifier
    '''
    p[0] = [p[1]] if len(p) == 2 else p[1]+[p[2]]

def p_parameter_type_list(p):
    '''
    parameter_type_list : parameter_declaration
	                    | parameter_type_list COMMA parameter_declaration
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        if p[1].type == "parameter_type_list":
            p[1].addChild(p[3])
            p[0] = p[1]
        else:
            p[0] = Node("parameter_type_list",children=[p[1],p[3]])
    
def p_parameter_declaration(p):
    '''
    parameter_declaration : declaration_specifiers declarator
	                      | declaration_specifiers abstract_declarator
	                      | declaration_specifiers
    '''
    p[0] = Node("parameter_declaration",children=[p[1]])
    if len(p) > 2:
        if isinstance(p[2],list):
            for i in p[2]:
                p[0].addChild(i)
        else:
            p[0].addChild(p[2])

def p_identifier_list(p):
    '''
    identifier_list : IDENTIFIER
	                | identifier_list COMMA IDENTIFIER
    '''
    if len(p) == 2:
        p[0] = Node("id",p[1])
    else:
        c =  Node("id",p[3])
        if p[1].type == "id":
            p[0] = Node("identifier_list",children=[p[1],c])
        else:
            p[1].addChild(c)
            p[0] = p[1]


def p_type_name(p):
    '''
    type_name : specifier_qualifier_list
	          | specifier_qualifier_list abstract_declarator
    '''
    c = []
    for i in range(1,len(p)):
        c += p[i]
    p[0] = Node("type_name",children=c)

def p_abstract_declarator(p):
    '''
    abstract_declarator : pointer
	                    | direct_abstract_declarator
	                    | pointer direct_abstract_declarator
    '''
    p[0] = []
    for i in range(1,len(p)):
        p[0] += p[i]

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
    p[0] = []
    for i in range(1,len(p)):
        if not isinstance(p[i],list):
            p[0] += [p[i]]
        else:
            p[0] += p[i]


#####################################################  
def p_initializer(p):
    '''
    initializer : assignment_expression
	            | L_BRACES initializer_list R_BRACES
	            | L_BRACES initializer_list COMMA R_BRACES
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = Node("init_list","{}",p[2])

def p_initializer_list(p):
    '''
    initializer_list : initializer
	                 | initializer_list COMMA initializer
    '''
    p[0] = [p[1]] if len(p) == 2 else p[1]+[p[2]]

def p_statement(p):
    '''
    statement : labeled_statement
	          | compound_statement
	          | expression_statement
	          | selection_statement
	          | iteration_statement
	          | jump_statement
    '''
    p[0] = p[1]

def p_labeled_statement_1(p):
    '''
    labeled_statement : IDENTIFIER COLON statement
    '''
    p[0] = Node("label",children=[p[1],p[3]])

def p_labeled_statement_2(p):
    '''
    labeled_statement : CASE constant_expression COLON statement
	                  | DEFAULT COLON statement
    '''
    if len(p) == 5:
        p[0] = Node("case",children=[p[2],p[4]])
    else:
        p[0] = Node("default",children=[p[3]])

def p_compound_statement(p):
    '''
    compound_statement : L_BRACES R_BRACES
	                   | L_BRACES statement_list R_BRACES
	                   | L_BRACES declaration_list R_BRACES
	                   | L_BRACES declaration_list statement_list R_BRACES
    '''
    if len(p) == 3:
        p[0] = Node("compound_statement","{}")
    elif len(p) == 4:
        p[0] = Node("compound_statement","{}",children=p[2])
    else:
        p[0] = Node("compound_statement","{}",children=p[2]+p[3])


def p_declaration_list(p):
    '''
    declaration_list : declaration
	                 | declaration_list declaration
    '''
    p[0] = [p[1]] if len(p) == 2 else p[1]+[p[2]]

def p_statement_list(p):
    '''
    statement_list : statement
	               | statement_list statement
    '''
    p[0] = [p[1]] if len(p) == 2 else p[1]+[p[2]]
        

def p_expression_statement(p):
    '''
    expression_statement : SEMI_COLON
	                     | expression SEMI_COLON
    '''
    if len(p) == 2:
        p[0] = Node("expression_statement",p[1])
    else:
        p[0] = p[1]

def p_selection_statement(p):
    '''
    selection_statement : IF L_PAREN expression R_PAREN statement
	                    | IF L_PAREN expression R_PAREN statement ELSE statement
	                    | SWITCH L_PAREN expression R_PAREN statement
    '''
    if p[1] == "if":
        if len(p) == 6:
            p[0] = Node("if",children=[p[3],p[5]])
        else:
            p[0] = Node("if_else",children=[p[3],p[5],p[7]])

def p_iteration_statement(p):
    '''
    iteration_statement : WHILE L_PAREN expression R_PAREN statement
	                    | DO statement WHILE L_PAREN expression R_PAREN SEMI_COLON
	                    | FOR L_PAREN expression_statement expression_statement R_PAREN statement
	                    | FOR L_PAREN expression_statement expression_statement expression R_PAREN statement
    '''
    if p[1] == "while":
        p[0] = Node("iteration_statement","while",children=[p[3],p[5]])
    elif p[1] == "do":
        p[0] = Node("iteration_statement","do",children=[p[2],p[5]])
    else:
        if len(p) == 7:
            child = [p[3],p[4],p[6]]
        else:
            child = [p[3],p[4],p[5],p[7]]
        p[0] = Node("iteration_statement","for",child)
    

def p_jump_statement(p):
    '''
    jump_statement : GOTO IDENTIFIER SEMI_COLON
	               | CONTINUE SEMI_COLON
	               | BREAK SEMI_COLON
	               | RETURN SEMI_COLON
	               | RETURN expression SEMI_COLON
	                 
    '''
    if len(p) == 4:
        p[0] = Node("jump_statment",p[1],[p[2]])
    else:
        p[0] = Node("Jump Statment",p[1])

 
######################################################

def main():
    """Driver code for Abstract syntax tree 
    Generation"""

    #read source code provided by user
    arg_parser = argparse.ArgumentParser(description="Lexer for Source Language C")
    arg_parser.add_argument('source_code',help="source code file location")
    arg_parser.add_argument('-t',action='store_false',help=" not print tokens")
    arg_parser.add_argument('-o',dest='filename',help="take the name of dot script", default="ast.dot")
    args = arg_parser.parse_args()

    try:
        # source_code = open(sys.argv[1],"r").read()
        source_code = open(args.source_code,"r").read()
    except FileNotFoundError:
        print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
        sys.exit(-1)



    parser = yacc.yacc()
    parser.parse(source_code, lexer = lexer.lexer)

    #print(parser)

    Graph = draw_ast(parser)
    Graph.draw("{args.filename}.png", format='png')

    file = open("{args.filename}", 'w')
    file.write(Graph.string())
    file.close()

if __name__ == "__main__":
    main()


"""
#refrences: https://www.dabeaz.com/ply/ply.html
            https://www.lysator.liu.se/c/ANSI-C-grammar-y.html
"""
