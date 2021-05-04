from structure import FunctionType, StructType, SymbolTable, sym_table, PointerType, BasicType
from threeaddr import gen
from threeaddr import alloc, temp_dict
import math

#Note:
"""
We've avoided padding for implementation purpose,
padding poses some more challenges and understanding
----++++----++++----++++----++++----++++
    |   |   |      |     |
Unaligned address will impose more runtime overhead
"""
"""
we are supporting the arguments in the main function
i) argc
ii) argv
"""

##
"""
Possible error:
i.)confusion of symbol_table_dict, sym_table
ii.)addresses are not aligned in add_args_copy_code
"""
##

gp_regs64 = ['rax', 'rbx', 'rcx', 'rdx','rsi','rdi', 'rbp' + 'rsp'] + ['r' + str(i) for i in range(8,16)]
gp_regs32 = ['eax', 'ebx', 'ecx', 'edx','esi','edi', 'ebp' + 'esp'] + ['r' + str(i) + 'd' for i in range(8,16)]
gp_regs16 = ['ax', 'bx', 'cx', 'dx','si','di', 'bp' + 'sp'] + ['r' + str(i) + 'w' for i in range(8,16)]
gp_regs8 = ['al', 'bl', 'cl', 'dl','sil','dil', 'bpl' + 'spl'] + ['r' + str(i) + 'b' for i in range(8,16)]

gp_regsf = ['xmm' + str(i) for i in range(16)]

arg_regs = [
        {8:'rdi', 4:'edi',2:'di', 1:'dil'},
        {8:'rsi', 4:'esi',2:'si', 2:'sil'},
        {8:'rdx', 4:'edx',2:'dx', 2:'dl'},
        {8:'rcx', 4:'ecx',2:'cx', 2:'cl'},
        {8:'r8', 4:'r8d',2:'r8w', 2:'r8b'},
        {8:'r9', 4:'r9d',2:'r9w', 2:'r9b'}
    ]
temp_regs= [
        {8:'r10', 4:'r10d',2:'r10w', 2:'r10b'},
        {8:'r11', 4:'r11d',2:'r11w', 2:'r11b'}
    ]
arg_regsf= ['xmm' + str(i) for i in range(8)]

size_type = {1:'byte', 2:'word', 4:'dword', 8:'qword'}

decl_type= {1:'db', 2:'dw', 4:'dd', 8:'dq',16:'ddq'}
decl_type_bss = {1:'resb', 2:'resw', 4:'resd', 8:'resq',16:'resdq'}

const_dict = {}

def add_standard_constant():
    code = ['; this section for standard constants']
    code += [
    'LF equ 10 ; line feed',
    'NULL equ 0 ; end of string',
    'TRUE equ 1',
    'FALSE equ 0',
    'EXIT_SUCCESS equ 0 ; success code',
    'STDIN equ 0 ; standard input',
    'STDOUT equ 1 ; standard output',
    'STDERR equ 2 ; standard error',
    'SYS_read equ 0 ; read',
    'SYS_write equ 1 ; write',
    'SYS_open equ 2 ; file open',
    'SYS_close equ 3 ; file close',
    'SYS_fork equ 57 ; fork',
    'SYS_exit equ 60 ; terminate',
    'SYS_creat equ 85 ; file open/create'
    ]
    return code


def add_bss():
    code = ['section .bss']
    for name in sym_table.table:
        typ = sym_table.table[name].type
        if typ.class_type == 'FunctionType':
            continue
        if '@' not in name:
            if name + '|global' not in alloc:
                name = name + '@global'
                if typ.class_type == 'BasicType':
                    code += [name + ' ' + decl_type_bss[typ.width] + ' 1']
                elif typ.class_type == 'PointerType':
                    if typ.array_type:
                        assert isinstance(typ.array_size, list), "array size must be list"
                        code += [name + ' ' + decl_type_bss[typ.array_type.width] + ' ' + str(math.prod(typ.array_size))]
                    else:
                        code += [name + ' ' + decl_type_bss[8] + ' 1']
                else:
                    assert isinstance(typ, StructType), "must be of struct type"
                    tmp_code =[]
                    
                    for key in typ.symbol_table.table:
                        typ2 = typ.symbol_table.table[key].type
                        if typ2.class_type == 'PointerType' and typ2.array_type:
                            tmp_code += [decl_type_bss[typ2.array_type.width] + ' ' + str(math.prod(typ2.array_size))]
                        else:
                            tmp_code += [decl_type_bss[typ2.width] + ' 1' ]
                    
                    #print(name, tmp_code)
                    assert tmp_code, "empty struct"

                    tmp_code[0] = name + ' ' + tmp_code[0]

                    code += tmp_code
    return code

