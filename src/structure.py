import builtins
from typing import List


class Node:
    count_nodes = 0
    nodes = []
    def __init__(self,name = None, value=None,type=None,children=None, constant =None):
        self.id = Node.count_nodes
        Node.count_nodes += 1
        Node.nodes.append(self)
        self.type = type #type of node
        self.name = name #name of node (or class of node)
        self.constant = constant

        self.place = ""
        self.code = []
        
        @property
        def code(self):
            return self._code
        
        @code.setter
        def code(self, code):
            assert isinstance(code, list), "code object must be list of gen's / labels"
            self._code = code

        if children:
            self.children = children
        else:
            self.children = []
        self.value = value #value in node (some attributes to use in ast)

        #A dictionary to contain info like(eg. width, offset..)
        #!Info may be Synthesised Attributes and Inherited Attributes
        self.data = {'type':self.type, 'value':self.value}

    def __str__(self):
        res = "Node("
        res += "id:" + str(self.id)
        res += ",name:" + str(self.name)
        res += ",value:" + str(self.value)
        res += ",type:" + str(self.type)
        res += ",info:" + str(self.data)
        res += ")"
        return res

    def addChild(self,node):
        self.children.append(node)

    def getChild(self):
        return self.children
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def get_copy(self):
        return Node(self.name, self.value, self.type, self.children, self.eval)



#=================================== TYPES CLASS ===================================#

class Type:
    size_dict = {
        'int':8,
        'long':8,
        'char':1,
        'float':4,
        'double':8,
        'void':0,
        'bool': 1
    }
    def __init__(self):
        self.class_type = None
        self.is_basic = False
        self.is_pointer = False
        self.is_struct = False
        self.is_function = False
        self.stype = 'void'
        self.type = 'void'
        self._width = 0
    
    def __eq__(self, other):
        if builtins.type(self) != builtins.type(other):
            return False
        if other.class_type != self.class_type:
            return False
        return self.type == other.type
    
    def __ne__(self, other):
        return not self == other
    
    def __str__(self) -> str:
        res  = str(self.type)
        return res
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def update_width(self):
        return self._width
    
    def is_convertible_to(self, t):
        return False

    @property
    def width(self):
        return self.update_width()
        

#! There are four class of entries: 
#! i)BasicType (include :int, float, double, char..etc)
#! ii)PointerType (which includes arrays also)
#! iii)StructType
#! iv)FunctionType
#TODO EnumType, TypeDef

class BasicType(Type):
    allowed_all_type = ['int', 'long', 'float', 'double','bool', 'char']
    allowed_bool_type = ['bool']
    allowed_int_type = ['long', 'int', 'char']
    allowed_read_type = ['float', 'double']
    def __init__(self, type = None):
        super().__init__()
        self.class_type = "BasicType"
        self.is_basic = True
        assert isinstance(type,str), str(type) + "expected Type object, provided:" + str(builtins.type(type))
        assert type in self.allowed_all_type, "unknown type:" +type + " given"
        self.type = type
        self.stype = self.type
        self._width = self.size_dict[type]

    def __str__(self) -> str:
        res  = str(self.type)
        return res
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def update_width(self):
        self._width = self.size_dict[self.type]
        return self._width
    
    def is_convertible_to(self, t):
        assert isinstance(t, Type), "please pass Type object"
        if t.class_type == 'FunctionType' or t.class_type == 'StructType':
            return False
        
        if t.class_type == 'PointerType':
            if self.type in ['char', 'long', 'int']:
                return True
            return False
        
        if t.type == 'void':
            return False
        
        if self.type == 'void':
            return False
        
        return True
        
                
        

