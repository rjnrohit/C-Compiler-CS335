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
const12 dq 1
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
sub rsp, 0
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 155
xor rax rax
leave
ret
label#0:
xor rax rax
leave
ret
label#1:
; saving arguments for call
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-147]
call insert
add rsp,0
label#2:
; saving arguments for call
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-171]
call insert
add rsp,0
label#3:
xor rax rax
leave
ret
global inorder
inorder:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 17
; saving arguments for call
mov rdi, qword [rbp-17]
call inorder
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-25]
call inorder
add rsp,0
label#4:
xor rax rax
leave
ret
global preorder
preorder:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 17
; saving arguments for call
mov rdi, qword [rbp-17]
call preorder
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-25]
call preorder
add rsp,0
label#5:
xor rax rax
leave
ret
global postorder
postorder:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 17
; saving arguments for call
mov rdi, qword [rbp-17]
call postorder
add rsp,0
; saving arguments for call
mov rdi, qword [rbp-25]
call postorder
add rsp,0
label#6:
xor rax rax
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0
;add space for symbols
sub rsp, 153
label#7:
; saving arguments for call
mov rsi, qword [rbp-153]
mov rdi, qword [rbp-137]
call insert
add rsp,0
label#8:
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
