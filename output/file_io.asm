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
const0 db "temp1.txt", NULL
const1 db "w", NULL
const2 db "temp2.txt", NULL
const3 db "r", NULL
const4 db "error",LF, NULL
const5 dq 1
const6 dq -1
const7 db "%ld", NULL
const8 db "sc: %ld",LF, NULL
const9 db "enter a string to write in temp2.txt", NULL
const10 db "%s",LF, NULL
const11 dq 0
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
sub rsp, 406
mov r10, qword[const0+0]
mov qword[rbp-18+0], r10
mov r10w, word[const0+8]
mov word[rbp-18+8], r10w
mov r10w, word[const1+0]
mov word[rbp-20+0], r10w
;preparing extern function fopen
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-20]
lea rdi, [rbp-18]
xor rax, rax
call fopen
;copy return value from rax
mov qword[rbp-28], rax
add rsp,8
pop rax
mov r10, qword [rbp-28]
mov qword[rbp-36], r10
mov r10, qword[const2+0]
mov qword[rbp-46+0], r10
mov r10w, word[const2+8]
mov word[rbp-46+8], r10w
mov r10w, word[const3+0]
mov word[rbp-48+0], r10w
;preparing extern function fopen
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-48]
lea rdi, [rbp-46]
xor rax, rax
call fopen
;copy return value from rax
mov qword[rbp-56], rax
add rsp,8
pop rax
mov r10, qword [rbp-56]
mov qword[rbp-64], r10
mov r10, qword [rbp-36]
cmp r10, 0
je label#2
mov r10,0
jmp label#3
label#2:
mov r10,1
label#3:
mov byte[rbp-65], r10b
mov r10b, byte [rbp-65]
cmp r10, 0
je label#0
mov r10d, dword[const4+0]
mov dword[rbp-72+0], r10d
mov r10w, word[const4+4]
mov word[rbp-72+4], r10w
mov r10b, byte[const4+6]
mov byte[rbp-72+6], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const5]
lea rdi, [rbp-72]
xor rax, rax
call printf
add rsp,8
pop rax
;preparing extern function exit
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const6]
xor rax, rax
call exit
;copy return value from rax
mov qword[rbp-80], rax
add rsp,8
pop rax
label#0:
mov r10, qword [rbp-64]
cmp r10, 0
je label#4
mov r10,0
jmp label#5
label#4:
mov r10,1
label#5:
mov byte[rbp-81], r10b
mov r10b, byte [rbp-81]
cmp r10, 0
je label#1
mov r10d, dword[const4+0]
mov dword[rbp-88+0], r10d
mov r10w, word[const4+4]
mov word[rbp-88+4], r10w
mov r10b, byte[const4+6]
mov byte[rbp-88+6], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const5]
lea rdi, [rbp-88]
xor rax, rax
call printf
add rsp,8
pop rax
;preparing extern function exit
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const6]
xor rax, rax
call exit
;copy return value from rax
mov qword[rbp-96], rax
add rsp,8
pop rax
label#1:
mov r10d, dword[const7+0]
mov dword[rbp-116+0], r10d
lea r10, [rbp-104]
mov qword [rbp-112], r10
;preparing extern function fscanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-112]
lea rsi, [rbp-116]
mov rdi, qword [rbp-64]
xor rax, rax
call fscanf
;copy return value from rax
mov qword[rbp-124], rax
add rsp,8
pop rax
mov r10, qword[const8+0]
mov qword[rbp-133+0], r10
mov r10b, byte[const8+8]
mov byte[rbp-133+8], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-104]
lea rdi, [rbp-133]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword[const9+0]
mov qword[rbp-370+0], r10
mov r10, qword[const9+8]
mov qword[rbp-370+8], r10
mov r10, qword[const9+16]
mov qword[rbp-370+16], r10
mov r10, qword[const9+24]
mov qword[rbp-370+24], r10
mov r10d, dword[const9+32]
mov dword[rbp-370+32], r10d
mov r10b, byte[const9+36]
mov byte[rbp-370+36], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-370]
xor rax, rax
call puts
add rsp,8
pop rax
lea r10, [rbp-333]
mov qword [rbp-378], r10
;preparing extern function gets
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-378]
xor rax, rax
call gets
add rsp,8
pop rax
mov r10d, dword[const10+0]
mov dword[rbp-390+0], r10d
lea r10, [rbp-333]
mov qword [rbp-386], r10
;preparing extern function fprintf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-386]
lea rsi, [rbp-390]
mov rdi, qword [rbp-36]
xor rax, rax
call fprintf
;copy return value from rax
mov qword[rbp-398], rax
add rsp,8
pop rax
;preparing extern function fclose
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-36]
xor rax, rax
call fclose
;copy return value from rax
mov qword[rbp-406], rax
add rsp,8
pop rax
;preparing extern function fclose
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-64]
xor rax, rax
call fclose
;copy return value from rax
mov qword[rbp-414], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const11]
leave
ret
