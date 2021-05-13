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
const0 db "%ld", NULL
const1 dq 0
const2 db "Enter a postive number",LF, NULL
const3 dq -1
const4 dq 50
const5 db "Number is too large",LF, NULL
const6 dq 8
const7 dq 1
const8 dq 2
const9 db "%ld",LF, NULL
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
sub rsp, 737
mov r10d, dword[const0+0]
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
mov r11, qword [const1]
cmp r10, r11
jl label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-37], r10b
mov r10b, byte [rbp-37]
cmp r10, 0
je label#0
mov r10, qword[const2+0]
mov qword[rbp-61+0], r10
mov r10, qword[const2+8]
mov qword[rbp-61+8], r10
mov r10, qword[const2+16]
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
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const4]
cmp r10, r11
jg label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-70], r10b
mov r10b, byte [rbp-70]
cmp r10, 0
je label#1
mov r10, qword[const5+0]
mov qword[rbp-91+0], r10
mov r10, qword[const5+8]
mov qword[rbp-91+8], r10
mov r10d, dword[const5+16]
mov dword[rbp-91+16], r10d
mov r10b, byte[const5+20]
mov byte[rbp-91+20], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-91]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-99], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const3]
leave
ret
label#1:
lea r10, [rbp-507]
mov qword [rbp-515], r10
mov r10, qword [rbp-515]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-523], r10
mov r10, qword [const1]
mov r11, qword [rbp-523]
mov qword[r11], r10
mov r10, qword [rbp-523]
mov r11,qword [r10]
mov qword[rbp-531], r11
lea r10, [rbp-507]
mov qword [rbp-539], r10
mov r10, qword [rbp-539]
mov r11, qword [const6]
add r10, r11
mov qword[rbp-547], r10
mov r10, qword [const7]
mov r11, qword [rbp-547]
mov qword[r11], r10
mov r10, qword [rbp-547]
mov r11,qword [r10]
mov qword[rbp-555], r11
mov r10, qword [const8]
mov qword[rbp-563], r10
label#2:
mov r10, qword [rbp-563]
mov r11, qword [rbp-16]
cmp r10, r11
jle label#9
mov r10,0
jmp label#10
label#9:
mov r10,1
label#10:
mov byte[rbp-564], r10b
mov r10b, byte [rbp-564]
cmp r10, 0
je label#4
lea r10, [rbp-507]
mov qword [rbp-588], r10
mov r10, qword [rbp-563]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-596], r10
mov r10, qword [rbp-588]
mov r11, qword [rbp-596]
add r10, r11
mov qword[rbp-604], r10
lea r10, [rbp-507]
mov qword [rbp-612], r10
mov r10, qword [rbp-563]
mov r11, qword [const7]
sub r10, r11
mov qword[rbp-620], r10
mov r10, qword [rbp-620]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-628], r10
mov r10, qword [rbp-612]
mov r11, qword [rbp-628]
add r10, r11
mov qword[rbp-636], r10
mov r10, qword [rbp-636]
mov r11,qword [r10]
mov qword[rbp-676], r11
lea r10, [rbp-507]
mov qword [rbp-644], r10
mov r10, qword [rbp-563]
mov r11, qword [const8]
sub r10, r11
mov qword[rbp-652], r10
mov r10, qword [rbp-652]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-660], r10
mov r10, qword [rbp-644]
mov r11, qword [rbp-660]
add r10, r11
mov qword[rbp-668], r10
mov r10, qword [rbp-668]
mov r11,qword [r10]
mov qword[rbp-684], r11
mov r10, qword [rbp-676]
mov r11, qword [rbp-684]
add r10, r11
mov qword[rbp-692], r10
mov r10, qword [rbp-692]
mov r11, qword [rbp-604]
mov qword[r11], r10
mov r10, qword [rbp-604]
mov r11,qword [r10]
mov qword[rbp-700], r11
label#3:
mov r10, qword [rbp-563]
mov qword[rbp-572], r10
mov r10, qword [rbp-563]
mov r11, qword [const7]
add r10, r11
mov qword[rbp-580], r10
mov r10, qword [rbp-580]
mov qword[rbp-563], r10
jmp label#2
label#4:
mov r10d, dword[const9+0]
mov dword[rbp-737+0], r10d
mov r10b, byte[const9+4]
mov byte[rbp-737+4], r10b
lea r10, [rbp-507]
mov qword [rbp-708], r10
mov r10, qword [rbp-16]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-716], r10
mov r10, qword [rbp-708]
mov r11, qword [rbp-716]
add r10, r11
mov qword[rbp-724], r10
mov r10, qword [rbp-724]
mov r11,qword [r10]
mov qword[rbp-732], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-732]
lea rdi, [rbp-737]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-745], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const1]
leave
ret
