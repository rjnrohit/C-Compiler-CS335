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


#TODO implement Hierarchical SymBol table
#TODO attributes of entries are size, width(if necessary), scope
#TODO attributes of symbol table class : parent, id, 
# metadata(#to store it's name), table(for children tables)
#TODO handle scope structs
class SymbolTable():
    def __init__():
        pass
    def __str__():
        pass
    pass