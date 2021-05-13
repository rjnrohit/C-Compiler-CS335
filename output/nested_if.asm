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
const0 db "enter a integer: ", NULL
const1 db "%ld", NULL
const2 dq 2
const3 dq 0
const4 db "given number is even",LF, NULL
const5 dq 3
const6 db "given no is divisible by 2,3", NULL
const7 dq 5
const8 db "given no is divisible by 2,3,5", NULL
const9 dq 7
const10 db "given no is divisible by 2,3,5,7", NULL
const11 dq 11
const12 db "given no is divisible by 2,3,5,7,11",LF, NULL
const13 db "given no is div by 2,3,5,7 but not by 11",LF, NULL
const14 db "given no is div by 2,3,5 but not by 7", NULL
const15 db "given no is div by 2,3 but not by 5", NULL
const16 db "given no is div by 2 but not by 3", NULL
const17 db "given number is odd",LF, NULL
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
sub rsp, 131
mov r10, qword[const0+0]
mov qword[rbp-34+0], r10
mov r10, qword[const0+8]
mov qword[rbp-34+8], r10
mov r10w, word[const0+16]
mov word[rbp-34+16], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-34]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-42], rax
add rsp,8
pop rax
mov r10d, dword[const1+0]
mov dword[rbp-54+0], r10d
lea r10, [rbp-16]
mov qword [rbp-50], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-50]
lea rdi, [rbp-54]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-62], rax
add rsp,8
pop rax
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const2]
mov qword[rbp-70], rdx
pop rax
mov r10, qword [rbp-70]
mov r11, qword [const3]
cmp r10, r11
je label#10
mov r10,0
jmp label#11
label#10:
mov r10,1
label#11:
mov byte[rbp-71], r10b
mov r10b, byte [rbp-71]
cmp r10, 0
je label#8
mov r10, qword[const4+0]
mov qword[rbp-93+0], r10
mov r10, qword[const4+8]
mov qword[rbp-93+8], r10
mov r10d, dword[const4+16]
mov dword[rbp-93+16], r10d
mov r10w, word[const4+20]
mov word[rbp-93+20], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-93]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-101], rax
add rsp,8
pop rax
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const5]
mov qword[rbp-109], rdx
pop rax
mov r10, qword [rbp-109]
mov r11, qword [const3]
cmp r10, r11
je label#12
mov r10,0
jmp label#13
label#12:
mov r10,1
label#13:
mov byte[rbp-110], r10b
mov r10b, byte [rbp-110]
cmp r10, 0
je label#6
mov r10, qword[const6+0]
mov qword[rbp-139+0], r10
mov r10, qword[const6+8]
mov qword[rbp-139+8], r10
mov r10, qword[const6+16]
mov qword[rbp-139+16], r10
mov r10d, dword[const6+24]
mov dword[rbp-139+24], r10d
mov r10b, byte[const6+28]
mov byte[rbp-139+28], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-139]
xor rax, rax
call puts
add rsp,8
pop rax
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const7]
mov qword[rbp-147], rdx
pop rax
mov r10, qword [rbp-147]
mov r11, qword [const3]
cmp r10, r11
je label#14
mov r10,0
jmp label#15
label#14:
mov r10,1
label#15:
mov byte[rbp-148], r10b
mov r10b, byte [rbp-148]
cmp r10, 0
je label#4
mov r10, qword[const8+0]
mov qword[rbp-179+0], r10
mov r10, qword[const8+8]
mov qword[rbp-179+8], r10
mov r10, qword[const8+16]
mov qword[rbp-179+16], r10
mov r10d, dword[const8+24]
mov dword[rbp-179+24], r10d
mov r10w, word[const8+28]
mov word[rbp-179+28], r10w
mov r10b, byte[const8+30]
mov byte[rbp-179+30], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-179]
xor rax, rax
call puts
add rsp,8
pop rax
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const9]
mov qword[rbp-187], rdx
pop rax
mov r10, qword [rbp-187]
mov r11, qword [const3]
cmp r10, r11
je label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-188], r10b
mov r10b, byte [rbp-188]
cmp r10, 0
je label#2
mov r10, qword[const10+0]
mov qword[rbp-221+0], r10
mov r10, qword[const10+8]
mov qword[rbp-221+8], r10
mov r10, qword[const10+16]
mov qword[rbp-221+16], r10
mov r10, qword[const10+24]
mov qword[rbp-221+24], r10
mov r10b, byte[const10+32]
mov byte[rbp-221+32], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-221]
xor rax, rax
call puts
add rsp,8
pop rax
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const11]
mov qword[rbp-229], rdx
pop rax
mov r10, qword [rbp-229]
mov r11, qword [const3]
cmp r10, r11
je label#18
mov r10,0
jmp label#19
label#18:
mov r10,1
label#19:
mov byte[rbp-230], r10b
mov r10b, byte [rbp-230]
cmp r10, 0
je label#0
mov r10, qword[const12+0]
mov qword[rbp-267+0], r10
mov r10, qword[const12+8]
mov qword[rbp-267+8], r10
mov r10, qword[const12+16]
mov qword[rbp-267+16], r10
mov r10, qword[const12+24]
mov qword[rbp-267+24], r10
mov r10d, dword[const12+32]
mov dword[rbp-267+32], r10d
mov r10b, byte[const12+36]
mov byte[rbp-267+36], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-267]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-275], rax
add rsp,8
pop rax
jmp label#1
label#0:
mov r10, qword[const13+0]
mov qword[rbp-317+0], r10
mov r10, qword[const13+8]
mov qword[rbp-317+8], r10
mov r10, qword[const13+16]
mov qword[rbp-317+16], r10
mov r10, qword[const13+24]
mov qword[rbp-317+24], r10
mov r10, qword[const13+32]
mov qword[rbp-317+32], r10
mov r10w, word[const13+40]
mov word[rbp-317+40], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-317]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-325], rax
add rsp,8
pop rax
label#1:
jmp label#3
label#2:
mov r10, qword[const14+0]
mov qword[rbp-268+0], r10
mov r10, qword[const14+8]
mov qword[rbp-268+8], r10
mov r10, qword[const14+16]
mov qword[rbp-268+16], r10
mov r10, qword[const14+24]
mov qword[rbp-268+24], r10
mov r10d, dword[const14+32]
mov dword[rbp-268+32], r10d
mov r10w, word[const14+36]
mov word[rbp-268+36], r10w
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-268]
xor rax, rax
call puts
add rsp,8
pop rax
label#3:
jmp label#5
label#4:
mov r10, qword[const15+0]
mov qword[rbp-224+0], r10
mov r10, qword[const15+8]
mov qword[rbp-224+8], r10
mov r10, qword[const15+16]
mov qword[rbp-224+16], r10
mov r10, qword[const15+24]
mov qword[rbp-224+24], r10
mov r10d, dword[const15+32]
mov dword[rbp-224+32], r10d
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-224]
xor rax, rax
call puts
add rsp,8
pop rax
label#5:
jmp label#7
label#6:
mov r10, qword[const16+0]
mov qword[rbp-182+0], r10
mov r10, qword[const16+8]
mov qword[rbp-182+8], r10
mov r10, qword[const16+16]
mov qword[rbp-182+16], r10
mov r10, qword[const16+24]
mov qword[rbp-182+24], r10
mov r10w, word[const16+32]
mov word[rbp-182+32], r10w
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-182]
xor rax, rax
call puts
add rsp,8
pop rax
label#7:
jmp label#9
label#8:
mov r10, qword[const17+0]
mov qword[rbp-131+0], r10
mov r10, qword[const17+8]
mov qword[rbp-131+8], r10
mov r10d, dword[const17+16]
mov dword[rbp-131+16], r10d
mov r10b, byte[const17+20]
mov byte[rbp-131+20], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-131]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-139], rax
add rsp,8
pop rax
label#9:
leave
ret
