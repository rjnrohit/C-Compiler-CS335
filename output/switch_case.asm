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
const1 dq 1
const2 dq 8
const3 dq 99
const4 dq 16
const5 dq 3
const6 dq 24
const7 dq 9
const8 dd 3.1
const9 dq 4
const10 db "test%ld",LF, NULL
const11 db "case 1: checking break",LF, NULL
const12 db "case 2: checking expression in case",LF, NULL
const13 db "case 3: checking variable in case and type cast",LF, NULL
const14 db "case 4: checking without break case",LF, NULL
const15 db "default",LF, NULL
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
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 214
lea r10, [rbp-32]
mov qword [rbp-40], r10
mov r10, qword [rbp-40]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-48], r10
mov r10, qword [const1]
mov r11, qword [rbp-48]
mov qword[r11], r10
mov r10, qword [rbp-48]
mov r11,qword [r10]
mov qword[rbp-56], r11
lea r10, [rbp-32]
mov qword [rbp-64], r10
mov r10, qword [rbp-64]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-72], r10
mov r10, qword [const3]
mov r11, qword [rbp-72]
mov qword[r11], r10
mov r10, qword [rbp-72]
mov r11,qword [r10]
mov qword[rbp-80], r11
lea r10, [rbp-32]
mov qword [rbp-88], r10
mov r10, qword [rbp-88]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [const5]
mov r11, qword [rbp-96]
mov qword[r11], r10
mov r10, qword [rbp-96]
mov r11,qword [r10]
mov qword[rbp-104], r11
lea r10, [rbp-32]
mov qword [rbp-112], r10
mov r10, qword [rbp-112]
mov r11, qword [const6]
add r10, r11
mov qword[rbp-120], r10
mov r10, qword [const7]
mov r11, qword [rbp-120]
mov qword[r11], r10
mov r10, qword [rbp-120]
mov r11,qword [r10]
mov qword[rbp-128], r11
mov r10, qword [const0]
mov qword[rbp-136], r10
movss xmm0, dword [const8]
movss dword[rbp-140], xmm0
label#0:
mov r10, qword [rbp-136]
mov r11, qword [const9]
cmp r10, r11
jl label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-141], r10b
mov r10b, byte [rbp-141]
cmp r10, 0
je label#6
mov r10, qword[const10+0]
mov qword[rbp-158+0], r10
mov r10b, byte[const10+8]
mov byte[rbp-158+8], r10b
mov r10, qword [rbp-136]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-149], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-149]
lea rdi, [rbp-158]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-166], rax
add rsp,8
pop rax
lea r10, [rbp-32]
mov qword [rbp-174], r10
mov r10, qword [rbp-136]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-182], r10
mov r10, qword [rbp-174]
mov r11, qword [rbp-182]
add r10, r11
mov qword[rbp-190], r10
mov r10, qword [rbp-190]
mov r11,qword [r10]
mov qword[rbp-198], r11
mov r10, qword [rbp-198]
mov r11, qword [const1]
cmp r10, r11
jne label#1
mov r10, qword[const11+0]
mov qword[rbp-222+0], r10
mov r10, qword[const11+8]
mov qword[rbp-222+8], r10
mov r10, qword[const11+16]
mov qword[rbp-222+16], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-222]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-230], rax
add rsp,8
pop rax
jmp label#5
label#1:
mov r10, qword [rbp-198]
mov r11, qword [const3]
cmp r10, r11
jne label#2
mov r10, qword[const12+0]
mov qword[rbp-267+0], r10
mov r10, qword[const12+8]
mov qword[rbp-267+8], r10
mov r10, qword[const12+16]
mov qword[rbp-267+16], r10
mov r10, qword[const12+24]
mov qword[rbp-267+24], r10
mov r10d, dword[const12+32]
mov dword[rbp-267+32], r10d
mov r10b, byte[const12+36]
mov byte[rbp-267+36], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-267]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-275], rax
add rsp,8
pop rax
label#2:
movss xmm0, dword [rbp-140]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-206], r10
mov r10, qword [rbp-198]
mov r11, qword [rbp-206]
cmp r10, r11
jne label#3
mov r10, qword[const13+0]
mov qword[rbp-324+0], r10
mov r10, qword[const13+8]
mov qword[rbp-324+8], r10
mov r10, qword[const13+16]
mov qword[rbp-324+16], r10
mov r10, qword[const13+24]
mov qword[rbp-324+24], r10
mov r10, qword[const13+32]
mov qword[rbp-324+32], r10
mov r10, qword[const13+40]
mov qword[rbp-324+40], r10
mov r10b, byte[const13+48]
mov byte[rbp-324+48], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-324]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-332], rax
add rsp,8
pop rax
jmp label#5
label#3:
mov r10, qword [rbp-198]
mov r11, qword [const3]
cmp r10, r11
jne label#4
mov r10, qword[const14+0]
mov qword[rbp-369+0], r10
mov r10, qword[const14+8]
mov qword[rbp-369+8], r10
mov r10, qword[const14+16]
mov qword[rbp-369+16], r10
mov r10, qword[const14+24]
mov qword[rbp-369+24], r10
mov r10d, dword[const14+32]
mov dword[rbp-369+32], r10d
mov r10b, byte[const14+36]
mov byte[rbp-369+36], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-369]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-377], rax
add rsp,8
pop rax
label#4:
mov r10, qword[const15+0]
mov qword[rbp-386+0], r10
mov r10b, byte[const15+8]
mov byte[rbp-386+8], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-386]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-394], rax
add rsp,8
pop rax
label#5:
mov r10, qword [rbp-136]
mov qword[rbp-214], r10
mov r10, qword [rbp-136]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-222], r10
mov r10, qword [rbp-222]
mov qword[rbp-136], r10
jmp label#0
label#6:
leave
ret
