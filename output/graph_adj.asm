section .data
; this section for standard constants
LF equ 10 ; line feed
NULL equ 0 ; end of string
TRUE equ 1
FALSE equ 0
EXIT_SUCCESS equ 0 ; success code
STDIN equ 0 ; standard input
STDOUT equ 1 ; standard output
STDERR equ 2 ; standard error
SYS_read equ 0 ; read
SYS_write equ 1 ; write
SYS_open equ 2 ; file open
SYS_close equ 3 ; file close
SYS_fork equ 57 ; fork
SYS_exit equ 60 ; terminate
SYS_creat equ 85 ; file open/create
;add global variables and constants
const0 dq 8
const1 dq 1
const2 dq -1
const3 db "Node %ld: new tree",LF, NULL
const4 db "Node %ld: Parent: %ld",LF, NULL
const5 dq 0
const6 dq 11
const7 dq 16
const8 db "Enter number of vertice (<=10)",LF, NULL
const9 db "%ld", NULL
const10 dq 10
const11 db "invalid number",LF, NULL
;add bss section for unintialized variables
section .bss
adj@global resq 11
visited@global resq 11
;add extern symbols
extern printf
extern scanf
extern malloc
extern sqrt
extern exit
extern puts
extern gets
extern atoi
extern atol
extern strlen
extern strcpy
extern strcat
extern strcmp
extern strlwr
extern memchr
extern memcmp
extern memcpy
extern memmove
extern memset
extern strcat
extern strncat
extern strchr
extern strcmp
extern strncmp
extern strcoll
extern strcpy
extern strncpy
extern strstr
extern strupr
extern free
extern acos
extern asin
extern atan
extern atan2
extern cos
extern cosh
extern sin
extern sinh
extern tanh
extern exp
extern log
extern log10
extern pow
extern ceil
extern fabs
extern floor
extern fopen
extern fclose
extern fprintf
extern fscanf
extern fread
extern fwrite
extern fseek
extern tan
extern log2
extern trunc
extern round
section .text
global dfs@func
dfs@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 238
lea r10, [visited@global]
mov qword [rbp-24], r10
mov r10, qword [rbp-8]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-32], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-32]
add r10, r11
mov qword[rbp-40], r10
mov r10, qword [const1]
mov r11, qword [rbp-40]
mov qword[r11], r10
mov r10, qword [rbp-40]
mov r11,qword [r10]
mov qword[rbp-48], r11
mov r10, qword [rbp-16]
mov r11, qword [const2]
cmp r10, r11
je label#23
mov r10,0
jmp label#24
label#23:
mov r10,1
label#24:
mov byte[rbp-49], r10b
mov r10b, byte [rbp-49]
cmp r10, 0
je label#0
mov r10, qword[const3+0]
mov qword[rbp-77+0], r10
mov r10, qword[const3+8]
mov qword[rbp-77+8], r10
mov r10d, dword[const3+16]
mov dword[rbp-77+16], r10d
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-57], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-57]
lea rdi, [rbp-77]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-85], rax
add rsp,8
pop rax
jmp label#1
label#0:
mov r10, qword[const4+0]
mov qword[rbp-124+0], r10
mov r10, qword[const4+8]
mov qword[rbp-124+8], r10
mov r10d, dword[const4+16]
mov dword[rbp-124+16], r10d
mov r10w, word[const4+20]
mov word[rbp-124+20], r10w
mov r10b, byte[const4+22]
mov byte[rbp-124+22], r10b
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-93], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-101], r10
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-101]
mov rsi, qword [rbp-93]
lea rdi, [rbp-124]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-132], rax
add rsp,8
pop rax
label#1:
lea r10, [adj@global]
mov qword [rbp-140], r10
mov r10, qword [rbp-8]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-148], r10
mov r10, qword [rbp-140]
mov r11, qword [rbp-148]
add r10, r11
mov qword[rbp-156], r10
mov r10, qword [rbp-156]
mov r11,qword [r10]
mov qword[rbp-164], r11
mov r10, qword [rbp-164]
mov qword[rbp-172], r10
label#2:
mov r10, qword [rbp-172]
mov r11, qword [const5]
cmp r10, r11
jne label#25
mov r10,0
jmp label#26
label#25:
mov r10,1
label#26:
mov byte[rbp-173], r10b
mov r10b, byte [rbp-173]
cmp r10, 0
je label#4
lea r10, [visited@global]
mov qword [rbp-181], r10
mov r10, qword [rbp-172]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-189], r10
mov r10, qword [rbp-189]
mov r11,qword [r10]
mov qword[rbp-197], r11
mov r10, qword [rbp-197]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-205], r10
mov r10, qword [rbp-181]
mov r11, qword [rbp-205]
add r10, r11
mov qword[rbp-213], r10
mov r10, qword [rbp-213]
mov r11,qword [r10]
mov qword[rbp-221], r11
mov r10, qword [rbp-221]
cmp r10, 0
je label#27
mov r10,0
jmp label#28
label#27:
mov r10,1
label#28:
mov byte[rbp-222], r10b
mov r10b, byte [rbp-222]
cmp r10, 0
je label#3
mov r10, qword [rbp-172]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-230], r10
mov r10, qword [rbp-230]
mov r11,qword [r10]
mov qword[rbp-238], r11
push rax
; saving arguments for call
mov rsi, qword [rbp-8]
mov rdi, qword [rbp-238]
call dfs@func
add rsp,0
pop rax
label#3:
mov r10, qword [rbp-172]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-246], r10
mov r10, qword [rbp-246]
mov r11,qword [r10]
mov qword[rbp-254], r11
mov r10, qword [rbp-254]
mov qword[rbp-172], r10
jmp label#2
label#4:
leave
ret
global push@func
push@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 113
mov r10, qword [rbp-8]
mov r11, qword [const6]
cmp r10, r11
jge label#29
mov r10,0
jmp label#30
label#29:
mov r10,1
label#30:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#5
xor rax, rax
leave
ret
label#5:
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const7]
xor rax, rax
add rdi, 15
and dil, 0xf0
call malloc
;copy return value from rax
mov qword[rbp-25], rax
add rsp,8
pop rax
mov r10, qword [rbp-25]
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-41], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-41]
mov qword[r11], r10
mov r10, qword [rbp-41]
mov r11,qword [r10]
mov qword[rbp-49], r11
mov r10, qword [rbp-33]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-57], r10
lea r10, [adj@global]
mov qword [rbp-65], r10
mov r10, qword [rbp-8]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-73], r10
mov r10, qword [rbp-65]
mov r11, qword [rbp-73]
add r10, r11
mov qword[rbp-81], r10
mov r10, qword [rbp-81]
mov r11,qword [r10]
mov qword[rbp-89], r11
mov r10, qword [rbp-89]
mov r11, qword [rbp-57]
mov qword[r11], r10
mov r10, qword [rbp-57]
mov r11,qword [r10]
mov qword[rbp-97], r11
lea r10, [adj@global]
mov qword [rbp-105], r10
mov r10, qword [rbp-8]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-113], r10
mov r10, qword [rbp-105]
mov r11, qword [rbp-113]
add r10, r11
mov qword[rbp-121], r10
mov r10, qword [rbp-33]
mov r11, qword [rbp-121]
mov qword[r11], r10
mov r10, qword [rbp-121]
mov r11,qword [r10]
mov qword[rbp-129], r11
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 259
mov r10, qword [const5]
mov qword[rbp-16], r10
label#6:
mov r10, qword [rbp-16]
mov r11, qword [const6]
cmp r10, r11
jl label#31
mov r10,0
jmp label#32
label#31:
mov r10,1
label#32:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#8
lea r10, [adj@global]
mov qword [rbp-41], r10
mov r10, qword [rbp-16]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-41]
mov r11, qword [rbp-49]
add r10, r11
mov qword[rbp-57], r10
mov r10, qword [const5]
mov r11, qword [rbp-57]
mov qword[r11], r10
mov r10, qword [rbp-57]
mov r11,qword [r10]
mov qword[rbp-65], r11
lea r10, [visited@global]
mov qword [rbp-73], r10
mov r10, qword [rbp-16]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-81], r10
mov r10, qword [rbp-73]
mov r11, qword [rbp-81]
add r10, r11
mov qword[rbp-89], r10
mov r10, qword [const5]
mov r11, qword [rbp-89]
mov qword[r11], r10
mov r10, qword [rbp-89]
mov r11,qword [r10]
mov qword[rbp-97], r11
label#7:
mov r10, qword [rbp-16]
mov qword[rbp-25], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov qword[rbp-16], r10
jmp label#6
label#8:
mov r10, qword[const8+0]
mov qword[rbp-137+0], r10
mov r10, qword[const8+8]
mov qword[rbp-137+8], r10
mov r10, qword[const8+16]
mov qword[rbp-137+16], r10
mov r10, qword[const8+24]
mov qword[rbp-137+24], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-137]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-145], rax
add rsp,8
pop rax
mov r10d, dword[const9+0]
mov dword[rbp-157+0], r10d
lea r10, [rbp-105]
mov qword [rbp-153], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-153]
lea rdi, [rbp-157]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-165], rax
add rsp,8
pop rax
mov r10, qword [rbp-105]
mov r11, qword [const10]
cmp r10, r11
jg label#33
mov r10,0
jmp label#34
label#33:
mov r10,1
label#34:
mov byte[rbp-166], r10b
mov r10b, byte [rbp-166]
cmp r10, 0
jne label#9
mov r10, qword [rbp-105]
mov r11, qword [const1]
cmp r10, r11
jl label#35
mov r10,0
jmp label#36
label#35:
mov r10,1
label#36:
mov byte[rbp-167], r10b
mov r10b, byte [rbp-167]
cmp r10, 0
jne label#9
mov r10, qword [const5]
mov byte[rbp-168], r10b
jmp label#10
label#9:
mov r10, qword [const1]
mov byte[rbp-168], r10b
label#10:
mov r10b, byte [rbp-168]
cmp r10, 0
je label#11
mov r10, qword[const11+0]
mov qword[rbp-184+0], r10
mov r10, qword[const11+8]
mov qword[rbp-184+8], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-184]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-192], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const2]
leave
ret
label#11:
mov r10, qword [const5]
mov qword[rbp-16], r10
label#12:
mov r10, qword [rbp-16]
mov r11, qword [rbp-105]
cmp r10, r11
jl label#37
mov r10,0
jmp label#38
label#37:
mov r10,1
label#38:
mov byte[rbp-193], r10b
mov r10b, byte [rbp-193]
cmp r10, 0
je label#17
label#13:
mov r10d, dword[const9+0]
mov dword[rbp-229+0], r10d
lea r10, [rbp-217]
mov qword [rbp-225], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-225]
lea rdi, [rbp-229]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-237], rax
add rsp,8
pop rax
mov r10, qword [rbp-217]
mov r11, qword [const2]
cmp r10, r11
je label#39
mov r10,0
jmp label#40
label#39:
mov r10,1
label#40:
mov byte[rbp-238], r10b
mov r10b, byte [rbp-238]
cmp r10, 0
je label#14
jmp label#16
label#14:
mov r10, qword [rbp-217]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-246], r10
push rax
; saving arguments for call
mov rsi, qword [rbp-246]
mov rdi, qword [rbp-16]
call push@func
add rsp,0
pop rax
label#15:
mov r10, qword [const1]
cmp r10, 0
jne label#13
label#16:
mov r10, qword [rbp-16]
mov qword[rbp-201], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-209], r10
mov r10, qword [rbp-209]
mov qword[rbp-16], r10
jmp label#12
label#17:
mov r10, qword [const5]
mov qword[rbp-16], r10
label#18:
mov r10, qword [rbp-16]
mov r11, qword [rbp-105]
cmp r10, r11
jl label#41
mov r10,0
jmp label#42
label#41:
mov r10,1
label#42:
mov byte[rbp-218], r10b
mov r10b, byte [rbp-218]
cmp r10, 0
je label#20
lea r10, [visited@global]
mov qword [rbp-242], r10
mov r10, qword [rbp-16]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-250], r10
mov r10, qword [rbp-242]
mov r11, qword [rbp-250]
add r10, r11
mov qword[rbp-258], r10
mov r10, qword [rbp-258]
mov r11,qword [r10]
mov qword[rbp-266], r11
mov r10, qword [rbp-266]
cmp r10, 0
je label#43
mov r10,0
jmp label#44
label#43:
mov r10,1
label#44:
mov byte[rbp-267], r10b
mov r10b, byte [rbp-267]
cmp r10, 0
je label#19
push rax
; saving arguments for call
mov rsi, qword [const2]
mov rdi, qword [rbp-16]
call dfs@func
add rsp,0
pop rax
label#19:
mov r10, qword [rbp-16]
mov qword[rbp-226], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-234], r10
mov r10, qword [rbp-234]
mov qword[rbp-16], r10
jmp label#18
label#20:
leave
ret
