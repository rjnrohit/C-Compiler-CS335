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
const0 dq 32
const1 dq 36
const2 db "%ld",LF, NULL
const3 dq 0
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
sub rsp, 141
lea r10, [rbp-88]
mov qword [rbp-96], r10
mov r10, qword [rbp-96]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-104], r10
mov r10, qword [const1]
mov r11, qword [rbp-104]
mov qword[r11], r10
mov r10, qword [rbp-104]
mov r11,qword [r10]
mov qword[rbp-112], r11
mov r10d, dword[const2+0]
mov dword[rbp-141+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-141+4], r10b
lea r10, [rbp-88]
mov qword [rbp-120], r10
mov r10, qword [rbp-120]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-128], r10
mov r10, qword [rbp-128]
mov r11,qword [r10]
mov qword[rbp-136], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-136]
lea rdi, [rbp-141]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-149], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const3]
leave
ret
