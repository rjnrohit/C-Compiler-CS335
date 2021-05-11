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
const2 dq 0
const3 dq 1
const4 dd -10.0
const5 dd 0.001
const6 dq 100
const7 db "%f",LF, NULL
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
sub rsp, 41
mov r10, qword [const2]
mov qword[rbp-28], r10
label#0:
mov r10, qword [rbp-28]
mov r11, qword [rbp-20]
cmp r10, r11
jl label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-29], r10b
mov r10b, byte [rbp-29]
cmp r10, 0
je label#2
label#1:
mov r10, qword [rbp-28]
mov qword[rbp-37], r10
mov r10, qword [rbp-28]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-45], r10
mov r10, qword [rbp-45]
mov qword[rbp-28], r10
jmp label#0
label#2:
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
sub rsp, 40
movss xmm0, dword [const0]
movss dword[rbp-12], xmm0
divss xmm0, xmm1
movss dword[rbp-16], xmm0
movss xmm0, dword [rbp-16]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-24], r10
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10d, dword[const7+0]
mov dword[rbp-40+0], r10d
; saving arguments for call
mov rdi, qword [const6]
movss xmm1, dword [const5]
movss xmm0, dword [const4]
call newton_raphson@func
;copy return value from xmm0
movss dword[rbp-36], xmm0
add rsp,0
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-36]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-40]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-48], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const2]
leave
ret
