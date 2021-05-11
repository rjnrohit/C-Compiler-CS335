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
const7 db "%ld %ld %ld",LF, NULL
const8 dq 100
const9 db "Invalid size1",LF, NULL
const10 db "Invalid size2",LF, NULL
const11 db "Invalid size3",LF, NULL
const12 db "Invalid size4",LF, NULL
const13 db "Invalid size5",LF, NULL
const14 db "Invalid size6",LF, NULL
const15 db "Invalid size7",LF, NULL
const16 db "%ld ", NULL
const17 db "",LF, NULL
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
sub rsp, 117
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
jl label#38
mov r10,0
jmp label#39
label#38:
mov r10,1
label#39:
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
jl label#40
mov r10,0
jmp label#41
label#40:
mov r10,1
label#41:
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
sub rsp, 240444
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
mov r10, qword[const7+0]
mov qword[rbp-148+0], r10
mov r10d, dword[const7+8]
mov dword[rbp-148+8], r10d
mov r10b, byte[const7+12]
mov byte[rbp-148+12], r10b
;preparing extern function printf3
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-148]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-156], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const8]
cmp r10, r11
jge label#42
mov r10,0
jmp label#43
label#42:
mov r10,1
label#43:
mov byte[rbp-157], r10b
mov r10b, byte [rbp-157]
cmp r10, 0
jne label#5
mov r10, qword [rbp-24]
mov r11, qword [const8]
cmp r10, r11
jge label#44
mov r10,0
jmp label#45
label#44:
mov r10,1
label#45:
mov byte[rbp-158], r10b
mov r10b, byte [rbp-158]
cmp r10, 0
jne label#5
mov r10, qword [const1]
mov byte[rbp-159], r10b
jmp label#6
label#5:
mov r10, qword [const2]
mov byte[rbp-159], r10b
label#6:
mov r10b, byte [rbp-159]
cmp r10, 0
jne label#7
mov r10, qword [rbp-32]
mov r11, qword [const8]
cmp r10, r11
jge label#46
mov r10,0
jmp label#47
label#46:
mov r10,1
label#47:
mov byte[rbp-160], r10b
mov r10b, byte [rbp-160]
cmp r10, 0
jne label#7
mov r10, qword [const1]
mov byte[rbp-161], r10b
jmp label#8
label#7:
mov r10, qword [const2]
mov byte[rbp-161], r10b
label#8:
mov r10b, byte [rbp-161]
cmp r10, 0
je label#9
mov r10, qword[const9+0]
mov qword[rbp-176+0], r10
mov r10d, dword[const9+8]
mov dword[rbp-176+8], r10d
mov r10w, word[const9+12]
mov word[rbp-176+12], r10w
mov r10b, byte[const9+14]
mov byte[rbp-176+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-176]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-184], rax
add rsp,8
pop rax
label#9:
mov r10, qword [rbp-32]
mov r11, qword [const8]
cmp r10, r11
jge label#48
mov r10,0
jmp label#49
label#48:
mov r10,1
label#49:
mov byte[rbp-185], r10b
mov r10b, byte [rbp-185]
cmp r10, 0
jne label#10
mov r10, qword [rbp-24]
mov r11, qword [const8]
cmp r10, r11
jge label#50
mov r10,0
jmp label#51
label#50:
mov r10,1
label#51:
mov byte[rbp-186], r10b
mov r10b, byte [rbp-186]
cmp r10, 0
jne label#10
mov r10, qword [const1]
mov byte[rbp-187], r10b
jmp label#11
label#10:
mov r10, qword [const2]
mov byte[rbp-187], r10b
label#11:
mov r10b, byte [rbp-187]
cmp r10, 0
je label#12
mov r10, qword[const10+0]
mov qword[rbp-202+0], r10
mov r10d, dword[const10+8]
mov dword[rbp-202+8], r10d
mov r10w, word[const10+12]
mov word[rbp-202+12], r10w
mov r10b, byte[const10+14]
mov byte[rbp-202+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-202]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-210], rax
add rsp,8
pop rax
label#12:
mov r10, qword [rbp-16]
mov r11, qword [const8]
cmp r10, r11
jge label#52
mov r10,0
jmp label#53
label#52:
mov r10,1
label#53:
mov byte[rbp-211], r10b
mov r10b, byte [rbp-211]
cmp r10, 0
jne label#13
mov r10, qword [rbp-24]
mov r11, qword [const8]
cmp r10, r11
jge label#54
mov r10,0
jmp label#55
label#54:
mov r10,1
label#55:
mov byte[rbp-212], r10b
mov r10b, byte [rbp-212]
cmp r10, 0
jne label#13
mov r10, qword [const1]
mov byte[rbp-213], r10b
jmp label#14
label#13:
mov r10, qword [const2]
mov byte[rbp-213], r10b
label#14:
mov r10b, byte [rbp-213]
cmp r10, 0
je label#15
mov r10, qword[const11+0]
mov qword[rbp-228+0], r10
mov r10d, dword[const11+8]
mov dword[rbp-228+8], r10d
mov r10w, word[const11+12]
mov word[rbp-228+12], r10w
mov r10b, byte[const11+14]
mov byte[rbp-228+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-228]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-236], rax
add rsp,8
pop rax
label#15:
mov r10, qword [rbp-24]
mov r11, qword [const8]
cmp r10, r11
jge label#56
mov r10,0
jmp label#57
label#56:
mov r10,1
label#57:
mov byte[rbp-237], r10b
mov r10b, byte [rbp-237]
cmp r10, 0
je label#16
mov r10, qword[const12+0]
mov qword[rbp-252+0], r10
mov r10d, dword[const12+8]
mov dword[rbp-252+8], r10d
mov r10w, word[const12+12]
mov word[rbp-252+12], r10w
mov r10b, byte[const12+14]
mov byte[rbp-252+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-252]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-260], rax
add rsp,8
pop rax
label#16:
mov r10, qword [rbp-16]
mov r11, qword [const8]
cmp r10, r11
jge label#58
mov r10,0
jmp label#59
label#58:
mov r10,1
label#59:
mov byte[rbp-261], r10b
mov r10b, byte [rbp-261]
cmp r10, 0
je label#17
mov r10, qword[const13+0]
mov qword[rbp-276+0], r10
mov r10d, dword[const13+8]
mov dword[rbp-276+8], r10d
mov r10w, word[const13+12]
mov word[rbp-276+12], r10w
mov r10b, byte[const13+14]
mov byte[rbp-276+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-276]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-284], rax
add rsp,8
pop rax
label#17:
mov r10, qword [rbp-32]
mov r11, qword [const8]
cmp r10, r11
jge label#60
mov r10,0
jmp label#61
label#60:
mov r10,1
label#61:
mov byte[rbp-285], r10b
mov r10b, byte [rbp-285]
cmp r10, 0
je label#18
mov r10, qword[const14+0]
mov qword[rbp-300+0], r10
mov r10d, dword[const14+8]
mov dword[rbp-300+8], r10d
mov r10w, word[const14+12]
mov word[rbp-300+12], r10w
mov r10b, byte[const14+14]
mov byte[rbp-300+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-300]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-308], rax
add rsp,8
pop rax
label#18:
mov r10, qword [rbp-16]
mov r11, qword [const8]
cmp r10, r11
jge label#62
mov r10,0
jmp label#63
label#62:
mov r10,1
label#63:
mov byte[rbp-309], r10b
mov r10b, byte [rbp-309]
cmp r10, 0
jne label#19
mov r10, qword [rbp-32]
mov r11, qword [const8]
cmp r10, r11
jge label#64
mov r10,0
jmp label#65
label#64:
mov r10,1
label#65:
mov byte[rbp-310], r10b
mov r10b, byte [rbp-310]
cmp r10, 0
jne label#19
mov r10, qword [const1]
mov byte[rbp-311], r10b
jmp label#20
label#19:
mov r10, qword [const2]
mov byte[rbp-311], r10b
label#20:
mov r10b, byte [rbp-311]
cmp r10, 0
je label#21
mov r10, qword[const15+0]
mov qword[rbp-326+0], r10
mov r10d, dword[const15+8]
mov dword[rbp-326+8], r10d
mov r10w, word[const15+12]
mov word[rbp-326+12], r10w
mov r10b, byte[const15+14]
mov byte[rbp-326+14], r10b
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-326]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-334], rax
add rsp,8
pop rax
label#21:
;copy return value in rax
mov rax , qword[const1]
leave
ret
lea r10, [rbp-80334]
mov qword [rbp-240342], r10
; saving arguments for call
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-240342]
call input_matrix@func
add rsp,0
lea r10, [rbp-160334]
mov qword [rbp-240350], r10
; saving arguments for call
mov rdx, qword [rbp-32]
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-240350]
call input_matrix@func
add rsp,0
mov r10, qword [const1]
mov qword[rbp-240358], r10
label#22:
mov r10, qword [rbp-240358]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#66
mov r10,0
jmp label#67
label#66:
mov r10,1
label#67:
mov byte[rbp-240375], r10b
mov r10b, byte [rbp-240375]
cmp r10, 0
je label#28
mov r10, qword [const1]
mov qword[rbp-240366], r10
label#23:
mov r10, qword [rbp-240366]
mov r11, qword [rbp-32]
cmp r10, r11
jl label#68
mov r10,0
jmp label#69
label#68:
mov r10,1
label#69:
mov byte[rbp-240392], r10b
mov r10b, byte [rbp-240392]
cmp r10, 0
je label#27
lea r10, [rbp-240334]
mov qword [rbp-240416], r10
mov r10, qword [rbp-240358]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240424], r10
mov r10, qword [rbp-240416]
mov r11, qword [rbp-240424]
add r10, r11
mov qword[rbp-240432], r10
mov r10, qword [rbp-240366]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240440], r10
mov r10, qword [rbp-240432]
mov r11, qword [rbp-240440]
add r10, r11
mov qword[rbp-240448], r10
mov r10, qword [const1]
mov r11, qword [rbp-240448]
mov qword[r11], r10
mov r10, qword [rbp-240448]
mov r11,qword [r10]
mov qword[rbp-240456], r11
mov r10, qword [const1]
mov qword[rbp-240374], r10
label#24:
mov r10, qword [rbp-240374]
mov r11, qword [rbp-24]
cmp r10, r11
jl label#70
mov r10,0
jmp label#71
label#70:
mov r10,1
label#71:
mov byte[rbp-240457], r10b
mov r10b, byte [rbp-240457]
cmp r10, 0
je label#26
lea r10, [rbp-240334]
mov qword [rbp-240481], r10
mov r10, qword [rbp-240358]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240489], r10
mov r10, qword [rbp-240481]
mov r11, qword [rbp-240489]
add r10, r11
mov qword[rbp-240497], r10
mov r10, qword [rbp-240366]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240505], r10
mov r10, qword [rbp-240497]
mov r11, qword [rbp-240505]
add r10, r11
mov qword[rbp-240513], r10
mov r10, qword [rbp-240513]
mov r11,qword [r10]
mov qword[rbp-240625], r11
lea r10, [rbp-80334]
mov qword [rbp-240521], r10
mov r10, qword [rbp-240358]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240529], r10
mov r10, qword [rbp-240521]
mov r11, qword [rbp-240529]
add r10, r11
mov qword[rbp-240537], r10
mov r10, qword [rbp-240374]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240545], r10
mov r10, qword [rbp-240537]
mov r11, qword [rbp-240545]
add r10, r11
mov qword[rbp-240553], r10
mov r10, qword [rbp-240553]
mov r11,qword [r10]
mov qword[rbp-240601], r11
lea r10, [rbp-160334]
mov qword [rbp-240561], r10
mov r10, qword [rbp-240374]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240569], r10
mov r10, qword [rbp-240561]
mov r11, qword [rbp-240569]
add r10, r11
mov qword[rbp-240577], r10
mov r10, qword [rbp-240366]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240585], r10
mov r10, qword [rbp-240577]
mov r11, qword [rbp-240585]
add r10, r11
mov qword[rbp-240593], r10
mov r10, qword [rbp-240593]
mov r11,qword [r10]
mov qword[rbp-240609], r11
mov r10, qword [rbp-240601]
mov r11, qword [rbp-240609]
imul r10, r11
mov qword[rbp-240617], r10
mov r10, qword [rbp-240625]
mov r11, qword [rbp-240617]
add r10, r11
mov qword[rbp-240633], r10
mov r10, qword [rbp-240633]
mov r11, qword [rbp-240513]
mov qword[r11], r10
mov r10, qword [rbp-240513]
mov r11,qword [r10]
mov qword[rbp-240641], r11
label#25:
mov r10, qword [rbp-240374]
mov qword[rbp-240465], r10
mov r10, qword [rbp-240374]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240473], r10
mov r10, qword [rbp-240473]
mov qword[rbp-240374], r10
jmp label#24
label#26:
mov r10, qword [rbp-240366]
mov qword[rbp-240400], r10
mov r10, qword [rbp-240366]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240408], r10
mov r10, qword [rbp-240408]
mov qword[rbp-240366], r10
jmp label#23
label#27:
mov r10, qword [rbp-240358]
mov qword[rbp-240383], r10
mov r10, qword [rbp-240358]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240391], r10
mov r10, qword [rbp-240391]
mov qword[rbp-240358], r10
jmp label#22
label#28:
mov r10, qword [const1]
mov qword[rbp-240358], r10
label#29:
mov r10, qword [rbp-240358]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#72
mov r10,0
jmp label#73
label#72:
mov r10,1
label#73:
mov byte[rbp-240409], r10b
mov r10b, byte [rbp-240409]
cmp r10, 0
je label#34
mov r10, qword [const1]
mov qword[rbp-240366], r10
label#30:
mov r10, qword [rbp-240366]
mov r11, qword [rbp-32]
cmp r10, r11
jl label#74
mov r10,0
jmp label#75
label#74:
mov r10,1
label#75:
mov byte[rbp-240426], r10b
mov r10b, byte [rbp-240426]
cmp r10, 0
je label#32
mov r10d, dword[const16+0]
mov dword[rbp-240495+0], r10d
mov r10b, byte[const16+4]
mov byte[rbp-240495+4], r10b
lea r10, [rbp-240334]
mov qword [rbp-240450], r10
mov r10, qword [rbp-240358]
mov r11, qword [const3]
imul r10, r11
mov qword[rbp-240458], r10
mov r10, qword [rbp-240450]
mov r11, qword [rbp-240458]
add r10, r11
mov qword[rbp-240466], r10
mov r10, qword [rbp-240366]
mov r11, qword [const4]
imul r10, r11
mov qword[rbp-240474], r10
mov r10, qword [rbp-240466]
mov r11, qword [rbp-240474]
add r10, r11
mov qword[rbp-240482], r10
mov r10, qword [rbp-240482]
mov r11,qword [r10]
mov qword[rbp-240490], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-240490]
lea rdi, [rbp-240495]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-240503], rax
add rsp,8
pop rax
label#31:
mov r10, qword [rbp-240366]
mov qword[rbp-240434], r10
mov r10, qword [rbp-240366]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240442], r10
mov r10, qword [rbp-240442]
mov qword[rbp-240366], r10
jmp label#30
label#32:
mov r10w, word[const17+0]
mov word[rbp-240505+0], r10w
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-240505]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-240513], rax
add rsp,8
pop rax
label#33:
mov r10, qword [rbp-240358]
mov qword[rbp-240417], r10
mov r10, qword [rbp-240358]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-240425], r10
mov r10, qword [rbp-240425]
mov qword[rbp-240358], r10
jmp label#29
label#34:
leave
ret
