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
root@global dq 0
const0 db "hello",LF, NULL
const1 dq 32
const2 dq 8
const3 dq 16
const4 dq 0
const5 dq 24
const6 dq 1
const7 db "%d ", NULL
const8 dq 2
const9 dq 7
const10 dq 9
const11 dq -1
;add bss section for unintialized variables
section .bss
;add extern symbols
extern printf
extern scanf
extern malloc
extern sqrt
extern exit
extern puts
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
section .text
global insert@func
insert@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 136
mov r10d, dword[const0+0]
mov dword[rbp-15+0], r10d
mov r10w, word[const0+4]
mov word[rbp-15+4], r10w
mov r10b, byte[const0+6]
mov byte[rbp-15+6], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-15]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-23], rax
add rsp,8
pop rax
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const1]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-31], rax
add rsp,8
pop rax
mov r10, qword [rbp-31]
mov qword[rbp-39], r10
mov r10d, dword[const0+0]
mov dword[rbp-62+0], r10d
mov r10w, word[const0+4]
mov word[rbp-62+4], r10w
mov r10b, byte[const0+6]
mov byte[rbp-62+6], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-62]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-70], rax
add rsp,8
pop rax
mov r10, qword [rbp-39]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-78], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-78]
mov qword[r11], r10
mov r10, qword [rbp-78]
mov r11,qword [r10]
mov qword[rbp-86], r11
mov r10, qword [rbp-39]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-94], r10
mov r10, qword [const4]
mov r11, qword [rbp-94]
mov qword[r11], r10
mov r10, qword [rbp-94]
mov r11,qword [r10]
mov qword[rbp-102], r11
mov r10, qword [rbp-39]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-110], r10
mov r10, qword [const4]
mov r11, qword [rbp-110]
mov qword[r11], r10
mov r10, qword [rbp-110]
mov r11,qword [r10]
mov qword[rbp-118], r11
mov r10, qword [root@global]
mov r11, qword [const4]
cmp r10, r11
je label#8
mov r10,0
jmp label#9
label#8:
mov r10,1
label#9:
mov byte[rbp-119], r10b
mov r10b, byte [rbp-119]
cmp r10, 0
je label#0
mov r10, qword [rbp-39]
mov qword[root@global], r10
xor rax, rax
leave
ret
label#0:
mov r10, qword [root@global]
mov qword[rbp-47], r10
mov r10, qword [const4]
mov qword[rbp-55], r10
label#1:
mov r10, qword [const6]
cmp r10, 0
je label#5
mov r10, qword [rbp-47]
mov qword[rbp-55], r10
mov r10, qword [rbp-55]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-127], r10
mov r10, qword [rbp-127]
mov r11,qword [r10]
mov qword[rbp-135], r11
mov r10, qword [rbp-8]
mov r11, qword [rbp-135]
cmp r10, r11
jl label#10
mov r10,0
jmp label#11
label#10:
mov r10,1
label#11:
mov byte[rbp-136], r10b
mov r10b, byte [rbp-136]
cmp r10, 0
je label#3
mov r10, qword [rbp-47]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-144], r10
mov r10, qword [rbp-144]
mov r11,qword [r10]
mov qword[rbp-152], r11
mov r10, qword [rbp-152]
mov qword[rbp-47], r10
mov r10, qword [rbp-47]
mov r11, qword [const4]
cmp r10, r11
je label#12
mov r10,0
jmp label#13
label#12:
mov r10,1
label#13:
mov byte[rbp-153], r10b
mov r10b, byte [rbp-153]
cmp r10, 0
je label#2
mov r10, qword [rbp-55]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-161], r10
mov r10, qword [rbp-39]
mov r11, qword [rbp-161]
mov qword[r11], r10
mov r10, qword [rbp-161]
mov r11,qword [r10]
mov qword[rbp-169], r11
xor rax, rax
leave
ret
label#2:
jmp label#4
label#3:
mov r10, qword [rbp-47]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-161], r10
mov r10, qword [rbp-161]
mov r11,qword [r10]
mov qword[rbp-169], r11
mov r10, qword [rbp-169]
mov qword[rbp-47], r10
mov r10, qword [rbp-47]
mov r11, qword [const4]
cmp r10, r11
je label#14
mov r10,0
jmp label#15
label#14:
mov r10,1
label#15:
mov byte[rbp-170], r10b
mov r10b, byte [rbp-170]
cmp r10, 0
je label#4
mov r10, qword [rbp-55]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-178], r10
mov r10, qword [rbp-39]
mov r11, qword [rbp-178]
mov qword[r11], r10
mov r10, qword [rbp-178]
mov r11,qword [r10]
mov qword[rbp-186], r11
xor rax, rax
leave
ret
label#4:
jmp label#1
label#5:
leave
ret
global inorder_traversal@func
inorder_traversal@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 69
mov r10, qword [rbp-8]
mov r11, qword [const4]
cmp r10, r11
jne label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#6
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
; saving arguments for call
mov rdi, qword [rbp-25]
call inorder_traversal@func
add rsp,0
mov r10d, dword[const7+0]
mov dword[rbp-45+0], r10d
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov r11,qword [r10]
mov qword[rbp-41], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-41]
lea rdi, [rbp-45]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-53], rax
add rsp,8
pop rax
mov r10, qword [rbp-8]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-61], r10
mov r10, qword [rbp-61]
mov r11,qword [r10]
mov qword[rbp-69], r11
; saving arguments for call
mov rdi, qword [rbp-69]
call inorder_traversal@func
add rsp,0
label#6:
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 0
; saving arguments for call
mov rdi, qword [const8]
call insert@func
add rsp,0
; saving arguments for call
mov rdi, qword [const9]
call insert@func
add rsp,0
; saving arguments for call
mov rdi, qword [const6]
call insert@func
add rsp,0
; saving arguments for call
mov rdi, qword [const10]
call insert@func
add rsp,0
; saving arguments for call
mov rdi, qword [const11]
call insert@func
add rsp,0
; saving arguments for call
mov rdi, qword [root@global]
call inorder_traversal@func
add rsp,0
leave
ret
