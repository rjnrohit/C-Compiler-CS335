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
const0 dd 10.8
const1 dq 21
const2 db "%ld",LF, NULL
const3 dq 69
const4 dd 3.1
const5 dq 65
const6 db "%f",LF, NULL
const7 dq 90
const8 db "%c",LF, NULL
const9 dd 24.0
const10 dq 1
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
section .text
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 233
mov r10, qword [const1]
mov qword[rbp-16], r10
mov r10d, dword[const2+0]
mov dword[rbp-21+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-21+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-21]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-29], rax
add rsp,8
pop rax
mov r10, qword [const3]
mov qword[rbp-37], r10
movss xmm0, dword [const4]
movss dword[rbp-41], xmm0
mov r10d, dword[const6+0]
mov dword[rbp-69+0], r10d
mov r10, qword [rbp-37]
mov r11, qword [const5]
sub r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-49]
cvtsi2ss xmm0,r10d
movss dword[rbp-53], xmm0
movss xmm0, dword [rbp-41]
movss xmm1, dword [rbp-53]
mulss xmm0, xmm1
movss dword[rbp-57], xmm0
mov r10, qword [rbp-16]
cvtsi2ss xmm0,r10d
movss dword[rbp-61], xmm0
movss xmm0, dword [rbp-57]
movss xmm1, dword [rbp-61]
addss xmm0, xmm1
movss dword[rbp-65], xmm0
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-65]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-69]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-77], rax
add rsp,8
pop rax
mov r10d, dword[const2+0]
mov dword[rbp-106+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-106+4], r10b
mov r10, qword [rbp-37]
mov r11, qword [const5]
sub r10, r11
mov qword[rbp-85], r10
mov r10, qword [rbp-85]
cvtsi2ss xmm0,r10d
movss dword[rbp-89], xmm0
movss xmm0, dword [rbp-41]
movss xmm1, dword [rbp-89]
mulss xmm0, xmm1
movss dword[rbp-93], xmm0
mov r10, qword [rbp-16]
cvtsi2ss xmm0,r10d
movss dword[rbp-97], xmm0
movss xmm0, dword [rbp-93]
movss xmm1, dword [rbp-97]
addss xmm0, xmm1
movss dword[rbp-101], xmm0
movss xmm0, dword [rbp-101]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-114], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-114]
lea rdi, [rbp-106]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-122], rax
add rsp,8
pop rax
mov r10d, dword[const6+0]
mov dword[rbp-158+0], r10d
mov r10, qword [rbp-37]
mov r11, qword [const5]
sub r10, r11
mov qword[rbp-130], r10
mov r10, qword [rbp-130]
cvtsi2ss xmm0,r10d
movss dword[rbp-134], xmm0
movss xmm0, dword [rbp-134]
movss xmm1, dword [rbp-41]
mulss xmm0, xmm1
movss dword[rbp-138], xmm0
mov r10, qword [rbp-16]
cvtsi2ss xmm0,r10d
movss dword[rbp-142], xmm0
movss xmm0, dword [rbp-138]
movss xmm1, dword [rbp-142]
addss xmm0, xmm1
movss dword[rbp-146], xmm0
movss xmm0, dword [rbp-146]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-154], r10
mov r10, qword [rbp-154]
cvtsi2ss xmm0,r10d
movss dword[rbp-162], xmm0
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-162]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-158]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-170], rax
add rsp,8
pop rax
mov r10, qword [const7]
mov byte[rbp-171], r10b
mov r10d, dword[const8+0]
mov dword[rbp-175+0], r10d
mov r10b, byte [rbp-171]
mov qword[rbp-183], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-183]
lea rdi, [rbp-175]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-191], rax
add rsp,8
pop rax
mov r10d, dword[const8+0]
mov dword[rbp-203+0], r10d
mov r10b, byte [rbp-171]
cvtsi2ss xmm0,r10d
movss dword[rbp-195], xmm0
movss xmm0, dword [rbp-195]
movss xmm1, dword [const9]
subss xmm0, xmm1
movss dword[rbp-199], xmm0
movss xmm0, dword [rbp-199]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-211], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-211]
lea rdi, [rbp-203]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-219], rax
add rsp,8
pop rax
mov r10, qword [const10]
mov byte[rbp-220], r10b
mov r10d, dword[const2+0]
mov dword[rbp-225+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-225+4], r10b
mov r10b, byte [rbp-220]
mov qword[rbp-233], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-233]
lea rdi, [rbp-225]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-241], rax
add rsp,8
pop rax
leave
ret
