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
const0 dq 24
const1 dq 0
const2 dq 8
const3 dq 16
const4 db "%ld ", NULL
const5 db "enter number of elements in tree: ", NULL
const6 db "%ld", NULL
const7 db "enter %ld ", NULL
const8 db "numbers",LF, NULL
const9 dq 1
const10 db "tree: ", NULL
const11 db "",LF, NULL
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
global newNode@func
newNode@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 64
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const0]
xor rax, rax
add rdi, 15
and dil, 0xf0
call malloc
;copy return value from rax
mov qword[rbp-24], rax
add rsp,8
pop rax
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10, qword [rbp-32]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-40], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-40]
mov qword[r11], r10
mov r10, qword [rbp-40]
mov r11,qword [r10]
mov qword[rbp-48], r11
mov r10, qword [rbp-32]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-56], r10
mov r10, qword [const1]
mov r11, qword [rbp-56]
mov qword[r11], r10
mov r10, qword [rbp-56]
mov r11,qword [r10]
mov qword[rbp-64], r11
mov r10, qword [rbp-32]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-72], r10
mov r10, qword [const1]
mov r11, qword [rbp-72]
mov qword[r11], r10
mov r10, qword [rbp-72]
mov r11,qword [r10]
mov qword[rbp-80], r11
;copy return value in rax
mov rax , qword[rbp-32]
leave
ret
global printInorder@func
printInorder@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 54
mov r10, qword [rbp-8]
mov r11, qword [const1]
cmp r10, r11
je label#5
mov r10,0
jmp label#6
label#5:
mov r10,1
label#6:
mov byte[rbp-9], r10b
mov r10b, byte [rbp-9]
cmp r10, 0
je label#0
xor rax, rax
leave
ret
label#0:
mov r10, qword [rbp-8]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-17], r10
mov r10, qword [rbp-17]
mov r11,qword [r10]
mov qword[rbp-25], r11
push rax
; saving arguments for call
mov rdi, qword [rbp-25]
call printInorder@func
add rsp,0
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-46+0], r10d
mov r10b, byte[const4+4]
mov byte[rbp-46+4], r10b
mov r10, qword [rbp-8]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov r11,qword [r10]
mov qword[rbp-41], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-41]
lea rdi, [rbp-46]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword [rbp-8]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-54], r10
mov r10, qword [rbp-54]
mov r11,qword [r10]
mov qword[rbp-62], r11
push rax
; saving arguments for call
mov rdi, qword [rbp-62]
call printInorder@func
add rsp,0
pop rax
leave
ret
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
sub rsp, 65
mov r10, qword [rbp-16]
cmp r10, 0
je label#2
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-32], r10
mov r10, qword [rbp-32]
mov r11,qword [r10]
mov qword[rbp-40], r11
mov r10, qword [rbp-24]
mov r11, qword [rbp-40]
cmp r10, r11
jge label#7
mov r10,0
jmp label#8
label#7:
mov r10,1
label#8:
mov byte[rbp-41], r10b
mov r10b, byte [rbp-41]
cmp r10, 0
je label#1
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-57], r10
mov r10, qword [rbp-57]
mov r11,qword [r10]
mov qword[rbp-65], r11
push rax
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-65]
call insert@func
;copy return value from rax
mov qword[rbp-73], rax
add rsp,0
pop rax
mov r10, qword [rbp-73]
mov r11, qword [rbp-49]
mov qword[r11], r10
mov r10, qword [rbp-49]
mov r11,qword [r10]
mov qword[rbp-81], r11
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#1:
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-89], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-97], r10
mov r10, qword [rbp-97]
mov r11,qword [r10]
mov qword[rbp-105], r11
push rax
; saving arguments for call
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-105]
call insert@func
;copy return value from rax
mov qword[rbp-113], rax
add rsp,0
pop rax
mov r10, qword [rbp-113]
mov r11, qword [rbp-89]
mov qword[r11], r10
mov r10, qword [rbp-89]
mov r11,qword [r10]
mov qword[rbp-121], r11
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#2:
push rax
; saving arguments for call
mov rdi, qword [rbp-24]
call newNode@func
;copy return value from rax
mov qword[rbp-89], rax
add rsp,0
pop rax
mov r10, qword [rbp-89]
mov qword[rbp-16], r10
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
sub rsp, 136
mov r10, qword[const5+0]
mov qword[rbp-51+0], r10
mov r10, qword[const5+8]
mov qword[rbp-51+8], r10
mov r10, qword[const5+16]
mov qword[rbp-51+16], r10
mov r10, qword[const5+24]
mov qword[rbp-51+24], r10
mov r10w, word[const5+32]
mov word[rbp-51+32], r10w
mov r10b, byte[const5+34]
mov byte[rbp-51+34], r10b
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-51]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const6+0]
mov dword[rbp-63+0], r10d
lea r10, [rbp-16]
mov qword [rbp-59], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-59]
lea rdi, [rbp-63]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const7+0]
mov qword[rbp-74+0], r10
mov r10w, word[const7+8]
mov word[rbp-74+8], r10w
mov r10b, byte[const7+10]
mov byte[rbp-74+10], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-16]
lea rdi, [rbp-74]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword[const8+0]
mov qword[rbp-83+0], r10
mov r10b, byte[const8+8]
mov byte[rbp-83+8], r10b
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-83]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword [const1]
mov qword[rbp-91], r10
label#3:
mov r10, qword [rbp-16]
mov qword[rbp-99], r10
mov r10, qword [rbp-16]
mov r11, qword [const9]
sub r10, r11
mov qword[rbp-107], r10
mov r10, qword [rbp-107]
mov qword[rbp-16], r10
mov r10, qword [rbp-99]
cmp r10, 0
je label#4
mov r10d, dword[const6+0]
mov dword[rbp-127+0], r10d
lea r10, [rbp-115]
mov qword [rbp-123], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-123]
lea rdi, [rbp-127]
xor rax, rax
call scanf
add rsp,8
pop rax
push rax
; saving arguments for call
mov rsi, qword [rbp-115]
mov rdi, qword [rbp-91]
call insert@func
;copy return value from rax
mov qword[rbp-135], rax
add rsp,0
pop rax
mov r10, qword [rbp-135]
mov qword[rbp-91], r10
jmp label#3
label#4:
mov r10d, dword[const10+0]
mov dword[rbp-142+0], r10d
mov r10w, word[const10+4]
mov word[rbp-142+4], r10w
mov r10b, byte[const10+6]
mov byte[rbp-142+6], r10b
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-142]
xor rax, rax
call printf
add rsp,8
pop rax
push rax
; saving arguments for call
mov rdi, qword [rbp-91]
call printInorder@func
add rsp,0
pop rax
mov r10w, word[const11+0]
mov word[rbp-144+0], r10w
;preparing extern function printfs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-144]
xor rax, rax
call printf
add rsp,8
pop rax
leave
ret
