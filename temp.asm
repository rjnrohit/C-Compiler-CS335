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
const4 dq 7
const5 dq 3
const6 db "%ld",LF, NULL
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
global insert@func
insert@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 121
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#1
mov r10,0
jmp label#2
label#1:
mov r10,1
label#2:
mov byte[rbp-25], r10b
mov r10b, byte [rbp-25]
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
mov qword[rbp-33], rax
add rsp,8
pop rax
mov r10, qword [rbp-33]
mov qword[rbp-41], r10
mov r10, qword [rbp-41]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-49]
mov qword[r11], r10
mov r10, qword [rbp-49]
mov r11,qword [r10]
mov qword[rbp-57], r11
mov r10, qword [rbp-41]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-65], r10
mov r10, qword [const0]
mov r11, qword [rbp-65]
mov qword[r11], r10
mov r10, qword [rbp-65]
mov r11,qword [r10]
mov qword[rbp-73], r11
mov r10, qword [rbp-41]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-81], r10
mov r10, qword [const0]
mov r11, qword [rbp-81]
mov qword[r11], r10
mov r10, qword [rbp-81]
mov r11,qword [r10]
mov qword[rbp-89], r11
;copy return value in rax
mov rax , qword[rbp-41]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-97], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-105], r10
mov r10, qword [rbp-105]
mov r11,qword [r10]
mov qword[rbp-113], r11
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-113]
call insert@func
;copy return value from rax
mov qword[rbp-121], rax
add rsp,0
mov r10, qword [rbp-121]
mov r11, qword [rbp-97]
mov qword[r11], r10
mov r10, qword [rbp-97]
mov r11,qword [r10]
mov qword[rbp-129], r11
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 37
mov r10, qword [const4]
mov qword[rbp-16], r10
mov r10, qword [const5]
mov qword[rbp-24], r10
mov r10d, dword[const6+0]
mov dword[rbp-37+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-37+4], r10b
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
or r10, r11
mov qword[rbp-32], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-32]
lea rdi, [rbp-37]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-45], rax
add rsp,8
pop rax
leave
ret
