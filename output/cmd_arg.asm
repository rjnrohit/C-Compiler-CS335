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
const0 db "no of args: %ld",LF, NULL
const1 dq 0
const2 dq 1
const3 dq 8
const4 db "argument no.%ld is %s",LF, NULL
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
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 97
mov r10, qword[const0+0]
mov qword[rbp-41+0], r10
mov r10, qword[const0+8]
mov qword[rbp-41+8], r10
mov r10b, byte[const0+16]
mov byte[rbp-41+16], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-41]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword [const1]
mov qword[rbp-49], r10
mov r10, qword [const1]
mov qword[rbp-49], r10
label#0:
mov r10, qword [rbp-49]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-50], r10b
mov r10b, byte [rbp-50]
cmp r10, 0
je label#2
mov r10, qword[const4+0]
mov qword[rbp-121+0], r10
mov r10, qword[const4+8]
mov qword[rbp-121+8], r10
mov r10d, dword[const4+16]
mov dword[rbp-121+16], r10d
mov r10w, word[const4+20]
mov word[rbp-121+20], r10w
mov r10b, byte[const4+22]
mov byte[rbp-121+22], r10b
mov r10, qword [rbp-49]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-74], r10
mov r10, qword [rbp-49]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-82], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-82]
add r10, r11
mov qword[rbp-90], r10
mov r10, qword [rbp-90]
mov r11,qword [r10]
mov qword[rbp-98], r11
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-98]
mov rsi, qword [rbp-74]
lea rdi, [rbp-121]
xor rax, rax
call printf
add rsp,8
pop rax
label#1:
mov r10, qword [rbp-49]
mov qword[rbp-58], r10
mov r10, qword [rbp-49]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-66], r10
mov r10, qword [rbp-66]
mov qword[rbp-49], r10
jmp label#0
label#2:
;copy return value in rax
mov rax , qword[const1]
leave
ret
