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
const2 db "%ld",LF, NULL
const3 db "This is ", NULL
const4 db "programiz.com", NULL
const5 db "rohit", NULL
const6 db "strings are same",LF, NULL
const7 dq 3
const8 db "they are not same",LF, NULL
const9 db "temp1.txt", NULL
const10 db "w", NULL
const11 db "temp2.txt", NULL
const12 db "r", NULL
const13 db "error",LF, NULL
const14 dq -1
const15 db "%ld", NULL
const16 db "sc: %ld",LF, NULL
const17 db "%s",LF, NULL
const18 dq 0
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
jle label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
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
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 820
mov r10d, dword[const2+0]
mov dword[rbp-21+0], r10d
mov r10b, byte[const2+4]
mov byte[rbp-21+4], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-21]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword[const3+0]
mov qword[rbp-121+0], r10
mov r10b, byte[const3+8]
mov byte[rbp-121+8], r10b
mov r10, qword[const4+0]
mov qword[rbp-577+0], r10
mov r10d, dword[const4+8]
mov dword[rbp-577+8], r10d
mov r10w, word[const4+12]
mov word[rbp-577+12], r10w
;preparing extern function strcat
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-577]
lea rdi, [rbp-121]
xor rax, rax
call strcat
;copy return value from rax
mov qword[rbp-585], rax
add rsp,8
pop rax
mov r10d, dword[const5+0]
mov dword[rbp-591+0], r10d
mov r10w, word[const5+4]
mov word[rbp-591+4], r10w
mov r10d, dword[const5+0]
mov dword[rbp-597+0], r10d
mov r10w, word[const5+4]
mov word[rbp-597+4], r10w
;preparing extern function strcmp
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-597]
lea rdi, [rbp-591]
xor rax, rax
call strcmp
;copy return value from rax
mov qword[rbp-605], rax
add rsp,8
pop rax
mov r10, qword [rbp-605]
cmp r10, 0
je label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-606], r10b
mov r10b, byte [rbp-606]
cmp r10, 0
je label#1
mov r10, qword[const6+0]
mov qword[rbp-624+0], r10
mov r10, qword[const6+8]
mov qword[rbp-624+8], r10
mov r10w, word[const6+16]
mov word[rbp-624+16], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const7]
lea rdi, [rbp-624]
xor rax, rax
call printf
add rsp,8
pop rax
jmp label#2
label#1:
mov r10, qword[const8+0]
mov qword[rbp-643+0], r10
mov r10, qword[const8+8]
mov qword[rbp-643+8], r10
mov r10w, word[const8+16]
mov word[rbp-643+16], r10w
mov r10b, byte[const8+18]
mov byte[rbp-643+18], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const7]
lea rdi, [rbp-643]
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
lea rdi, [rbp-121]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-651], rax
add rsp,8
pop rax
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-577]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-659], rax
add rsp,8
pop rax
;preparing extern function strcpy
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-121]
lea rdi, [rbp-577]
xor rax, rax
call strcpy
;copy return value from rax
mov qword[rbp-667], rax
add rsp,8
pop rax
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-121]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-675], rax
add rsp,8
pop rax
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-577]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-683], rax
add rsp,8
pop rax
mov r10, qword[const9+0]
mov qword[rbp-693+0], r10
mov r10w, word[const9+8]
mov word[rbp-693+8], r10w
mov r10w, word[const10+0]
mov word[rbp-695+0], r10w
;preparing extern function fopen
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-695]
lea rdi, [rbp-693]
xor rax, rax
call fopen
;copy return value from rax
mov qword[rbp-703], rax
add rsp,8
pop rax
mov r10, qword [rbp-703]
mov qword[rbp-711], r10
mov r10, qword[const11+0]
mov qword[rbp-721+0], r10
mov r10w, word[const11+8]
mov word[rbp-721+8], r10w
mov r10w, word[const12+0]
mov word[rbp-723+0], r10w
;preparing extern function fopen
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rsi, [rbp-723]
lea rdi, [rbp-721]
xor rax, rax
call fopen
;copy return value from rax
mov qword[rbp-731], rax
add rsp,8
pop rax
mov r10, qword [rbp-731]
mov qword[rbp-739], r10
mov r10, qword [rbp-711]
mov qword[rbp-747], r10
mov r10, qword [rbp-747]
cmp r10, 0
je label#9
mov r10,0
jmp label#10
label#9:
mov r10,1
label#10:
mov byte[rbp-748], r10b
mov r10b, byte [rbp-748]
cmp r10, 0
je label#3
mov r10d, dword[const13+0]
mov dword[rbp-755+0], r10d
mov r10w, word[const13+4]
mov word[rbp-755+4], r10w
mov r10b, byte[const13+6]
mov byte[rbp-755+6], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const0]
lea rdi, [rbp-755]
xor rax, rax
call printf
add rsp,8
pop rax
;preparing extern function exit
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const14]
xor rax, rax
call exit
add rsp,8
pop rax
label#3:
mov r10, qword [rbp-739]
mov qword[rbp-763], r10
mov r10, qword [rbp-763]
cmp r10, 0
je label#11
mov r10,0
jmp label#12
label#11:
mov r10,1
label#12:
mov byte[rbp-764], r10b
mov r10b, byte [rbp-764]
cmp r10, 0
je label#4
mov r10d, dword[const13+0]
mov dword[rbp-771+0], r10d
mov r10w, word[const13+4]
mov word[rbp-771+4], r10w
mov r10b, byte[const13+6]
mov byte[rbp-771+6], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const0]
lea rdi, [rbp-771]
xor rax, rax
call printf
add rsp,8
pop rax
;preparing extern function exit
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const14]
xor rax, rax
call exit
add rsp,8
pop rax
label#4:
mov r10d, dword[const15+0]
mov dword[rbp-791+0], r10d
lea r10, [rbp-779]
mov qword [rbp-787], r10
;preparing extern function fscanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-787]
lea rsi, [rbp-791]
mov rdi, qword [rbp-739]
xor rax, rax
call fscanf
;copy return value from rax
mov qword[rbp-799], rax
add rsp,8
pop rax
mov r10, qword[const16+0]
mov qword[rbp-808+0], r10
mov r10b, byte[const16+8]
mov byte[rbp-808+8], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-779]
lea rdi, [rbp-808]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const17+0]
mov dword[rbp-812+0], r10d
;preparing extern function fprintf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdx, [rbp-121]
lea rsi, [rbp-812]
mov rdi, qword [rbp-711]
xor rax, rax
call fprintf
;copy return value from rax
mov qword[rbp-820], rax
add rsp,8
pop rax
;preparing extern function fclose
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-711]
xor rax, rax
call fclose
;copy return value from rax
mov qword[rbp-828], rax
add rsp,8
pop rax
;preparing extern function fclose
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-739]
xor rax, rax
call fclose
;copy return value from rax
mov qword[rbp-836], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const18]
leave
ret
