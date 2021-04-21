from structure import Errors, Node
from structure import sym_table, BasicType, FunctionType, PointerType, Type
from structure import implicit_casting


def type_check_init(init,type,token):
    if isinstance(init,Node):
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
            return Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
        if node1.type.class_type == "PointerType":
            return Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
        error = True
    elif op == "+" or op == "-":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base:
            return Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
        error = True
    elif op == "&":
        return Node(name="unary_op",value=op,children=[node1],type=PointerType(node1.type))
    elif op == "*":
        if node1.type.class_type == "PointerType":
            return Node(name="unary_op",value=op,children=[node1],type=node1.type.type)
        Errors(
            errorType='TypeError',
            errorText="cannot dereference non-pointer type "+node1.type.stype,
            token_object= token
        )
        return Node(type="error")
    elif op == "~":
        if node1.type.class_type == "BasicType" and node1.type.type in allowed_base_1:
            return Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=node1.type)
        error = True
    elif op == "!":
        if node1.type.is_convertible_to(BasicType('bool')):
            return Node(name="unary_op",value=node1.type.stype+op,children=[node1],type=BasicType('bool'))
        error = True
    elif op == "sizeof":
        if is_typename:
            return Node(name = "unary_op", value=op+':'+node1.type.stype,type = BasicType(type = 'long'))
        if isinstance(node1.type,Type) == False:
            Errors(
                errorType='TypeError',
                errorText="cannot do sizeof on non type",
                token_object= token
            )
            return Node(type="error")
        if node1.type.class_type in {'BasicType','PointerType','StructType'}:
            return Node(name = "unary_op",value=op,type = BasicType(type='long'),children=[node1])
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
    return Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=typ)

# addition, subtraction
def type_check_add(node1,node2,op,token):
    allowed_class = [('PointerType','BasicType'),('BasicType','PointerType'),('BasicType','BasicType')]
    allowed_base = [{'int','long','char'},{'int','long','char'},{'int','long','char','double','float'}]
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
        return Node(name="binary_op",value=node1.type.stype+op,type=node1.type,children = [node1,node2])
        
    if i == 1:
        if node1.type.type not in allowed_base[i]:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
        return Node(name="binary_op",value=node2.type.stype+op,type=node2.type,children = [node2,node1])
    if i == 2:
        if node1.type.type not in allowed_base[i] or node2.type.type not in allowed_base[i]:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
        node1,node2,typ = implicit_casting(node1,node2)
        return Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=typ)

#bitwise xor,and,or,shift
def type_check_bit(node1,node2,op,token):
    allowed_class = {'BasicType'}
    allowed_base = {'int','long','char'}
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
    return Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=typ)

#less than, greater than, equal , not equal
def type_check_relational(node1,node2,op,token,is_bool=False):
    allowed_class = {'BasicType'}
    allowed_base = {'int','long','char','double','float'}
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if node1.type.class_type not in allowed_class or node2.type.class_type not in allowed_class:
            Errors(
                errorType='TypeError',
                errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
                token_object= token
            )
            return Node(type="error")
    if is_bool:
        if node1.type.type == "bool" and node2.type.type  == "bool":
            return Node(name="binary_op",value="bool"+op,children = [node1,node2],type=BasicType('bool'))
    if node1.type.type not in allowed_base or node2.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
        
    node1,node2,typ = implicit_casting(node1,node2)
    return Node(name="binary_op",value=typ.stype+op,children = [node1,node2],type=BasicType('bool'))

def type_check_logical(node1,node2,op,token):
    allowed_class = {'BasicType'}
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
    if node1.type.type not in allowed_base or node2.type.type not in allowed_base:
        Errors(
            errorType='TypeError',
            errorText=op+' not support type '+node1.type.stype+','+node2.type.stype,
            token_object= token
        )
        return Node(type="error")
        
    if node1.type.type != "bool":
        node1 = Node(name="type_cast",value='bool',children=[node1],type=BasicType('bool'))
    if node2.type.type != "bool":
        node2 = Node(name="type_cast",value='bool',children=[node2],type=BasicType('bool'))
    return Node(name="binary_op",value=op,children = [node1,node2],type=BasicType('bool'))

def type_check_assign(node1,node2,token):
    if node1.type == "error" or node2.type == "error":
        return Node(type="error")
    if node2.type.is_convertible_to(node1.type):
        if str(node2.type) != str(node1.type):
            node2 = Node(name="type_cast",value=node1.type.stype,children=[node2],type=node1.type)
        return Node("binary_op",node1.type.stype+"=",children = [node1,node2],type=node1.type)
    Errors(
        errorType='TypeError',
        errorText="cannot assign " + node2.type.stype+ " to "+node1.type.stype,
        token_object= token
    )
    return Node(type="error")

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
    

