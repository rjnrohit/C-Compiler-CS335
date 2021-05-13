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
const1 dq 0
const2 db "a:%ld b:%ld c:%ld",LF, NULL
const3 db "False",LF, NULL
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
sub rsp, 372
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword [const0]
mov qword[rbp-24], r10
mov r10, qword [const0]
mov qword[rbp-32], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
cmp r10, r11
je label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-33], r10b
mov r10b, byte [rbp-33]
cmp r10, 0
jne label#0
mov r10, qword [rbp-32]
mov qword[rbp-41], r10
mov r10, qword [rbp-32]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-49]
mov qword[rbp-32], r10
mov r10, qword [rbp-41]
cmp r10, 0
jne label#0
mov r10, qword [const1]
mov byte[rbp-50], r10b
jmp label#1
label#0:
mov r10, qword [const0]
mov byte[rbp-50], r10b
label#1:
mov r10b, byte [rbp-50]
cmp r10, 0
je label#2
mov r10, qword[const2+0]
mov qword[rbp-69+0], r10
mov r10, qword[const2+8]
mov qword[rbp-69+8], r10
mov r10w, word[const2+16]
mov word[rbp-69+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-69+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-69]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-77], rax
add rsp,8
pop rax
jmp label#3
label#2:
mov r10d, dword[const3+0]
mov dword[rbp-84+0], r10d
mov r10w, word[const3+4]
mov word[rbp-84+4], r10w
mov r10b, byte[const3+6]
mov byte[rbp-84+6], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-84]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-92], rax
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-111+0], r10
mov r10, qword[const2+8]
mov qword[rbp-111+8], r10
mov r10w, word[const2+16]
mov word[rbp-111+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-111+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-111]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-119], rax
add rsp,8
pop rax
label#3:
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
cmp r10, r11
je label#18
mov r10,0
jmp label#19
label#18:
mov r10,1
label#19:
mov byte[rbp-120], r10b
mov r10b, byte [rbp-120]
cmp r10, 0
je label#4
mov r10, qword [rbp-32]
mov qword[rbp-128], r10
mov r10, qword [rbp-32]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-136], r10
mov r10, qword [rbp-136]
mov qword[rbp-32], r10
mov r10, qword [rbp-128]
cmp r10, 0
je label#4
mov r10, qword [const0]
mov byte[rbp-137], r10b
jmp label#5
label#4:
mov r10, qword [const1]
mov byte[rbp-137], r10b
label#5:
mov r10b, byte [rbp-137]
cmp r10, 0
je label#6
mov r10, qword[const2+0]
mov qword[rbp-156+0], r10
mov r10, qword[const2+8]
mov qword[rbp-156+8], r10
mov r10w, word[const2+16]
mov word[rbp-156+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-156+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-156]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-164], rax
add rsp,8
pop rax
jmp label#7
label#6:
mov r10d, dword[const3+0]
mov dword[rbp-171+0], r10d
mov r10w, word[const3+4]
mov word[rbp-171+4], r10w
mov r10b, byte[const3+6]
mov byte[rbp-171+6], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-171]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-179], rax
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-198+0], r10
mov r10, qword[const2+8]
mov qword[rbp-198+8], r10
mov r10w, word[const2+16]
mov word[rbp-198+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-198+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-198]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-206], rax
add rsp,8
pop rax
label#7:
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
cmp r10, r11
jne label#20
mov r10,0
jmp label#21
label#20:
mov r10,1
label#21:
mov byte[rbp-207], r10b
mov r10b, byte [rbp-207]
cmp r10, 0
jne label#8
mov r10, qword [rbp-32]
mov qword[rbp-215], r10
mov r10, qword [rbp-32]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-223], r10
mov r10, qword [rbp-223]
mov qword[rbp-32], r10
mov r10, qword [rbp-215]
cmp r10, 0
jne label#8
mov r10, qword [const1]
mov byte[rbp-224], r10b
jmp label#9
label#8:
mov r10, qword [const0]
mov byte[rbp-224], r10b
label#9:
mov r10b, byte [rbp-224]
cmp r10, 0
je label#10
mov r10, qword[const2+0]
mov qword[rbp-243+0], r10
mov r10, qword[const2+8]
mov qword[rbp-243+8], r10
mov r10w, word[const2+16]
mov word[rbp-243+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-243+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-243]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-251], rax
add rsp,8
pop rax
jmp label#11
label#10:
mov r10d, dword[const3+0]
mov dword[rbp-258+0], r10d
mov r10w, word[const3+4]
mov word[rbp-258+4], r10w
mov r10b, byte[const3+6]
mov byte[rbp-258+6], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-258]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-266], rax
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-285+0], r10
mov r10, qword[const2+8]
mov qword[rbp-285+8], r10
mov r10w, word[const2+16]
mov word[rbp-285+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-285+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-285]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-293], rax
add rsp,8
pop rax
label#11:
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
cmp r10, r11
jne label#22
mov r10,0
jmp label#23
label#22:
mov r10,1
label#23:
mov byte[rbp-294], r10b
mov r10b, byte [rbp-294]
cmp r10, 0
je label#12
mov r10, qword [rbp-32]
mov qword[rbp-302], r10
mov r10, qword [rbp-32]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-310], r10
mov r10, qword [rbp-310]
mov qword[rbp-32], r10
mov r10, qword [rbp-302]
cmp r10, 0
je label#12
mov r10, qword [const0]
mov byte[rbp-311], r10b
jmp label#13
label#12:
mov r10, qword [const1]
mov byte[rbp-311], r10b
label#13:
mov r10b, byte [rbp-311]
cmp r10, 0
je label#14
mov r10, qword[const2+0]
mov qword[rbp-330+0], r10
mov r10, qword[const2+8]
mov qword[rbp-330+8], r10
mov r10w, word[const2+16]
mov word[rbp-330+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-330+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-330]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-338], rax
add rsp,8
pop rax
jmp label#15
label#14:
mov r10d, dword[const3+0]
mov dword[rbp-345+0], r10d
mov r10w, word[const3+4]
mov word[rbp-345+4], r10w
mov r10b, byte[const3+6]
mov byte[rbp-345+6], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-345]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-353], rax
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-372+0], r10
mov r10, qword[const2+8]
mov qword[rbp-372+8], r10
mov r10w, word[const2+16]
mov word[rbp-372+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-372+18], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-372]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-380], rax
add rsp,8
pop rax
label#15:
leave
ret
