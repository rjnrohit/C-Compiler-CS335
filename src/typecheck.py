from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type
from threeaddr import *
import copy
         

#multiplication, division, modulus
def type_check_unary(node1,op,token,is_typename=False):
    allowed_base = {'int','float','char','long'}
    allowed_base_1 = {'int','char','long'}
    error = False
    error_const = False
    if node1.type == "error":
        return Node(type="error")
    const = False
    if 'const@' in node1.place:
        const = True
    if (op == "++" or op == "--"):
        if const:
            error_const = True
        elif node1.type.class_type == "BasicType" and node1.type.type in allowed_base:
            node =  Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            node.code = node1.code
            const_place = get_const(const=1,type=node1.type,use=True)
            node.code += [gen(op=node1.type.stype+op[0],place1=node1.place,place2=const_place,place3=node1.place)]
            node.place = node1.place
            return node
        elif node1.type.class_type == "PointerType":
            node = Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            node.code = node1.code
            width = node1.type.type_size
            const_place = get_const(const=width,type="long",use=True)
            node.code += [gen(op="long"+op[0],place1=node1.place,place2=const_place,place3=node1.place)]
            node.place = node1.place
            return node
        else: error = True
    elif op == "+" or op == "-":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base:
            node =  Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            if op == "+":
                node.place = node1.place
                return node
            if "const@" in node1.place:
                neg = -1 if op == "-" else 1
                node.place = get_const(neg*get_const_value(node1.place),type=node1.type)
                return node
            node.code = node1.code
            node.place = get_newtmp(type=node1.type)
            node.code += [gen(op="u"+node1.type.stype+op,place1=node1.place,place3=node.place)]
            return node
        error = True
    elif op == "&":
        if const:
            error_const = True
        else:
            node =  Node(name="unary_op",value=op,children=[node1],type=PointerType(node1.type))
            node.code = node1.code
            node.place = get_newtmp()
            node.code += [gen(op="addr",place1=node1.place,place3=node.place,code=node.place+" = "+"addr("+node1.place+")")]
            return node
    elif op == "*":
        if const:
            error_const = True
        elif node1.type.class_type == "PointerType":
            node = Node(name="unary_op",value=op,children=[node1],type=node1.type.type)
            if node.type.class_type == "PointerType":
                node.type.array_size = node1.type.array_size[1:]
            node.code = node1.code
            # node.place = get_newtmp(node1.type.type)
            # node.code += [gen(op="load",place1=node1.place,place3=node.place,code=node.place+" = "+"load("+node1.place+")")]
            node.place = "load$"+node1.place
            return node
        else:
            Errors(
                errorType='TypeError',
                errorText="cannot dereference non-pointer type "+node1.type.stype,
                token_object= token
            )
            return Node(type="error")
    elif op == "~":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base_1:
            node = Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            if "const@" in node1.place:
                node.place = get_const(~get_const_value(node1.place),type=node1.type)
                return node
            node.code = node1.code
            node.place = get_newtmp(type=node1.type)
            node.code += [gen(op=node1.type.stype+op,place1=node1.place,place3=node.place)]
            return node
        error = True
    elif op == "!":
        if node1.type.is_convertible_to(BasicType('bool')):
            node = Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=BasicType('bool'))
            if "const@" in node1.place:
                value = 0 if get_const_value(node1.place) == 0 else 1
                node.place = get_const(value,type='bool')
                return node
            node.code = node1.code
            node.place = get_newtmp(type=BasicType('bool'))
            node.code += [gen(op="not_bool",place1=node1.place,place3=node.place)]
            return node
        error = True
    elif op == "sizeof":
        if is_typename:
            node = Node(name = "unary_op", value=op+':'+node1.type.stype,type = BasicType(type = 'long'))
            node.place = get_const(const=node1.type.width,type="long")
            # node.code += [gen(op="=",place1=str(node1.type.width),place3=node.place)]
            return node
        if isinstance(node1.type,Type) == False:
            Errors(
                errorType='TypeError',
                errorText="cannot do sizeof on non type",
                token_object= token
            )
            return Node(type="error")
        if node1.type.class_type in {'BasicType','PointerType','StructType'}:
            node =  Node(name = "unary_op",value=op,type = BasicType(type='long'),children=[node1])
            node.place = get_const(const=node1.type.width,type="long")
            # node.code += [gen(op="=",place1=str(node1.type.width),place3=node.place)]
            return node
        error = True
    
    if error_const:
        Errors(
            errorType='TypeError',
            errorText=op + " not valid on constant",
            token_object= token
        )
        return Node(type="error")
    if error:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype,
            token_object= token
        )
        return Node(type="error")



