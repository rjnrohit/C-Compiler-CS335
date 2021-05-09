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
const0 dq 0
const1 db "%ld", NULL
const2 db "Enter a positive number",LF, NULL
const3 db "%ld",LF, NULL
const4 dq 1
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
section .text
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 60
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10d, dword[const1+0]
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
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const0]
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
je label#0
mov r10, qword[const2+0]
mov qword[rbp-54+0], r10
mov r10, qword[const2+8]
mov qword[rbp-54+8], r10
mov r10, qword[const2+16]
mov qword[rbp-54+16], r10
mov r10b, byte[const2+24]
mov byte[rbp-54+24], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const0]
lea rdi, [rbp-54]
xor rax, rax
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const0]
leave
ret
label#0:
mov r10d, dword[const3+0]
mov dword[rbp-60+0], r10d
mov r10b, byte[const3+4]
mov byte[rbp-60+4], r10b
; saving arguments for call
mov rdi, qword [rbp-16]
call is_odd
;copy return value from rax
mov byte[rbp-55], al
add rsp,0
mov r10b, byte [rbp-55]
mov qword[rbp-68], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-68]
lea rdi, [rbp-60]
xor rax, rax
call printf
add rsp,8
pop rax
leave
ret
global is_odd
is_odd:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 1; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 10
mov r10, qword [rbp-9]
mov r11, qword [const0]
cmp r10, r11
je label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-10], r10b
mov r10b, byte [rbp-10]
cmp r10, 0
je label#1
;copy return value in rax
mov al , byte[const0]
leave
ret
label#1:
mov r10, qword [rbp-9]
mov r11, qword [const4]
sub r10, r11
mov qword[rbp-18], r10
; saving arguments for call
mov rdi, qword [rbp-18]
call is_even
;copy return value from rax
mov byte[rbp-19], al
add rsp,0
;copy return value in rax
mov al , byte[rbp-19]
leave
ret
global is_even
is_even:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 1; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 10
mov r10, qword [rbp-9]
mov r11, qword [const0]
cmp r10, r11
je label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-10], r10b
mov r10b, byte [rbp-10]
cmp r10, 0
je label#2
;copy return value in rax
mov al , byte[const4]
leave
ret
label#2:
mov r10, qword [rbp-9]
mov r11, qword [const4]
sub r10, r11
mov qword[rbp-18], r10
; saving arguments for call
mov rdi, qword [rbp-18]
call is_odd
;copy return value from rax
mov byte[rbp-19], al
add rsp,0
;copy return value in rax
mov al , byte[rbp-19]
leave
ret
