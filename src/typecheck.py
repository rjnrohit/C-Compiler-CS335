from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type
from threeaddr import *


def type_check_init(init,type,token):
    if isinstance(init,Node):
        if init.type == "error":
            return Node(type="error")
        if init.type.is_convertible_to(type):
            return init
        else:
            Errors(
            errorType='TypeError',
            errorText="cannot assign "+init.type.stype+" to "+type.stype,
            token_object= token
            )
        return Node(type="error")
    if type.class_type != "PointerType":
        Errors(
            errorType='TypeError',
            errorText="cannot assign array to "+type.stype,
            token_object= token
        )
        return Node(type="error")
    if isinstance(init[0],Node): leng = 0
    else: leng = len(init[0])
    size_error = False
    for i in init[1:]:
        if (isinstance(i,Node) and leng != 0) or (isinstance(i,list) and leng != len(i)):
            size_error = True
            break
    if size_error:
        Errors(
            errorType='TypeError',
            errorText="size of arrays not matching",
            token_object= token
        )
        return Node(type="error")
    children = []
    for i in init:
        node = type_check_init(i,type.type,token)
        if node.type == "error":
            return Node(type="error")
        children.append(node)
    return Node(name="init_array",value="{}",children=children,type=type)

#multiplication, division, modulus
def type_check_unary(node1,op,token,is_typename=False):
    allowed_base = {'int','float','double','char','long'}
    allowed_base_1 = {'int','char','long'}
    error = False
    if node1.type == "error":
        return Node(type="error")
    if op == "++" or op == "--":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base:
            node =  Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            node.code = node1.code
            node.code += [gen(op=node1.type.stype+op[0]+"_c",place1=node1.place,place2="1",place3=node1.place)]
            node.place = node1.place
            return node
        if node1.type.class_type == "PointerType":
            node = Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            node.code = node1.code
            width = node1.type.type_size
            node.code += [gen(op="long"+op[0]+"_c",place1=node1.place,place2=str(width),place3=node1.place)]
            node.place = node1.place
            return node
        error = True
    elif op == "+" or op == "-":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base:
            node =  Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            node.code = node1.code
            node.place = get_newtmp(type=node1.type)
            node.code += [gen(op=node1.type.stype+op,place1=node1.place,place3=node.place)]
            return node
        error = True
    elif op == "&":
        node =  Node(name="unary_op",value=op,children=[node1],type=PointerType(node1.type))
        node.code = node1.code
        node.place = get_newtmp()
        node.code += [gen(op="addr",place1=node1.place,place3=node.place,code=node.place+" = "+"addr("+node1.place+")")]
        return node
    elif op == "*":
        if node1.type.class_type == "PointerType":
            node = Node(name="unary_op",value=op,children=[node1],type=node1.type.type)
            node.code = node1.code
            node.place = get_newtmp(node1.type.type)
            node.code += [gen(op="*",place1=node1.place,place3=node.place,code=node.place+" = "+"load("+node1.place+")")]
            return node
        Errors(
            errorType='TypeError',
            errorText="cannot dereference non-pointer type "+node1.type.stype,
            token_object= token
        )
        return Node(type="error")
    elif op == "~":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base_1:
            node = Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
            node.code = node1.code
            node.place = get_newtmp(type=node1.type)
            node.code += [gen(op=node1.type.stype+op,place1=node1.place,place3=node.place)]
            return node
        error = True
    elif op == "!":
        if node1.type.is_convertible_to(BasicType('bool')):
            node = Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=BasicType('bool'))
            node.code = node1.code
            node.place = get_newtmp(type=BasicType('bool'))
            node.code += [gen(op="not_bool",place1=node1.place,place3=node.place)]
            return node
        error = True
    elif op == "sizeof":
        if is_typename:
            node = Node(name = "unary_op", value=op+':'+node1.type.stype,type = BasicType(type = 'long'))
            node.place = get_newtmp()
            node.code += [gen(op="=",place1=str(node1.type.width),place3=node.place)]
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
            node.place = get_newtmp()
            node.code += [gen(op="=",place1=str(node1.type.width),place3=node.place)]
            return node
        error = True
    
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
    if decimal: allowed_base = {'int','long','char','float','double'}
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
    allowed_base = [{'int','long','char'},{'int','long','char'},{'int','long','char','double','float','bool'}]
    if node1.type == "error" or node2.type == "error":
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
        tmp = get_newtmp()
        width = node1.type.type_size
        node.code += [gen(op="long*_c",place1=node2.place,place2=str(width),place3=tmp)]
        node.code += [gen(op="long"+op,place1=node1.place,place2=tmp,place3=tmp)]
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
        tmp = get_newtmp()
        width = node2.type.type_size
        node.code += [gen(op="long*_c",place1=node1.place,place2=str(width),place3=tmp)]
        node.code += [gen(op="long"+op,place1=node2.place,place2=tmp,place3=tmp)]
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
    allowed_base = {'int','long','char','double','float','bool'}
    if node1.type == "error" or node2.type == "error":
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
    allowed_base = {'int','long','char','double','float','bool'}
    if node1.type == "error" or node2.type == "error":
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
    node.place = get_newtmp(BasicType('bool'))
    label1 = get_newlabel()
    label2 = get_newlabel()
    if op == "&&":
        node.code = node1.code
        node.code += [gen(op="ifz",place1=node1.place,place2=label1)]
        node.code += node2.code
        node.code += [gen(op="ifz",place1=node2.place,place2=label1)]
        node.code += [gen(op="eqc",place1="1",place3=node.place)]
        node.code += [gen(op="goto",place1=label2)]
        node.code += [gen(op="label",place1=label1)]
        node.code += [gen(op="eqc",place1="0",place3=node.place)]
        node.code += [gen(op="label",place1=label2)]
    else:
        node.code = node1.code
        node.code += [gen(op="ifnz",place1=node1.place,place2=label1)]
        node.code += node2.code
        node.code += [gen(op="ifnz",place1=node2.place,place2=label1)]
        node.code += [gen(op="eqc",place1="0",place3=node.place)]
        node.code += [gen(op="goto",place1=label2)]
        node.code += [gen(op="label",place1=label1)]
        node.code += [gen(op="eqc",place1="1",place3=node.place)]
        node.code += [gen(op="label",place1=label2)]
    return node


def type_check_assign(node1,node2,token):
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if node2.type.is_convertible_to(node1.type):
        node2 = typecast(node2,type=node1.type)
        node = Node("binary_op",node1.type.stype+"=",children = [node1,node2],type=node1.type)
        node.code = node1.code + node2.code
        node.code += [gen(op="=",place1=node2.place,place3=node1.place)]
        node.place = node1.place
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
    return type_check_assign(node1,node,token)
    

def typecast(node1,type):
    assert isinstance(type,Type), "not of class Type"
    assert type.class_type in {"BasicType","PointerType"}, "not valid type"
    assert node1.type.class_type in {"BasicType","PointerType"}, "not valid type"
    if str(node1.type) == str(type):
        return node1
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