def type_check_multi(node1,node2,op,token,decimal=True):
    allowed_class = {'BasicType'}
    allowed_base = {'int','long','char'}
    if decimal: allowed_base = {'int','long','char','float'}
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if node1.type.class_type not in allowed_class or node2.type.class_type not in allowed_class:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")

    if node1.type.type not in allowed_base or node2.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
        
    node1,node2,typ = implicit_casting(node1,node2)
    node = Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=typ)
    node.code = node1.code + node2.code
    tmp,code = get_opcode(op=typ.stype+op,place1=node1.place,place2=node2.place,type=typ)
    node.code += [code]
    node.place = tmp
    return node

# addition, subtraction
def type_check_add(node1,node2,op,token):
    allowed_class = [('PointerType','BasicType'),('BasicType','PointerType'),('BasicType','BasicType')]
    allowed_base = [{'int','long','char'},{'int','long','char'},{'int','long','char','float','bool'}]
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if "sconst@" in node1.place or "sconst@" in node2.place:
        Errors(
            errorType='TypeError',
            errorText=op+' not support string constant',
            token_object= token
        )
        return Node(type="error")
    class1 = node1.type.class_type
    class2 = node2.type.class_type
    if (class1,class2) not in allowed_class:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
    i = allowed_class.index((class1,class2))
    if i == 0:
        if node2.type.type not in allowed_base[i]:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
        node = Node(name="binary_op",value=node1.type.stype+op,type=node1.type,children = [node1,node2])
        node.code = node1.code + node2.code
        width = node1.type.type_size
        const_place = get_const(width,type="long")
        tmp,code = get_opcode(op="long*",place1=node2.place,place2=const_place,type="long")
        node.code += [code]
        tmp,code = get_opcode(op="long"+op,place1=node1.place,place2=tmp,type="long")
        node.code += [code]
        node.place = tmp
        return node
        
    if i == 1:
        if node1.type.type not in allowed_base[i]:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
        node = Node(name="binary_op",value=node2.type.stype+op,type=node2.type,children = [node2,node1])
        node.code = node1.code + node2.code
        width = node2.type.type_size
        const_place = get_const(width,type="long")
        tmp,code = get_opcode(op="long*",place1=node1.place,place2=const_place,type="long")
        node.code += [code]
        tmp,code = get_opcode(op="long"+op,place1=node2.place,place2=tmp,type="long")
        node.code += [code]
        node.place = tmp
        return node
    if i == 2:
        if node1.type.type not in allowed_base[i] or node2.type.type not in allowed_base[i]:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
        node1,node2,typ = implicit_casting(node1,node2)
        node = Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=typ)
        node.code = node1.code + node2.code
        tmp,code = get_opcode(op=typ.stype+op,place1=node1.place,place2=node2.place,type=typ)
        node.code += [code]
        node.place = tmp
        return node

#bitwise xor,and,or,shift
def type_check_bit(node1,node2,op,token):
    allowed_class = {'BasicType'}
    allowed_base = {'int','long','char','bool'}
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if node1.type.class_type not in allowed_class or node2.type.class_type not in allowed_class:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")

    if node1.type.type not in allowed_base or node2.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
        
    node1,node2,typ = implicit_casting(node1,node2)
    node = Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=typ)
    node.code = node1.code + node2.code
    tmp,code = get_opcode(op=typ.stype+op,place1=node1.place,place2=node2.place,type=typ)
    node.code += [code]
    node.place = tmp
    return node

#less than, greater than, equal , not equal
def type_check_relational(node1,node2,op,token):
    allowed_class = {'BasicType','PointerType'}
    allowed_base = {'int','long','char','float','bool'}
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if "sconst@" in node1.place or "sconst@" in node2.place:
        Errors(
            errorType='TypeError',
            errorText=op+' not support string constant',
            token_object= token
        )
        return Node(type="error")
    if node1.type.class_type not in allowed_class or node2.type.class_type not in allowed_class:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
    if node1.type.class_type == "PointerType":
        node1.type = BasicType("long")
    if node2.type.class_type == "PointerType":
        node2.type = BasicType("long")
    if node1.type.type not in allowed_base or node2.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
        
    node1,node2,typ = implicit_casting(node1,node2)
    node = Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=BasicType('bool'))
    node.code = node1.code + node2.code
    tmp,code = get_opcode(op=typ.stype+op,place1=node1.place,place2=node2.place,type=BasicType('bool'))
    node.code += [code]
    node.place = tmp
    return node

