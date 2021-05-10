from io import open_code
import re
from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type, Entry
from structure import getMutliPointerType
from typecheck import *


temp_cnt = 0
lable_cnt = 0
label_list = list()
alloc = dict()
temp_dict = {}

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
            return place1+":"
        
        if op == "goto":
            return "goto "+place1
        if op == "addr":
            return self.place3+" = "+"addr("+self.place1+")"
            
        if op == 'if' or op == 'ifz':
            return self.ifcode(self.place1, self.place2)

        if op == 'ifn' or op == 'ifnz':
            return self.ifncode(self.place1, self.place2)

        assert place3, "please provide variable to assign final value"
        assign_op = ["long=","int=","char=","float=","str=","bool="]
        if op == 'assign' or op in assign_op or ("struct" in op and "=" in op) or op[-2:] == "eq":
            assert place2 is None, "extra operand given for assignment"
            return self.assign(place1, place3,op)

        if not place2 or op == "func_call":
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

    def assign(self,place1, place3,op):
        assert place1, "cannot assign with single operand"
        assert place3, "cannot assign with single operand"
        if "eq" in op:
            code = place3 +' eq ' + place1
            return code
        code = place3 +' = ' + place1 #+ "({})".format(op.replace("=",""))

        return code
    
    def get_code(self):
        return self.opcode(op = self.op, place1 = self.place1, place2 = self.place2, place3 = self.place3)
    
    # def goto(self, label):
    #     assert label , "goto None not possible"
    #     return "goto " + label
    def __str__(self) -> str:
        return self.code
    
    def __repr__(self) -> str:
        return self.code



def get_newtmp(type = BasicType("long")):
    assert isinstance(type, Type), "inconsistent type for newtmp"
    global temp_cnt
    name = "tmp@"+str(temp_cnt)
    temp_cnt += 1
    sym_table.add_entry(name  = name, type = type)
    temp_dict[name] = sym_table.curr_symbol_table
    return name

def get_newlabel():
    global label_list
    global lable_cnt
    label = "label#" + str(lable_cnt)
    lable_cnt += 1
    label_list.append(label)
    return label

def get_const(const,type,use=False):
    assert isinstance(type,str) or isinstance(type,Type)
    if isinstance(type,str):
        assert type in {"bool","long","char","int","float"}
    if isinstance(type,Type):
        assert type.class_type in ["PointerType","BasicType"]
        if type.class_type == "PointerType":
            type = "long"
        else:
            assert type.type in {"bool","long","char","int","float"}
            type = type.type
    #long const
    if type != "float":
        name = "lconst@"+str(int(const))
    #float
    else:
        name = "fconst@"+str(const)
    if use: const_use(name)
    return name

def remove_backslash(string):
    s = string
    s = "\0".join(s.split("\\0"))
    s = "\b".join(s.split("\\b"))
    s = "\t".join(s.split("\\t"))
    s = "\n".join(s.split("\\n"))
    s = "\r".join(s.split("\\r"))
    s = "\v".join(s.split("\\v"))
    # print(len(s),str(s))
    return s

def get_str_const(string):
    assert isinstance(string,str)
    place = "sconst@"+string
    # if place not in alloc.keys():
    #     type = PointerType(type=BasicType("char"),array_size=len(string)+1,array_type=BasicType("char"))
    #     sym_table._add_entry(name=place,type=type)
    #     alloc[place] = string+"\0"
    return place

def const_use(place,sconst=False):
    if "sconst@" in place:
        if sconst and place not in alloc.keys():
            string = remove_backslash(place.split("@")[-1])
            # print(string,len(string))
            node_type = PointerType(type=BasicType("char"),array_size=[len(string)+1],array_type=BasicType("char"))
            sym_table._add_entry(name=place,type=node_type)
            alloc[place] = string
        return
    if place not in alloc.keys():
        node_type = BasicType("long") if place[0] == "l" else BasicType("float") 
        sym_table._add_entry(name=place,type=node_type)
        alloc[place] = get_const_value(place)

def get_const_value(place):
    global const_list
    assert "const@" in place
    if "sconst@" in place:
        return 1
    value = place.split("@")[-1]
    if "fconst@" in place:
        return float(value)
    else:
        return int(value)


def break_continue(input, break_label, continue_label):
    assert break_label, "label1 not given"
    assert continue_label, "label2 not given"

    for gens in input:
        if gens == None:
            continue
        assert isinstance(gens, gen), "input must list of gen's"
        if gens.op == 'continue':
            gens.op = 'goto'
            gens.place1 = continue_label
            gens.code = 'goto ' + continue_label
        elif gens.op == 'break':
            gens.op = 'goto'
            gens.place1 = break_label
            gens.code = 'goto ' + break_label

    return input

