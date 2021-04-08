#!/usr/local/bin/python3
"""This Script for Syntax Analysis of C code
provided by user"""

import sys
import ply.lex as lex
import ply.yacc as yacc
import clexer as lexer
import argparse
import pygraphviz as pgv


from visualize import draw_ast
from clexer import tokens,print_lexeme
from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, StructType
from structure import getMutliPointerType

#####################Grammar section #################


start = 'program' #start action

#Node
def p_program(p):
    'program : translation_unit'
    p[0] = Node("program",children=p[1])

#List
def p_translation_unit(p):
    '''
    translation_unit : external_declaration
                     | translation_unit external_declaration
    '''
    p[0] = p[1] if len(p)==2 else p[1]+p[2]

#List
def p_external_declaration(p):
    '''
    external_declaration : function_definition
                         | declaration
    '''
    p[0] = p[1]

#List
def p_function_definition(p):
    '''
    function_definition : type_specifier declarator func_scope parameter_type_list R_PAREN function_body pop_sym
                        | type_specifier declarator func_scope R_PAREN function_body pop_sym
    '''
    
    if len(p) == 8:
        node_type = FunctionType(return_type=p[2].type,param_list=p[4],symbol_table=p[7])
        p[0] = Node("function",p[2].value,children=[p[6]])
    else:
        node_type = FunctionType(return_type=p[2].type,param_list=[],symbol_table=p[6])
        p[0] = Node("function",p[2].value,children=[p[5]])
    sym_table.add_entry(name=p[2].value,type=node_type,token_object=p[2].data['token'])
    p[0] = [p[0]]


#Node
def p_func_scope(p):
    '''
    func_scope : L_PAREN
    '''
    sym_table.start_scope(name=p.stack[-1].value.value)
    sym_table.add_entry(name='return',type=p.stack[-1].value.type)
    

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
                       | TRUE
                       | FALSE
    '''
    if len(p) == 2:
        if p.slice[-1].type == "IDENTIFIER":
            success = sym_table.look_up(name=p[1],token_object=p.slice[-1])
            if success:
                p[0] = Node(name="id",value=p[1],type=success.type)
            else:
                p[0] = Node(name="id",type='error')

        elif p.slice[-1].type in {"INT_CONSTANT","HEX_CONSTANT","OCTAL_CONSTANT"}:
            p[0] = Node(name="constant",value=p[1],type=BasicType('int'))
        
        elif p.slice[-1].type in {"EXPONENT_CONSTANT","REAL_CONSTANT"}:
            p[0] = Node(name="constant",value=p[1],type=BasicType('float'))
        
        elif p.slice[-1].type == "CHAR_CONSTANT":
            p[0] = Node(name="constant",value=p[1],type=BasicType('char'))

        elif p.slice[-1].type == "STR_CONSTANT":
            str_type = PointerType(type=BasicType('char'),array_size=len(p[1]))
            p[0] = Node(name="constant",value=p[1],type=str_type)
        else:
            p[0] = Node(name="constant",value=p[1],type=BasicType('bool'))
    
    else:
        p[0] = p[2]

#Node
def p_postfix_expression(p):
    '''
    postfix_expression : primary_expression
                       | postfix_expression INCREMENT
                       | postfix_expression DECREMENT

    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        allowed_base = {'int','float','double','char','long'}
        allowed_class = {'PointerType'}
        if p[1].type == 'error':
            p[0] = p[1]
        elif p[1].type.class_type == 'BasicType' and p[1].type.type in allowed_base:
            p[0] = Node(name="unary_op",value=str(p[1].type)+': p'+p[2],type=p[1].type)
        elif p[1].type.class_type in allowed_class:
            p[0] = Node(name="unary_op",value=str(p[1].type)+': p'+p[2],type=p[1].type)
        else:
            p[0] = p[1]
            p[0].type = 'error'
            Errors(
                errorType='TypeError',
                errorText='increment/decrement not possible',
                token_object= p.slice[-1]
            )
        

