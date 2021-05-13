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
const0 dq 40
const1 dq 0
const2 dq 5
const3 dq 1
const4 dq 8
const5 dq 10
const6 db "%ld ", NULL
const7 db "",LF, NULL
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
sub rsp, 142
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
mov qword[rbp-16], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov qword[rbp-24], r10
mov r10, qword [const1]
mov qword[rbp-32], r10
label#0:
mov r10, qword [rbp-32]
mov r11, qword [const2]
cmp r10, r11
jl label#12
mov r10,0
jmp label#13
label#12:
mov r10,1
label#13:
mov byte[rbp-41], r10b
mov r10b, byte [rbp-41]
cmp r10, 0
je label#4
mov r10, qword [rbp-32]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-65], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-65]
add r10, r11
mov qword[rbp-73], r10
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
mov qword[rbp-81], rax
add rsp,8
pop rax
mov r10, qword [rbp-81]
mov r11, qword [rbp-73]
mov qword[r11], r10
mov r10, qword [rbp-73]
mov r11,qword [r10]
mov qword[rbp-89], r11
mov r10, qword [const1]
mov qword[rbp-40], r10
label#1:
mov r10, qword [rbp-40]
mov r11, qword [const2]
cmp r10, r11
jl label#14
mov r10,0
jmp label#15
label#14:
mov r10,1
label#15:
mov byte[rbp-90], r10b
mov r10b, byte [rbp-90]
cmp r10, 0
je label#3
mov r10, qword [rbp-32]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-114], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-114]
add r10, r11
mov qword[rbp-122], r10
mov r10, qword [rbp-122]
mov r11,qword [r10]
mov qword[rbp-130], r11
mov r10, qword [rbp-40]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-138], r10
mov r10, qword [rbp-130]
mov r11, qword [rbp-138]
add r10, r11
mov qword[rbp-146], r10
mov r10, qword [rbp-32]
mov r11, qword [const5]
imul r10, r11
mov qword[rbp-154], r10
mov r10, qword [rbp-154]
mov r11, qword [rbp-40]
add r10, r11
mov qword[rbp-162], r10
mov r10, qword [rbp-162]
mov r11, qword [rbp-146]
mov qword[r11], r10
mov r10, qword [rbp-146]
mov r11,qword [r10]
mov qword[rbp-170], r11
label#2:
mov r10, qword [rbp-40]
mov qword[rbp-98], r10
mov r10, qword [rbp-40]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-106], r10
mov r10, qword [rbp-106]
mov qword[rbp-40], r10
jmp label#1
label#3:
mov r10, qword [rbp-32]
mov qword[rbp-49], r10
mov r10, qword [rbp-32]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-57], r10
mov r10, qword [rbp-57]
mov qword[rbp-32], r10
jmp label#0
label#4:
mov r10, qword [const1]
mov qword[rbp-32], r10
label#5:
mov r10, qword [rbp-32]
mov r11, qword [const2]
cmp r10, r11
jl label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-107], r10b
mov r10b, byte [rbp-107]
cmp r10, 0
je label#10
mov r10, qword [const1]
mov qword[rbp-40], r10
label#6:
mov r10, qword [rbp-40]
mov r11, qword [const2]
cmp r10, r11
jl label#18
mov r10,0
jmp label#19
label#18:
mov r10,1
label#19:
mov byte[rbp-124], r10b
mov r10b, byte [rbp-124]
cmp r10, 0
je label#8
mov r10d, dword[const6+0]
mov dword[rbp-193+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-193+4], r10b
mov r10, qword [rbp-32]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-148], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-148]
add r10, r11
mov qword[rbp-156], r10
mov r10, qword [rbp-156]
mov r11,qword [r10]
mov qword[rbp-164], r11
mov r10, qword [rbp-40]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-172], r10
mov r10, qword [rbp-164]
mov r11, qword [rbp-172]
add r10, r11
mov qword[rbp-180], r10
mov r10, qword [rbp-180]
mov r11,qword [r10]
mov qword[rbp-188], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-188]
lea rdi, [rbp-193]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-201], rax
add rsp,8
pop rax
label#7:
mov r10, qword [rbp-40]
mov qword[rbp-132], r10
mov r10, qword [rbp-40]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-140], r10
mov r10, qword [rbp-140]
mov qword[rbp-40], r10
jmp label#6
label#8:
mov r10w, word[const7+0]
mov word[rbp-203+0], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-203]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-211], rax
add rsp,8
pop rax
label#9:
mov r10, qword [rbp-32]
mov qword[rbp-115], r10
mov r10, qword [rbp-32]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-123], r10
mov r10, qword [rbp-123]
mov qword[rbp-32], r10
jmp label#5
label#10:
leave
ret