def break_only(input,break_label):
    assert break_label, "label1 not given"
    for gens in input:
        if gens == None:
            continue
        assert isinstance(gens, gen), "input must list of gen's"
        if gens.op == 'continue':
            return False
        if gens.op == "break":
            gens.op = 'goto'
            gens.place1 = break_label
            gens.code = 'goto ' + break_label
    return input

def fill_return(input, label):
    assert label, "wrong label"
    input = input.replace("return", "goto " + label)
    return input

def add_scope_info(entry):
    assert isinstance(entry, Entry), "entry object is of wrong class"
    return '|' + entry.symbol_table.name

def op_on_const(op,place1,place2):
    value1 = get_const_value(place1)
    value2 = get_const_value(place2)
    #length 2 op <= , => , == , >> , << , !=
    if op[-2:] == "<=": return int(value1<=value2)
    if op[-2:] == ">=": return int(value1>=value2)
    if op[-2:] == "==": return int(value1==value2)
    if op[-2:] == "!=": return int(value1!=value2)
    if op[-2:] == ">>": return value1>>value2
    if op[-2:] == "<<": return value1<<value2
    #length 1 +,-,/,*,%,^,&,|
    if op[-1] == "+": return value1+value2
    if op[-1] == "-": return value1-value2
    if op[-1] == "/": return value1 / value2 #handle division by zero
    if op[-1] == "*": return value1*value2
    if op[-1] == "%": return value1%value2
    if op[-1] == "^": return value1^value2
    if op[-1] == "&": return value1&value2
    if op[-1] == "|": return value1|value2
    if op[-1] == ">": return int(value1>value2)
    if op[-1] == "<": return int(value1<value2)
    assert False, op + "not in list"



def get_opcode(op=None,place1=None,place2=None,type=None):
    if isinstance(type,str):
        type = BasicType(type)
    assert "sconst@" not in place1 and "sconst@" not in place2, "string"
    if "const@" in place1 and "const@" in place2:
        return get_const(op_on_const(op,place1,place2),type=type), None
    tmp = get_newtmp(type)
    place1 = str(place1)
    place2 = str(place2)
    if op != "=":
        code = gen(op=op,place1=place1,place2=place2,place3=tmp)
        if "const@" in place1:
            const_use(place1)
        if "const@" in place2:
            const_use(place2)
    else:
        code = gen(op=op,place1=place1,place3=tmp)
        if "const@" in place1:
            const_use(place1)
    return tmp,code



def has_break_continue(input):
    for gens in input:
        if gens == None:
            continue
        assert isinstance(gens, gen), "input must list of gen's"
        if gens.op == "break" or gens.op == "continue":
            return True
    return False

def remove_none(code_list):
    new_code_list = []
    for code in code_list:
        if code != None:
            new_code_list.append(code)
    return new_code_list

def remove_label(code_list):
    global label_list
    new_label = dict()
    new_label_cnt = 0
    i = 0
    while(i<len(code_list)):
        if code_list[i].op == "label" and code_list[i].place1[:6] == "label#":
            label = "label#" + str(new_label_cnt)
            new_label_cnt += 1
            new_label[code_list[i].place1] = label
            i += 1
            while(i<len(code_list) and code_list[i].op == "label" and code_list[i].place1[:6] == "label#"):
                new_label[code_list[i].place1] = label
                i += 1
        else:
            i += 1
    # for k,v in new_label.items():
    #     print(k,v,sep=": ")
    new_code_list = []
    for code in code_list:
        if code.op == "label":
            label = new_label.get(code.place1,code.place1)
            if len(new_code_list) == 0 or new_code_list[-1].op != "label" or new_code_list[-1].place1 != label:
                new_code_list.append(gen(op="label",place1=label))
        elif code.op == "goto":
            label = new_label.get(code.place1,code.place1)
            new_code_list.append(gen(op="goto",place1=label))
        elif code.op == "ifz" or code.op == "ifnz":
            label = new_label.get(code.place2,code.place2)
            new_code_list.append(gen(op=code.op,place1=code.place1,place2=label))
        elif "if_not_cmp_" in code.op:
            label = new_label.get(code.place3,code.place3)
            new_code_list.append(gen(op=code.op,place1=code.place1,place2=code.place2,place3=label,code="if "+code.place1+" <> "+code.place2+" goto "+label))
        else:
            new_code_list.append(code)
    return new_code_list
    
