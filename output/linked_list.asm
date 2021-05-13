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
head@global dq 0
const0 dq 16
const1 dq 0
const2 dq 8
const3 db "linked list is empty",LF, NULL
const4 db "removing node with data %ld",LF, NULL
const5 db "%ld ", NULL
const6 db "",LF, NULL
const7 db "Element %ld is present in linked list",LF, NULL
const8 db "Element %ld is not in linked list",LF, NULL
const9 dq 10
const10 dq 1
const11 dq 49
const12 dq 5
;add bss section for unintialized variables
section .bss
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
global push@func
push@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 48
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const0]
xor rax, rax
add rdi, 15
and dil, 0xf0
call malloc
;copy return value from rax
mov qword[rbp-16], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov qword[rbp-24], r10
mov r10, qword [rbp-24]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-32], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-32]
mov qword[r11], r10
mov r10, qword [rbp-32]
mov r11,qword [r10]
mov qword[rbp-40], r11
mov r10, qword [rbp-24]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-48], r10
mov r10, qword [head@global]
mov r11, qword [rbp-48]
mov qword[r11], r10
mov r10, qword [rbp-48]
mov r11,qword [r10]
mov qword[rbp-56], r11
mov r10, qword [rbp-24]
mov qword[head@global], r10
leave
ret
global pop@func
pop@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
;add space for symbols
sub rsp, 100
mov r10, qword [head@global]
mov r11, qword [const1]
cmp r10, r11
je label#17
mov r10,0
jmp label#18
label#17:
mov r10,1
label#18:
mov byte[rbp-1], r10b
mov r10b, byte [rbp-1]
cmp r10, 0
je label#0
mov r10, qword[const3+0]
mov qword[rbp-23+0], r10
mov r10, qword[const3+8]
mov qword[rbp-23+8], r10
mov r10d, dword[const3+16]
mov dword[rbp-23+16], r10d
mov r10w, word[const3+20]
mov word[rbp-23+20], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-23]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-31], rax
add rsp,8
pop rax
xor rax, rax
leave
ret
label#0:
mov r10, qword[const4+0]
mov qword[rbp-76+0], r10
mov r10, qword[const4+8]
mov qword[rbp-76+8], r10
mov r10, qword[const4+16]
mov qword[rbp-76+16], r10
mov r10d, dword[const4+24]
mov dword[rbp-76+24], r10d
mov r10b, byte[const4+28]
mov byte[rbp-76+28], r10b
mov r10, qword [head@global]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-39], r10
mov r10, qword [rbp-39]
mov r11,qword [r10]
mov qword[rbp-47], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-47]
lea rdi, [rbp-76]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-84], rax
add rsp,8
pop rax
mov r10, qword [head@global]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-92], r10
mov r10, qword [rbp-92]
mov r11,qword [r10]
mov qword[rbp-100], r11
mov r10, qword [rbp-100]
mov qword[head@global], r10
leave
ret
global print_list@func
print_list@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
;add space for symbols
sub rsp, 95
mov r10, qword [head@global]
mov r11, qword [const1]
cmp r10, r11
je label#19
mov r10,0
jmp label#20
label#19:
mov r10,1
label#20:
mov byte[rbp-1], r10b
mov r10b, byte [rbp-1]
cmp r10, 0
je label#1
mov r10, qword[const3+0]
mov qword[rbp-23+0], r10
mov r10, qword[const3+8]
mov qword[rbp-23+8], r10
mov r10d, dword[const3+16]
mov dword[rbp-23+16], r10d
mov r10w, word[const3+20]
mov word[rbp-23+20], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-23]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-31], rax
add rsp,8
pop rax
xor rax, rax
leave
ret
label#1:
mov r10, qword [head@global]
mov qword[rbp-39], r10
label#2:
mov r10, qword [rbp-39]
mov r11, qword [const1]
cmp r10, r11
jne label#21
mov r10,0
jmp label#22
label#21:
mov r10,1
label#22:
mov byte[rbp-40], r10b
mov r10b, byte [rbp-40]
cmp r10, 0
je label#3
mov r10d, dword[const5+0]
mov dword[rbp-61+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-61+4], r10b
mov r10, qword [rbp-39]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-48], r10
mov r10, qword [rbp-48]
mov r11,qword [r10]
mov qword[rbp-56], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-56]
lea rdi, [rbp-61]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-69], rax
add rsp,8
pop rax
mov r10, qword [rbp-39]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-77], r10
mov r10, qword [rbp-77]
mov r11,qword [r10]
mov qword[rbp-85], r11
mov r10, qword [rbp-85]
mov qword[rbp-39], r10
jmp label#2
label#3:
mov r10w, word[const6+0]
mov word[rbp-87+0], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-87]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-95], rax
add rsp,8
pop rax
leave
ret
global search@func
search@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 116
mov r10, qword [head@global]
mov r11, qword [const1]
cmp r10, r11
je label#23
mov r10,0
jmp label#24
label#23:
mov r10,1
label#24:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#4
mov r10, qword[const3+0]
mov qword[rbp-31+0], r10
mov r10, qword[const3+8]
mov qword[rbp-31+8], r10
mov r10d, dword[const3+16]
mov dword[rbp-31+16], r10d
mov r10w, word[const3+20]
mov word[rbp-31+20], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-31]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-39], rax
add rsp,8
pop rax
xor rax, rax
leave
ret
label#4:
mov r10, qword [head@global]
mov qword[rbp-47], r10
label#5:
mov r10, qword [rbp-47]
mov r11, qword [const1]
cmp r10, r11
jne label#25
mov r10,0
jmp label#26
label#25:
mov r10,1
label#26:
mov byte[rbp-48], r10b
mov r10b, byte [rbp-48]
cmp r10, 0
je label#7
mov r10, qword [rbp-47]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-56], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-64], r11
mov r10, qword [rbp-64]
mov r11, qword [rbp-8]
cmp r10, r11
je label#27
mov r10,0
jmp label#28
label#27:
mov r10,1
label#28:
mov byte[rbp-65], r10b
mov r10b, byte [rbp-65]
cmp r10, 0
je label#6
mov r10, qword[const7+0]
mov qword[rbp-104+0], r10
mov r10, qword[const7+8]
mov qword[rbp-104+8], r10
mov r10, qword[const7+16]
mov qword[rbp-104+16], r10
mov r10, qword[const7+24]
mov qword[rbp-104+24], r10
mov r10d, dword[const7+32]
mov dword[rbp-104+32], r10d
mov r10w, word[const7+36]
mov word[rbp-104+36], r10w
mov r10b, byte[const7+38]
mov byte[rbp-104+38], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-8]
lea rdi, [rbp-104]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-112], rax
add rsp,8
pop rax
xor rax, rax
leave
ret
label#6:
mov r10, qword [rbp-47]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-120], r10
mov r10, qword [rbp-120]
mov r11,qword [r10]
mov qword[rbp-128], r11
mov r10, qword [rbp-128]
mov qword[rbp-47], r10
jmp label#5
label#7:
mov r10, qword[const8+0]
mov qword[rbp-116+0], r10
mov r10, qword[const8+8]
mov qword[rbp-116+8], r10
mov r10, qword[const8+16]
mov qword[rbp-116+16], r10
mov r10, qword[const8+24]
mov qword[rbp-116+24], r10
mov r10w, word[const8+32]
mov word[rbp-116+32], r10w
mov r10b, byte[const8+34]
mov byte[rbp-116+34], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-8]
lea rdi, [rbp-116]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-124], rax
add rsp,8
pop rax
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 67
mov r10, qword [const1]
mov qword[rbp-16], r10
label#8:
mov r10, qword [rbp-16]
mov r11, qword [const9]
cmp r10, r11
jl label#29
mov r10,0
jmp label#30
label#29:
mov r10,1
label#30:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#10
mov r10, qword [rbp-16]
mov r11, qword [rbp-16]
imul r10, r11
mov qword[rbp-41], r10
; saving arguments for call
mov rdi, qword [rbp-41]
call push@func
add rsp,0
label#9:
mov r10, qword [rbp-16]
mov qword[rbp-25], r10
mov r10, qword [rbp-16]
mov r11, qword [const10]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov qword[rbp-16], r10
jmp label#8
label#10:
; saving arguments for call
call print_list@func
add rsp,0
; saving arguments for call
mov rdi, qword [const11]
call search@func
add rsp,0
mov r10, qword [const1]
mov qword[rbp-16], r10
label#11:
mov r10, qword [rbp-16]
mov r11, qword [const12]
cmp r10, r11
jl label#31
mov r10,0
jmp label#32
label#31:
mov r10,1
label#32:
mov byte[rbp-42], r10b
mov r10b, byte [rbp-42]
cmp r10, 0
je label#13
; saving arguments for call
call pop@func
add rsp,0
label#12:
mov r10, qword [rbp-16]
mov qword[rbp-50], r10
mov r10, qword [rbp-16]
mov r11, qword [const10]
add r10, r11
mov qword[rbp-58], r10
mov r10, qword [rbp-58]
mov qword[rbp-16], r10
jmp label#11
label#13:
; saving arguments for call
call print_list@func
add rsp,0
; saving arguments for call
mov rdi, qword [const11]
call search@func
add rsp,0
label#14:
mov r10, qword [rbp-16]
mov r11, qword [const9]
cmp r10, r11
jle label#33
mov r10,0
jmp label#34
label#33:
mov r10,1
label#34:
mov byte[rbp-59], r10b
mov r10b, byte [rbp-59]
cmp r10, 0
je label#16
; saving arguments for call
call pop@func
add rsp,0
label#15:
mov r10, qword [rbp-16]
mov qword[rbp-67], r10
mov r10, qword [rbp-16]
mov r11, qword [const10]
add r10, r11
mov qword[rbp-75], r10
mov r10, qword [rbp-75]
mov qword[rbp-16], r10
jmp label#14
label#16:
;copy return value in rax
mov rax , qword[const1]
leave
ret
