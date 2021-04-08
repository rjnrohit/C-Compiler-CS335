import csv
from os import write

csv_file = open('dump.csv','w', newline='')
writer = csv.writer(csv_file)

def print_csv(sym_table):
    queue = [sym_table]

    while queue:
        top = queue[0]
        queue.pop(0)
        print_csv_sym_table(top)
        for table in top.scopes_list:
            queue += [table]
    


def print_csv_sym_table(sym_table):
    print(sym_table.name, sym_table.id)
    writer.writerow(['-------------------------------------------------------------------------------------------'])
    writer.writerow(["          symbol table id:" , sym_table.id, "symbol table name:", sym_table.name])
    writer.writerow(["name", "type", "offset","width"])
    for entry_key in sym_table.table:
        if entry_key == 'return':
            continue
        print(sym_table.table[entry_key].name, sym_table.table[entry_key].type, sym_table.table[entry_key].offset,sym_table.table[entry_key].width)
        writer.writerow([sym_table.table[entry_key].name, sym_table.table[entry_key].type, sym_table.table[entry_key].offset,sym_table.table[entry_key].width])


# csv_file.close()