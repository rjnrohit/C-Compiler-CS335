#program
"""
int a = 3, b, c;
float d, *f;
struct A{
    int x, int y;
    float z;
    int *p;
};
int main(int argv[], int argc){
    struct A c;
    int i =0;
    long n = 1000;
    for(i=0;i<n;i++){
        struct D{
            int*ptr;
        };
        struct D f;
    } // end for loop
}
"""




from src.structure import *



# int a = 3, b, c;
sym_table.add_entry('a', BasicType('int'))
sym_table.add_entry('b', BasicType('int'))
sym_table.add_entry('c', BasicType('int'))

#float d, *f;
sym_table.add_entry('d', BasicType('float'))
sym_table.add_entry('f', PointerType('float'))

# struct A{
#     int x, int y;
#     float z;
#     int *p;
# }

sym_table.start_scope(name = 'A', scope_type='struct')
sym_table.add_entry('x',BasicType('int'))
sym_table.add_entry('y',BasicType('int'))
sym_table.add_entry('z',BasicType('float'))
sym_table.add_entry('p',PointerType('int'))

sym_table.close_scope()
sym_table.add_struct_entry(name = 'A', symbol_table = sym_table.get_next_symbol_table())

#int main(int argv[], int argc){
sym_table.start_scope(name = 'main', scope_type='function')

#   struct A c;
sym_table.add_entry(name  = 'c', type = sym_table.look_up_struct('A'))

#   int i =0;
#   long n = 1000;
sym_table.add_entry(name  = 'i', type = BasicType('int'))
sym_table.add_entry(name  = 'n', type = BasicType('long'))

#   for(i=0;i<n;i++){
sym_table.start_scope(scope_type='local')
        
#       struct D{
#          int*ptr;
#       }

sym_table.start_scope(name = 'D', scope_type='struct')
sym_table.add_entry('ptr', PointerType('int'))
sym_table.close_scope()

sym_table.add_struct_entry(name = 'D', symbol_table=sym_table.get_next_symbol_table())

#       struct D f;
sym_table.add_entry('f', sym_table.look_up_struct('D'))

#   } // end for loop
sym_table.close_scope()
sym_table.add_scope(symbol_table=sym_table.get_next_symbol_table())

#} // end main
sym_table.close_scope()
sym_table.add_entry(name = 'main', type = FunctionType(return_type='int', param_dict={'argv':PointerType('int'), 'argc':BasicType('int')}, symbol_table=sym_table.get_next_symbol_table()))

assert(sym_table.name == "global")

print(sym_table)