import pygraphviz as pgv

def not_all_None(ls):
    if not ls:
        return True
    return not all(v is None for v in ls)

def getlabel(type,value):
    if value == None:
        return type
    else:
        return type+": "+str(value)


def draw_ast(node):
    G = pgv.AGraph(strict=True, directed=True)
    node_list =[node]

    if not node:
        return G

    G.add_node(node.id, label = getlabel(node.type,node.value))

    while node_list:

        top_node = node_list[0]
        node_list.pop(0)
        for nd in top_node.children:
            print(top_node.type,nd)
            if nd is None:
                continue
            if not_all_None(nd.children):
                G.add_node(nd.id, label = getlabel(nd.type,nd.value))
                G.add_edge(top_node.id, nd.id)
                node_list += [nd]
    
    G.layout()
    G.layout(prog="dot")

    return G


