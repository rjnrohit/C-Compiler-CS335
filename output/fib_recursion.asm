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
const1 dq 2
const2 db "%ld", NULL
const3 dq 0
const4 db "Enter a postive number",LF, NULL
const5 db "%ld",LF, NULL
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
global fibonacci@func
fibonacci@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 41
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
jle label#2
mov r10,0
jmp label#3
label#2:
mov r10,1
label#3:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#0
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const0]
sub r10, r11
mov qword[rbp-25], r10
push rax
; saving arguments for call
mov rdi, qword [rbp-25]
call fibonacci@func
;copy return value from rax
mov qword[rbp-33], rax
add rsp,0
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-41], r10
push rax
; saving arguments for call
mov rdi, qword [rbp-41]
call fibonacci@func
;copy return value from rax
mov qword[rbp-49], rax
add rsp,0
pop rax
mov r10, qword [rbp-33]
mov r11, qword [rbp-49]
add r10, r11
mov qword[rbp-57], r10
;copy return value in rax
mov rax , qword[rbp-57]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 82
mov r10d, dword[const2+0]
mov dword[rbp-28+0], r10d
lea r10, [rbp-16]
mov qword [rbp-24], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-24]
lea rdi, [rbp-28]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-36], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const3]
cmp r10, r11
jl label#4
mov r10,0
jmp label#5
label#4:
mov r10,1
label#5:
mov byte[rbp-37], r10b
mov r10b, byte [rbp-37]
cmp r10, 0
je label#1
mov r10, qword[const4+0]
mov qword[rbp-61+0], r10
mov r10, qword[const4+8]
mov qword[rbp-61+8], r10
mov r10, qword[const4+16]
mov qword[rbp-61+16], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-61]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-69], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const3]
leave
ret
label#1:
mov r10d, dword[const5+0]
mov dword[rbp-82+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-82+4], r10b
push rax
; saving arguments for call
mov rdi, qword [rbp-16]
call fibonacci@func
;copy return value from rax
mov qword[rbp-77], rax
add rsp,0
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-77]
lea rdi, [rbp-82]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-90], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const3]
leave
ret
