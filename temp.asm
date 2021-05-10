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
const0 db "%ld",LF, NULL
const1 dq 1
const2 dq 2
const3 dq 3
const4 dq 4
const5 dq 5
const6 dq 6
const7 dq 7
const8 dq 8
const9 dq 9
const10 dq 10
const11 dq 11
const12 dd 11.7
const13 dq 0
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
global many_sum
many_sum:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
sub rsp, 8
mov qword [rsp],rdx
sub rsp, 8
mov qword [rsp],rcx
sub rsp, 8
mov qword [rsp],r8
sub rsp, 8
mov qword [rsp],r9
sub rsp, 8
mov r10, qword [rbp+16]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+24]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+32]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+40]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+48]
mov qword[rsp], r10
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 165
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
add r10, r11
mov qword[rbp-108], r10
mov r10, qword [rbp-108]
mov r11, qword [rbp-32]
add r10, r11
mov qword[rbp-116], r10
mov r10, qword [rbp-116]
mov r11, qword [rbp-40]
add r10, r11
mov qword[rbp-124], r10
mov r10, qword [rbp-124]
mov r11, qword [rbp-48]
add r10, r11
mov qword[rbp-132], r10
mov r10, qword [rbp-132]
mov r11, qword [rbp-56]
add r10, r11
mov qword[rbp-140], r10
mov r10, qword [rbp-140]
mov r11, qword [rbp-64]
add r10, r11
mov qword[rbp-148], r10
mov r10, qword [rbp-148]
mov r11, qword [rbp-72]
add r10, r11
mov qword[rbp-156], r10
mov r10, qword [rbp-156]
mov r11, qword [rbp-80]
add r10, r11
mov qword[rbp-164], r10
mov r10, qword [rbp-164]
mov r11, qword [rbp-88]
add r10, r11
mov qword[rbp-172], r10
mov r10, qword [rbp-172]
mov r11, qword [rbp-96]
add r10, r11
mov qword[rbp-180], r10
mov r10, qword [rbp-180]
cvtsi2ss xmm0,r10d
movss dword[rbp-184], xmm0
movss xmm0, dword [rbp-184]
movss xmm1, dword [rbp-100]
addss xmm0, xmm1
movss dword[rbp-188], xmm0
movss xmm0, dword [rbp-188]
movss dword[rbp-192], xmm0
mov r10d, dword[const0+0]
mov dword[rbp-205+0], r10d
mov r10b, byte[const0+4]
mov byte[rbp-205+4], r10b
movss xmm0, dword [rbp-192]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-200], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-200]
lea rdi, [rbp-205]
xor rax, rax
call printf
add rsp,8
pop rax
movss xmm0, dword [rbp-192]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-213], r10
;copy return value in rax
mov rax , qword[rbp-213]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 21
mov r10d, dword[const0+0]
mov dword[rbp-29+0], r10d
mov r10b, byte[const0+4]
mov byte[rbp-29+4], r10b
; saving arguments for call
movss xmm0, dword [const12]
sub rsp, 8
mov r10, qword [const11]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const10]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const9]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const8]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const7]
mov qword [rsp], r10
mov r9, qword [const6]
mov r8, qword [const5]
mov rcx, qword [const4]
mov rdx, qword [const3]
mov rsi, qword [const2]
mov rdi, qword [const1]
call many_sum
;copy return value from rax
mov qword[rbp-24], rax
add rsp,40
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-24]
lea rdi, [rbp-29]
xor rax, rax
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const13]
leave
ret
