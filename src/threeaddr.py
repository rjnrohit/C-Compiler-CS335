from io import open_code
import re
from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type, Entry
from structure import getMutliPointerType
from typecheck import *

temp_cnt = 0
lable_cnt = 0
label_list = []



class gen:

    def __init__(self,op  = None, place3 = None, place2 = None, place1 = None, code = None):
        # assert place3, "place3 must be present"
        self.op = op
        self.place3 = place3
        self.place2 = place2
        self.place1 = place1

        if not code:
            self.code = self.get_code()
        else:
            self.code = code


    def unary_opcode(self, op = None, place1 = None, place3 = None):
        assert place3, "please provide variable to assign final value"
        return place3 +' = ' + op + " " + place1

    def opcode(self,op  = None, place3 = None, place2 = None, place1 = None):

        assert place1, "there must be atleast one operand in 3AC"

        if "label" in op:
            assert place2 is None, "place2 is not None"
            assert place3 is None, "place3 is not None"
            return op + place1
        
        if op == 'if' or op == 'ifz':
            return self.ifcode(self.place1, self.place2)

        if op == 'ifn' or op == 'ifnz':
            return self.ifncode(self.place1, self.place2)

        assert place3, "please provide variable to assign final value"

        if op == 'assign' or op == '=':
            assert place2 is None, "extra operand given for assignment"
            return self.assign(place1, place3)

        if not place2:
            return self.unary_opcode(op, place1, place3)
        
        return place3 + ' = ' + place1 + " " + op + " " + place2
    
    def ifcode(self,place, label1):

        assert label1, "provide label in if"

        code = "ifz " + place + " goto " + label1
        return code 
    
    def ifncode(self, place, label1):
        assert label1, "provide label in if"

        code = "ifnz " + place + " goto " + label1
        return code

    def assign(self,place1, place3):
        assert place1, "cannot assign with single operand"
        assert place3, "cannot assign with single operand"

        code = place3 +' = ' + place1

        return code
    
    def get_code(self):
        return self.opcode(op = self.op, place1 = self.place1, place2 = self.place2, place3 = self.place3)
    
    def goto(self, label):
        assert label , "goto None not possible"
        return "goto " + label



def get_newtmp(type = BasicType("long")):
    assert isinstance(type, Type), "inconsistent type for newtmp"
    global temp_cnt
    name = "tmp@"+str(temp_cnt)
    temp_cnt += 1
    sym_table.add_entry(name  = name, type = type)
    return name

def get_newlabel():
    global label_list
    global lable_cnt
    label = "label#" + str(lable_cnt)
    lable_cnt += 1
    label_list.append(label)
    return label



def break_continue(input, break_label, continue_label):
    assert break_label, "label1 not given"
    assert continue_label, "label2 not given"

    for gens in input:
        assert isinstance(gens, gen), "input must list of gen's"
        if gens.op == 'continue':
            #input.op == 'goto'
            gens.place1 == continue_label
            gens.code = 'goto ' + continue_label
        elif gens.op == 'break':
            #input.op == 'goto'
            gens.place1 == break_label
            gens.code = 'goto ' + break_label

    return input

def fill_return(input, label):
    assert label, "wrong label"
    input = input.replace("return", "goto " + label)
    return input

def add_scope_info(entry):
    assert isinstance(entry, Entry), "entry object is of wrong class"
    return '|' + entry.symbol_table.name

    
def get_opcode(op=None,place1=None,place2=None,type=None):
    if isinstance(type,str):
        type = BasicType(type)
    tmp = get_newtmp(type)
    place1 = str(place1)
    place2 = str(place2)
    if op != "=":
        code = gen(op=op,place1=place1,place2=place2,place3=tmp)
    else:
        code = gen(op=op,place1=place1,place3=tmp)
    return tmp,code

def print_code(code_list):
    for obj in code_list:
        if obj.code:
            print(obj.code)



