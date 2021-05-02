import pygraphviz as pgv
import csv
from os import write

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
            # print(top_node)
            # print(top_node.type,nd)
            if nd is None:
                continue
            # if isinstance(nd,list):
            #     # print(nd[0].children)
            if not_all_None(nd.children):
                G.add_node(nd.id, label = getlabel(nd.name,nd.value))
                G.add_edge(top_node.id, nd.id)
                node_list += [nd]
    
    G.layout()
    G.layout(prog="dot")

    return G

def print_csv(sym_table =None , filename = None):
    queue = [sym_table]
    csv_file = open(filename,'w', newline='')
    writer = csv.writer(csv_file)
    while queue:
        top = queue[0]
        queue.pop(0)
        if not top.unused:
            print_csv_sym_table(top, writer)
        # print(top.id)
        for table in top.scopes_list:
            # print(table.id, end=' ')
            queue += [table]
        # print()
    
def print_csv_sym_table(sym_table, writer):
    # print(sym_table.name, sym_table.id)
    writer.writerow([])
    
    if sym_table.parent:
        writer.writerow(["symbol table id" , "symbol table name", "parent id"])
        writer.writerow([sym_table.id, sym_table.name, sym_table.parent.id])
    else:
        writer.writerow(["symbol table id" , "symbol table name"])
        writer.writerow([sym_table.id, sym_table.name])

    writer.writerow(["name", "type", "offset","width"])
    for entry_key in sym_table.table:
        # if entry_key == 'return' or "@" in entry_key:
        #     continue
        if entry_key == 'return':
            continue
        #print(sym_table.table[entry_key].name, sym_table.table[entry_key].type, sym_table.table[entry_key].offset,sym_table.table[entry_key].width)
        writer.writerow([sym_table.table[entry_key].name, sym_table.table[entry_key].type, sym_table.table[entry_key].offset,sym_table.table[entry_key].width])

# csv_file.close()

def print_code(code_list, filename):
    file = open(filename, 'w')
    for obj in code_list:
        if obj.code:
            print(obj.code,file = file)