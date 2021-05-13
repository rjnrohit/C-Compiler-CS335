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
const0 dq 24
const1 dq 0
const2 dq 8
const3 dq 16
const4 db "%ld ", NULL
const5 dq 1
const6 dq 2
const7 dq 3
const8 dq 4
const9 dq 5
const10 db "Preorder traversal of binary tree is ",LF, NULL
const11 db "",LF,"Inorder traversal of binary tree is ",LF, NULL
const12 db "",LF,"Postorder traversal of binary tree is ",LF, NULL
const13 db "",LF, NULL
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
global newNode@func
newNode@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 64
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
mov qword[rbp-24], rax
add rsp,8
pop rax
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10, qword [rbp-32]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-40], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-40]
mov qword[r11], r10
mov r10, qword [rbp-40]
mov r11,qword [r10]
mov qword[rbp-48], r11
mov r10, qword [rbp-32]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-56], r10
mov r10, qword [const1]
mov r11, qword [rbp-56]
mov qword[r11], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-64], r11
mov r10, qword [rbp-32]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-72], r10
mov r10, qword [const1]
mov r11, qword [rbp-72]
mov qword[r11], r10
mov r10, qword [rbp-72]
mov r11,qword [r10]
mov qword[rbp-80], r11
;copy return value in rax
mov rax , qword[rbp-32]
leave
ret
global printPostorder@func
printPostorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 54
mov r10, qword [rbp-8]
mov r11, qword [const1]
cmp r10, r11
je label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#0
xor rax, rax
leave
ret
label#0:
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
; saving arguments for call
mov rdi, qword [rbp-25]
call printPostorder@func
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov r11,qword [r10]
mov qword[rbp-41], r11
; saving arguments for call
mov rdi, qword [rbp-41]
call printPostorder@func
add rsp,0
mov r10d, dword[const4+0]
mov dword[rbp-62+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-62+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const1]
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
add rsp,8
pop rax
leave
ret
global printInorder@func
printInorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 54
mov r10, qword [rbp-8]
mov r11, qword [const1]
cmp r10, r11
je label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#1
xor rax, rax
leave
ret
label#1:
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
; saving arguments for call
mov rdi, qword [rbp-25]
call printInorder@func
add rsp,0
mov r10d, dword[const4+0]
mov dword[rbp-46+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-46+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const1]
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
add rsp,8
pop rax
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-54], r10
mov r10, qword [rbp-54]
mov r11,qword [r10]
mov qword[rbp-62], r11
; saving arguments for call
mov rdi, qword [rbp-62]
call printInorder@func
add rsp,0
leave
ret
global printPreorder@func
printPreorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 54
mov r10, qword [rbp-8]
mov r11, qword [const1]
cmp r10, r11
je label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#2
xor rax, rax
leave
ret
label#2:
mov r10d, dword[const4+0]
mov dword[rbp-30+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-30+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const1]
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
add rsp,8
pop rax
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-38], r10
mov r10, qword [rbp-38]
mov r11,qword [r10]
mov qword[rbp-46], r11
; saving arguments for call
mov rdi, qword [rbp-46]
call printPreorder@func
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-54], r10
mov r10, qword [rbp-54]
mov r11,qword [r10]
mov qword[rbp-62], r11
; saving arguments for call
mov rdi, qword [rbp-62]
call printPreorder@func
add rsp,0
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 265
; saving arguments for call
mov rdi, qword [const5]
call newNode@func
;copy return value from rax
mov qword[rbp-16], rax
add rsp,0
mov r10, qword [rbp-16]
mov qword[rbp-24], r10
mov r10, qword [rbp-24]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-32], r10
; saving arguments for call
mov rdi, qword [const6]
call newNode@func
;copy return value from rax
mov qword[rbp-40], rax
add rsp,0
mov r10, qword [rbp-40]
mov r11, qword [rbp-32]
mov qword[r11], r10
mov r10, qword [rbp-32]
mov r11,qword [r10]
mov qword[rbp-48], r11
mov r10, qword [rbp-24]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-56], r10
; saving arguments for call
mov rdi, qword [const7]
call newNode@func
;copy return value from rax
mov qword[rbp-64], rax
add rsp,0
mov r10, qword [rbp-64]
mov r11, qword [rbp-56]
mov qword[r11], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-72], r11
mov r10, qword [rbp-24]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-80], r10
mov r10, qword [rbp-80]
mov r11,qword [r10]
mov qword[rbp-88], r11
mov r10, qword [rbp-88]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-96], r10
; saving arguments for call
mov rdi, qword [const8]
call newNode@func
;copy return value from rax
mov qword[rbp-104], rax
add rsp,0
mov r10, qword [rbp-104]
mov r11, qword [rbp-96]
mov qword[r11], r10
mov r10, qword [rbp-96]
mov r11,qword [r10]
mov qword[rbp-112], r11
mov r10, qword [rbp-24]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-120], r10
mov r10, qword [rbp-120]
mov r11,qword [r10]
mov qword[rbp-128], r11
mov r10, qword [rbp-128]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-136], r10
; saving arguments for call
mov rdi, qword [const9]
call newNode@func
;copy return value from rax
mov qword[rbp-144], rax
add rsp,0
mov r10, qword [rbp-144]
mov r11, qword [rbp-136]
mov qword[r11], r10
mov r10, qword [rbp-136]
mov r11,qword [r10]
mov qword[rbp-152], r11
mov r10, qword[const10+0]
mov qword[rbp-191+0], r10
mov r10, qword[const10+8]
mov qword[rbp-191+8], r10
mov r10, qword[const10+16]
mov qword[rbp-191+16], r10
mov r10, qword[const10+24]
mov qword[rbp-191+24], r10
mov r10d, dword[const10+32]
mov dword[rbp-191+32], r10d
mov r10w, word[const10+36]
mov word[rbp-191+36], r10w
mov r10b, byte[const10+38]
mov byte[rbp-191+38], r10b
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-191]
xor rax, rax
call printf
add rsp,8
pop rax
; saving arguments for call
mov rdi, qword [rbp-24]
call printPreorder@func
add rsp,0
mov r10, qword[const11+0]
mov qword[rbp-230+0], r10
mov r10, qword[const11+8]
mov qword[rbp-230+8], r10
mov r10, qword[const11+16]
mov qword[rbp-230+16], r10
mov r10, qword[const11+24]
mov qword[rbp-230+24], r10
mov r10d, dword[const11+32]
mov dword[rbp-230+32], r10d
mov r10w, word[const11+36]
mov word[rbp-230+36], r10w
mov r10b, byte[const11+38]
mov byte[rbp-230+38], r10b
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-230]
xor rax, rax
call printf
add rsp,8
pop rax
; saving arguments for call
mov rdi, qword [rbp-24]
call printInorder@func
add rsp,0
mov r10, qword[const12+0]
mov qword[rbp-271+0], r10
mov r10, qword[const12+8]
mov qword[rbp-271+8], r10
mov r10, qword[const12+16]
mov qword[rbp-271+16], r10
mov r10, qword[const12+24]
mov qword[rbp-271+24], r10
mov r10, qword[const12+32]
mov qword[rbp-271+32], r10
mov r10b, byte[const12+40]
mov byte[rbp-271+40], r10b
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-271]
xor rax, rax
call printf
add rsp,8
pop rax
; saving arguments for call
mov rdi, qword [rbp-24]
call printPostorder@func
add rsp,0
mov r10w, word[const13+0]
mov word[rbp-273+0], r10w
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-273]
xor rax, rax
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const1]
leave
ret
