class Node:
    count_nodes = 0
    nodes = []
    def __init__(self,type=None,value=None,children=None):
        self.id = Node.count_nodes
        Node.count_nodes += 1
        Node.nodes.append(self)
        self.type = type
        if children:
            self.children = children
        else:
            self.children = []
        self.value = value

        #A dictionary to contain info like(eg. width, offset..)
        #!Info may be Synthesised Attributes and Inherited Attributes
        self.data = {'type':self.type, 'value':self.value}

    def __str__(self):
        res = "Node("
        res += "id:" + str(self.id)
        res += "info:" + str(self.data)
        res += ")"
        return res

    def addChild(self,node):
        self.children.append(node)

    def getChild(self):
        return self.children



#=================================== TYPES CLASS ===================================#

class Type:
    size_dict = {
        'int':4,
        'long':8,
        'char':1,
        'float':4,
        'double':8,
        'void':0,
        'bool': 1,
        'short':2,
    }
    def __init__(self):
        self.class_type = None
        self.is_basic = False
        self.is_pointer = False
        self.is_struct = False
        self.is_function = False
        self.width = 0
        

#! There are four class of entries: 
#! i)BasicType (include :int, float, double, char..etc)
#! ii)PointerType (which includes arrays also)
#! iii)StructType
#! iv)FunctionType
#TODO EnumType, TypeDef

class BasicType(Type):
    
    def __init__(self, type = None):
        super().__init__()
        self.class_type = "BasicType"
        self.is_basic = True
        self.type = type
        self.width = self.size_dict[type]

    def __str__(self) -> str:
        res  = str(self.type)
        return res
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def update_width(self):
        self.width = self.size_dict[type]
        return self.width

class PointerType(Type):

    def __init__(self, type = None, array_size = 0):
        super().__init__()
        self.class_type = "PointerType"
        self.is_pointer = True
        self.type = type
        self.array_size = array_size
        self.width = self.update_width()

    def __str__(self) -> str:
        res = "pointer of (" + str(self.type) + ")"
        return res
    
    def __repr__(self) -> str:
        return self.__str__()
    
    def update_width(self):
        self.width = 8
        matrix_size = 1
        if hasattr(self.array_size, '__iter__'):
            for s in self.array_size:
                matrix_size *= s
        else:
            matrix_size *= self.array_size
        self.width += matrix_size*self.size_dict[self.type]
        return self.width

class StructType(Type):
    
    def __init__(self, name = None, symbol_table = None):
        super().__init__()
        self.class_type = "StructType"
        self.is_struct = True
        self.name = name
        self.symbol_table = symbol_table
        self.type = "struct " + str(self.name)
        self.width = self.update_width()

    def __str__(self) -> str:
        return self.type
    
    def __repr__(self) -> str:
        return self.__str__()

    def update_width(self):
        self.width = self.symbol_table.width
        return self.width

class FunctionType(Type):

    def __init__(self, return_type = None, param_list = None, symbol_table = None):
        super().__init__()
        self.class_type = "FunctionType"
        self.is_function = True
        self.return_type = return_type
        self.symbol_table = symbol_table
        self.param_list = param_list
        self.type = str(self.return_type) + " function("  +str(param_list)+")"
        self.width = self.update_width()

    def __str__(self) -> str:
        return self.type
    
    def __repr__(self) -> str:
        return self.__str__()

    def update_width(self):
        self.width = self.symbol_table.width
        return self.width
    
    def add_param_list(self, param_list=None):
        self.param_list = param_list
        return self.param_list

#=================================== SYMBOL TABLE ==================================#