def type_check_logical(node1,node2,op,token):
    allowed_class = {'BasicType','PointerType'}
    allowed_base = {'int','long','char','float','bool'}
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if "sconst@" in node1.place or "sconst@" in node2.place:
        Errors(
            errorType='TypeError',
            errorText=op+' not support string constant',
            token_object= token
        )
        return Node(type="error")
    if node1.type.class_type not in allowed_class or node2.type.class_type not in allowed_class:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
    if node1.type.class_type == "BasicType" and node1.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
    if node2.type.class_type == "BasicType" and node2.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
        
    # if node1.type.type != "bool": 
    #     node1 = typecast(node1,BasicType("bool"))
    # if node2.type.type != "bool":
    #     node2 = typecast(node2,BasicType("bool"))
    node = Node(name="binary_op",value=op,children = [node1,node2],type=BasicType('bool'))
    # node.code = node1.code + node2.code
    # tmp,code = get_opcode(op=op,place1=node1.place,place2=node2.place,type=BasicType('bool'))
    # node.code += [code]
    # node.place = tmp
    if op == "&&":
        if "const@" in node1.place and "const@" in node2.place:
            value = 1 if get_const_value(node1.place) and get_const_value(node2.place) else 0
            node.place = get_const(value,"bool")
            return node
        if "const@" in node1.place:
            const_use(node1.place)
        if "const@" in node2.place:
            const_use(node2.place)
        node.place = get_newtmp(BasicType('bool'))
        label1 = get_newlabel()
        label2 = get_newlabel()
        node.code = node1.code
        node.code += [gen(op="ifz",place1=node1.place,place2=label1)]
        node.code += node2.code
        node.code += [gen(op="ifz",place1=node2.place,place2=label1)]
        node.code += [gen(op="=",place1=get_const(1,type='bool',use=True),place3=node.place)]
        node.code += [gen(op="goto",place1=label2)]
        node.code += [gen(op="label",place1=label1)]
        node.code += [gen(op="=",place1=get_const(0,type='bool',use=True),place3=node.place)]
        node.code += [gen(op="label",place1=label2)]
    else:
        if "const@" in node1.place and "const@" in node2.place:
            value = 1 if get_const_value(node1.place) or get_const_value(node2.place) else 0
            node.place = get_const(value,"bool")
            return node
        if "const@" in node1.place:
            const_use(node1.place)
        if "const@" in node2.place:
            const_use(node2.place)
        node.place = get_newtmp(BasicType('bool'))
        label1 = get_newlabel()
        label2 = get_newlabel()
        node.code = node1.code
        node.code += [gen(op="ifnz",place1=node1.place,place2=label1)]
        node.code += node2.code
        node.code += [gen(op="ifnz",place1=node2.place,place2=label1)]
        node.code += [gen(op="=",place1="get_const(0,type='bool',use=True)",place3=node.place)]
        node.code += [gen(op="goto",place1=label2)]
        node.code += [gen(op="label",place1=label1)]
        node.code += [gen(op="=",place1=get_const(1,type='bool',use=True),place3=node.place)]
        node.code += [gen(op="label",place1=label2)]
    return node


def type_check_assign(node1,node2,token):
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if "const@" in node1.place:
        Errors(
                errorType='TypeError',
                errorText="cannot asign to constant",
                token_object= token
        )
        return Node(type="error")
    if "sconst@" in node2.place:
        Errors(
                errorType='TypeError',
                errorText="can asign string constant only in declaration",
                token_object= token
        )
        return Node(type="error")
    if node2.type.is_convertible_to(node1.type):
        node2 = typecast(node2,type=node1.type)
        node = Node("binary_op",node1.type.stype+"=",children = [node1,node2],type=node1.type)
        node.code = node1.code + node2.code
        if "load$" in node1.place:
            place = node1.place.split("load$")[-1]
            node.code += [gen(op=get_type(node2)+"_eq",place1=node2.place,place3=place)]
        else:
            node.code += [gen(op=get_type(node2)+"=",place1=node2.place,place3=node1.place)]
        if "const@" in node2.place:
            const_use(node2.place)
        node.place = node1.place
        node = load_place(node)
        return node
    Errors(
        errorType='TypeError',
        errorText="cannot assign " + node2.type.stype+ " to "+node1.type.stype,
        token_object= token
    )
    return Node(type="error")

