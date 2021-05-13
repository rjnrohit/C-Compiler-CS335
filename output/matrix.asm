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
const0 db "give matrix input of size %ldx%ld",LF, NULL
const1 dq 0
const2 dq 1
const3 dq 800
const4 dq 8
const5 db "%ld", NULL
const6 db "Enter matrix size (less than 100)",LF, NULL
const7 dq 100
const8 db "Invalid size",LF, NULL
const9 db "%ld ", NULL
const10 db "",LF, NULL
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
global input_matrix@func
input_matrix@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
sub rsp, 8
mov qword [rsp],rdx
;add space for symbols
sub rsp, 93
mov r10, qword[const0+0]
mov qword[rbp-59+0], r10
mov r10, qword[const0+8]
mov qword[rbp-59+8], r10
mov r10, qword[const0+16]
mov qword[rbp-59+16], r10
mov r10, qword[const0+24]
mov qword[rbp-59+24], r10
mov r10w, word[const0+32]
mov word[rbp-59+32], r10w
mov r10b, byte[const0+34]
mov byte[rbp-59+34], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-59]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-67], rax
add rsp,8
pop rax
mov r10, qword [const1]
mov qword[rbp-75], r10
label#0:
mov r10, qword [rbp-75]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#26
mov r10,0
jmp label#27
label#26:
mov r10,1
label#27:
mov byte[rbp-84], r10b
mov r10b, byte [rbp-84]
cmp r10, 0
je label#4
mov r10, qword [const1]
mov qword[rbp-83], r10
label#1:
mov r10, qword [rbp-83]
mov r11, qword [rbp-24]
cmp r10, r11
jl label#28
mov r10,0
jmp label#29
label#28:
mov r10,1
label#29:
mov byte[rbp-101], r10b
mov r10b, byte [rbp-101]
cmp r10, 0
je label#3
mov r10d, dword[const5+0]
mov dword[rbp-153+0], r10d
mov r10, qword [rbp-75]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-125], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-125]
add r10, r11
mov qword[rbp-133], r10
mov r10, qword [rbp-83]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-141], r10
mov r10, qword [rbp-133]
mov r11, qword [rbp-141]
add r10, r11
mov qword[rbp-149], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-149]
lea rdi, [rbp-153]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-161], rax
add rsp,8
pop rax
label#2:
mov r10, qword [rbp-83]
mov qword[rbp-109], r10
mov r10, qword [rbp-83]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-117], r10
mov r10, qword [rbp-117]
mov qword[rbp-83], r10
jmp label#1
label#3:
mov r10, qword [rbp-75]
mov qword[rbp-92], r10
mov r10, qword [rbp-75]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-100], r10
mov r10, qword [rbp-100]
mov qword[rbp-75], r10
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
sub rsp, 240272
mov r10, qword[const6+0]
mov qword[rbp-67+0], r10
mov r10, qword[const6+8]
mov qword[rbp-67+8], r10
mov r10, qword[const6+16]
mov qword[rbp-67+16], r10
mov r10, qword[const6+24]
mov qword[rbp-67+24], r10
mov r10w, word[const6+32]
mov word[rbp-67+32], r10w
mov r10b, byte[const6+34]
mov byte[rbp-67+34], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-67]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-75], rax
add rsp,8
pop rax
mov r10d, dword[const5+0]
mov dword[rbp-87+0], r10d
lea r10, [rbp-16]
mov qword [rbp-83], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-83]
lea rdi, [rbp-87]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-95], rax
add rsp,8
pop rax
mov r10d, dword[const5+0]
mov dword[rbp-107+0], r10d
lea r10, [rbp-24]
mov qword [rbp-103], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-103]
lea rdi, [rbp-107]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-115], rax
add rsp,8
pop rax
mov r10d, dword[const5+0]
mov dword[rbp-127+0], r10d
lea r10, [rbp-32]
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
;copy return value from rax
mov qword[rbp-135], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const7]
cmp r10, r11
jge label#30
mov r10,0
jmp label#31
label#30:
mov r10,1
label#31:
mov byte[rbp-136], r10b
mov r10b, byte [rbp-136]
cmp r10, 0
jne label#5
mov r10, qword [rbp-24]
mov r11, qword [const7]
cmp r10, r11
jge label#32
mov r10,0
jmp label#33
label#32:
mov r10,1
label#33:
mov byte[rbp-137], r10b
mov r10b, byte [rbp-137]
cmp r10, 0
jne label#5
mov r10, qword [const1]
mov byte[rbp-138], r10b
jmp label#6
label#5:
mov r10, qword [const2]
mov byte[rbp-138], r10b
label#6:
mov r10b, byte [rbp-138]
cmp r10, 0
jne label#7
mov r10, qword [rbp-32]
mov r11, qword [const7]
cmp r10, r11
jge label#34
mov r10,0
jmp label#35
label#34:
mov r10,1
label#35:
mov byte[rbp-139], r10b
mov r10b, byte [rbp-139]
cmp r10, 0
jne label#7
mov r10, qword [const1]
mov byte[rbp-140], r10b
jmp label#8
label#7:
mov r10, qword [const2]
mov byte[rbp-140], r10b
label#8:
mov r10b, byte [rbp-140]
cmp r10, 0
je label#9
mov r10, qword[const8+0]
mov qword[rbp-154+0], r10
mov r10d, dword[const8+8]
mov dword[rbp-154+8], r10d
mov r10w, word[const8+12]
mov word[rbp-154+12], r10w
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-154]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-162], rax
add rsp,8
pop rax
label#9:
lea r10, [rbp-80162]
mov qword [rbp-240170], r10
; saving arguments for call
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-240170]
call input_matrix@func
add rsp,0
lea r10, [rbp-160162]
mov qword [rbp-240178], r10
; saving arguments for call
mov rdx, qword [rbp-32]
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-240178]
call input_matrix@func
add rsp,0
mov r10, qword [const1]
mov qword[rbp-240186], r10
label#10:
mov r10, qword [rbp-240186]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#36
mov r10,0
jmp label#37
label#36:
mov r10,1
label#37:
mov byte[rbp-240203], r10b
mov r10b, byte [rbp-240203]
cmp r10, 0
je label#16
mov r10, qword [const1]
mov qword[rbp-240194], r10
label#11:
mov r10, qword [rbp-240194]
mov r11, qword [rbp-32]
cmp r10, r11
jl label#38
mov r10,0
jmp label#39
label#38:
mov r10,1
label#39:
mov byte[rbp-240220], r10b
mov r10b, byte [rbp-240220]
cmp r10, 0
je label#15
lea r10, [rbp-240162]
mov qword [rbp-240244], r10
mov r10, qword [rbp-240186]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240252], r10
mov r10, qword [rbp-240244]
mov r11, qword [rbp-240252]
add r10, r11
mov qword[rbp-240260], r10
mov r10, qword [rbp-240194]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240268], r10
mov r10, qword [rbp-240260]
mov r11, qword [rbp-240268]
add r10, r11
mov qword[rbp-240276], r10
mov r10, qword [const1]
mov r11, qword [rbp-240276]
mov qword[r11], r10
mov r10, qword [rbp-240276]
mov r11,qword [r10]
mov qword[rbp-240284], r11
mov r10, qword [const1]
mov qword[rbp-240202], r10
label#12:
mov r10, qword [rbp-240202]
mov r11, qword [rbp-24]
cmp r10, r11
jl label#40
mov r10,0
jmp label#41
label#40:
mov r10,1
label#41:
mov byte[rbp-240285], r10b
mov r10b, byte [rbp-240285]
cmp r10, 0
je label#14
lea r10, [rbp-240162]
mov qword [rbp-240309], r10
mov r10, qword [rbp-240186]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240317], r10
mov r10, qword [rbp-240309]
mov r11, qword [rbp-240317]
add r10, r11
mov qword[rbp-240325], r10
mov r10, qword [rbp-240194]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240333], r10
mov r10, qword [rbp-240325]
mov r11, qword [rbp-240333]
add r10, r11
mov qword[rbp-240341], r10
mov r10, qword [rbp-240341]
mov r11,qword [r10]
mov qword[rbp-240453], r11
lea r10, [rbp-80162]
mov qword [rbp-240349], r10
mov r10, qword [rbp-240186]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240357], r10
mov r10, qword [rbp-240349]
mov r11, qword [rbp-240357]
add r10, r11
mov qword[rbp-240365], r10
mov r10, qword [rbp-240202]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240373], r10
mov r10, qword [rbp-240365]
mov r11, qword [rbp-240373]
add r10, r11
mov qword[rbp-240381], r10
mov r10, qword [rbp-240381]
mov r11,qword [r10]
mov qword[rbp-240429], r11
lea r10, [rbp-160162]
mov qword [rbp-240389], r10
mov r10, qword [rbp-240202]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240397], r10
mov r10, qword [rbp-240389]
mov r11, qword [rbp-240397]
add r10, r11
mov qword[rbp-240405], r10
mov r10, qword [rbp-240194]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240413], r10
mov r10, qword [rbp-240405]
mov r11, qword [rbp-240413]
add r10, r11
mov qword[rbp-240421], r10
mov r10, qword [rbp-240421]
mov r11,qword [r10]
mov qword[rbp-240437], r11
mov r10, qword [rbp-240429]
mov r11, qword [rbp-240437]
imul r10, r11
mov qword[rbp-240445], r10
mov r10, qword [rbp-240453]
mov r11, qword [rbp-240445]
add r10, r11
mov qword[rbp-240461], r10
mov r10, qword [rbp-240461]
mov r11, qword [rbp-240341]
mov qword[r11], r10
mov r10, qword [rbp-240341]
mov r11,qword [r10]
mov qword[rbp-240469], r11
label#13:
mov r10, qword [rbp-240202]
mov qword[rbp-240293], r10
mov r10, qword [rbp-240202]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240301], r10
mov r10, qword [rbp-240301]
mov qword[rbp-240202], r10
jmp label#12
label#14:
mov r10, qword [rbp-240194]
mov qword[rbp-240228], r10
mov r10, qword [rbp-240194]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240236], r10
mov r10, qword [rbp-240236]
mov qword[rbp-240194], r10
jmp label#11
label#15:
mov r10, qword [rbp-240186]
mov qword[rbp-240211], r10
mov r10, qword [rbp-240186]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240219], r10
mov r10, qword [rbp-240219]
mov qword[rbp-240186], r10
jmp label#10
label#16:
mov r10, qword [const1]
mov qword[rbp-240186], r10
label#17:
mov r10, qword [rbp-240186]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#42
mov r10,0
jmp label#43
label#42:
mov r10,1
label#43:
mov byte[rbp-240237], r10b
mov r10b, byte [rbp-240237]
cmp r10, 0
je label#22
mov r10, qword [const1]
mov qword[rbp-240194], r10
label#18:
mov r10, qword [rbp-240194]
mov r11, qword [rbp-32]
cmp r10, r11
jl label#44
mov r10,0
jmp label#45
label#44:
mov r10,1
label#45:
mov byte[rbp-240254], r10b
mov r10b, byte [rbp-240254]
cmp r10, 0
je label#20
mov r10d, dword[const9+0]
mov dword[rbp-240323+0], r10d
mov r10b, byte[const9+4]
mov byte[rbp-240323+4], r10b
lea r10, [rbp-240162]
mov qword [rbp-240278], r10
mov r10, qword [rbp-240186]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240286], r10
mov r10, qword [rbp-240278]
mov r11, qword [rbp-240286]
add r10, r11
mov qword[rbp-240294], r10
mov r10, qword [rbp-240194]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240302], r10
mov r10, qword [rbp-240294]
mov r11, qword [rbp-240302]
add r10, r11
mov qword[rbp-240310], r10
mov r10, qword [rbp-240310]
mov r11,qword [r10]
mov qword[rbp-240318], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-240318]
lea rdi, [rbp-240323]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-240331], rax
add rsp,8
pop rax
label#19:
mov r10, qword [rbp-240194]
mov qword[rbp-240262], r10
mov r10, qword [rbp-240194]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240270], r10
mov r10, qword [rbp-240270]
mov qword[rbp-240194], r10
jmp label#18
label#20:
mov r10w, word[const10+0]
mov word[rbp-240333+0], r10w
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-240333]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-240341], rax
add rsp,8
pop rax
label#21:
mov r10, qword [rbp-240186]
mov qword[rbp-240245], r10
mov r10, qword [rbp-240186]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240253], r10
mov r10, qword [rbp-240253]
mov qword[rbp-240186], r10
jmp label#17
label#22:
leave
ret
