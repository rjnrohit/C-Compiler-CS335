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
const1 dq 8
const2 dq 24
const3 dq 16
const4 dq 6
const5 dq 12
const6 dq 11
const7 dq 13
const8 dq 5
const9 dq 32
const10 dq 40
const11 dq 7
const12 db "stringconst", NULL
const13 dq 1
;add bss section for unintialized variables
section .bss
;add extern symbols
extern printf
extern scanf
extern malloc
section .text
global _start
_start:
mov r12,  [rsp]
lea r13, [rsp+8]
mov rdi, r12
mov rsi, r13
call main
end:
mov rax, SYS_exit ; Call code for exit
mov rdi, EXIT_SUCCESS ; Exit program with success
syscall
global insert
insert:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 155
mov r10, qword [rbp-8]
mov qword[rbp-24], r10
mov r10b, byte [rbp-25]
cmp r10, 0
jne label#0
mov r10, qword [rbp-8]
mov qword[rbp-41], r10
mov r10, qword [rbp-33]
mov qword[rbp-41], r10
mov r10, qword [rbp-8]
mov qword[rbp-49], r10
mov r10, qword [rbp-49]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-57], r10
mov r10, qword [rbp-57]
mov qword[rbp-57], r10
mov r10, qword [const0]
mov qword[rbp-57], r10
mov r10, qword [rbp-8]
mov qword[rbp-65], r10
mov r10, qword [rbp-65]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-73], r10
mov r10, qword [rbp-73]
mov qword[rbp-73], r10
mov r10, qword [const0]
mov qword[rbp-73], r10
mov r10, qword [rbp-8]
mov qword[rbp-81], r10
mov r10, qword [rbp-81]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-89], r10
mov r10, qword [rbp-89]
mov qword[rbp-89], r10
mov r10, qword [rbp-16]
mov qword[rbp-89], r10
xor rax, rax
leave
ret
jmp label#3
label#0:
mov r10, qword [rbp-8]
mov qword[rbp-97], r10
mov r10, qword [rbp-97]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-105], r10
mov r10, qword [rbp-105]
mov qword[rbp-105], r10
mov r10b, byte [rbp-106]
cmp r10, 0
jne label#1
xor rax, rax
leave
ret
label#1:
mov r10, qword [rbp-8]
mov qword[rbp-114], r10
mov r10, qword [rbp-114]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-122], r10
mov r10, qword [rbp-122]
mov qword[rbp-122], r10
mov r10b, byte [rbp-123]
cmp r10, 0
jne label#2
mov r10, qword [rbp-8]
mov qword[rbp-131], r10
mov r10, qword [rbp-131]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-139], r10
mov r10, qword [rbp-139]
mov qword[rbp-139], r10
lea r10, [rbp-139]
mov qword [rbp-147], r10
; saving arguments for call
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-147]
call insert
add rsp,0
jmp label#3
label#2:
mov r10, qword [rbp-8]
mov qword[rbp-155], r10
mov r10, qword [rbp-155]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-163], r10
mov r10, qword [rbp-163]
mov qword[rbp-163], r10
lea r10, [rbp-163]
mov qword [rbp-171], r10
; saving arguments for call
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-171]
call insert
add rsp,0
label#3:
xor rax, rax
leave
ret
global inorder
inorder:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 17
mov r10b, byte [rbp-9]
cmp r10, 0
jne label#4
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov qword[rbp-17], r10
; saving arguments for call
mov rdi, qword [rbp-17]
call inorder
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-25], r10
mov r10, qword [rbp-25]
mov qword[rbp-25], r10
; saving arguments for call
mov rdi, qword [rbp-25]
call inorder
add rsp,0
label#4:
xor rax, rax
leave
ret
global preorder
preorder:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 17
mov r10b, byte [rbp-9]
cmp r10, 0
jne label#5
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov qword[rbp-17], r10
; saving arguments for call
mov rdi, qword [rbp-17]
call preorder
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-25], r10
mov r10, qword [rbp-25]
mov qword[rbp-25], r10
; saving arguments for call
mov rdi, qword [rbp-25]
call preorder
add rsp,0
label#5:
xor rax, rax
leave
ret
global postorder
postorder:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 17
mov r10b, byte [rbp-9]
cmp r10, 0
jne label#6
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov qword[rbp-17], r10
; saving arguments for call
mov rdi, qword [rbp-17]
call postorder
add rsp,0
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-25], r10
mov r10, qword [rbp-25]
mov qword[rbp-25], r10
; saving arguments for call
mov rdi, qword [rbp-25]
call postorder
add rsp,0
label#6:
xor rax, rax
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
;add space for symbols
sub rsp, 229
mov r10, qword [const4]
mov qword[rbp-16], r10
lea r10, [rbp-64]
mov qword [rbp-72], r10
mov r10, qword [rbp-72]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-80], r10
mov r10, qword [const5]
mov qword[rbp-80], r10
lea r10, [rbp-64]
mov qword [rbp-88], r10
mov r10, qword [rbp-88]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [const6]
mov qword[rbp-96], r10
lea r10, [rbp-64]
mov qword [rbp-104], r10
mov r10, qword [rbp-104]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-112], r10
mov r10, qword [const7]
mov qword[rbp-112], r10
lea r10, [rbp-64]
mov qword [rbp-120], r10
mov r10, qword [rbp-120]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-128], r10
mov r10, qword [const8]
mov qword[rbp-128], r10
lea r10, [rbp-64]
mov qword [rbp-136], r10
mov r10, qword [rbp-136]
mov r11, qword [const9]
add r10, r11
mov qword[rbp-144], r10
mov r10, qword [const4]
mov qword[rbp-144], r10
lea r10, [rbp-64]
mov qword [rbp-152], r10
mov r10, qword [rbp-152]
mov r11, qword [const10]
add r10, r11
mov qword[rbp-160], r10
mov r10, qword [const11]
mov qword[rbp-160], r10
mov r10, qword[const12+0]
mov qword[rbp-180+0], r10
mov r10d, dword[const12+8]
mov dword[rbp-180+8], r10d
mov r10, qword [const0]
mov qword[rbp-8], r10
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-188], r10
mov r10, qword [rbp-188]
mov qword[rbp-188], r10
mov r10, qword [const0]
mov qword[rbp-188], r10
mov r10, qword [const0]
mov qword[rbp-24], r10
label#7:
mov r10b, byte [rbp-189]
cmp r10, 0
jne label#9
lea r10, [rbp-8]
mov qword [rbp-205], r10
mov r10, qword [rbp-24]
mov r11, qword [const1]
imul r10, r11
mov qword[rbp-213], r10
lea r10, [rbp-64]
mov qword [rbp-221], r10
mov r10, qword [rbp-221]
mov r11, qword [rbp-213]
add r10, r11
mov qword[rbp-229], r10
; saving arguments for call
mov rsi, qword [rbp-229]
mov rdi, qword [rbp-205]
call insert
add rsp,0
label#8:
mov r10, qword [rbp-24]
mov r11, qword [const13]
add r10, r11
mov qword[rbp-24], r10
jmp label#7
label#9:
; saving arguments for call
mov rdi, qword [rbp-8]
call inorder
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-8]
call preorder
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-8]
call postorder
add rsp,0
leave
ret
