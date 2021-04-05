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

    def __str__():
        pass

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
    pass

class PointerType:
    pass

class StructType:
    pass

class FunctionType:
    pass

#=================================== SYMBOL TABLE ==================================#

#! The Symbol Table implemented is Hierarchical symbol table
# every scope has it's own symbol table
# It has id(unique), name(unique), dict of entries with key id_name
# It has attribute children which stores the chilren symbol tables
# It has table attribute which is of type: dict will store the entries
# It has scopes attribute which is an dict of symbol_tables with key scope_id

class SymbolTable():
    id_count =0
    def __init__(self, parent = None, id =None, name = None):
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

        if name:
            self.name = name
        else:
            self.name = '_temp_name_' + str(self.id)

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

    def add_entry(self):
        pass

    def add_scope(self):
        pass

    def look_up(self):
        pass
    
    def set_parent(self, parent = None):
        self.parent = parent
        return self.id