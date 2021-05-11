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
const0 dq 0
const1 dq 24
const2 dq 8
const3 dq 16
const4 db "%ld ", NULL
const5 db "Enter number to insert in BST (stop at -1)",LF, NULL
const6 db "%ld", NULL
const7 dq -1
const8 dq 1
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
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 178
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#10
mov r10,0
jmp label#11
label#10:
mov r10,1
label#11:
mov byte[rbp-25], r10b
mov r10b, byte [rbp-25]
cmp r10, 0
je label#0
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const1]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-33], rax
add rsp,8
pop rax
mov r10, qword [rbp-33]
mov qword[rbp-41], r10
mov r10, qword [rbp-41]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-49]
mov qword[r11], r10
mov r10, qword [rbp-49]
mov r11,qword [r10]
mov qword[rbp-57], r11
mov r10, qword [rbp-41]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-65], r10
mov r10, qword [const0]
mov r11, qword [rbp-65]
mov qword[r11], r10
mov r10, qword [rbp-65]
mov r11,qword [r10]
mov qword[rbp-73], r11
mov r10, qword [rbp-41]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-81], r10
mov r10, qword [const0]
mov r11, qword [rbp-81]
mov qword[r11], r10
mov r10, qword [rbp-81]
mov r11,qword [r10]
mov qword[rbp-89], r11
;copy return value in rax
mov rax , qword[rbp-41]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-97], r10
mov r10, qword [rbp-97]
mov r11,qword [r10]
mov qword[rbp-105], r11
mov r10, qword [rbp-105]
mov r11, qword [rbp-24]
cmp r10, r11
jg label#12
mov r10,0
jmp label#13
label#12:
mov r10,1
label#13:
mov byte[rbp-106], r10b
mov r10b, byte [rbp-106]
cmp r10, 0
je label#1
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-114], r10
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-122], r10
mov r10, qword [rbp-122]
mov r11,qword [r10]
mov qword[rbp-130], r11
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-130]
call insert@func
;copy return value from rax
mov qword[rbp-138], rax
add rsp,0
mov r10, qword [rbp-138]
mov r11, qword [rbp-114]
mov qword[r11], r10
mov r10, qword [rbp-114]
mov r11,qword [r10]
mov qword[rbp-146], r11
jmp label#2
label#1:
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-154], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-162], r10
mov r10, qword [rbp-162]
mov r11,qword [r10]
mov qword[rbp-170], r11
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-170]
call insert@func
;copy return value from rax
mov qword[rbp-178], rax
add rsp,0
mov r10, qword [rbp-178]
mov r11, qword [rbp-154]
mov qword[r11], r10
mov r10, qword [rbp-154]
mov r11,qword [r10]
mov qword[rbp-186], r11
label#2:
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
global inorder@func
inorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 70
mov r10, qword [rbp-8]
mov r11, qword [const0]
cmp r10, r11
je label#14
mov r10,0
jmp label#15
label#14:
mov r10,1
label#15:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#3
xor rax, rax
leave
ret
label#3:
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
; saving arguments for call
mov rdi, qword [rbp-25]
call inorder@func
add rsp,0
mov r10d, dword[const4+0]
mov dword[rbp-46+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-46+4], r10b
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
lea rdi, [rbp-46]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-54], rax
add rsp,8
pop rax
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-62], r10
mov r10, qword [rbp-62]
mov r11,qword [r10]
mov qword[rbp-70], r11
; saving arguments for call
mov rdi, qword [rbp-70]
call inorder@func
add rsp,0
leave
ret
global preorder@func
preorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 70
mov r10, qword [rbp-8]
mov r11, qword [const0]
cmp r10, r11
je label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#4
xor rax, rax
leave
ret
label#4:
mov r10d, dword[const4+0]
mov dword[rbp-30+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-30+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-25]
lea rdi, [rbp-30]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-38], rax
add rsp,8
pop rax
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-46], r10
mov r10, qword [rbp-46]
mov r11,qword [r10]
mov qword[rbp-54], r11
; saving arguments for call
mov rdi, qword [rbp-54]
call inorder@func
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-62], r10
mov r10, qword [rbp-62]
mov r11,qword [r10]
mov qword[rbp-70], r11
; saving arguments for call
mov rdi, qword [rbp-70]
call inorder@func
add rsp,0
leave
ret
global postorder@func
postorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 70
mov r10, qword [rbp-8]
mov r11, qword [const0]
cmp r10, r11
je label#18
mov r10,0
jmp label#19
label#18:
mov r10,1
label#19:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#5
xor rax, rax
leave
ret
label#5:
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
; saving arguments for call
mov rdi, qword [rbp-25]
call inorder@func
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov r11,qword [r10]
mov qword[rbp-41], r11
; saving arguments for call
mov rdi, qword [rbp-41]
call inorder@func
add rsp,0
mov r10d, dword[const4+0]
mov dword[rbp-62+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-62+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-49]
mov r11,qword [r10]
mov qword[rbp-57], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-57]
lea rdi, [rbp-62]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-70], rax
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
sub rsp, 97
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword[const5+0]
mov qword[rbp-60+0], r10
mov r10, qword[const5+8]
mov qword[rbp-60+8], r10
mov r10, qword[const5+16]
mov qword[rbp-60+16], r10
mov r10, qword[const5+24]
mov qword[rbp-60+24], r10
mov r10, qword[const5+32]
mov qword[rbp-60+32], r10
mov r10d, dword[const5+40]
mov dword[rbp-60+40], r10d
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-60]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-68], rax
add rsp,8
pop rax
label#6:
mov r10d, dword[const6+0]
mov dword[rbp-88+0], r10d
lea r10, [rbp-76]
mov qword [rbp-84], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-84]
lea rdi, [rbp-88]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-96], rax
add rsp,8
pop rax
mov r10, qword [rbp-76]
mov r11, qword [const7]
cmp r10, r11
je label#20
mov r10,0
jmp label#21
label#20:
mov r10,1
label#21:
mov byte[rbp-97], r10b
mov r10b, byte [rbp-97]
cmp r10, 0
je label#7
jmp label#9
label#7:
; saving arguments for call
mov rsi, qword [rbp-76]
mov rdi, qword [rbp-16]
call insert@func
;copy return value from rax
mov qword[rbp-105], rax
add rsp,0
mov r10, qword [rbp-105]
mov qword[rbp-16], r10
label#8:
mov r10, qword [const8]
cmp r10, 0
jne label#6
label#9:
; saving arguments for call
mov rdi, qword [rbp-16]
call inorder@func
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-16]
call preorder@func
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-16]
call postorder@func
add rsp,0
leave
ret
