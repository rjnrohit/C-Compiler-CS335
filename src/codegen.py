from structure import StructType, sym_table, PointerType, BasicType
from threeaddr import gen
from threeaddr import alloc
import math

gp_regs64 = ['rax', 'rbx', 'rcx', 'rdx','rsi','rdi', 'rbp' + 'rsp'] + ['r' + str(i) for i in range(8,16)]
gp_regs32 = ['eax', 'ebx', 'ecx', 'edx','esi','edi', 'ebp' + 'esp'] + ['r' + str(i) + 'd' for i in range(8,16)]
gp_regs16 = ['ax', 'bx', 'cx', 'dx','si','di', 'bp' + 'sp'] + ['r' + str(i) + 'w' for i in range(8,16)]
gp_regs8 = ['al', 'bl', 'cl', 'dl','sil','dil', 'bpl' + 'spl'] + ['r' + str(i) + 'b' for i in range(8,16)]

gp_regsf = ['xmm' + str(i) for i in range(16)]

arg_regs = ['rdi', 'rsi', 'rdx','rcx', 'r8','r9']
temp_regs= ['r10','r11']
arg_regsf= ['xmm' + str(i) for i in range(8)]

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
            const_dict[str(alloc[key])] = e_name
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

def add_func_body_code(name, func_code):
    code =[]
    return code

def add_func_code(func):
    code = ['global ' + func['name']]
    code += [func['name'] + ':']
    code += ['push   rbp']
    code += ['mov    rbp,rsp']
    code += add_func_body_code(func['name'], func['code'])
    code += ['leave']
    code += ['ret']
    return code

def add_func_call(gen_obj):
    assert isinstance(gen_obj, gen), "object type error"

    if not sym_table.table[gen_obj.place1].type.defined:
        print( "\033[93m {}\033[00m" .format("Warning:")+ "Undefined refrence to" + "\033[91m {}\033[00m" .format(gen_obj.place1))
    
    #args in place2
    #retrun type in place3
    
    

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
    f = open('temp.s', 'w')
    for string in code:
        print(string, file = f)
        