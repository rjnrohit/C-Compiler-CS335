from structure import sym_table
from threeaddr import gen
#add global variables with inital value zero
#float will set to 0.0
#int will set to 0
#pointer with 0 value(NULL)

gp_regs64 = ['rax', 'rbx', 'rcx', 'rdx','rsi','rdi', 'rbp' + 'rsp'] + ['r' + str(i) for i in range(8,16)]
gp_regs32 = ['eax', 'ebx', 'ecx', 'edx','esi','edi', 'ebp' + 'esp'] + ['r' + str(i) + 'd' for i in range(8,16)]
gp_regs16 = ['ax', 'bx', 'cx', 'dx','si','di', 'bp' + 'sp'] + ['r' + str(i) + 'w' for i in range(8,16)]
gp_regs8 = ['al', 'bl', 'cl', 'dl','sil','dil', 'bpl' + 'spl'] + ['r' + str(i) + 'b' for i in range(8,16)]

fp_regs = ['xmm' + str(i) for i in range(16)]



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


def add_bss(vars):
    code = ['section .bss']
    #code for uninitialized vars
    #add for arrays 
    #add for structs
    return code

def add_global_variables():
    pass

def add_data():
    code = ['section .data']
    code += add_standard_constant()
    code += add_global_variables()
    return code

def add_start(gcode):
    code = ['global _start']
    code += ['_start:']
    code += ['mov r12 qword [rsp]'] #argc
    code += ['mov r13 rsp']
    code += ['add r13 8'] #starting address of argv

    #add code for 3ac for outside of all functions

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

def add_func_body_code(name, func_code):
    pass

def add_func_code(func):
    code = ['global ' + func['name']]
    code += [func['name'] + ':']
    code += ['endbr64']
    code += ['push   rbp']
    code += ['mov    rbp,rsp']
    code += add_func_body_code(func['name'], func['code'])
    code += ['leave']
    code += ['ret']

def add_func_call(gen_obj):
    assert isinstance(gen_obj, gen), "object type error"
    #TODO check if function is defined
    pass

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
            gcode += [obj]
    #print(gcode, funcs)
    code = add_data()
    code += add_bss()
    code += add_text(gcode, funcs)


        
        