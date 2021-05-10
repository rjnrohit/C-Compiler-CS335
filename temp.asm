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
const0 dq 16
const1 dq 1
const2 dd 1.0
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
sub rsp, 116
lea r10, [rbp-40]
mov qword [rbp-48], r10
mov r10, qword [rbp-48]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-56], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-72], r11
mov r10, qword [rbp-72]
mov qword[rbp-64], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-80], r11
mov r10, qword [rbp-80]
mov qword[rbp-88], r10
mov r10, qword [rbp-88]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [rbp-96]
mov qword[rbp-104], r10
mov r10, qword [rbp-104]
mov r11, qword [rbp-56]
mov qword[r11], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-112], r11
movss xmm0, dword [rbp-116]
movss dword[rbp-120], xmm0
movss xmm0, dword [rbp-116]
movss xmm1, dword [const2]
addss xmm0, xmm1
movss dword[rbp-124], xmm0
movss xmm0, dword [rbp-124]
movss dword[rbp-116], xmm0
leave
ret
