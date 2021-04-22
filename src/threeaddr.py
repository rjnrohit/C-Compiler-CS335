from io import open_code
import re
from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type, Entry
from structure import getMutliPointerType
from structure import implicit_casting
from typecheck import *

temp_cnt = 0
lable_cnt = 0


class gen:

    def __init__(self,op  = None, plcae3 = None, place2 = None, place1 = None):
        assert plcae3, "place3 must be present"
        self.op = op
        self.place3 = plcae3
        self.place2 = place2
        self.place1 = place1
        self.code = self.get_code()
    
    def unary_opcode(self, op = None, place3 = None, place1 = None):
        assert place3, "please provide variable to assign final value"
        return place3 +' = ' + op + place1 + '\n'

    def opcode(self,op  = None, place3 = None, place2 = None, place1 = None):

        assert place3, "please provide variable to assign final value"
        assert place1, "there must be atleast one operand in 3AC"

        if op is None or op == 'assign':
            assert place2 is None, "extra operand given for assignment"
            return self.assign(place1, place3)

        if not place2:
            return self.unary_opcode(op, place1, place3)
        
        return place3 + ' = ' + place1 + op + place2 + '\n'
    
    def ifcode(self,place, label1 , label2 = None):

        assert label1, "provide first label"

        code = "ifnz " + place + " goto " + label1
        if label2:
            code += "goto " + label2
        return code + '\n'

    def assign(self,place1, place3):
        assert place1, "cannot assign with single operand"
        assert place3, "cannot assign with single operand"

        code = place3 +' = ' + place1

        return code + '\n'
    
    def get_code(self):
        return self.opcode(op = self.op, place1 = self.place1, place2 = self.place2, place3 = self.place3)



def newtmp(type = None):
    assert isinstance(type, Type), "inconsistent type for newtmp"
    name = "tmp@"+str(temp_cnt)
    temp_cnt += 1
    sym_table.add_entry(name  = name, type = type)

def newlabel():
    lable_cnt += 1
    return "label#" + str(lable_cnt) + ':\n'



def break_continue(input, break_label, continue_label):
    assert break_label, "label1 not given"
    assert continue_label, "label2 not given"

    input = input.replace("continue", "goto " + continue_label)
    input = input.replace("break", "goto " + break_label)

    return input



def add_scope_info(entry):
    assert isinstance(entry, Entry), "entry object is of wrong class"
    return '|' + entry.symbol_table.name

    
    