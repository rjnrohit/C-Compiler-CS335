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
const2 dq 80
const3 dq 8
const4 db "%ld", NULL
const5 db "%ld ", NULL
const6 db "",LF, NULL
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
global input_matrix
input_matrix:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 50
mov r10, qword [const0]
mov qword[rbp-24], r10
label#0:
mov r10, qword [rbp-24]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#21
mov r10,0
jmp label#22
label#21:
mov r10,1
label#22:
mov byte[rbp-33], r10b
mov r10b, byte [rbp-33]
cmp r10, 0
je label#4
mov r10, qword [const0]
mov qword[rbp-32], r10
label#1:
mov r10, qword [rbp-32]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#23
mov r10,0
jmp label#24
label#23:
mov r10,1
label#24:
mov byte[rbp-42], r10b
mov r10b, byte [rbp-42]
cmp r10, 0
je label#3
mov r10d, dword[const4+0]
mov dword[rbp-94+0], r10d
mov r10, qword [rbp-24]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-66], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-66]
add r10, r11
mov qword[rbp-74], r10
mov r10, qword [rbp-32]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-82], r10
mov r10, qword [rbp-74]
mov r11, qword [rbp-82]
add r10, r11
mov qword[rbp-90], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-90]
lea rdi, [rbp-94]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-102], rax
add rsp,8
pop rax
label#2:
mov r10, qword [rbp-32]
mov qword[rbp-50], r10
mov r10, qword [rbp-32]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-32], r10
jmp label#1
label#3:
mov r10, qword [rbp-24]
mov qword[rbp-41], r10
mov r10, qword [rbp-24]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-24], r10
jmp label#0
label#4:
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 2514
mov r10d, dword[const4+0]
mov dword[rbp-2428+0], r10d
lea r10, [rbp-2416]
mov qword [rbp-2424], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2424]
lea rdi, [rbp-2428]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-2436], rax
add rsp,8
pop rax
lea r10, [rbp-808]
mov qword [rbp-2444], r10
; saving arguments for call
mov rsi, qword [rbp-2416]
mov rdi, qword [rbp-2444]
call input_matrix
add rsp,0
lea r10, [rbp-1608]
mov qword [rbp-2452], r10
; saving arguments for call
mov rsi, qword [rbp-2416]
mov rdi, qword [rbp-2452]
call input_matrix
add rsp,0
mov r10, qword [const0]
mov qword[rbp-2460], r10
label#5:
mov r10, qword [rbp-2460]
mov r11, qword [rbp-2416]
cmp r10, r11
jl label#25
mov r10,0
jmp label#26
label#25:
mov r10,1
label#26:
mov byte[rbp-2477], r10b
mov r10b, byte [rbp-2477]
cmp r10, 0
je label#11
mov r10, qword [const0]
mov qword[rbp-2468], r10
label#6:
mov r10, qword [rbp-2468]
mov r11, qword [rbp-2416]
cmp r10, r11
jl label#27
mov r10,0
jmp label#28
label#27:
mov r10,1
label#28:
mov byte[rbp-2486], r10b
mov r10b, byte [rbp-2486]
cmp r10, 0
je label#10
lea r10, [rbp-2408]
mov qword [rbp-2502], r10
mov r10, qword [rbp-2460]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-2510], r10
mov r10, qword [rbp-2502]
mov r11, qword [rbp-2510]
add r10, r11
mov qword[rbp-2518], r10
mov r10, qword [rbp-2468]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-2526], r10
mov r10, qword [rbp-2518]
mov r11, qword [rbp-2526]
add r10, r11
mov qword[rbp-2534], r10
mov r10, qword [const0]
mov r11, qword [rbp-2534]
mov qword[r11], r10
mov r10, qword [rbp-2534]
mov r11,qword [r10]
mov qword[rbp-2542], r11
mov r10, qword [const0]
mov qword[rbp-2476], r10
label#7:
mov r10, qword [rbp-2476]
mov r11, qword [rbp-2416]
cmp r10, r11
jl label#29
mov r10,0
jmp label#30
label#29:
mov r10,1
label#30:
mov byte[rbp-2543], r10b
mov r10b, byte [rbp-2543]
cmp r10, 0
je label#9
lea r10, [rbp-2408]
mov qword [rbp-2559], r10
mov r10, qword [rbp-2460]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-2567], r10
mov r10, qword [rbp-2559]
mov r11, qword [rbp-2567]
add r10, r11
mov qword[rbp-2575], r10
mov r10, qword [rbp-2468]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-2583], r10
mov r10, qword [rbp-2575]
mov r11, qword [rbp-2583]
add r10, r11
mov qword[rbp-2591], r10
mov r10, qword [rbp-2591]
mov r11,qword [r10]
mov qword[rbp-2703], r11
lea r10, [rbp-2408]
mov qword [rbp-2559], r10
mov r10, qword [rbp-2460]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-2567], r10
mov r10, qword [rbp-2559]
mov r11, qword [rbp-2567]
add r10, r11
mov qword[rbp-2575], r10
mov r10, qword [rbp-2468]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-2583], r10
mov r10, qword [rbp-2575]
mov r11, qword [rbp-2583]
add r10, r11
mov qword[rbp-2591], r10
mov r10, qword [rbp-2591]
mov r11,qword [r10]
mov qword[rbp-2703], r11
lea r10, [rbp-808]
mov qword [rbp-2599], r10
mov r10, qword [rbp-2460]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-2607], r10
mov r10, qword [rbp-2599]
mov r11, qword [rbp-2607]
add r10, r11
mov qword[rbp-2615], r10
mov r10, qword [rbp-2476]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-2623], r10
mov r10, qword [rbp-2615]
mov r11, qword [rbp-2623]
add r10, r11
mov qword[rbp-2631], r10
mov r10, qword [rbp-2631]
mov r11,qword [r10]
mov qword[rbp-2679], r11
lea r10, [rbp-1608]
mov qword [rbp-2639], r10
mov r10, qword [rbp-2476]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-2647], r10
mov r10, qword [rbp-2639]
mov r11, qword [rbp-2647]
add r10, r11
mov qword[rbp-2655], r10
mov r10, qword [rbp-2468]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-2663], r10
mov r10, qword [rbp-2655]
mov r11, qword [rbp-2663]
add r10, r11
mov qword[rbp-2671], r10
mov r10, qword [rbp-2671]
mov r11,qword [r10]
mov qword[rbp-2687], r11
mov r10, qword [rbp-2679]
mov r11, qword [rbp-2687]
imul r10, r11
mov qword[rbp-2695], r10
mov r10, qword [rbp-2703]
mov r11, qword [rbp-2695]
add r10, r11
mov qword[rbp-2711], r10
mov r10, qword [rbp-2711]
mov r11, qword [rbp-2591]
mov qword[r11], r10
mov r10, qword [rbp-2591]
mov r11,qword [r10]
mov qword[rbp-2719], r11
label#8:
mov r10, qword [rbp-2476]
mov qword[rbp-2551], r10
mov r10, qword [rbp-2476]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-2476], r10
jmp label#7
label#9:
mov r10, qword [rbp-2468]
mov qword[rbp-2494], r10
mov r10, qword [rbp-2468]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-2468], r10
jmp label#6
label#10:
mov r10, qword [rbp-2460]
mov qword[rbp-2485], r10
mov r10, qword [rbp-2460]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-2460], r10
jmp label#5
label#11:
mov r10, qword [const0]
mov qword[rbp-2460], r10
label#12:
mov r10, qword [rbp-2460]
mov r11, qword [rbp-2416]
cmp r10, r11
jl label#31
mov r10,0
jmp label#32
label#31:
mov r10,1
label#32:
mov byte[rbp-2495], r10b
mov r10b, byte [rbp-2495]
cmp r10, 0
je label#17
mov r10, qword [const0]
mov qword[rbp-2468], r10
label#13:
mov r10, qword [rbp-2468]
mov r11, qword [rbp-2416]
cmp r10, r11
jl label#33
mov r10,0
jmp label#34
label#33:
mov r10,1
label#34:
mov byte[rbp-2504], r10b
mov r10b, byte [rbp-2504]
cmp r10, 0
je label#15
mov r10d, dword[const5+0]
mov dword[rbp-2565+0], r10d
mov r10b, byte[const5+4]
mov byte[rbp-2565+4], r10b
lea r10, [rbp-2408]
mov qword [rbp-2520], r10
mov r10, qword [rbp-2460]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-2528], r10
mov r10, qword [rbp-2520]
mov r11, qword [rbp-2528]
add r10, r11
mov qword[rbp-2536], r10
mov r10, qword [rbp-2468]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-2544], r10
mov r10, qword [rbp-2536]
mov r11, qword [rbp-2544]
add r10, r11
mov qword[rbp-2552], r10
mov r10, qword [rbp-2552]
mov r11,qword [r10]
mov qword[rbp-2560], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2560]
lea rdi, [rbp-2565]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-2573], rax
add rsp,8
pop rax
label#14:
mov r10, qword [rbp-2468]
mov qword[rbp-2512], r10
mov r10, qword [rbp-2468]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-2468], r10
jmp label#13
label#15:
mov r10w, word[const6+0]
mov word[rbp-2575+0], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const1]
lea rdi, [rbp-2575]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-2583], rax
add rsp,8
pop rax
label#16:
mov r10, qword [rbp-2460]
mov qword[rbp-2503], r10
mov r10, qword [rbp-2460]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-2460], r10
jmp label#12
label#17:
;copy return value in rax
mov rax , qword[const0]
leave
ret
