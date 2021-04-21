from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type
from structure import getMutliPointerType
from structure import implicit_casting
from typecheck import *

temp_cnt = 0
lable_cnt = 0

def newtmp(type = None):
    assert isinstance(type, Type), "inconsistent type for newtmp"
    name = "tmp@"+str(temp_cnt)
    temp_cnt += 1
    sym_table.add_entry(name  = name, type = type)

def newlabel():
    return "label#" + str(lable_cnt)


def unary_opcode(op, opr1, tmp):

    assert tmp, "please provide variable to assign final value"
    return tmp +' = ' + op + opr1

def opcode(op, opr1, opr2=None, tmp = None):

    assert tmp, "please provide variable to assign final value"

    if not opr2:
        return unary_opcode(op, opr1, tmp)
    
    return tmp + ' = ' + opr1 + op + opr2


    