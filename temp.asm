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
a@global db "%ld ",LF, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
const0 dq 45
const1 dq 567
const2 dq 56
const3 dq 345435
const4 dq 97
const5 dd 3.456
const6 db "%ld ",LF, NULL
const7 dq 0
const8 dq 20
const9 dq 2
const10 dd 3.4
const11 dd 3.0
const12 dq 1
;add bss section for unintialized variables
section .bss
;add extern symbols
extern printf
extern scanf
extern malloc
extern sqrt
extern strlen
extern exit
section .text
global foo
foo:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 40
mov r10, qword [rbp-16]
cvtsi2ss xmm0,r10d
movss dword[rbp-24], xmm0
movss xmm0, dword [rbp-24]
movss xmm1, dword [rbp-20]
addss xmm0, xmm1
movss dword[rbp-28], xmm0
movss xmm0, dword [rbp-28]
cvtss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-36], r10
;preparing extern function printf
; saving arguments for call
and spl, 0xf0
push rax
mov rsi, qword [rbp-36]
lea rdi, [a@global]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-44], rax
add rsp,0
pop rax
mov r10, qword [rbp-16]
cvtsi2ss xmm0,r10d
movss dword[rbp-48], xmm0
movss xmm0, dword [rbp-48]
movss xmm1, dword [rbp-20]
addss xmm0, xmm1
movss dword[rbp-52], xmm0
movss xmm0, dword [rbp-52]
cvtss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-60], r10
;copy return value in rax
mov rax , qword[rbp-60]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 73
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword [const1]
mov qword[rbp-24], r10
mov r10, qword [const2]
mov qword[rbp-32], r10
mov r10, qword [const3]
mov qword[rbp-40], r10
mov r10, qword [const4]
mov byte[rbp-41], r10b
movss xmm0, dword [const5]
movss dword[rbp-45], xmm0
mov r10d, dword[const6+0]
mov dword[rbp-55+0], r10d
mov r10w, word[const6+4]
mov word[rbp-55+4], r10w
mov r10b, byte[const6+6]
mov byte[rbp-55+6], r10b
mov r10, qword [const7]
mov qword[rbp-63], r10
label#0:
mov r10, qword [rbp-63]
mov r11, qword [const8]
cmp r10, r11
jl label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-64], r10b
mov r10b, byte [rbp-64]
cmp r10, 0
je label#2
push rax
mov rax, qword[rbp-63]
cqo
idiv qword[const9]
mov qword[rbp-72], rdx
pop rax
mov r10, qword [rbp-72]
mov r11, qword [const7]
cmp r10, r11
je label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-73], r10b
mov r10b, byte [rbp-73]
cmp r10, 0
je label#1
movss xmm0, dword [const10]
movss dword[rbp-77], xmm0
; saving arguments for call
movss xmm0, dword [const11]
mov rdi, qword [const9]
call foo
;copy return value from rax
mov qword[rbp-85], rax
add rsp,0
mov r10, qword [rbp-85]
mov qword[rbp-93], r10
mov r10, qword [const12]
mov qword[rbp-93], r10
;preparing extern function printf
; saving arguments for call
and spl, 0xf0
push rax
mov rsi, qword [rbp-93]
lea rdi, [rbp-55]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-101], rax
add rsp,0
pop rax
label#1:
mov r10, qword [rbp-63]
mov qword[rbp-109], r10
mov r10, qword [rbp-63]
mov r11, qword [const12]
add r10, r11
mov qword[rbp-63], r10
jmp label#0
label#2:
;copy return value in rax
mov rax , qword[const7]
leave
ret