def p_postfix_expression_1(p):
    # Array ref
    ''' 
    postfix_expression : postfix_expression L_SQBR expression R_SQBR
    
    '''
    allowed_class = {'BasicType'}
    allowd_base = {'int','long'}
    check1 = True
    check2 = True
    if p[3].type == "error":
        check1 = False
        p[0] = Node(type="error")
    elif p[3].type.class_type not in allowed_class or p[3].type.type not in allowd_base:
        Errors(
            errorType='TypeError',
            errorText='wrong index type'+p[3].type.stype,
            token_object= p.slice[-1]
        )
        check1  = False
        p[0] = Node(type="error")

    allowed_class = {'PointerType'}
    if p[1].type == "error":
        check2 = False
        p[0] = Node(type="error")
    elif p[1].type.class_type not in allowed_class:
        Errors(
            errorType='TypeError',
            errorText='cannot reference type'+p[1].type.stype,
            token_object= p.slice[-1]
        )
        check2  = False
        p[0] = Node(type="error")

    if check1 and check2:
        p[0] = Node(name="array_ref",value = "[]",type=p[1].type.type,children=[p[1],p[3]])


def p_postfix_expression_2(p):
    # function ref
    ''' 
    postfix_expression : postfix_expression L_PAREN R_PAREN
                       | postfix_expression L_PAREN argument_expression_list R_PAREN
    
    '''

def p_p_postfix_expression_3(p):
    # struct ref
    ''' 
    postfix_expression : postfix_expression DOT IDENTIFIER
                       | postfix_expression ARROW IDENTIFIER
    
    '''



#Node
def p_argument_expression_list(p):
    '''
    argument_expression_list : assignment_expression
	                         | argument_expression_list COMMA assignment_expression
    '''
    # if len(p) == 2:
    #     p[0] = Node("argument_expression_list",children=[p[1]])
    # else:
    #     p[1].addChild(p[3])
    #     p[0] = p[1]


#Node
def p_unary_expression(p):
    '''
    unary_expression : postfix_expression
                     | INCREMENT unary_expression
                     | DECREMENT unary_expression
                     | unary_operator cast_expression
                     | SIZEOF unary_expression
                     | SIZEOF L_PAREN type_name R_PAREN
    '''
    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("unary_op",p[1],children = [p[2]] if len(p) == 3 else [p[3]])

#String
def p_unary_operator(p):
    '''
    unary_operator : BITWISE_AND
                   | MULTIPLY
                   | ADD
                   | SUBSTRACT
                   | BITWISE_ONE_COMPLEMENT
                   | LOGICAL_NOT
    '''
    # p[0] = p[1]

#Node
def p_cast_expression(p):
    '''
    cast_expression : unary_expression
	                | L_PAREN type_name R_PAREN cast_expression
    '''
    # if len(p) == 2:
    #     p[0] = p[1]
    # else:

    #     p[0] = Node("cast",children=[p[2],p[4]])

