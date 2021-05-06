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
d@global dq 99
cc@global db "this is pointer test", NULL
const0 db "char", NULL
const1 dq 9
const2 dq 4
const3 dq 103
const4 dq 1
const5 dq 0
const6 db "hello", NULL
const7 dq 5
section .bss
c@global resq 1
p@global resq 1
ptr3@global resq 1
b@global resb 1
str@global resb 48
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
global a
a:
push   rbp
mov    rbp,rsp
sub rsp, 8
mov qword [rsp],rdi
mov rax , qword[rbp-24]
leave
ret
global g
g:
push   rbp
mov    rbp,rsp
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
mov rdi, qword [const4]
call func
add rsp,0
mov rsi, qword [const7]
mov rdi, qword [rbp-142]
call printf
add rsp,0
mov rax , qword[rbp-167]
leave
ret
