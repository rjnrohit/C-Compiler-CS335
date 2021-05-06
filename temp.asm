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
g@global dq 34
str@global db "string", NULL
b@global dq 0
c@global dq 0
def@global dq 1
const0 dq 0
const1 dd 1.1
const2 dq 8
const3 dq 5
const4 dq 16
const5 dq -1
const6 dd 1.0
const7 dd 2.0
;add bss section for unintialized variables
section .bss
gg@global resq 1
d@global resq 1
resq 1
a@global resq 20
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
global wow
wow:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdx
sub rsp, 8
mov qword [rsp],rcx
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 8
mov qword [rsp],r8
sub rsp, 4
movss dword [rsp],xmm2
sub rsp, 8
mov qword [rsp],r9
sub rsp, 4
movss dword [rsp],xmm3
sub rsp, 8
mov r10, qword [rbp+80]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+88]
mov qword[rsp], r10
sub rsp, 4
movss dword [rsp],xmm4
sub rsp, 4
movss dword [rsp],xmm5
sub rsp, 4
movss dword [rsp],xmm6
sub rsp, 4
movss dword [rsp],xmm7
sub rsp, 4
movss xmm0, dword [rbp+112]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+116]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+120]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+124]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+128]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+132]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+136]
movss dword [rsp], xmm0
;add space for symbols
sub rsp, 8
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
global foo
foo:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 16
;copy return value in rax
mov rax , qword[rbp-36]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 156
; saving arguments for call
lea rdi, [rbp-172]
movss xmm0, dword [rbp-120]
call foo
add rsp,0
;copy return value in rax
mov rax , qword[const0]
leave
ret