#! class corresponding to symbol table entry
class Entry:
    def __init__(self, name = None, type = None, symbol_table = None, token_object=None):
        self.name = name
        self.type = type
        
        self.symbol_table = symbol_table
        self.token_object = token_object

        self.offset = self.symbol_table.offset
        self.width = self.type.width

    def __str__(self):
        res = "Entry("
        res += "name:" + str(self.name)
        res += ",type:" + str(self.type)
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
    def __init__(self, parent = None, id =None, name = None,scope_type = None, base =0):
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

        self.width = 0
        self.base = base
        self.offset = 0
        self.scope_type = scope_type

        if name:
            self.name = name
        else:
            self.name = '_temp_name_' + str(self.id)

        SymbolTable.symbol_table_dict[id] = self

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

    def _add_entry(self,name = None, type = None, token_object = None):

        assert name, "name not provided for entry"
        assert type is not None, "type not specified for entry"
        
        if type.class_type == "FunctionType":
            self._add_scope(name = name, parent=self, symbol_table = type.symbol_table)

        #TODO check error if name already in table
        self.table[name] = Entry(name=name, type = type, symbol_table = self, token_object = token_object)

        if type.class_type != "FunctionType":
            #update offset
            self._update_offset(self.table[name])
            
            #update width
            self._update_width(self.table[name])

        return self.table[name]
    
    def _add_struct_entry(self, name = None, symbol_table = None):
        assert name, "name not provided for entry"
        assert symbol_table is not None, "symbol table not given for struct entry"

        
        self._add_scope(name = name, parent=self, symbol_table=symbol_table)

        #TODO check error if name already in table
        self.struct_table[name] = StructType(name = name, symbol_table=symbol_table)
        return self.struct_table[name]
        

    def _add_scope(self, name = None, parent = None, symbol_table = None):
        #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object

        if parent:
            assert isinstance(parent, SymbolTable) 
            
        if symbol_table is None:
            self.scopes_list.append(SymbolTable(name, parent))
        else:
            self.scopes_list.append(symbol_table)
        
        if name is None:
            self.scopes[self.scopes_list[-1].name] = self.scopes_list[-1]
        else:
            self.scopes[name] = self.scopes_list[-1]
        
        return self.scopes_list[-1]

    def _look_up(self, name = None):
        symbol_table =self
        while symbol_table != None and name not in symbol_table.table:
            symbol_table = symbol_table.parent
        
        if symbol_table is None:
            #TODO throw error
            return None

        return symbol_table.table[name]

    def _look_up_struct(self, name = None):
        symbol_table =self
        while symbol_table != None and name not in symbol_table.struct_table:
            symbol_table = symbol_table.parent
        
        if symbol_table is None:
            #TODO throw error
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
    
    def start_scope(self, name =None, scope_type = None):

        if SymbolTable.curr_symbol_table is None:
            if SymbolTable.symbol_table_dict:
                SymbolTable.curr_symbol_table = SymbolTable.symbol_table_dict[0]

        SymbolTable.curr_symbol_table = SymbolTable(
            name = name,
            scope_type = scope_type,
            parent = SymbolTable.curr_symbol_table, 
            base = SymbolTable.curr_symbol_table.offset
            )
        
        return SymbolTable.curr_symbol_table
    
    def close_scope(self):
        SymbolTable.next_symbol_table = SymbolTable.curr_symbol_table
        SymbolTable.curr_symbol_table = SymbolTable.curr_symbol_table.parent

        return SymbolTable.curr_symbol_table
    
    def get_next_symbol_table(self):
        return SymbolTable.next_symbol_table
    
    def add_entry(self,name = None, type = None, token_object = None):
        return SymbolTable.curr_symbol_table._add_entry(name = name, type = type, token_object=token_object)
    
    def add_struct_entry(self, name = None, symbol_table = None):
        return SymbolTable.curr_symbol_table._add_struct_entry(name = name, symbol_table=symbol_table)
    
    def look_up(self, name = None):
        return SymbolTable.curr_symbol_table._look_up(name = name)

    def look_up_struct(self, name = None):
        return SymbolTable.curr_symbol_table._look_up_struct(name = name)

    def update_width(self, entry = None):
        return SymbolTable.curr_symbol_table._update_width(entry=entry)

    def update_offset(self, entry = None):
        return SymbolTable.curr_symbol_table._update_offset(entry=entry)

    def set_parent(self, parent = None):
        return SymbolTable.curr_symbol_table._set_parent(parent=parent)

    def add_scope(self, name = None, parent = None, symbol_table = None):
        return SymbolTable.curr_symbol_table._add_scope(name = name, parent = parent,symbol_table=symbol_table)
    
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

class Errors:
    error_id = 0
    error_list = []

    def __init__(self, errorType = None, errorText = None):
        self.id = Errors.error_id
        self.errorType = errorType
        self.errorText = errorText

        Errors.error_list.append(self)
        Errors.error_id += 1

    def get_error(self, id=None):
        return Errors.error_list[id]
    
    def get_all_error(self):
        return Errors.error_list


    def __str__(self):
        res  = "Error("
        res += self.errorType + ","
        res += self.errorText + ")"

sym_table = SymbolTable(name = 'global', scope_type='global')
sym_table.set_curr_scope(symbol_table = sym_table)