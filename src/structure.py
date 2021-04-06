class Node:
    count_nodes = 0
    nodes = []
    def __init__(self,type,value=None,children=None):
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
    
    def update_width(self):
        self.width = 8
        matrix_size = 1
        if hasattr(self.array_size):
            for s in self.array_size:
                matrix_size *= s
        else:
            matrix_size *= self.array_size
        self.width += matrix_size*self.size_dict[type]
        return self.width

class StructType(Type):
    
    def __init__(self, name = None, symbol_table = None):
        super().__init__()
        self.class_type = "StructType"
        self.is_struct = True
        self.name = name
        self.symbol_table = symbol_table
        self.type = "struct:" + str(self.name)
        self.width = self.update_width()

    def __str__(self) -> str:
        return self.type

    def update_width(self):
        self.width = self.symbol_table.width
        return self.width

class FunctionType(Type):

    def __init__(self, return_type = None, param__dict = None, symbol_table = None):
        super().__init__()
        self.class_type = "FunctionType"
        self.is_function = True
        self.return_type = return_type
        self.symbol_table = symbol_table
        self.type = str(self.return_type) + " function("  +str(param__dict)+")"
        self.width = self.update_width()

    def __str__(self) -> str:
        return self.type

    def update_width(self):
        self.width = self.symbol_table.width
        return self.width

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
    def __init__(self, parent = None, id =None, name = None, base =0):
        if parent:
            assert(isinstance(parent, SymbolTable))

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

        if name:
            self.name = name
        else:
            self.name = '_temp_name_' + str(self.id)

        SymbolTable.symbol_table_dict[id] = self

        #TODO add dict for every type class

    def __str__(self):
        res = ""
        res += "SymbolTable("
        res += "id:" + str(self.id)
        res += ",name:" + str(self.name)
        res += ",parent:" + str(self.parent)
        res += ",table:" + str(self.table)
        res += ", chilren:" + str(self.chilren)
        res +=")"
        return res

    def add_entry(self,name = None, type = None, offset = 0, width = 0, token_object = None):

        assert(name, "name not provided for entry")
        assert(type is not None, "type not specified for entry")
        
        if type.class_type == "FunctionType":
            self.add_scope(name = name, parent=self, symbol_table = type.symbol_table)

        #TODO check error if name already in table
        self.table[name] = Entry(name=name, type = type , offset = offset, width = width, symbol_table = self, token_object = token_object)

        if type.class_type != "FunctionType":
            #update offset
            self.update_offset(self.table[name])
            
            #update width
            self.update_width(self.table[name])

        return self.table[name]
    
    def add_struct_entry(self, name = None, symbol_table = None):
        assert(name, "name not provided for entry")
        assert(symbol_table is not None, "symbol table not given for struct entry")

        
        self.add_scope(name = name, parent=self, symbol_table=symbol_table)

        #TODO check error if name already in table
        self.struct_table[name] = StructType(name = name, symbol_table=symbol_table)
        return self.struct_table[name]
        

    def add_scope(self, name = None, parent = None, symbol_table = None):
        #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object

        if symbol_table is None:
            self.scopes_list.append(SymbolTable(name, parent))
        else:
            self.scopes_list.append(symbol_table)
        
        if name is None:
            self.scopes[self.scopes_list[-1].name] = self.scopes_list[-1]
        else:
            self.scopes[name] = self.scopes_list[-1]
        
        return self.scopes_list[-1]

    def look_up(self, name = None):
        symbol_table =self
        while symbol_table != None and name not in symbol_table.table:
            symbol_table = symbol_table.parent
        return symbol_table

    def look_up_struct(self, name = None):
        symbol_table =self
        while symbol_table != None and name not in symbol_table.struct_table:
            symbol_table = symbol_table.parent
        return symbol_table
    
    def set_parent(self, parent = None):
        #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object
        self.parent = parent
        return self.get_symbol_table(self.id)

    def get_symbol_table(self, id = None):
         #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object
        assert(id, "No Id value given or it is None type")
        assert(id < SymbolTable.id_count, "No Symbol table exist with given id")
        return SymbolTable.symbol_table_dict[id]

    def update_offset(self, entry = None):
        self.offset += entry.type.width
        return self.offset 

    def update_width(self, entry = None):
        self.widht += entry.type.width
        return self.width

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