#Node
def p_multiplicative_expression(p):
    '''
    multiplicative_expression : cast_expression
                              | multiplicative_expression MULTIPLY cast_expression
                              | multiplicative_expression DIVIDE cast_expression
                              | multiplicative_expression MODULUS cast_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_additive_expression(p):
    '''
    additive_expression : multiplicative_expression
                        | additive_expression ADD multiplicative_expression
                        | additive_expression SUBSTRACT multiplicative_expression
    '''
    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_shift_expression(p):
    '''
    shift_expression : additive_expression
                     | shift_expression LEFT_SHIFT additive_expression
                     | shift_expression RIGHT_SHIFT additive_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_relational_expression(p):
    '''
    relational_expression : shift_expression
                          | relational_expression LESS shift_expression
                          | relational_expression GREATER shift_expression
                          | relational_expression LESS_EQUALS shift_expression
                          | relational_expression GREATER_EQUALS shift_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])
        
#Node
def p_equality_expression(p):
    '''
    equality_expression : relational_expression
                        | equality_expression EQUALS relational_expression
                        | equality_expression NOT_EQUALS relational_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_and_expression(p):
    '''
    and_expression : equality_expression
	               | and_expression BITWISE_AND equality_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_exclusive_or_expression(p):
    '''
    exclusive_or_expression : and_expression
	                        | exclusive_or_expression BITWISE_XOR and_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_inclusive_or_expression(p):
    '''
    inclusive_or_expression : exclusive_or_expression
	                        | inclusive_or_expression BITWISE_OR exclusive_or_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_logical_and_expression(p):
    '''
    logical_and_expression : inclusive_or_expression
	                       | logical_and_expression LOGICAL_AND inclusive_or_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_logical_or_expression(p):
    '''
    logical_or_expression : logical_and_expression
	                      | logical_or_expression LOGICAL_OR logical_and_expression
    '''

    ### Implement typecasting logic
    allowed_class = {'BasicType'}
    allowed_base = {'bool'}

    check1 = True
    check3 = True

    if len(p) == 2:
        p[0] = p[1]
        return
    elif p[1].type=="error":
        p[0] = Node(type="error")
        check1 = False
    elif p[1].type.class_type not in allowed_class or p[1].type.type not in allowed_base:
        Errors(
            errorType = 'TypeError',
            errorText = 'wrong index type '+p[1].type.stype,
            token_object=p.slice[-1]
        )
        check1 = False
    
    if p[3].type=="error":
        p[0] = Node(type="error")
        check3 = False
    elif p[3].type.class_type not in allowed_class or p[3].type.type not in allowed_base:
        Errors(
            errorType = 'TypeError',
            errorText = 'wrong index type '+p[3].type.stype,
            token_object=p.slice[-1]
        )
        check3 = False

    if check1 and check3:
        p[0] = Node(name="or_express", value=p[2], type='BasicType', children=[p[1],p[3]])
    # else:
    #     p[0] = Node("binary_op",p[2],children = [p[1],p[3]])

#Node
def p_conditional_expression(p):
    '''
    conditional_expression : logical_or_expression
	                       | logical_or_expression QUES_MARK expression COLON conditional_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("ternary_op",children = [p[1],p[3],p[5]])

#Node
def p_assignment_expression(p):
    '''
    assignment_expression : conditional_expression
	                      | unary_expression assignment_operator assignment_expression
    '''

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("assignment",p[2],children = [p[1],p[3]])

#String
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
    # p[0] = p[1]

# Node
def p_expression(p):
    '''
    expression : assignment_expression
	           | expression COMMA assignment_expression
    ''' 
    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     if isinstance(p[1],Node) and p[1].type == "expression":
    #         p[1].addChild(p[3])
    #         p[0] = p[1]
    #     else:
    #         p[0] = Node("expression",children=[p[1],p[3]])
    
#Node
def p_constant_expression(p):
    '''
    constant_expression : conditional_expression
    '''
    # p[0] = p[1]


#List
def p_declaration(p):
    '''
    declaration : struct_specifier SEMI_COLON
                | enum_specifier SEMI_COLON
	            | type_specifier init_declarator_list SEMI_COLON
    '''
    if len(p) == 4:
        p[0] = p[2]
    else:
        p[0] = [None]



# list (can be None)
def p_init_declarator_list(p):
    '''
    init_declarator_list : init_declarator
	                     | init_declarator_list COMMA init_declarator
    '''
    p[0] = p[1] if len(p) == 2  else p[1]+p[3]


# list (can be None)
def p_init_declarator(p):
    '''
    init_declarator : declarator
	                | declarator ASSIGNMENT initializer
    '''
    success = sym_table.add_entry(name=p[1].value,type=p[1].type,token_object=p[1].data['token'])
    if len(p) == 2:
        p[0] = [None]
    else:
        if success:
            # type checking
            # check for initliazer
            p[0] = [Node(value = p[2],children = [p[1],p[3]])]
        else:
            p[0] = [None]

# Node
def p_type_specifier(p):
    '''
    type_specifier : VOID
                   | CHAR
                   | INT
                   | LONG
                   | FLOAT
                   | DOUBLE
                   | STRUCT IDENTIFIER
                   | ENUM IDENTIFIER
                   | BOOL
    '''
    if p[1] == 'enum':
        pass
    elif p[1] == 'struct':
        success = sym_table.look_up_struct(name = p[2],token_object=p.slice[-1])
        if success:
            p[0] = Node(type = success)
        else:
            p[0] = Node(type="error")
    else:
        p[0] = Node(type = BasicType(type = p[1]))


# String
def p_struct_specifier(p):
    '''
    struct_specifier : STRUCT IDENTIFIER L_BRACES add_sym struct_declaration_list pop_sym R_BRACES
    '''
    
    # todo dict
    sym_table.add_struct_entry(name=p[2],symbol_table=p[6],token_object=p.slice[2])



# dict
def p_struct_declaration_list(p):
    '''
    struct_declaration_list : struct_declaration
	                        | struct_declaration_list struct_declaration
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = p[1]
        p[0].update(p[2])
        print(p[1])

