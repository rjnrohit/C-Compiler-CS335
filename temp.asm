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
const0 dd 2.0
const1 dd 3.0
const2 db "%f",LF, NULL
const3 dq 0
const4 dq 1
const5 dq 10
const6 db "%f %f %f %f",LF, NULL
const7 dd -20.0
const8 dd 0.001
const9 dq 100
const10 db "root: %f",LF, NULL
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
global func@func
func@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 4; adjust rsp for return entry
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 24
movss xmm0, dword [rbp-8]
movss xmm1, dword [rbp-8]
mulss xmm0, xmm1
movss dword[rbp-12], xmm0
movss xmm0, dword [rbp-12]
movss xmm1, dword [rbp-8]
mulss xmm0, xmm1
movss dword[rbp-16], xmm0
movss xmm0, dword [rbp-8]
movss xmm1, dword [rbp-8]
mulss xmm0, xmm1
movss dword[rbp-20], xmm0
movss xmm0, dword [rbp-16]
movss xmm1, dword [rbp-20]
subss xmm0, xmm1
movss dword[rbp-24], xmm0
movss xmm0, dword [rbp-24]
movss xmm1, dword [const0]
addss xmm0, xmm1
movss dword[rbp-28], xmm0
;copy return value in xmm0
movss xmm0, dword[rbp-28]
leave
ret
global deriv@func
deriv@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 4; adjust rsp for return entry
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 20
movss xmm0, dword [const1]
movss xmm1, dword [rbp-8]
mulss xmm0, xmm1
movss dword[rbp-12], xmm0
movss xmm0, dword [rbp-12]
movss xmm1, dword [rbp-8]
mulss xmm0, xmm1
movss dword[rbp-16], xmm0
movss xmm0, dword [const0]
movss xmm1, dword [rbp-8]
mulss xmm0, xmm1
movss dword[rbp-20], xmm0
movss xmm0, dword [rbp-16]
movss xmm1, dword [rbp-20]
subss xmm0, xmm1
movss dword[rbp-24], xmm0
;copy return value in xmm0
movss xmm0, dword[rbp-24]
leave
ret
global newton_raphson@func
newton_raphson@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 4; adjust rsp for return entry
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 146
mov r10d, dword[const2+0]
mov dword[rbp-32+0], r10d
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-32]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-40], rax
add rsp,8
pop rax
mov r10d, dword[const2+0]
mov dword[rbp-48+0], r10d
movss xmm0, dword [rbp-12]
subss xmm1, xmm1
subss xmm1, xmm0
movss dword[rbp-44], xmm1
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-44]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-48]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-56], rax
add rsp,8
pop rax
mov r10, qword [const3]
mov qword[rbp-28], r10
label#0:
mov r10, qword [rbp-28]
mov r11, qword [rbp-20]
cmp r10, r11
jl label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-57], r10b
mov r10b, byte [rbp-57]
cmp r10, 0
je label#6
; saving arguments for call
movss xmm0, dword [rbp-8]
call func@func
;copy return value from xmm0
movss dword[rbp-77], xmm0
add rsp,0
; saving arguments for call
movss xmm0, dword [rbp-8]
call deriv@func
;copy return value from xmm0
movss dword[rbp-81], xmm0
add rsp,0
divss xmm0, xmm1
movss dword[rbp-85], xmm0
movss xmm0, dword [rbp-85]
movss dword[rbp-89], xmm0
; saving arguments for call
movss xmm0, dword [rbp-8]
call func@func
;copy return value from xmm0
movss dword[rbp-93], xmm0
add rsp,0
movss xmm0, dword [rbp-93]
movss dword[rbp-97], xmm0
; saving arguments for call
movss xmm0, dword [rbp-8]
call deriv@func
;copy return value from xmm0
movss dword[rbp-101], xmm0
add rsp,0
movss xmm0, dword [rbp-101]
movss dword[rbp-105], xmm0
mov r10, qword [rbp-28]
mov r11, qword [const5]
cmp r10, r11
jl label#9
mov r10,0
jmp label#10
label#9:
mov r10,1
label#10:
mov byte[rbp-106], r10b
mov r10b, byte [rbp-106]
cmp r10, 0
je label#1
mov r10, qword[const6+0]
mov qword[rbp-131+0], r10
mov r10d, dword[const6+8]
mov dword[rbp-131+8], r10d
mov r10b, byte[const6+12]
mov byte[rbp-131+12], r10b
; saving arguments for call
movss xmm0, dword [rbp-8]
call func@func
;copy return value from xmm0
movss dword[rbp-110], xmm0
add rsp,0
; saving arguments for call
movss xmm0, dword [rbp-8]
call deriv@func
;copy return value from xmm0
movss dword[rbp-114], xmm0
add rsp,0
divss xmm0, xmm1
movss dword[rbp-118], xmm0
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm3, dword [rbp-118]
cvtss2sd xmm3,xmm3
movss xmm2, dword [rbp-89]
cvtss2sd xmm2,xmm2
movss xmm1, dword [rbp-114]
cvtss2sd xmm1,xmm1
movss xmm0, dword [rbp-110]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-131]
mov rax, 4
call printf
;copy return value from rax
mov qword[rbp-139], rax
add rsp,8
pop rax
label#1:
movss xmm0, dword [rbp-89]
movss xmm1, dword [rbp-12]
ucomiss xmm0, xmm1
jb label#11
mov r10,0
jmp label#12
label#11:
mov r10,1
label#12:
mov byte[rbp-140], r10b
mov r10b, byte [rbp-140]
cmp r10, 0
je label#2
movss xmm0, dword [rbp-12]
subss xmm1, xmm1
subss xmm1, xmm0
movss dword[rbp-144], xmm1
movss xmm0, dword [rbp-89]
movss xmm1, dword [rbp-144]
ucomiss xmm0, xmm1
ja label#13
mov r10,0
jmp label#14
label#13:
mov r10,1
label#14:
mov byte[rbp-145], r10b
mov r10b, byte [rbp-145]
cmp r10, 0
je label#2
mov r10, qword [const4]
mov byte[rbp-146], r10b
jmp label#3
label#2:
mov r10, qword [const3]
mov byte[rbp-146], r10b
label#3:
mov r10b, byte [rbp-146]
cmp r10, 0
je label#4
;copy return value in xmm0
movss xmm0, dword[rbp-8]
leave
ret
label#4:
movss xmm0, dword [rbp-8]
movss xmm1, dword [rbp-89]
subss xmm0, xmm1
movss dword[rbp-150], xmm0
movss xmm0, dword [rbp-150]
movss dword[rbp-8], xmm0
label#5:
mov r10, qword [rbp-28]
mov qword[rbp-65], r10
mov r10, qword [rbp-28]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-73], r10
mov r10, qword [rbp-73]
mov qword[rbp-28], r10
jmp label#0
label#6:
;copy return value in xmm0
movss xmm0, dword[rbp-8]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 26
movss xmm0, dword [const0]
movss dword[rbp-12], xmm0
mov r10, qword[const10+0]
mov qword[rbp-26+0], r10
mov r10w, word[const10+8]
mov word[rbp-26+8], r10w
; saving arguments for call
mov rdi, qword [const9]
movss xmm1, dword [const8]
movss xmm0, dword [const7]
call newton_raphson@func
;copy return value from xmm0
movss dword[rbp-16], xmm0
add rsp,0
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-16]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-26]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-34], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const3]
leave
ret
