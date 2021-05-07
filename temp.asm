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
b@global dq 64
a@global db "abc", NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
const0 dq 3
const1 dq 4
const2 dq 46
const3 dq 1
const4 dd 3.1
const5 dq 0
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
global foo
foo:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 4; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 8
movss xmm0, dword [rbp-20]
movss xmm1, dword [rbp-16]
addss xmm0, xmm1
movss dword[rbp-24], xmm0
;copy return value in xmm0
movss xmm0, dword[rbp-24]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 108
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword [const1]
mov qword[rbp-24], r10
push rax
mov rax, qword[rbp-24]
cqo
idiv qword[rbp-16]
mov qword[rbp-32], rax
pop rax
mov r10, qword [rbp-32]
mov qword[rbp-40], r10
mov r10, qword [const2]
mov qword[rbp-48], r10
mov r10, qword [rbp-48]
not r11
mov qword[rbp-56], r11
mov r10, qword [rbp-56]
mov qword[rbp-64], r10
mov r10, qword [rbp-64]
mov r11, qword [const3]
mov cl,r11b
shl r10, cl
mov qword[rbp-72], r10
mov r10, qword [rbp-72]
mov qword[rbp-80], r10
label#0:
mov r10, qword [rbp-48]
mov qword[rbp-88], r10
mov r10, qword [rbp-48]
mov r11, qword [const3]
sub r10, r11
mov qword[rbp-48], r10
mov r10, qword [rbp-88]
cmp r10, 0
je label#1
mov r10, qword [rbp-16]
mov r11, qword [rbp-40]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [rbp-96]
mov qword[rbp-16], r10
jmp label#0
label#1:
; saving arguments for call
movss xmm0, dword [const4]
mov rdi, qword [rbp-16]
call foo
;copy return value from xmm0
movss dword[rbp-100], xmm0
add rsp,0
mov r10, qword [rbp-108]
mov qword[rbp-116], r10
;copy return value in rax
mov rax , qword[const5]
leave
ret
