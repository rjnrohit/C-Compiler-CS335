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
const1 dq 1
const2 dq -1
const3 db "%ld", NULL
const4 db "Enter positive number", NULL
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
global ackermann@func
ackermann@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 63
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#12
mov r10,0
jmp label#13
label#12:
mov r10,1
label#13:
mov byte[rbp-25], r10b
mov r10b, byte [rbp-25]
cmp r10, 0
je label#0
mov r10, qword [rbp-24]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-33], r10
;copy return value in rax
mov rax , qword[rbp-33]
leave
ret
jmp label#6
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
jg label#14
mov r10,0
jmp label#15
label#14:
mov r10,1
label#15:
mov byte[rbp-34], r10b
mov r10b, byte [rbp-34]
cmp r10, 0
je label#1
mov r10, qword [rbp-24]
mov r11, qword [const0]
cmp r10, r11
je label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-35], r10b
mov r10b, byte [rbp-35]
cmp r10, 0
je label#1
mov r10, qword [const1]
mov byte[rbp-36], r10b
jmp label#2
label#1:
mov r10, qword [const0]
mov byte[rbp-36], r10b
label#2:
mov r10b, byte [rbp-36]
cmp r10, 0
je label#3
mov r10, qword [rbp-16]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-44], r10
push rax
; saving arguments for call
mov rsi, qword [const1]
mov rdi, qword [rbp-44]
call ackermann@func
;copy return value from rax
mov qword[rbp-52], rax
add rsp,0
pop rax
;copy return value in rax
mov rax , qword[rbp-52]
leave
ret
jmp label#6
label#3:
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
jg label#18
mov r10,0
jmp label#19
label#18:
mov r10,1
label#19:
mov byte[rbp-53], r10b
mov r10b, byte [rbp-53]
cmp r10, 0
je label#4
mov r10, qword [rbp-24]
mov r11, qword [const0]
cmp r10, r11
jg label#20
mov r10,0
jmp label#21
label#20:
mov r10,1
label#21:
mov byte[rbp-54], r10b
mov r10b, byte [rbp-54]
cmp r10, 0
je label#4
mov r10, qword [const1]
mov byte[rbp-55], r10b
jmp label#5
label#4:
mov r10, qword [const0]
mov byte[rbp-55], r10b
label#5:
mov r10b, byte [rbp-55]
cmp r10, 0
je label#6
mov r10, qword [rbp-16]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-63], r10
mov r10, qword [rbp-24]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-71], r10
push rax
; saving arguments for call
mov rsi, qword [rbp-71]
mov rdi, qword [rbp-16]
call ackermann@func
;copy return value from rax
mov qword[rbp-79], rax
add rsp,0
pop rax
push rax
; saving arguments for call
mov rsi, qword [rbp-79]
mov rdi, qword [rbp-63]
call ackermann@func
;copy return value from rax
mov qword[rbp-87], rax
add rsp,0
pop rax
;copy return value in rax
mov rax , qword[rbp-87]
leave
ret
label#6:
;copy return value in rax
mov rax , qword[const2]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 110
mov r10d, dword[const3+0]
mov dword[rbp-36+0], r10d
lea r10, [rbp-16]
mov qword [rbp-32], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-32]
lea rdi, [rbp-36]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-44], rax
add rsp,8
pop rax
mov r10d, dword[const3+0]
mov dword[rbp-56+0], r10d
lea r10, [rbp-24]
mov qword [rbp-52], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-52]
lea rdi, [rbp-56]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-64], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
jl label#22
mov r10,0
jmp label#23
label#22:
mov r10,1
label#23:
mov byte[rbp-65], r10b
mov r10b, byte [rbp-65]
cmp r10, 0
jne label#7
mov r10, qword [rbp-24]
mov r11, qword [const0]
cmp r10, r11
jl label#24
mov r10,0
jmp label#25
label#24:
mov r10,1
label#25:
mov byte[rbp-66], r10b
mov r10b, byte [rbp-66]
cmp r10, 0
jne label#7
mov r10, qword [const0]
mov byte[rbp-67], r10b
jmp label#8
label#7:
mov r10, qword [const1]
mov byte[rbp-67], r10b
label#8:
mov r10b, byte [rbp-67]
cmp r10, 0
je label#9
mov r10, qword[const4+0]
mov qword[rbp-89+0], r10
mov r10, qword[const4+8]
mov qword[rbp-89+8], r10
mov r10d, dword[const4+16]
mov dword[rbp-89+16], r10d
mov r10w, word[const4+20]
mov word[rbp-89+20], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-89]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-97], rax
add rsp,8
pop rax
label#9:
mov r10d, dword[const5+0]
mov dword[rbp-110+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-110+4], r10b
push rax
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-16]
call ackermann@func
;copy return value from rax
mov qword[rbp-105], rax
add rsp,0
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-105]
lea rdi, [rbp-110]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-118], rax
add rsp,8
pop rax
leave
ret
