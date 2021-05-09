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
a@global db "%ld ",LF, NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
const0 dq 45
const1 dq 567
const2 dq 56
const3 dq 345435
const4 dq 97
const5 dd 3.456
const6 db "%ld ",LF, NULL
const7 dq 0
const8 db "bhosdiwala dimag kaharb kar diya printf ne",LF, NULL
const9 dq 3
const10 dq 20
const11 dq 2
const12 dd 3.4
const13 dd 3.0
const14 dq 1
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
sub rsp, 4; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 32
mov r10, qword [rbp-12]
cvtsi2ss xmm0,r10d
movss dword[rbp-20], xmm0
movss xmm0, dword [rbp-20]
movss xmm1, dword [rbp-16]
addss xmm0, xmm1
movss dword[rbp-24], xmm0
movss xmm0, dword [rbp-24]
cvtss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-32], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-32]
lea rdi, [a@global]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-40], rax
add rsp,8
pop rax
mov r10, qword [rbp-12]
cvtsi2ss xmm0,r10d
movss dword[rbp-44], xmm0
movss xmm0, dword [rbp-44]
movss xmm1, dword [rbp-16]
addss xmm0, xmm1
movss dword[rbp-48], xmm0
;copy return value in xmm0
movss xmm0, dword[rbp-48]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 221
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
mov r10, qword [const7]
mov qword[rbp-63], r10
lea r10, [rbp-63]
mov qword [rbp-71], r10
mov r10, qword [rbp-71]
mov qword[rbp-79], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-79]
lea rdi, [rbp-55]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-87], rax
add rsp,8
pop rax
lea r10, [rbp-63]
mov qword [rbp-95], r10
mov r10, qword [rbp-95]
mov qword[rbp-103], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-103]
lea rdi, [rbp-55]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-111], rax
add rsp,8
pop rax
lea r10, [rbp-63]
mov qword [rbp-119], r10
mov r10, qword [rbp-119]
mov qword[rbp-127], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-127]
lea rdi, [rbp-55]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-135], rax
add rsp,8
pop rax
lea r10, [rbp-63]
mov qword [rbp-143], r10
mov r10, qword [rbp-143]
mov qword[rbp-151], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-151]
lea rdi, [rbp-55]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-159], rax
add rsp,8
pop rax
mov r10, qword[const8+0]
mov qword[rbp-203+0], r10
mov r10, qword[const8+8]
mov qword[rbp-203+8], r10
mov r10, qword[const8+16]
mov qword[rbp-203+16], r10
mov r10, qword[const8+24]
mov qword[rbp-203+24], r10
mov r10, qword[const8+32]
mov qword[rbp-203+32], r10
mov r10d, dword[const8+40]
mov dword[rbp-203+40], r10d
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const9]
lea rdi, [rbp-203]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-211], rax
add rsp,8
pop rax
label#0:
mov r10, qword [rbp-63]
mov r11, qword [const10]
cmp r10, r11
jl label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-212], r10b
mov r10b, byte [rbp-212]
cmp r10, 0
je label#2
push rax
mov rax, qword[rbp-63]
cqo
idiv qword[const11]
mov qword[rbp-220], rdx
pop rax
mov r10, qword [rbp-220]
mov r11, qword [const7]
cmp r10, r11
je label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-221], r10b
mov r10b, byte [rbp-221]
cmp r10, 0
je label#1
mov r10d, dword[const6+0]
mov dword[rbp-227+0], r10d
mov r10w, word[const6+4]
mov word[rbp-227+4], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-63]
lea rdi, [rbp-227]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-235], rax
add rsp,8
pop rax
movss xmm0, dword [const12]
movss dword[rbp-239], xmm0
; saving arguments for call
movss xmm0, dword [const13]
mov rdi, qword [const11]
call foo
;copy return value from xmm0
movss dword[rbp-243], xmm0
add rsp,0
movss xmm0, dword [rbp-243]
cvtss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-251], r10
mov r10, qword [rbp-251]
mov qword[rbp-259], r10
mov r10, qword [const14]
mov qword[rbp-259], r10
mov r10, qword [const9]
mov qword[rbp-259], r10
mov r10, qword [const9]
mov qword[rbp-267], r10
; saving arguments for call
movss xmm0, dword [rbp-239]
mov rdi, qword [const11]
call foo
;copy return value from xmm0
movss dword[rbp-271], xmm0
add rsp,0
movss xmm0, dword [rbp-271]
cvtss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-279], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-279]
lea rdi, [rbp-55]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-287], rax
add rsp,8
pop rax
label#1:
mov r10, qword [rbp-63]
mov qword[rbp-295], r10
mov r10, qword [rbp-63]
mov r11, qword [const14]
add r10, r11
mov qword[rbp-63], r10
jmp label#0
label#2:
;copy return value in rax
mov rax , qword[const7]
leave
ret
