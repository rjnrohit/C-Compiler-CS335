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
a@global dq 8
const0 db "global: %ld",LF, NULL
const1 dq 1
const2 dq 29
const3 db "local: %ld",LF, NULL
const4 db "global using scope resolution: %ld",LF, NULL
const5 dq 6
const6 db "%ld",LF, NULL
const7 dd 33.0
const8 db "%f",LF, NULL
const9 dq 200
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
sub rsp, 165
mov r10, qword[const0+0]
mov qword[rbp-21+0], r10
mov r10d, dword[const0+8]
mov dword[rbp-21+8], r10d
mov r10b, byte[const0+12]
mov byte[rbp-21+12], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [a@global]
lea rdi, [rbp-21]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-29], rax
add rsp,8
pop rax
mov r10, qword [const2]
mov qword[rbp-37], r10
mov r10, qword[const3+0]
mov qword[rbp-49+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-49+8], r10d
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-37]
lea rdi, [rbp-49]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-57], rax
add rsp,8
pop rax
mov r10, qword[const4+0]
mov qword[rbp-93+0], r10
mov r10, qword[const4+8]
mov qword[rbp-93+8], r10
mov r10, qword[const4+16]
mov qword[rbp-93+16], r10
mov r10, qword[const4+24]
mov qword[rbp-93+24], r10
mov r10d, dword[const4+32]
mov dword[rbp-93+32], r10d
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [a@global]
lea rdi, [rbp-93]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-101], rax
add rsp,8
pop rax
mov r10, qword [const5]
mov qword[rbp-37], r10
mov r10d, dword[const6+0]
mov dword[rbp-106+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-106+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-37]
lea rdi, [rbp-106]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-114], rax
add rsp,8
pop rax
movss xmm0, dword [const7]
movss dword[rbp-118], xmm0
mov r10d, dword[const8+0]
mov dword[rbp-122+0], r10d
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-118]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-122]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-130], rax
add rsp,8
pop rax
mov r10, qword [const1]
mov byte[rbp-131], r10b
mov r10d, dword[const6+0]
mov dword[rbp-136+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-136+4], r10b
mov r10b, byte [rbp-131]
movsx r10,r10b
mov qword[rbp-144], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-144]
lea rdi, [rbp-136]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-152], rax
add rsp,8
pop rax
mov r10, qword [const9]
mov qword[rbp-160], r10
mov r10d, dword[const6+0]
mov dword[rbp-165+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-165+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-160]
lea rdi, [rbp-165]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-173], rax
add rsp,8
pop rax
leave
ret