def add_init_global_variables():
    code =[]
    for key in alloc:
        if '@' in key:
            name = key
            e_name = 'const' + str(len(const_dict))
            #const_dict[str(alloc[key])] = e_name
            const_dict[key] = e_name
        else :
            name = key.split('|')[0]
            e_name = name + '@global'

        typ = sym_table.table[name].type
        assert isinstance(typ, PointerType) or isinstance(typ,BasicType)

        if typ.class_type == 'BasicType':
            code += [e_name + ' ' + decl_type[typ.width] + ' ' + str(alloc[key])]
        else:
            if typ.array_type:
                assert typ.array_type.stype == 'char', "not char string"
                code += [e_name + ' ' + decl_type[typ.array_type.width]  + ' "' + str(alloc[key]) +'", NULL']
            else:
                code += [e_name + ' ' + decl_type[8] + ' ' + str(alloc[key])]
    
    return code


def add_data():
    code = ['section .data']
    code += add_standard_constant()
    code += add_init_global_variables()
    return code

def add_start(gcode):
    code = ['global _start']
    code += ['_start:']
    code += ['mov r12,  [rsp]'] #argc
    code += ['lea r13, [rsp+8]']    #starting address of argv

    assert not gcode, "Not supported exp outside functions"

    code += ['mov rdi, r12']
    code += ['mov rsi, r13']
    code += ['call main']
    code += ['end:']
    code += ['mov rax, SYS_exit ; Call code for exit']
    code += ['mov rdi, EXIT_SUCCESS ; Exit program with success']
    code += ['syscall']

    return code

def add_text(gcode, func_codes):
    code = ['section .text']
    code += add_start(gcode)
    
    for func in func_codes:
        code += add_func_code(func)
    
    return code

def add_args_copy_code(fname):
    code =[]
    float_args = 0
    byte8_args = 0
    other_args =0
    args_type = sym_table.table[fname].type.param_list
    symbol_table = sym_table.table[fname].type.symbol_table

    assert symbol_table == SymbolTable.symbol_table_dict[fname], "possibly wrong implementation"

    off = 16

    for typ in args_type:
        if typ.stype == "float":
            float_args += 1
            if float_args <= len(arg_regsf):
                code += ["sub rsp, 4"]
                code += ["movss dword [rsp]," + arg_regsf[float_args-1]]
            else:
                code += ["sub rsp, 4"]
                code += ["movss xmm0, dword [rbp+" +str(off)+ "]"]
                code += ["movss dword [rsp], xmm0"]
        elif typ.class_type == "BasicType" or (typ.class_type == "PointerType" and typ.array_type is None):
            byte8_args += 1
            get_width = str(typ.width)
            get_size = size_type[typ.width]
            if byte8_args <= len(arg_regs):
                code += ["sub rsp, " + get_width]
                code += ["mov "+get_size+" [rsp]," + arg_regs[byte8_args-1][typ.width]]
            else:
                code += ["sub rsp, " + get_width]
                code += ["mov "+temp_regs[0][typ.width]+", "+get_size+" [rbp+" +str(off)+ "]"]
                code += ["mov "+get_size+"[rsp], "+ temp_regs[0][typ.width]]

        else:
            other_args += 1
            code += add_copy_data_code(typ.width, "rbp+" +str(off))
        off += typ.width
    #print(code)
    return code

def add_func_body_code(name, func_code):
    code =[]
    for gen_obj in func_code:
        if gen_obj.op == 'func_call':
            code += add_func_call(gen_obj)
    return code

def add_func_code(func):
    code = ['global ' + func['name']]
    code += [func['name'] + ':']
    code += ['push   rbp']
    code += ['mov    rbp,rsp']
    code += add_args_copy_code(func['name'])
    code += add_func_body_code(func['name'], func['code'])
    code += ['leave']
    code += ['ret']
    return code

