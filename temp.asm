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
const1 dq 29
const2 db "%ld",LF, NULL
const3 dq 6
const4 dd 33.0
const5 db "%f",LF, NULL
const6 dq 0
const7 dq 200
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
sub rsp, 93
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
mov qword[rbp-16], r10
mov r10d, dword[const2+0]
mov dword[rbp-34+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-34+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-34]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-42], rax
add rsp,8
pop rax
movss xmm0, dword [const4]
movss dword[rbp-46], xmm0
mov r10d, dword[const5+0]
mov dword[rbp-50+0], r10d
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-46]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-50]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-58], rax
add rsp,8
pop rax
mov r10, qword [const0]
mov byte[rbp-59], r10b
mov r10d, dword[const2+0]
mov dword[rbp-64+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-64+4], r10b
mov r10b, byte [rbp-59]
movsx r10,r10b
mov qword[rbp-72], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-72]
lea rdi, [rbp-64]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-80], rax
add rsp,8
pop rax
mov r10, qword [const7]
mov qword[rbp-88], r10
mov r10d, dword[const2+0]
mov dword[rbp-93+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-93+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-88]
lea rdi, [rbp-93]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-101], rax
add rsp,8
pop rax
leave
ret