# dict
def p_struct_declaration(p):
    '''
    struct_declaration : type_specifier struct_declarator_list SEMI_COLON
    '''
    p[0] = p[2]
    print("ksjjd", p[0])


# dict
def p_struct_declarator_list(p):
    '''
    struct_declarator_list : declarator
	                       | struct_declarator_list COMMA declarator
    '''
    if len(p) == 2:
        success = sym_table.add_entry(name=p[1].value,type=p[1].type,token_object=p[1].data['token'])
        if success:
            p[0] = {p[1].value:p[1].type}
        else:
            p[0] = dict({})

    else:
        success = sym_table.add_entry(name=p[3].value,type=p[3].type,token_object=p[3].data['token'])
        if success:
            p[0] = p[1]
            p[0].update({p[3].value:p[3].type})
        else:
            p[0] = p[1]



#string
def p_enum_specifier(p):
    '''
    enum_specifier : ENUM IDENTIFIER L_BRACES enumerator_list R_BRACES
    '''
    # p[0] = p[1]

# None
def p_enumerator_list(p):
    '''
    enumerator_list : enumerator
	                | enumerator_list COMMA enumerator
    '''
    # p[0] = None

# None
def p_enumerator(p):
    '''
    enumerator : IDENTIFIER
	           | IDENTIFIER ASSIGNMENT constant_expression
    '''
    # p[0] = None


# Node
def p_declarator(p):
    '''
    declarator : pointer direct_declarator
	           | no_pointer direct_declarator
    '''
    p[0] = p[2]
    print(p[0].type, type(p[0].type), p[0].value)
    #   

    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     print(p, p[0], p[1], p[2])
    #     sym_table.add_entry(name = p[2],type = getMutliPointerType(type =p.stack[-1].value.type, level = p[1].data['pointer']), token_object=p.slice[-1])


# Node
def p_direct_declarator(p):
    '''
    direct_declarator : IDENTIFIER
                      | L_PAREN declarator R_PAREN
                      | direct_declarator L_SQBR INT_CONSTANT R_SQBR
                      | direct_declarator L_SQBR R_SQBR
    '''

    if len(p) == 2:
        # sym_table.add_entry(name= p[1],type = p.stack[-1].value.type, token_object=p.slice[-1])
        # store in direct declarator
        p[0] = Node(value=p[1], type = p.stack[-1].value.type)
        p[0].data['token'] = p.slice[-1]
    elif p[1] == '(':
        p[0] = p[2]
    elif len(p) == 4:
        p[0] = p[1]
        if p[0].type != "error":
            p[0].type = PointerType(type = p[0].type,array_size=p[3])
    else:
        p[0] = p[1]
        if p[0].type != "error":
            p[0].type = PointerType(type = p[0].type)
    