#getcopy
def type_check_assign_op(node1,node2,op,token):
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if op == "=":
        return type_check_assign(node1,node2,token)
    op = op[:-1]
    eq_node = copy.copy(node1)
    node1 = load_place(node1)
    if op == "+" or op == "-":
        node = type_check_add(node1,node2,op,token)
    elif op == "/" or op == "*":
        node = type_check_multi(node1,node2,op,token)
    elif op == "%":
        node = type_check_multi(node1,node2,op,token,decimal=False)
    elif op == "^" or op == "&" or op == "|":
        node = type_check_bit(node1,node2,op,token)
    else:
        Errors(
            errorType='SyntaxError',
            errorText="invalid "+op+"=",
            token_object= token
        )
        return Node(type="error")
    return type_check_assign(eq_node,node,token)
    

def typecast(node1,type,token=None):
    node1 = load_place(node1)
    assert isinstance(type,Type), "not of class Type"
    assert type.class_type in {"BasicType","PointerType","StructType"}, "not valid type"
    # assert node1.type.class_type in {"BasicType","PointerType"}, "not valid type"
    # assert "sconst@" not in node1.place, "string in typecast"
    if node1.type.stype == type.stype:
        return node1
    elif "sconst@" in node1.place:
        # print(str(node1.type.stype),str(type.stype))
        if token:
            Errors(
                errorType='TypeError',
                errorText="cannot assign string constant to type " + type.stype,
                token_object= token
            )
            return Node(type="error")
        else:
            assert "string in typecast"
    else:
        node = Node(name="type_cast",value=type.stype,children=[node1],type=type)
        node.code = node1.code
        node.place = node1.place
        if type.class_type == 'PointerType':
            type1 = 'long'
        else:
            type1 = type.type
        if node1.type.class_type == 'PointerType':
            type2 = 'long'
        else:
            type2 = node1.type.type
        
        if type1 == type2:
            return node
        if "const@" in node1.place:
            node.place = get_const(const=get_const_value(node1.place),type=BasicType(type1))
            return node
        node.place = get_newtmp(type=BasicType(type1))
        node.code += [gen(op=type2+"_to_"+type1,place1=node1.place,place3=node.place,code=node.place + " = "+type2+"_to_"+type1+" "+node1.place)]
    return node

def implicit_casting(node1,node2):
    list_type = {'double':1,'float':2,'long':3,'int':4,'char':5,'bool':6}
    if node1.type.class_type != 'BasicType' or  node2.type.class_type != 'BasicType':
        #print('1')
        return None
    if node1.type.type not in list_type or  node1.type.type not in list_type:
        #print('2')
        return None
    else:
        rank1 = list_type[node1.type.type]
        rank2 = list_type[node2.type.type]
        if rank1 == rank2:
            return node1,node2,node1.type
        elif rank1 < rank2:
            new_node = typecast(node2,node1.type)
            return node1,new_node,node1.type
        else:
            new_node = typecast(node1,node2.type)
            return new_node,node2,node2.type

def get_type(node):
    assert node.type.class_type in {"BasicType","PointerType","StructType"}, "not valid type"
    if "sconst@" in node.place:
        return "str"
    if node.type.class_type == "StructType":
        return node.type.stype
    if node.type.class_type == "PointerType":
        return "long"
    return node.type.type

def load_place(node):
    if node.type == "error":
        return node
    if "load$" not in node.place:
        return node
    if node.type.class_type == "PointerType" and node.type.is_array == True:
        node.place = node.place.split("load$")[-1]
        return node
    tmp = get_newtmp(type=node.type)
    place = node.place.split("load$")[-1]
    print(tmp)
    node.code += [gen(op="load",place1=place,place3=tmp,code=tmp + " = " + "load("+place+")")]
    node.place = tmp
    return node
