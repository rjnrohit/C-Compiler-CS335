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
const0 dq 5
const1 dq 3
const2 dq 4
const3 dq 8
const4 db "%ld",LF, NULL
const5 dq 1
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
sub rsp, 222
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword [const1]
mov qword[rbp-24], r10
mov r10, qword [const2]
mov qword[rbp-32], r10
mov r10, qword [const3]
mov qword[rbp-40], r10
mov r10d, dword[const4+0]
mov dword[rbp-61+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-61+4], r10b
mov r10, qword [rbp-16]
xor r11,r11
sub r11, r10
mov qword[rbp-48], r11
mov r10, qword [rbp-48]
mov r11, qword [rbp-24]
sub r10, r11
mov qword[rbp-56], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-56]
lea rdi, [rbp-61]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-69], rax
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-90+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-90+4], r10b
mov r10, qword [rbp-24]
mov r11, qword [rbp-32]
imul r10, r11
mov qword[rbp-77], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-77]
add r10, r11
mov qword[rbp-85], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-85]
lea rdi, [rbp-90]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-98], rax
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-119+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-119+4], r10b
push rax
mov rax, qword[rbp-40]
cqo
idiv qword[rbp-32]
mov qword[rbp-106], rax
pop rax
mov r10, qword [rbp-106]
mov r11, qword [rbp-16]
imul r10, r11
mov qword[rbp-114], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-114]
lea rdi, [rbp-119]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-127], rax
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-172+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-172+4], r10b
mov r10, qword [rbp-24]
mov r11, qword [rbp-24]
imul r10, r11
mov qword[rbp-135], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-135]
add r10, r11
mov qword[rbp-143], r10
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[rbp-24]
mov qword[rbp-151], rax
pop rax
push rax
mov rax, qword[rbp-151]
cqo
idiv qword[rbp-16]
mov qword[rbp-159], rdx
pop rax
mov r10, qword [rbp-143]
mov r11, qword [rbp-159]
sub r10, r11
mov qword[rbp-167], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-167]
lea rdi, [rbp-172]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-180], rax
add rsp,8
pop rax
mov r10, qword [const5]
mov qword[rbp-16], r10
mov r10d, dword[const4+0]
mov dword[rbp-201+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-201+4], r10b
mov r10, qword [rbp-16]
mov qword[rbp-188], r10
mov r10, qword [rbp-16]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-196], r10
mov r10, qword [rbp-196]
mov qword[rbp-16], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-188]
lea rdi, [rbp-201]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-209], rax
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-222+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-222+4], r10b
mov r10, qword [rbp-16]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-217], r10
mov r10, qword [rbp-217]
mov qword[rbp-16], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-222]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-230], rax
add rsp,8
pop rax
leave
ret