# List
def p_pointer(p):
    '''
    pointer : MULTIPLY
            | pointer MULTIPLY
    '''
    # | MULTIPLY type_qualifier_list
    # | MULTIPLY type_qualifier_list pointer
    # p[0] = [Node("pointer_ref",p[1])]
    # for i in range(2,len(p)):
    #     p[0] += p[i]
    if len(p) == 2:
        type_specifier_symbol = None
        for symbol in reversed(p.stack):
            if symbol.type == 'type_specifier':
                type_specifier_symbol = symbol
                break
        if type_specifier_symbol.value.type == "error":
            p[0] = Node(type="error")
        else:
            p[0] = Node(type = PointerType(type = type_specifier_symbol.value.type))
        #p[0] = Node(PointerType(type = p.stack[-1].value.type))
    else:
        p[0] = p[1]
        if p[0].type != "error":
            p[0].type = PointerType(type = p[1].type)

# Node

def p_no_pointer(p):
    '''
    no_pointer : 
    '''
    type_specifier_symbol = None
    for symbol in reversed(p.stack):
        if symbol.type == 'type_specifier':
            type_specifier_symbol = symbol
            break
    p[0] = Node(type = type_specifier_symbol.value.type)
    



def p_parameter_type_list(p):
    '''
    parameter_type_list : parameter_declaration
	                    | parameter_type_list COMMA parameter_declaration
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = p[1]+p[3]
    
# Node 
def p_parameter_declaration(p):
    '''
    parameter_declaration : type_specifier declarator
    '''

    success = sym_table.add_entry(name=p[2].value,type=p[2].type,token_object=p[2].data['token'])
    if success:
        p[0] = [p[2].type]
    else:
        p[0] = []



# Node
def p_type_name(p):
    '''
    type_name : type_specifier
	          | type_specifier pointer
    '''
    if len(p) == 2:
        p[0] = p[1]
    else:
        p[0] = p[2]



# Node
def p_initializer(p):
    '''
    initializer : assignment_expression
	            | L_BRACES initializer_list R_BRACES
	            | L_BRACES initializer_list COMMA R_BRACES
    '''
    # if len(p) == 2:
    #     p[0] = p[1]
    # else:
    #     p[0] = Node("init_list","{}",p[2])

# List
def p_initializer_list(p):
    '''
    initializer_list : initializer
	                 | initializer_list COMMA initializer
    '''
    # p[0] = [p[1]] if len(p) == 2 else p[1]+[p[3]]

# Node
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

# Node
def p_labeled_statement(p):
    '''
    labeled_statement : CASE constant_expression COLON statement
	                  | DEFAULT COLON statement
    '''
    # if p.slice[1].type == 'IDENTIFIER':
    #     p[0] = Node("label",children=[Node("id",p[1]),p[3]])
    # elif p.slice[1].type == 'CASE':
    #     p[0] = Node("case",children=[p[2],p[4]])
    # else:
    #     p[0] = Node("default",children=[p[3]])

# Node
def p_compound_statement(p):
    '''
    compound_statement : L_BRACES R_BRACES
	                   | L_BRACES add_sym block_item_list pop_sym R_BRACES
    '''
    if len(p) == 3:
        p[0] = Node("compound_statement","{}")
    else:
        p[0] = Node("compound_statement","{}",children=p[3])
    # print(p, p.__dict__, p[-1], p.stack[-1], p.stack[-1].__dict__)

def p_function_body(p):
    '''
    function_body : L_BRACES R_BRACES
	              | L_BRACES block_item_list R_BRACES
    '''
    if len(p) == 3:
        p[0] = Node("compound_statement","{}")
    else:
        p[0] = Node("compound_statement","{}",children=p[2])

# List
def p_block_item_list(p):
    '''
    block_item_list : block_item
                   | block_item_list block_item
    '''
    p[0] = p[1] if len(p) == 2 else p[1]+p[2]

# List     
def p_block_item(p):
    '''
    block_item : statement
                | declaration
    '''
    p[0] = [p[1]]

# Node
def p_expression_statement(p):
    '''
    expression_statement : SEMI_COLON
	                     | expression SEMI_COLON
    '''
    if len(p) == 2:
        p[0] = Node(value = p[1])
    else:
        p[0] = p[1]

# Node
def p_selection_statement(p):
    '''
    selection_statement : IF L_PAREN expression R_PAREN statement
	                    | IF L_PAREN expression R_PAREN statement ELSE statement
	                    | SWITCH L_PAREN expression R_PAREN statement
    '''
    # if p[1] == "if":
    #     if len(p) == 6:
    #         p[0] = Node("if",children=[p[3],p[5]])
    #     else:
    #         p[0] = Node("if_else",children=[p[3],p[5],p[7]])

# Node
def p_iteration_statement(p):
    '''
    iteration_statement : WHILE L_PAREN expression R_PAREN statement
	                    | DO statement WHILE L_PAREN expression R_PAREN SEMI_COLON
	                    | FOR L_PAREN expression_statement expression_statement R_PAREN statement
	                    | FOR L_PAREN expression_statement expression_statement expression R_PAREN statement
    '''
    # if p[1] == "while":
    #     p[0] = Node("iteration_statement","while",children=[p[3],p[5]])
    # elif p[1] == "do":
    #     p[0] = Node("iteration_statement","do",children=[p[2],p[5]])
    # else:
    #     if len(p) == 7:
    #         child = [p[3],p[4],p[6]]
    #     else:
    #         child = [p[3],p[4],p[5],p[7]]
    #     p[0] = Node("iteration_statement","for",child)
    
# Node
def p_jump_statement(p):
    '''
    jump_statement : CONTINUE SEMI_COLON
	               | BREAK SEMI_COLON
	               | RETURN SEMI_COLON
	               | RETURN expression SEMI_COLON
	                 
    '''
    # if len(p) == 4:
    #     c = Node("id",p[2]) if p[1] == "goto" else p[2]
    #     p[0] = Node("jump_statment",p[1],[c])
    # else:
    #     p[0] = Node("Jump Statment",p[1])

def p_add_sym(p):
    '''
        add_sym :
    '''
    sym_table.start_scope()

def p_pop_sym(p):
    '''
        pop_sym :
    '''
    p[0] = sym_table.curr_symbol_table
    sym_table.close_scope()
    
def p_error(t):
    if t is None:
        print("End of File Reached. More Input required")    
    print("syntax error at line no.{0} in file {1}, erroneous lexeme:'{2}'".format(t.lineno, t.lexer.filename,t.value))
    exit(-1)



def main():
    """Driver code for Abstract syntax tree 
    Generation"""

    #read source code provided by user
    arg_parser = argparse.ArgumentParser(description="Lexer for Source Language C")
    arg_parser.add_argument('source_code',help="source code file location")
    arg_parser.add_argument('-o',help="take the name of dot script", default="ast.dot")
    arg_parser.add_argument('-f',help="take the name of png file", default="ast.png")
    arg_parser.add_argument('-p',action='store_true',help="output dot script to console")
    arg_parser.add_argument('-l',action='store_true',help="output lexeme table")
    args = arg_parser.parse_args()

    try:
        # source_code = open(sys.argv[1],"r").read()
        source_code = open(args.source_code,"r").read()
    except FileNotFoundError:
        print("source file cannot be open/read.\nCheck the file name or numbers of arguments!!")
        sys.exit(-1)

    if args.l:
        print_lexeme(source_code)

    parser = yacc.yacc(debug=0)
    lexer.lexer.filename = args.source_code
    
    parser.parse(source_code, lexer = lexer.lexer)

    # Graph = draw_ast(parser.parse(source_code, lexer = lexer.lexer))
    # # print(args)
    # if args.p:
    #     Graph.draw(args.f, format='png')
    #     print(Graph.string())
    #     return

    # Graph.draw(args.f, format='png')

    # file = open(args.o, 'w')
    # file.write(Graph.string())
    # file.close()
    print(sym_table)

if __name__ == "__main__":
    main()


"""
#refrences: https://www.dabeaz.com/ply/ply.html
            https://www.lysator.liu.se/c/ANSI-C-grammar-y.html
"""
