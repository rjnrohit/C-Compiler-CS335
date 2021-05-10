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
const1 dq 10
const2 dq 1
const3 dq 88
const4 dq 8
const5 dq 32
const6 db "%ld",LF, NULL
const7 dq 40
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
sub rsp, 331
mov r10, qword [const0]
mov qword[rbp-184], r10
label#0:
mov r10, qword [rbp-184]
mov r11, qword [const1]
cmp r10, r11
jl label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-185], r10b
mov r10b, byte [rbp-185]
cmp r10, 0
je label#2
lea r10, [rbp-176]
mov qword [rbp-201], r10
mov r10, qword [rbp-201]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-209], r10
mov r10, qword [rbp-184]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-217], r10
mov r10, qword [rbp-209]
mov r11, qword [rbp-217]
add r10, r11
mov qword[rbp-225], r10
mov r10, qword [rbp-184]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-233], r10
lea r10, [rbp-88]
mov qword [rbp-241], r10
mov r10, qword [rbp-241]
mov r11, qword [rbp-233]
add r10, r11
mov qword[rbp-249], r10
mov r10, qword [rbp-249]
mov qword[rbp-257], r10
mov r10, qword [rbp-225]
mov qword[rbp-265], r10
label#1:
mov r10, qword [rbp-184]
mov qword[rbp-193], r10
mov r10, qword [rbp-184]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-184], r10
jmp label#0
label#2:
mov r10d, dword[const6+0]
mov dword[rbp-294+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-294+4], r10b
lea r10, [rbp-88]
mov qword [rbp-273], r10
mov r10, qword [rbp-273]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-281], r10
mov r10, qword [rbp-281]
mov qword[rbp-289], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-289]
lea rdi, [rbp-294]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-302], rax
add rsp,8
pop rax
mov r10d, dword[const6+0]
mov dword[rbp-331+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-331+4], r10b
lea r10, [rbp-88]
mov qword [rbp-310], r10
mov r10, qword [rbp-310]
mov r11, qword [const7]
add r10, r11
mov qword[rbp-318], r10
mov r10, qword [rbp-318]
mov qword[rbp-326], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-326]
lea rdi, [rbp-331]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-339], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const0]
leave
ret
