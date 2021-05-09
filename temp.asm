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
const0 dq 1
const1 dq 2
const2 db "3123", NULL
const3 db "%ld",LF, NULL
const4 dq 0
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
section .text
global fib
fib:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 41
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
jle label#1
mov r10,0
jmp label#2
label#1:
mov r10,1
label#2:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#0
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const0]
sub r10, r11
mov qword[rbp-25], r10
; saving arguments for call
mov rdi, qword [rbp-25]
call fib
;copy return value from rax
mov qword[rbp-33], rax
add rsp,0
mov r10, qword [rbp-16]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-41], r10
; saving arguments for call
mov rdi, qword [rbp-41]
call fib
;copy return value from rax
mov qword[rbp-49], rax
add rsp,0
mov r10, qword [rbp-33]
mov r11, qword [rbp-49]
add r10, r11
mov qword[rbp-57], r10
;copy return value in rax
mov rax , qword[rbp-57]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 30
mov r10d, dword[const2+0]
mov dword[rbp-13+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-13+4], r10b
;preparing extern function atol
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-13]
xor rax, rax
call atol
;copy return value from rax
mov qword[rbp-21], rax
add rsp,8
pop rax
mov r10, qword [rbp-21]
mov qword[rbp-29], r10
mov r10d, dword[const3+0]
mov dword[rbp-34+0], r10d
mov r10b, byte[const3+4]
mov byte[rbp-34+4], r10b
mov r10, qword [rbp-29]
cvtsi2ss xmm0,r10d
movss dword[rbp-38], xmm0
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-38]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-34]
mov rax, 1
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const4]
leave
ret
