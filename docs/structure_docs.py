#program
"""
int a = 3, b, c;
float d, *f;
struct A{
    int x, int y;
    float z;
    int *p;
}
int main(int argv[], int argc){
    struct A c;
    int i =0;
    long n = 1000;
    for(i=0;i<n;i++){
        struct D{
            int*ptr;
        }
        struct D f;
    } // end for loop
}
"""




from src.structure import *

global_scope = SymbolTable(name = 'global', scope_type='global')
curr_symbol_table = global_scope


# int a = 3, b, c;
curr_symbol_table.add_entry('a', BasicType('int'))
curr_symbol_table.add_entry('b', BasicType('int'))
curr_symbol_table.add_entry('c', BasicType('int'))

#float d, *f;
curr_symbol_table.add_entry('d', BasicType('float'))
curr_symbol_table.add_entry('f', PointerType('float'))

# struct A{
#     int x, int y;
#     float z;
#     int *p;
# }

new_scope_for_struct = SymbolTable(name = 'A', parent=curr_symbol_table, base = curr_symbol_table.offset, scope_type='struct')
curr_symbol_table = new_scope_for_struct
curr_symbol_table.add_entry('x',BasicType('int'))
curr_symbol_table.add_entry('y',BasicType('int'))
curr_symbol_table.add_entry('z',BasicType('float'))
curr_symbol_table.add_entry('p',PointerType('int'))

curr_symbol_table.parent.add_struct_entry('A',curr_symbol_table)

curr_symbol_table = curr_symbol_table.parent

#int main(int argv[], int argc){
new_scope_for_main = SymbolTable(name = 'main', base = curr_symbol_table.offset, parent=curr_symbol_table, scope_type='function')
curr_symbol_table = new_scope_for_main

#   struct A c;
curr_symbol_table.add_entry(name  = 'c', type = curr_symbol_table.look_up_struct('A'))

#   int i =0;
#   long n = 1000;
curr_symbol_table.add_entry(name  = 'i', type = BasicType('int'))
curr_symbol_table.add_entry(name  = 'n', type = BasicType('long'))

#   for(i=0;i<n;i++){
new_scope_for_loop = SymbolTable(parent=curr_symbol_table, base = curr_symbol_table.offset, scope_type='local')
curr_symbol_table = new_scope_for_loop
        
#       struct D{
#          int*ptr;
#       }

new_scope_for_struct = SymbolTable(name = 'D', parent=curr_symbol_table, scope_type='struct')
curr_symbol_table = new_scope_for_struct
curr_symbol_table.add_entry('ptr', PointerType('int'))
curr_symbol_table.parent.add_struct_entry(name = 'D', symbol_table=curr_symbol_table)

curr_symbol_table = curr_symbol_table.parent

#       struct D f;
curr_symbol_table.add_entry('f', curr_symbol_table.look_up_struct('D'))

#   } // end for loop
curr_symbol_table.parent.add_scope(curr_symbol_table)
curr_symbol_table = curr_symbol_table.parent

#} // end main
curr_symbol_table.parent.add_entry('main',FunctionType(return_type='int', param_dict={'argv':PointerType('int'), 'argc':BasicType('int')}, symbol_table=curr_symbol_table))
curr_symbol_table = curr_symbol_table.parent

assert(curr_symbol_table.name == "global")

print(curr_symbol_table)