def add_func_call(gen_obj):
    assert isinstance(gen_obj, gen), "object type error"
    assert isinstance(sym_table.table[gen_obj.place1].type, FunctionType), "not a function"

    if not sym_table.table[gen_obj.place1].type.defined:
        print( "\033[93m {}\033[00m" .format("Warning:")+ "Undefined refrence to" + "\033[91m {}\033[00m" .format(gen_obj.place1))
    
    code = []

    args_val = gen_obj.place2
    ret_type = gen_obj.place3
    args_type = sym_table.table[gen_obj.place1].type.param_list

    #print(args_val)
    #print(args_type, args_type[0])

    assert len(args_type) == len(args_val), "argument mismatch"

    float_args =[]
    float_args_type = []
    byte8_args = []
    byte8_args_type = []
    other_args= []
    other_args_type = []

    for i, typ in enumerate(args_type):
        if typ.stype == "float":
            float_args += [args_val[i]]
            float_args_type += [typ]
        elif typ.class_type == "BasicType":
            byte8_args += [args_val[i]]
            byte8_args_type += [typ]
        elif typ.class_type == "PointerType" and typ.array_type is None:
            byte8_args += [args_val[i]]
            byte8_args_type += [typ]
        else:
            other_args += [args_val[i]]
            other_args_type += [typ]
    #print(float_args_type, byte8_args_type, other_args_type)
    #print(float_args, byte8_args, other_args)

    args_val = args_val[::-1]
    args_type = args_type[::-1]

    shift = 0

    for i, typ in enumerate(args_type):
        if 'const@' in args_val[i]:
            addr =  const_dict[args_val[i]]
        elif 'tmp@' in args_val[i]:
            offset = temp_dict[args_val[i]].table[args_val[i]].offset + temp_dict[args_val[i]].base
            addr = 'rbp-'+ str(offset)
        else:
            assert '|' in args_val[i], "wrong var in 3ac code"
            name = args_val[i].split('|')[0]
            table = args_val[i].split('|')[1]
            
            symbol_table = SymbolTable.symbol_table_dict[table]
            offset = symbol_table.table[name].offset + symbol_table.base
            assert symbol_table, "there is no symbol table correspoding to" + table

            if table == "global":
                addr = name + '@global'
            else:
                addr = 'rbp-'+ str(offset)

        if typ.stype == "float":
            if len(float_args) > len(arg_regsf):
                code += ['sub rsp, 4']
                code += ['movss xmm0, dword [' + addr+']']
                code += ['movss dword [rsp], xmm0']
                shift += typ.width
            else:
                code += ['movss ' + arg_regsf[len(float_args)-1] +', dword [' + addr + ']']
            float_args.pop()
            float_args_type.pop()
        elif typ.class_type == "BasicType" or (typ.class_type == "PointerType" and typ.array_type is None):
            get_size = size_type[typ.width]
            get_width = str(typ.width)
            if len(byte8_args) > len(arg_regs):
                code += ['sub rsp, ' + get_width]
                code += ['mov '+temp_regs[0][typ.width]+', '+get_size+' [' + addr+']']
                code += ['mov '+get_size+' [rsp], '+temp_regs[0][typ.width]]
                shift += typ.width
            else:
                code += ['mov ' + arg_regs[len(byte8_args)-1][typ.width] +', '+get_size+' [' + addr + ']']
            byte8_args.pop()
            byte8_args_type.pop()
        else:
            shift += typ.width
            code += add_copy_data_code(typ.width, addr)
            other_args.pop()
            other_args_type.pop()
    code += ["call " + gen_obj.place1]
    code += ["add rsp," + str(shift)]
    return code

def add_copy_data_code(count, addr):
    """
    array
       addr :+
             +
             +
             +
      addr+4 -
             -
             -
             -
    """
    code =[]
    off = 0
    while count:
        new_addr = addr + '+' + str(off)
        if count >= 8:
            dec = 8
        elif count >= 4:
            dec = 4
        elif count >= 2:
            dec = 2
        else:
            dec = 1
        get_size = size_type[dec]
        count -= dec
        off += dec
        code += ["push " + get_size+ " [" + new_addr + "]"]

    return code
   

    

    

def generate(tac_code):
    func_name =""
    gcode = []
    funcs =[]
    for i, obj in enumerate(tac_code):
        if obj.op == 'BeginFunc':
            if func_name:
                assert False, "wrong code generated"
                exit(-1)
            func_name = tac_code[i-1].place1
            funcs += [{}]
            funcs[-1]['name'] = func_name
            funcs[-1]['code'] = []
            continue
        elif obj.op == 'EndFunc':
            if not func_name:
                assert False, "wrong code generated"
                exit(-1)
            func_name =""
            continue

        if func_name:
            funcs[-1]['code'] += [obj]
        else:
            if obj.op!= 'label':
                gcode += [obj]
    
    code = add_data()
    code += add_bss()
    code += add_text(gcode, funcs)

    return code


def print_asm(tac_code):
    code = generate(tac_code)
    f = open('temp.asm', 'w')
    for string in code:
        print(string, file = f)
        