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
const1 dq 24
const2 dq 8
const3 dq 16
const4 dq 3
const5 dq 4
const6 dq 5
const7 dq 2
const8 dq 69
const9 db "%ld %ld %ld",LF, NULL
const10 db "%ld %ld",LF, NULL
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
global insert
insert:
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
;add space for symbols
sub rsp, 137
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#1
mov r10,0
jmp label#2
label#1:
mov r10,1
label#2:
mov byte[rbp-33], r10b
mov r10b, byte [rbp-33]
cmp r10, 0
je label#0
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const1]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-41], rax
add rsp,8
pop rax
mov r10, qword [rbp-41]
mov qword[rbp-16], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-49]
mov qword[r11], r10
mov r10, qword [rbp-49]
mov r11,qword [r10]
mov qword[rbp-57], r11
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-65], r10
mov r10, qword [rbp-32]
mov r11, qword [rbp-65]
mov qword[r11], r10
mov r10, qword [rbp-65]
mov r11,qword [r10]
mov qword[rbp-73], r11
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-81], r10
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const1]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-89], rax
add rsp,8
pop rax
mov r10, qword [rbp-89]
mov r11, qword [rbp-81]
mov qword[r11], r10
mov r10, qword [rbp-81]
mov r11,qword [r10]
mov qword[rbp-97], r11
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-105], r10
mov r10, qword [rbp-105]
mov r11,qword [r10]
mov qword[rbp-113], r11
mov r10, qword [rbp-113]
mov qword[rbp-16], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-121], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-121]
mov qword[r11], r10
mov r10, qword [rbp-121]
mov r11,qword [r10]
mov qword[rbp-129], r11
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-137], r10
mov r10, qword [rbp-32]
mov r11, qword [rbp-137]
mov qword[r11], r10
mov r10, qword [rbp-137]
mov r11,qword [r10]
mov qword[rbp-145], r11
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
global s
s:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 24; adjust rsp for return entry
; copying data in stack of struct_Node
push qword [rbp+16+0]
push qword [rbp+16+8]
push qword [rbp+16+16]
;add space for symbols
sub rsp, 136
lea r10, [rbp-72]
mov qword [rbp-80], r10
mov r10, qword [rbp-80]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-88], r10
lea r10, [rbp-48]
mov qword [rbp-96], r10
mov r10, qword [rbp-96]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-104], r10
mov r10, qword [rbp-104]
mov r11,qword [r10]
mov qword[rbp-112], r11
mov r10, qword [rbp-112]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-120], r10
mov r10, qword [rbp-120]
mov r11, qword [rbp-88]
mov qword[r11], r10
mov r10, qword [rbp-88]
mov r11,qword [r10]
mov qword[rbp-128], r11
lea r10, [rbp-72]
mov qword [rbp-136], r10
mov r10, qword [rbp-136]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-144], r10
lea r10, [rbp-48]
mov qword [rbp-152], r10
mov r10, qword [rbp-152]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-160], r10
mov r10, qword [rbp-160]
mov r11,qword [r10]
mov qword[rbp-168], r11
mov r10, qword [rbp-168]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-176], r10
mov r10, qword [rbp-176]
mov r11, qword [rbp-144]
mov qword[r11], r10
mov r10, qword [rbp-144]
mov r11,qword [r10]
mov qword[rbp-184], r11
mov r10, qword[rbp-48+0]
mov qword[rbp-72+0], r10
mov r10, qword[rbp-48+8]
mov qword[rbp-72+8], r10
mov r10, qword[rbp-48+16]
mov qword[rbp-72+16], r10
;copy return value at addr in rax
mov r10, qword[rbp-72+0]
mov qword[rax+0], r10
mov r10, qword[rbp-72+8]
mov qword[rax+8], r10
mov r10, qword[rbp-72+16]
mov qword[rax+16], r10
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 238
mov r10, qword [const0]
mov qword[rbp-16], r10
; saving arguments for call
mov rdx, qword [const6]
mov rsi, qword [const5]
mov rdi, qword [rbp-16]
call insert
;copy return value from rax
mov qword[rbp-24], rax
add rsp,0
mov r10, qword [rbp-24]
mov qword[rbp-16], r10
; saving arguments for call
mov rdx, qword [const7]
mov rsi, qword [const4]
mov rdi, qword [rbp-16]
call insert
;copy return value from rax
mov qword[rbp-32], rax
add rsp,0
mov r10, qword [rbp-32]
mov qword[rbp-16], r10
lea r10, [rbp-56]
mov qword [rbp-64], r10
mov r10, qword [rbp-64]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-72], r10
mov r10, qword [const5]
mov r11, qword [rbp-72]
mov qword[r11], r10
mov r10, qword [rbp-72]
mov r11,qword [r10]
mov qword[rbp-80], r11
lea r10, [rbp-56]
mov qword [rbp-88], r10
mov r10, qword [rbp-88]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [const8]
mov r11, qword [rbp-96]
mov qword[r11], r10
mov r10, qword [rbp-96]
mov r11,qword [r10]
mov qword[rbp-104], r11
lea rsp, [rsp+24]
lea rax, [rsp]
; saving arguments for call
; copying data in stack of struct_Node
push qword [rbp-56+0]
push qword [rbp-56+8]
push qword [rbp-56+16]
call s
;copy return value from addr in rax
mov r10, qword[rax+0]
mov qword[rbp-128+0], r10
mov r10, qword[rax+8]
mov qword[rbp-128+8], r10
mov r10, qword[rax+16]
mov qword[rbp-128+16], r10
add rsp,48
mov r10, qword[rbp-128+0]
mov qword[rbp-56+0], r10
mov r10, qword[rbp-128+8]
mov qword[rbp-56+8], r10
mov r10, qword[rbp-128+16]
mov qword[rbp-56+16], r10
mov r10, qword[const9+0]
mov qword[rbp-173+0], r10
mov r10d, dword[const9+8]
mov dword[rbp-173+8], r10d
mov r10b, byte[const9+12]
mov byte[rbp-173+12], r10b
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-136], r10
mov r10, qword [rbp-136]
mov r11,qword [r10]
mov qword[rbp-144], r11
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-152], r10
mov r10, qword [rbp-152]
mov r11,qword [r10]
mov qword[rbp-160], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-160]
mov rdx, qword [rbp-144]
mov rsi, qword [const1]
lea rdi, [rbp-173]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-181], rax
add rsp,8
pop rax
mov r10, qword[const10+0]
mov qword[rbp-238+0], r10
mov r10b, byte[const10+8]
mov byte[rbp-238+8], r10b
lea r10, [rbp-56]
mov qword [rbp-189], r10
mov r10, qword [rbp-189]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-197], r10
mov r10, qword [rbp-197]
mov r11,qword [r10]
mov qword[rbp-205], r11
lea r10, [rbp-56]
mov qword [rbp-213], r10
mov r10, qword [rbp-213]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-221], r10
mov r10, qword [rbp-221]
mov r11,qword [r10]
mov qword[rbp-229], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [rbp-229]
mov rsi, qword [rbp-205]
lea rdi, [rbp-238]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-246], rax
add rsp,8
pop rax
leave
ret