class PointerType(Type):

    def __init__(self, type = None, array_size = list(),array_type=None):
        super().__init__()
        self.class_type = "PointerType"
        self.is_pointer = True
        assert isinstance(type,Type), str(type) + " expected Type object, provided:" + str(builtins.type(type))
        self.type = type
        self.stype = type.stype + "*"
        assert not isinstance(array_size,str), "array_size can't be string, provided: " + str(array_size)
        self.array_size = array_size
        self.array_type = array_type
        self.is_array = True if array_type else False
        self._width = self.update_width()
        self.type_size = 8 if self.type.class_type =="PointerType" else type.width

    def __str__(self) -> str:
        res = "pointer of (" + str(self.type) + ")"
        if self.is_array:
            res += ", array of:" + str(self.array_type)
        return res
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def update_width(self):
        # if len(self.array_size) == 0:
        if self.is_array == False or len(self.array_size) == 0:
            return 8
        matrix_size = 1
        # print(self.array_size)
        for s in self.array_size:
            if s == float('inf'):
                continue
            matrix_size *= s

        assert self.array_type != None, "array_type cannot be None"
        if isinstance(self.array_type, Type):
            #print(self.type, self.type.width, matrix_size)
            return matrix_size*self.array_type.width
        else:
            return matrix_size*self.size_dict[self.array_type]
    
    def is_convertible_to(self, t):
        assert isinstance(t, Type), "please pass Type object"
        if t.class_type == 'FunctionType' or t.class_type == 'StructType':
            return False
        
        if t.class_type == 'PointerType':
            return True

        if t.type in ['long', 'int', 'char']:
            return True

        return False
        
        

class StructType(Type):
    
    def __init__(self, name = None, symbol_table = None,arg_dict=None):
        super().__init__()
        self.class_type = "StructType"
        self.is_struct = True
        self.name = name
        self.symbol_table = symbol_table
        self.type = "struct " + str(self.name)
        self.stype = "struct_"+str(self.name)
        self._width = self.update_width()
        self.arg_dict = arg_dict

    def __str__(self) -> str:
        return self.type
    
    def __repr__(self) -> str:
        return self.__str__()

    def update_width(self):
        self._width = self.symbol_table.width
        return self._width

    def is_same(self, t):
        assert isinstance(t, Type), "please pass Type object"
        if t.class_type == 'StructType' and t.name == self.name:
            return True
        return False
    
    def is_convertible_to(self, t):
        assert isinstance(t, Type), "please pass Type object"
        return self.is_same(t)

class FunctionType(Type):

    def __init__(self, return_type = None, param_list = None, symbol_table = None,defined=True):
        super().__init__()
        self.class_type = "FunctionType"
        self.is_function = True
        self.return_type = return_type
        self.symbol_table = symbol_table
        self.param_list = param_list
        self.type = str(self.return_type) + " function("  +str(param_list)+")"
        self.stype = "function"
        self._width = self.update_width()
        self.defined = defined

    def __str__(self) -> str:
        return self.type
    
    def __repr__(self) -> str:
        return self.__str__()

    def update_width(self):
        self._width = self.symbol_table.width
        return self._width
    
    def add_param_list(self, param_list=None):
        self.param_list = param_list
        self.type = str(self.return_type) + " function("  +str(param_list)+")"
        return self.param_list
    
    def is_same(self, t):
        assert isinstance(t, Type), "please pass Type object"
        if t.class_type == 'FunctionType':
            if self.return_type == t.return_type and self.param_list == t.param_list:
                return True
        return False
    
    def is_convertible_to(self, t):
        assert isinstance(t, Type), "please pass Type object"
        # return self.is_same(t)
        return False

#=================================== SYMBOL TABLE ==================================#

#! class corresponding to symbol table entry
class Entry:
    def __init__(self, name = None, type = None, symbol_table = None, token_object=None, label = None,eval = None):
        self.name = name

        assert isinstance(type,Type), str(type) + "expected Type object, provided:" + str(builtins.type(type))

        self.type = type
        self.eval = eval
        self.label = label

        self.symbol_table = symbol_table
        self.token_object = token_object

        self.offset = self.symbol_table.offset
        self.width = self.type.width

    def __str__(self):
        res = "Entry("
        res += "name:" + str(self.name)
        res += ",type:" + str(self.type)
        res += ",eval:" + str(self.eval)
        res += ",offset:" + str(self.offset)
        res += ",width:" + str(self.width)
        res +=",symbol_table_id:" + str(self.symbol_table.id)
        res += ")\n"
        return res
    
    def __repr__(self) -> str:
        return self.__str__()

#! The Symbol Table implemented is Hierarchical symbol table
# every scope has it's own symbol table
# It has id(unique), name(unique), dict of entries with key id_name
# It has attribute children which stores the chilren symbol tables
# It has table attribute which is of type: dict will store the entries
# It has scopes attribute which is an dict of symbol_tables with key scope_id
# It has struct_table attribute which will store all struct defined things #TODO modify to support typedef also

