import re
from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type
from structure import getMutliPointerType
from structure import implicit_casting
from typecheck import *

temp_cnt = 0
lable_cnt = 0
label_list = []


def newtmp(type = None):
    assert isinstance(type, Type), "inconsistent type for newtmp"
    name = "tmp@"+str(temp_cnt)
    temp_cnt += 1
    sym_table.add_entry(name  = name, type = type)

def newlabel():
    label = "label#" + str(lable_cnt)+"\n"
    lable_cnt += 1
    label_list.append(label)
    return label


def unary_opcode(op, opr1, tmp):

    assert tmp, "please provide variable to assign final value"
    return tmp +' = ' + op + opr1 + '\n'

def opcode(op = None, opr1 = None, opr2=None, tmp = None):

    assert tmp, "please provide variable to assign final value"
    assert opr1, "there must be atleast one operand in 3AC"

    if op is None or op == 'assign':
        assert opr2 is None, "extra operand given for assignment"
        return assign(opr1, tmp)

    if not opr2:
        return unary_opcode(op, opr1, tmp)
    
    return tmp + ' = ' + opr1 + op + opr2 + '\n'


def break_continue(input, break_label, continue_label):
    assert break_label, "label1 not given"
    assert continue_label, "label2 not given"

    input = input.replace("continue", "goto " + continue_label)
    input = input.replace("break", "goto " + break_label)

    return input


def ifcode(tmp, label1 , label2 = None):

    assert label1, "provide first label"

    code = "ifnz " + tmp + " goto " + label1
    if label2:
        code += "goto " + label2
    return code + '\n'

def assign(opr1, tmp):
    assert opr1, "cannot assign with single operand"
    assert tmp, "cannot assign with single operand"

    code = tmp +' = ' + opr1

    return code + '\n'


def add_scope_info(sym_table):
    return '@' + sym_table.curr_symbol_table.name
    
    