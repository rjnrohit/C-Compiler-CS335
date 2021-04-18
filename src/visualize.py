import pygraphviz as pgv

def not_all_None(ls):
    if not ls:
        return True
    return not all(v is None for v in ls)

def getlabel(name,value):
    if value == None and name == None:
        return ""
    elif value == None and name != None:
        return str(name)
    elif value != None and name == None:
        return str(value)
    else:
        return str(name)+": "+str(value)


def draw_ast(node):
    G = pgv.AGraph(strict=True, directed=True)
    node_list =[node]

    if not node:
        G.layout()
        G.layout(prog="dot")
        return G

    G.add_node(node.id, label = getlabel(node.name,node.value))

    while node_list:

        top_node = node_list[0]
        node_list.pop(0)
        for nd in top_node.children:
            print(top_node.type,nd)
            if nd is None:
                continue
            if isinstance(nd,list):
                # print(nd[0].children)
            if not_all_None(nd.children):
                G.add_node(nd.id, label = getlabel(nd.name,nd.value))
                G.add_edge(top_node.id, nd.id)
                node_list += [nd]
    
    G.layout()
    G.layout(prog="dot")

    return G


