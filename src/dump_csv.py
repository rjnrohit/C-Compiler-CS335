import csv
from os import write



def print_csv(sym_table =None , filename = None):
    queue = [sym_table]
    csv_file = open(filename,'w', newline='')
    writer = csv.writer(csv_file)
    while queue:
        top = queue[0]
        queue.pop(0)
        print_csv_sym_table(top, writer)
        # print(top.id)
        for table in top.scopes_list:
            # print(table.id, end=' ')
            queue += [table]
        # print()
    


def print_csv_sym_table(sym_table, writer):
    # print(sym_table.name, sym_table.id)
    writer.writerow(['-------------------------------------------------------------------------------------------'])
    writer.writerow(["          symbol table id:" , sym_table.id, "symbol table name:", sym_table.name])
    writer.writerow(["name", "type", "offset","width"])
    for entry_key in sym_table.table:
        if entry_key == 'return':
            continue
        #print(sym_table.table[entry_key].name, sym_table.table[entry_key].type, sym_table.table[entry_key].offset,sym_table.table[entry_key].width)
        writer.writerow([sym_table.table[entry_key].name, sym_table.table[entry_key].type, sym_table.table[entry_key].offset,sym_table.table[entry_key].width])


# csv_file.close()