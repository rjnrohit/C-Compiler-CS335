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
    label = "label#" + str(lable_cnt)
    lable_cnt += 1
    label_list.append(label)
    return label


def unary_opcode(op, opr1, tmp):

    assert tmp, "please provide variable to assign final value"
    return tmp +' = ' + op + opr1

def opcode(op, opr1, opr2=None, tmp = None):

    assert tmp, "please provide variable to assign final value"

    if not opr2:
        return unary_opcode(op, opr1, tmp)
    
    return tmp + ' = ' + opr1 + op + opr2


def break_continue(input, break_label, continue_label):
    assert break_label, "label1 not given"
    assert continue_label, "label2 not given"

    input = input.replace("continue", "goto " + continue_label)
    input = input.replace("break", "goto " + break_label)

    return input


def ifcode(tmp, label1 , label2 = None):

    assert label1, "provide first label"

    code = "if ze " + tmp + " goto " + label1
    if label2:
        code += "goto " + label2
    return code

    
    