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
const0 dq 94
const1 dq 1386
const2 dq 1103
const3 dq 124
const4 dq 38
const5 dq 126
const6 dq 60
const7 dq 62
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
sub rsp, 27
mov r10, qword [const0]
mov byte[rbp-9], r10b
mov r10, qword [const1]
mov qword[rbp-17], r10
mov r10, qword [const2]
mov qword[rbp-25], r10
mov r10, qword [rbp-17]
mov r11, qword [rbp-25]
cmp r10, r11
je label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-26], r10b
mov r10b, byte [rbp-26]
mov byte[rbp-27], r10b
mov r10b, byte [rbp-9]
mov r11, qword [const3]
cmp r10, r11
jne label#0
mov r10, qword [rbp-43]
mov qword[rbp-35], r10
jmp label#6
label#0:
mov r10b, byte [rbp-9]
mov r11, qword [const4]
cmp r10, r11
jne label#1
mov r10, qword [rbp-51]
mov qword[rbp-35], r10
jmp label#6
label#1:
mov r10b, byte [rbp-9]
mov r11, qword [const0]
cmp r10, r11
jne label#2
mov r10, qword [rbp-59]
mov qword[rbp-35], r10
jmp label#6
label#2:
mov r10b, byte [rbp-9]
mov r11, qword [const5]
cmp r10, r11
jne label#3
mov r10, qword [rbp-17]
not r11
mov qword[rbp-67], r11
mov r10, qword [rbp-67]
mov qword[rbp-35], r10
jmp label#6
label#3:
mov r10b, byte [rbp-9]
mov r11, qword [const6]
cmp r10, r11
jne label#4
mov r10, qword [rbp-17]
mov r11, qword [rbp-25]
cmp r10, r11
jl label#9
mov r10,0
jmp label#10
label#9:
mov r10,1
label#10:
mov byte[rbp-68], r10b
mov r10b, byte [rbp-68]
mov qword[rbp-76], r10
mov r10, qword [rbp-76]
mov qword[rbp-35], r10
jmp label#6
label#4:
mov r10b, byte [rbp-9]
mov r11, qword [const7]
cmp r10, r11
jne label#5
mov r10, qword [rbp-17]
mov r11, qword [rbp-25]
cmp r10, r11
jg label#11
mov r10,0
jmp label#12
label#11:
mov r10,1
label#12:
mov byte[rbp-77], r10b
mov r10b, byte [rbp-77]
mov qword[rbp-85], r10
mov r10, qword [rbp-85]
mov qword[rbp-35], r10
jmp label#6
label#5:
mov r10, qword [rbp-17]
mov qword[rbp-35], r10
label#6:
leave
ret
