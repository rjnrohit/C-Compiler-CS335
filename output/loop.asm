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
const2 dq 5
const3 dq 10
const4 db "%ld ", NULL
const5 db "",LF, NULL
const6 dq 7
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
sub rsp, 103
mov r10, qword [const0]
mov qword[rbp-16], r10
label#0:
mov r10, qword [rbp-16]
mov qword[rbp-24], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-32], r10
mov r10, qword [rbp-32]
mov qword[rbp-16], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
cmp r10, r11
jl label#11
mov r10,0
jmp label#12
label#11:
mov r10,1
label#12:
mov byte[rbp-33], r10b
mov r10b, byte [rbp-33]
cmp r10, 0
je label#1
jmp label#0
label#1:
mov r10, qword [rbp-16]
mov r11, qword [const3]
cmp r10, r11
jg label#13
mov r10,0
jmp label#14
label#13:
mov r10,1
label#14:
mov byte[rbp-34], r10b
mov r10b, byte [rbp-34]
cmp r10, 0
je label#2
jmp label#3
label#2:
mov r10d, dword[const4+0]
mov dword[rbp-39+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-39+4], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-39]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-47], rax
add rsp,8
pop rax
jmp label#0
label#3:
mov r10w, word[const5+0]
mov word[rbp-49+0], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-49]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-57], rax
add rsp,8
pop rax
label#4:
mov r10, qword [const1]
cmp r10, 0
je label#9
label#5:
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const2]
mov qword[rbp-65], rdx
pop rax
mov r10, qword [rbp-65]
cmp r10, 0
je label#15
mov r10,0
jmp label#16
label#15:
mov r10,1
label#16:
mov byte[rbp-66], r10b
mov r10b, byte [rbp-66]
cmp r10, 0
je label#6
jmp label#7
label#6:
mov r10, qword [rbp-16]
mov qword[rbp-74], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-82], r10
mov r10, qword [rbp-82]
mov qword[rbp-16], r10
mov r10, qword [rbp-74]
cmp r10, 0
jne label#5
label#7:
mov r10d, dword[const4+0]
mov dword[rbp-87+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-87+4], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-87]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-95], rax
add rsp,8
pop rax
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const6]
mov qword[rbp-103], rdx
pop rax
mov r10, qword [rbp-103]
cmp r10, 0
je label#17
mov r10,0
jmp label#18
label#17:
mov r10,1
label#18:
mov byte[rbp-104], r10b
mov r10b, byte [rbp-104]
cmp r10, 0
je label#8
mov r10w, word[const5+0]
mov word[rbp-106+0], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-106]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-114], rax
add rsp,8
pop rax
jmp label#9
label#8:
mov r10, qword [rbp-16]
mov qword[rbp-122], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-130], r10
mov r10, qword [rbp-130]
mov qword[rbp-16], r10
jmp label#4
label#9:
leave
ret
