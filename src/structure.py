#Node to represent entry in a symbol table
#TODO Modify node 
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

#! There are four class of types: 
#! i)BasicType (include :int, float, double, char..etc)
#! ii)PointerType
#! iii)StructType
#! iv)FunctionType
#TODO EnumType, TypeDefs

class BasicType:
    class_type = "BasicType"
    def __init__(self, name = None, type = None,width =0, offset = 0, base = None):
        self.name = name
        self.type = type
        self.offset = offset
        self.base = base
        self.width = width

    def __str__(self) -> str:
        #TODO
        pass

class PointerType:
    class_type = "PointerType"
    def __init__(self, name = None, type = None,width =0, offset = 0, base = None):
        self.name = name
        self.type = type
        self.offset = offset
        self.base = base
        self.width = width
    
    def __str__(self) -> str:
        #TODO
        pass

class StructType:
    class_type = "Struct Type"
    def __init__(self, name = None, type = None,width =0, offset = 0, base = None):
        self.name = name
        self.type = type
        self.offset = offset
        self.base = base
        self.width = width
    
    def __str__(self) -> str:
        #TODO
        pass

class FunctionType:
    class_type = "FunctionType"
    def __init__(self, name = None, type = None,width =0, offset = 0, base = None):
        self.name = name
        self.type = type
        self.offset = offset
        self.base = base
        self.width = width
    
    def __str__(self) -> str:
        #TODO
        pass

#=================================== SYMBOL TABLE ==================================#

#! The Symbol Table implemented is Hierarchical symbol table
# every scope has it's own symbol table
# It has id(unique), name(unique), dict of entries with key id_name
# It has attribute children which stores the chilren symbol tables
# It has table attribute which is of type: dict will store the entries
# It has scopes attribute which is an dict of symbol_tables with key scope_id

class SymbolTable:
    id_count =0
    symbol_table_dict= {}
    def __init__(self, parent = None, id =None, name = None, width =0 , offset =0):
        if parent:
            assert(isinstance(parent, SymbolTable))

        self.parent = parent

        if id : 
            self.id = id
        else :
            self.id = SymbolTable.id_count
            SymbolTable.id_count += 1

        self.table = {}
        self.scopes_list= []
        self.scopes = {}

        self.width = width
        self.offset = offset

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

    def add_entry(self,table_id = None,table = None):
        pass

    def add_scope(self, name = None, parent = None):
        #! CAUTION
        #Python always return the object itself (not a copy)
        #Any changes to the returned object will reflect to original object
        self.scopes_list.append(SymbolTable(name, parent))
        self.scopes[self.scopes_list[-1].name] = self.scopes_list[-1]
        return self.scopes_list[-1]

    def look_up(self, name = None, type = None, class_type = None):
        pass
    
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

    def calc_offset(self, type = None, class_type = None, base = 0):
        pass

    def update_offset(self):
        pass