class SymbolTable:
    id_count =0
    symbol_table_dict= {}
    curr_symbol_table = None
    next_symbol_table = None
    def __init__(self, parent = None, id =None, name = None,scope_type = None, base =0, unused = False):
        if parent:
            assert isinstance(parent, SymbolTable) 

        self.parent = parent

        if id : 
            self.id = id
        else :
            self.id = SymbolTable.id_count
            SymbolTable.id_count += 1

        self.table = {}
        self.struct_table = {}

        #TODO enum table for enum
        self.scopes_list= []
        self.scopes = {}
        self.unused = unused

        self.width = 0
        self.base = base
        self.offset = 0
        self.scope_type = scope_type

        if name:
            self.name = name
        else:
            self.name = 'scope@' + str(self.id)

        SymbolTable.symbol_table_dict[self.name] = self

        #TODO add dict for every type class

    def __str__(self):
        res = "SymbolTable("
        res += "id:" + str(self.id)
        res += ",name:" + str(self.name)
        res += ",scope_type:" + str(self.scope_type)
        if self.parent:
            res += ",parent_id:" + str(self.parent.id)
        else:
            res += ",parent:" + str(self.parent)
        res += ",table:" + str(self.table)
        res += ",scopes:" + str(self.scopes)
        res += ")\n"
        return res

    def __repr__(self) -> str:
        return self.__str__()

    def _add_entry(self,name = None, type = None, token_object = None, eval = None):

        assert name, "name not provided for entry"
        assert type is not None, "type not specified for entry"
        assert isinstance(type, Type), "type: '"+ str(type) + "' is not of Type class, provided: " + str((builtins.type(type)))

        if self.table.get(name):
            Errors(
                errorType='RedeclarationError', 
                errorText='variable already declared',
                token_object = token_object
            )
            return None

        self.table[name] = Entry(name=name, type = type, symbol_table = self, token_object = token_object, eval = eval)

        if type.class_type != "FunctionType":
            #update offset
            self.table[name].offset = self._update_offset(self.table[name])
            
            #update width
            self._update_width(self.table[name])

        return self.table[name]
    
    def _add_struct_entry(self, name = None, symbol_table = None, token_object = None,arg_dict=None):
        assert name, "name not provided for entry"
        assert symbol_table is not None, "symbol table not given for struct entry"


        if self.struct_table.get(name):
            Errors(
                errorType='RedefinitionError', 
                errorText='struct already defined',
                token_object = token_object
            )
            return None

        self.struct_table[name] = StructType(name = name, symbol_table=symbol_table,arg_dict=arg_dict)
        return self.struct_table[name]
        

    def _add_scope(self,  symbol_table = None, name = None, parent = None):
        #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object

        if parent:
            assert isinstance(parent, SymbolTable) 
        else:
            parent = self

        assert symbol_table, "symbol table can't be None"
        #print(symbol_table.id, parent)
        parent.scopes_list.append(symbol_table)
        
        if name is None:
            parent.scopes[parent.scopes_list[-1].name] = parent.scopes_list[-1]
        else:
            parent.scopes[name] = parent.scopes_list[-1]
        
        return parent.scopes_list[-1]

    def _look_up(self, name = None, token_object = None, in_struct = False, no_error = False):
        symbol_table =self
        if not in_struct:
            while symbol_table != None and name not in symbol_table.table:
                symbol_table = symbol_table.parent
        else:
            if name not in symbol_table.table:
                symbol_table = None
            
        
        if symbol_table is None:
            if no_error == False:
                Errors(
                    errorType='DeclarationError', 
                    errorText='variable/function not declared before',
                    token_object = token_object
                )
            return None

        return symbol_table.table[name]

    def _look_up_struct(self, name = None, token_object = None):
        symbol_table =self
        while symbol_table != None and name not in symbol_table.struct_table:
            symbol_table = symbol_table.parent
        
        if symbol_table is None:
            Errors(
                errorType='DefinitionError', 
                errorText='struct not defined',
                token_object = token_object
            )
            return None

        return symbol_table.struct_table[name]
    
    def _set_parent(self, parent = None):
        #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object
        self.parent = parent
        return self.get_symbol_table(self.id)

    def get_symbol_table(self, id = None):
         #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object
        assert id, "No Id value given or it is None type"
        assert id < SymbolTable.id_count, "No Symbol table exist with given id"
        return SymbolTable.symbol_table_dict[id]

    def _update_offset(self, entry = None):
        self.offset += entry.type.width
        return self.offset 

    def _update_width(self, entry = None):
        self.width += entry.type.width
        return self.width
    
    def start_scope(self, name =None, scope_type = None, unused = False):

        if SymbolTable.curr_symbol_table is None:
            if SymbolTable.symbol_table_dict:
                SymbolTable.curr_symbol_table = SymbolTable.symbol_table_dict[0]

        new_symbol_table = SymbolTable(
            name = name,
            scope_type = scope_type,
            parent = SymbolTable.curr_symbol_table, 
            base = SymbolTable.curr_symbol_table.offset + SymbolTable.curr_symbol_table.base,
            unused = unused
            )
        
        if name:
            new_symbol_table.base = 0

        if not unused:
            self.add_scope(symbol_table = new_symbol_table)

        SymbolTable.curr_symbol_table = new_symbol_table

        return SymbolTable.curr_symbol_table
    
    def close_scope(self):
        SymbolTable.next_symbol_table = SymbolTable.curr_symbol_table
        SymbolTable.curr_symbol_table = SymbolTable.curr_symbol_table.parent

        if 'scope@' in SymbolTable.next_symbol_table.name:
            SymbolTable.curr_symbol_table.offset += SymbolTable.next_symbol_table.width

        return SymbolTable.curr_symbol_table
    
    def get_next_symbol_table(self):
        return SymbolTable.next_symbol_table
    
    def add_entry(self,name = None, type = None, token_object = None, eval = None):
        return SymbolTable.curr_symbol_table._add_entry(name = name, type = type, token_object=token_object, eval=eval)
    
    def add_struct_entry(self, name = None, symbol_table = None, token_object = None,arg_dict=None):
        return SymbolTable.curr_symbol_table._add_struct_entry(name = name, symbol_table=symbol_table, token_object = token_object,arg_dict=arg_dict)
    
    def look_up(self, name = None, token_object = None, in_struct = False, no_error = False):
        return SymbolTable.curr_symbol_table._look_up(name = name, token_object = token_object, in_struct = in_struct, no_error = no_error)

    def look_up_struct(self, name = None, token_object = None):
        return SymbolTable.curr_symbol_table._look_up_struct(name = name, token_object = token_object)

    def update_width(self, entry = None):
        return SymbolTable.curr_symbol_table._update_width(entry=entry)

    def update_offset(self, entry = None):
        return SymbolTable.curr_symbol_table._update_offset(entry=entry)

    def set_parent(self, parent = None):
        return SymbolTable.curr_symbol_table._set_parent(parent=parent)

    def add_scope(self, symbol_table = None, name = None, parent = None):
        #print('here', symbol_table.id, parent)
        return SymbolTable.curr_symbol_table._add_scope(symbol_table=symbol_table, name = name, parent = parent)
    
    def set_curr_scope(self, symbol_table=None):
        if symbol_table:
            SymbolTable.curr_symbol_table = symbol_table
        else:
            if SymbolTable.symbol_table_dict:
                SymbolTable.curr_symbol_table = SymbolTable.symbol_table_dict[0]
            else:
                return None
        return SymbolTable.curr_symbol_table
        

#=================================== ERRORS ==================================#

from clexer import lexer

class Errors:
    error_id = 0
    error_list = []

    def __init__(self, errorType = None, errorText = None, token_object = None):
        self.id = Errors.error_id
        self.errorType = errorType
        self.errorText = errorText
        self.token_object = token_object

        if token_object:
            self.lineno = token_object.lineno
            # print(token_object, token_object.__dict__)
            self.filename = lexer.filename
            if token_object.lexeme:
                self.lexeme = token_object.lexeme
            else:
                self.lexeme = token_object.value

        Errors.error_list.append(self)
        Errors.error_id += 1

    def get_error(self, id=None):
        return Errors.error_list[id]
    
    def get_all_error():
        return Errors.error_list


    def __str__(self):
        res = self.filename + " "
        res += "at line no: "+ str(self.lineno)
        res += ", "+self.errorType +": " + self.errorText
        return res

def getMutliPointerType(type = None, level = 0):
    levObj = PointerType(type = type)
    while level:
        levObj = PointerType(type = levObj)
        level -= 1
    return levObj



sym_table = SymbolTable(name = 'global', scope_type='global')
sym_table.set_curr_scope(symbol_table = sym_table)

# checking type


