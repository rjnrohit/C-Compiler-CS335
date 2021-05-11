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
const1 db "%ld",LF, NULL
const2 dq 24
const3 dq 8
const4 dq 16
const5 db "%ld ", NULL
const6 dq 3
const7 dq 1
const8 db "Enter number to insert in BST (stop at -1)",LF, NULL
const9 db "%ld", NULL
const10 dq -1
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
sub rsp, 204
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#13
mov r10,0
jmp label#14
label#13:
mov r10,1
label#14:
mov byte[rbp-25], r10b
mov r10b, byte [rbp-25]
cmp r10, 0
je label#0
mov r10d, dword[const1+0]
mov dword[rbp-30+0], r10d
mov r10b, byte[const1+4]
mov byte[rbp-30+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const2]
lea rdi, [rbp-30]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-38], rax
add rsp,8
pop rax
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const2]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-46], rax
add rsp,8
pop rax
mov r10, qword [rbp-46]
mov qword[rbp-54], r10
mov r10d, dword[const1+0]
mov dword[rbp-59+0], r10d
mov r10b, byte[const1+4]
mov byte[rbp-59+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const2]
lea rdi, [rbp-59]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-67], rax
add rsp,8
pop rax
mov r10, qword [rbp-54]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-75], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-75]
mov qword[r11], r10
mov r10, qword [rbp-75]
mov r11,qword [r10]
mov qword[rbp-83], r11
mov r10, qword [rbp-54]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-91], r10
mov r10, qword [const0]
mov r11, qword [rbp-91]
mov qword[r11], r10
mov r10, qword [rbp-91]
mov r11,qword [r10]
mov qword[rbp-99], r11
mov r10, qword [rbp-54]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-107], r10
mov r10, qword [const0]
mov r11, qword [rbp-107]
mov qword[r11], r10
mov r10, qword [rbp-107]
mov r11,qword [r10]
mov qword[rbp-115], r11
;copy return value in rax
mov rax , qword[rbp-54]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-123], r10
mov r10, qword [rbp-123]
mov r11,qword [r10]
mov qword[rbp-131], r11
mov r10, qword [rbp-131]
mov r11, qword [rbp-24]
cmp r10, r11
jg label#15
mov r10,0
jmp label#16
label#15:
mov r10,1
label#16:
mov byte[rbp-132], r10b
mov r10b, byte [rbp-132]
cmp r10, 0
je label#1
mov r10, qword [rbp-16]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-140], r10
mov r10, qword [rbp-16]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-148], r10
mov r10, qword [rbp-148]
mov r11,qword [r10]
mov qword[rbp-156], r11
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-156]
call insert@func
;copy return value from rax
mov qword[rbp-164], rax
add rsp,0
mov r10, qword [rbp-164]
mov r11, qword [rbp-140]
mov qword[r11], r10
mov r10, qword [rbp-140]
mov r11,qword [r10]
mov qword[rbp-172], r11
jmp label#2
label#1:
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-180], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-188], r10
mov r10, qword [rbp-188]
mov r11,qword [r10]
mov qword[rbp-196], r11
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-196]
call insert@func
;copy return value from rax
mov qword[rbp-204], rax
add rsp,0
mov r10, qword [rbp-204]
mov r11, qword [rbp-180]
mov qword[r11], r10
mov r10, qword [rbp-180]
mov r11,qword [r10]
mov qword[rbp-212], r11
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
je label#17
mov r10,0
jmp label#18
label#17:
mov r10,1
label#18:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#3
xor rax, rax
leave
ret
label#3:
mov r10, qword [rbp-8]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
; saving arguments for call
mov rdi, qword [rbp-25]
call inorder@func
add rsp,0
mov r10d, dword[const5+0]
mov dword[rbp-46+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-46+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const3]
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
mov r11, qword [const2]
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
je label#19
mov r10,0
jmp label#20
label#19:
mov r10,1
label#20:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#4
xor rax, rax
leave
ret
label#4:
mov r10d, dword[const5+0]
mov dword[rbp-30+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-30+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const3]
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
mov r11, qword [const4]
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
mov r11, qword [const2]
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
je label#21
mov r10,0
jmp label#22
label#21:
mov r10,1
label#22:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#5
xor rax, rax
leave
ret
label#5:
mov r10, qword [rbp-8]
mov r11, qword [const4]
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
mov r11, qword [const2]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov r11,qword [r10]
mov qword[rbp-41], r11
; saving arguments for call
mov rdi, qword [rbp-41]
call inorder@func
add rsp,0
mov r10d, dword[const5+0]
mov dword[rbp-62+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-62+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const3]
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
global foo@func
foo@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 25
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#23
mov r10,0
jmp label#24
label#23:
mov r10,1
label#24:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#6
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const2]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-25], rax
add rsp,8
pop rax
mov r10, qword [rbp-25]
mov qword[rbp-33], r10
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
sub rsp, 142
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword [const6]
mov qword[rbp-24], r10
label#7:
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10, qword [rbp-24]
mov r11, qword [const7]
sub r10, r11
mov qword[rbp-40], r10
mov r10, qword [rbp-40]
mov qword[rbp-24], r10
mov r10, qword [rbp-32]
cmp r10, 0
je label#8
; saving arguments for call
mov rdi, qword [rbp-16]
call foo@func
;copy return value from rax
mov qword[rbp-48], rax
add rsp,0
mov r10, qword [rbp-48]
mov qword[rbp-16], r10
jmp label#7
label#8:
mov r10, qword[const8+0]
mov qword[rbp-92+0], r10
mov r10, qword[const8+8]
mov qword[rbp-92+8], r10
mov r10, qword[const8+16]
mov qword[rbp-92+16], r10
mov r10, qword[const8+24]
mov qword[rbp-92+24], r10
mov r10, qword[const8+32]
mov qword[rbp-92+32], r10
mov r10d, dword[const8+40]
mov dword[rbp-92+40], r10d
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-92]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-100], rax
add rsp,8
pop rax
label#9:
mov r10d, dword[const9+0]
mov dword[rbp-120+0], r10d
lea r10, [rbp-108]
mov qword [rbp-116], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-116]
lea rdi, [rbp-120]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-128], rax
add rsp,8
pop rax
mov r10, qword [rbp-108]
mov r11, qword [const10]
cmp r10, r11
je label#25
mov r10,0
jmp label#26
label#25:
mov r10,1
label#26:
mov byte[rbp-129], r10b
mov r10b, byte [rbp-129]
cmp r10, 0
je label#10
jmp label#12
label#10:
; saving arguments for call
mov rsi, qword [rbp-108]
mov rdi, qword [rbp-16]
call insert@func
;copy return value from rax
mov qword[rbp-137], rax
add rsp,0
mov r10, qword [rbp-137]
mov qword[rbp-16], r10
label#11:
mov r10, qword [const7]
cmp r10, 0
jne label#9
label#12:
mov r10d, dword[const1+0]
mov dword[rbp-142+0], r10d
mov r10b, byte[const1+4]
mov byte[rbp-142+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-142]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-150], rax
add rsp,8
pop rax
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
