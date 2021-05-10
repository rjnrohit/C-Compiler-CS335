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
const1 dq 2
const2 db "This is ", NULL
const3 db "programiz.com", NULL
const4 db "rohit", NULL
const5 db "strings are same",LF, NULL
const6 dq 3
const7 db "they are not same",LF, NULL
const8 dq 0
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
section .text
global fib
fib:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 41
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
jle label#3
mov r10,0
jmp label#4
label#3:
mov r10,1
label#4:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#0
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const0]
sub r10, r11
mov qword[rbp-25], r10
; saving arguments for call
mov rdi, qword [rbp-25]
call fib
;copy return value from rax
mov qword[rbp-33], rax
add rsp,0
mov r10, qword [rbp-16]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-41], r10
; saving arguments for call
mov rdi, qword [rbp-41]
call fib
;copy return value from rax
mov qword[rbp-49], rax
add rsp,0
mov r10, qword [rbp-33]
mov r11, qword [rbp-49]
add r10, r11
mov qword[rbp-57], r10
;copy return value in rax
mov rax , qword[rbp-57]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 662
mov r10, qword[const2+0]
mov qword[rbp-108+0], r10
mov r10b, byte[const2+8]
mov byte[rbp-108+8], r10b
mov r10, qword[const3+0]
mov qword[rbp-564+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-564+8], r10d
mov r10w, word[const3+12]
mov word[rbp-564+12], r10w
;preparing extern function strcat
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-564]
lea rdi, [rbp-108]
xor rax, rax
call strcat
;copy return value from rax
mov qword[rbp-572], rax
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-578+0], r10d
mov r10w, word[const4+4]
mov word[rbp-578+4], r10w
mov r10d, dword[const4+0]
mov dword[rbp-584+0], r10d
mov r10w, word[const4+4]
mov word[rbp-584+4], r10w
;preparing extern function strcmp
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-584]
lea rdi, [rbp-578]
xor rax, rax
call strcmp
;copy return value from rax
mov qword[rbp-592], rax
add rsp,8
pop rax
mov r10, qword [rbp-592]
cmp r10, 0
je label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-593], r10b
mov r10b, byte [rbp-593]
cmp r10, 0
je label#1
mov r10, qword[const5+0]
mov qword[rbp-611+0], r10
mov r10, qword[const5+8]
mov qword[rbp-611+8], r10
mov r10w, word[const5+16]
mov word[rbp-611+16], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const6]
lea rdi, [rbp-611]
xor rax, rax
call printf
add rsp,8
pop rax
jmp label#2
label#1:
mov r10, qword[const7+0]
mov qword[rbp-630+0], r10
mov r10, qword[const7+8]
mov qword[rbp-630+8], r10
mov r10w, word[const7+16]
mov word[rbp-630+16], r10w
mov r10b, byte[const7+18]
mov byte[rbp-630+18], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const6]
lea rdi, [rbp-630]
xor rax, rax
call printf
add rsp,8
pop rax
label#2:
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-108]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-638], rax
add rsp,8
pop rax
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-564]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-646], rax
add rsp,8
pop rax
;preparing extern function strcpy
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-108]
lea rdi, [rbp-564]
xor rax, rax
call strcpy
;copy return value from rax
mov qword[rbp-654], rax
add rsp,8
pop rax
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-108]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-662], rax
add rsp,8
pop rax
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-564]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-670], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const8]
leave
ret
