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
const0 db "Enter operator in {+,-,/,*,%%,&,|,^,>,<,!,~} or 1-8 for {<<,>>,<=,>=,!=,==,&&,||}: ", NULL
const1 db "%c", NULL
const2 db "Enter 2 numbers",LF, NULL
const3 db "%ld", NULL
const4 dq 43
const5 db "ans: %ld",LF, NULL
const6 dq 45
const7 dq 47
const8 dq 42
const9 dq 37
const10 dq 38
const11 dq 124
const12 dq 94
const13 dq 62
const14 dq 60
const15 dq 33
const16 dq 126
const17 dq 49
const18 dq 50
const19 dq 51
const20 dq 52
const21 dq 53
const22 dq 54
const23 dq 55
const24 dq 1
const25 dq 0
const26 dq 56
const27 db "Wrong operator",LF, NULL
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
sub rsp, 766
mov r10, qword[const0+0]
mov qword[rbp-93+0], r10
mov r10, qword[const0+8]
mov qword[rbp-93+8], r10
mov r10, qword[const0+16]
mov qword[rbp-93+16], r10
mov r10, qword[const0+24]
mov qword[rbp-93+24], r10
mov r10, qword[const0+32]
mov qword[rbp-93+32], r10
mov r10, qword[const0+40]
mov qword[rbp-93+40], r10
mov r10, qword[const0+48]
mov qword[rbp-93+48], r10
mov r10, qword[const0+56]
mov qword[rbp-93+56], r10
mov r10, qword[const0+64]
mov qword[rbp-93+64], r10
mov r10, qword[const0+72]
mov qword[rbp-93+72], r10
mov r10d, dword[const0+80]
mov dword[rbp-93+80], r10d
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
mov r10w, word[const1+0]
mov word[rbp-112+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-112+2], r10b
lea r10, [rbp-9]
mov qword [rbp-109], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-109]
lea rdi, [rbp-112]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-120], rax
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-153+0], r10
mov r10, qword[const2+8]
mov qword[rbp-153+8], r10
mov r10b, byte[const2+16]
mov byte[rbp-153+16], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-153]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-161], rax
add rsp,8
pop rax
mov r10d, dword[const3+0]
mov dword[rbp-173+0], r10d
lea r10, [rbp-128]
mov qword [rbp-169], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-169]
lea rdi, [rbp-173]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-181], rax
add rsp,8
pop rax
mov r10d, dword[const3+0]
mov dword[rbp-193+0], r10d
lea r10, [rbp-136]
mov qword [rbp-189], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-189]
lea rdi, [rbp-193]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-201], rax
add rsp,8
pop rax
mov r10b, byte [rbp-9]
mov r11, qword [const4]
cmp r10, r11
je label#44
mov r10,0
jmp label#45
label#44:
mov r10,1
label#45:
mov byte[rbp-202], r10b
mov r10b, byte [rbp-202]
cmp r10, 0
je label#0
mov r10, qword[const5+0]
mov qword[rbp-220+0], r10
mov r10w, word[const5+8]
mov word[rbp-220+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
add r10, r11
mov qword[rbp-210], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-210]
lea rdi, [rbp-220]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-228], rax
add rsp,8
pop rax
jmp label#24
label#0:
mov r10b, byte [rbp-9]
mov r11, qword [const6]
cmp r10, r11
je label#46
mov r10,0
jmp label#47
label#46:
mov r10,1
label#47:
mov byte[rbp-229], r10b
mov r10b, byte [rbp-229]
cmp r10, 0
je label#1
mov r10, qword[const5+0]
mov qword[rbp-247+0], r10
mov r10w, word[const5+8]
mov word[rbp-247+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
sub r10, r11
mov qword[rbp-237], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-237]
lea rdi, [rbp-247]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-255], rax
add rsp,8
pop rax
jmp label#24
label#1:
mov r10b, byte [rbp-9]
mov r11, qword [const7]
cmp r10, r11
je label#48
mov r10,0
jmp label#49
label#48:
mov r10,1
label#49:
mov byte[rbp-256], r10b
mov r10b, byte [rbp-256]
cmp r10, 0
je label#2
mov r10, qword[const5+0]
mov qword[rbp-274+0], r10
mov r10w, word[const5+8]
mov word[rbp-274+8], r10w
push rax
mov rax, qword[rbp-128]
cqo
idiv qword[rbp-136]
mov qword[rbp-264], rax
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-264]
lea rdi, [rbp-274]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-282], rax
add rsp,8
pop rax
jmp label#24
label#2:
mov r10b, byte [rbp-9]
mov r11, qword [const8]
cmp r10, r11
je label#50
mov r10,0
jmp label#51
label#50:
mov r10,1
label#51:
mov byte[rbp-283], r10b
mov r10b, byte [rbp-283]
cmp r10, 0
je label#3
mov r10, qword[const5+0]
mov qword[rbp-301+0], r10
mov r10w, word[const5+8]
mov word[rbp-301+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
imul r10, r11
mov qword[rbp-291], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-291]
lea rdi, [rbp-301]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-309], rax
add rsp,8
pop rax
jmp label#24
label#3:
mov r10b, byte [rbp-9]
mov r11, qword [const9]
cmp r10, r11
je label#52
mov r10,0
jmp label#53
label#52:
mov r10,1
label#53:
mov byte[rbp-310], r10b
mov r10b, byte [rbp-310]
cmp r10, 0
je label#4
mov r10, qword[const5+0]
mov qword[rbp-328+0], r10
mov r10w, word[const5+8]
mov word[rbp-328+8], r10w
push rax
mov rax, qword[rbp-128]
cqo
idiv qword[rbp-136]
mov qword[rbp-318], rdx
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-318]
lea rdi, [rbp-328]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-336], rax
add rsp,8
pop rax
jmp label#24
label#4:
mov r10b, byte [rbp-9]
mov r11, qword [const10]
cmp r10, r11
je label#54
mov r10,0
jmp label#55
label#54:
mov r10,1
label#55:
mov byte[rbp-337], r10b
mov r10b, byte [rbp-337]
cmp r10, 0
je label#5
mov r10, qword[const5+0]
mov qword[rbp-355+0], r10
mov r10w, word[const5+8]
mov word[rbp-355+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-345]
lea rdi, [rbp-355]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-363], rax
add rsp,8
pop rax
jmp label#24
label#5:
mov r10b, byte [rbp-9]
mov r11, qword [const11]
cmp r10, r11
je label#56
mov r10,0
jmp label#57
label#56:
mov r10,1
label#57:
mov byte[rbp-364], r10b
mov r10b, byte [rbp-364]
cmp r10, 0
je label#6
mov r10, qword[const5+0]
mov qword[rbp-382+0], r10
mov r10w, word[const5+8]
mov word[rbp-382+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-372]
lea rdi, [rbp-382]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-390], rax
add rsp,8
pop rax
jmp label#24
label#6:
mov r10b, byte [rbp-9]
mov r11, qword [const12]
cmp r10, r11
je label#58
mov r10,0
jmp label#59
label#58:
mov r10,1
label#59:
mov byte[rbp-391], r10b
mov r10b, byte [rbp-391]
cmp r10, 0
je label#7
mov r10, qword[const5+0]
mov qword[rbp-409+0], r10
mov r10w, word[const5+8]
mov word[rbp-409+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-399]
lea rdi, [rbp-409]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-417], rax
add rsp,8
pop rax
jmp label#24
label#7:
mov r10b, byte [rbp-9]
mov r11, qword [const13]
cmp r10, r11
je label#60
mov r10,0
jmp label#61
label#60:
mov r10,1
label#61:
mov byte[rbp-418], r10b
mov r10b, byte [rbp-418]
cmp r10, 0
je label#8
mov r10, qword[const5+0]
mov qword[rbp-429+0], r10
mov r10w, word[const5+8]
mov word[rbp-429+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
cmp r10, r11
jg label#62
mov r10,0
jmp label#63
label#62:
mov r10,1
label#63:
mov byte[rbp-419], r10b
mov r10b, byte [rbp-419]
mov qword[rbp-437], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-437]
lea rdi, [rbp-429]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-445], rax
add rsp,8
pop rax
jmp label#24
label#8:
mov r10b, byte [rbp-9]
mov r11, qword [const14]
cmp r10, r11
je label#64
mov r10,0
jmp label#65
label#64:
mov r10,1
label#65:
mov byte[rbp-446], r10b
mov r10b, byte [rbp-446]
cmp r10, 0
je label#9
mov r10, qword[const5+0]
mov qword[rbp-457+0], r10
mov r10w, word[const5+8]
mov word[rbp-457+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
cmp r10, r11
jl label#66
mov r10,0
jmp label#67
label#66:
mov r10,1
label#67:
mov byte[rbp-447], r10b
mov r10b, byte [rbp-447]
mov qword[rbp-465], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-465]
lea rdi, [rbp-457]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-473], rax
add rsp,8
pop rax
jmp label#24
label#9:
mov r10b, byte [rbp-9]
mov r11, qword [const15]
cmp r10, r11
je label#68
mov r10,0
jmp label#69
label#68:
mov r10,1
label#69:
mov byte[rbp-474], r10b
mov r10b, byte [rbp-474]
cmp r10, 0
je label#10
mov r10, qword[const5+0]
mov qword[rbp-485+0], r10
mov r10w, word[const5+8]
mov word[rbp-485+8], r10w
mov r10, qword [rbp-128]
cmp r10, 0
je label#70
mov r10,0
jmp label#71
label#70:
mov r10,1
label#71:
mov byte[rbp-475], r10b
mov r10b, byte [rbp-475]
mov qword[rbp-493], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-493]
lea rdi, [rbp-485]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-501], rax
add rsp,8
pop rax
jmp label#24
label#10:
mov r10b, byte [rbp-9]
mov r11, qword [const16]
cmp r10, r11
je label#72
mov r10,0
jmp label#73
label#72:
mov r10,1
label#73:
mov byte[rbp-502], r10b
mov r10b, byte [rbp-502]
cmp r10, 0
je label#11
mov r10, qword[const5+0]
mov qword[rbp-520+0], r10
mov r10w, word[const5+8]
mov word[rbp-520+8], r10w
mov r10, qword [rbp-128]
not r11
mov qword[rbp-510], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-510]
lea rdi, [rbp-520]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-528], rax
add rsp,8
pop rax
jmp label#24
label#11:
mov r10b, byte [rbp-9]
mov r11, qword [const17]
cmp r10, r11
je label#74
mov r10,0
jmp label#75
label#74:
mov r10,1
label#75:
mov byte[rbp-529], r10b
mov r10b, byte [rbp-529]
cmp r10, 0
je label#12
mov r10, qword[const5+0]
mov qword[rbp-547+0], r10
mov r10w, word[const5+8]
mov word[rbp-547+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
mov cl,r11b
shl r10, cl
mov qword[rbp-537], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-537]
lea rdi, [rbp-547]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-555], rax
add rsp,8
pop rax
jmp label#24
label#12:
mov r10b, byte [rbp-9]
mov r11, qword [const18]
cmp r10, r11
je label#76
mov r10,0
jmp label#77
label#76:
mov r10,1
label#77:
mov byte[rbp-556], r10b
mov r10b, byte [rbp-556]
cmp r10, 0
je label#13
mov r10, qword[const5+0]
mov qword[rbp-574+0], r10
mov r10w, word[const5+8]
mov word[rbp-574+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
mov cl,r11b
shr r10, cl
mov qword[rbp-564], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-564]
lea rdi, [rbp-574]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-582], rax
add rsp,8
pop rax
jmp label#24
label#13:
mov r10b, byte [rbp-9]
mov r11, qword [const19]
cmp r10, r11
je label#78
mov r10,0
jmp label#79
label#78:
mov r10,1
label#79:
mov byte[rbp-583], r10b
mov r10b, byte [rbp-583]
cmp r10, 0
je label#14
mov r10, qword[const5+0]
mov qword[rbp-594+0], r10
mov r10w, word[const5+8]
mov word[rbp-594+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
cmp r10, r11
jle label#80
mov r10,0
jmp label#81
label#80:
mov r10,1
label#81:
mov byte[rbp-584], r10b
mov r10b, byte [rbp-584]
mov qword[rbp-602], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-602]
lea rdi, [rbp-594]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-610], rax
add rsp,8
pop rax
jmp label#24
label#14:
mov r10b, byte [rbp-9]
mov r11, qword [const20]
cmp r10, r11
je label#82
mov r10,0
jmp label#83
label#82:
mov r10,1
label#83:
mov byte[rbp-611], r10b
mov r10b, byte [rbp-611]
cmp r10, 0
je label#15
mov r10, qword[const5+0]
mov qword[rbp-622+0], r10
mov r10w, word[const5+8]
mov word[rbp-622+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
cmp r10, r11
jge label#84
mov r10,0
jmp label#85
label#84:
mov r10,1
label#85:
mov byte[rbp-612], r10b
mov r10b, byte [rbp-612]
mov qword[rbp-630], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-630]
lea rdi, [rbp-622]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-638], rax
add rsp,8
pop rax
jmp label#24
label#15:
mov r10b, byte [rbp-9]
mov r11, qword [const21]
cmp r10, r11
je label#86
mov r10,0
jmp label#87
label#86:
mov r10,1
label#87:
mov byte[rbp-639], r10b
mov r10b, byte [rbp-639]
cmp r10, 0
je label#16
mov r10, qword[const5+0]
mov qword[rbp-650+0], r10
mov r10w, word[const5+8]
mov word[rbp-650+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
cmp r10, r11
jne label#88
mov r10,0
jmp label#89
label#88:
mov r10,1
label#89:
mov byte[rbp-640], r10b
mov r10b, byte [rbp-640]
mov qword[rbp-658], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-658]
lea rdi, [rbp-650]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-666], rax
add rsp,8
pop rax
jmp label#24
label#16:
mov r10b, byte [rbp-9]
mov r11, qword [const22]
cmp r10, r11
je label#90
mov r10,0
jmp label#91
label#90:
mov r10,1
label#91:
mov byte[rbp-667], r10b
mov r10b, byte [rbp-667]
cmp r10, 0
je label#17
mov r10, qword[const5+0]
mov qword[rbp-678+0], r10
mov r10w, word[const5+8]
mov word[rbp-678+8], r10w
mov r10, qword [rbp-128]
mov r11, qword [rbp-136]
cmp r10, r11
je label#92
mov r10,0
jmp label#93
label#92:
mov r10,1
label#93:
mov byte[rbp-668], r10b
mov r10b, byte [rbp-668]
mov qword[rbp-686], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-686]
lea rdi, [rbp-678]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-694], rax
add rsp,8
pop rax
jmp label#24
label#17:
mov r10b, byte [rbp-9]
mov r11, qword [const23]
cmp r10, r11
je label#94
mov r10,0
jmp label#95
label#94:
mov r10,1
label#95:
mov byte[rbp-695], r10b
mov r10b, byte [rbp-695]
cmp r10, 0
je label#20
mov r10, qword[const5+0]
mov qword[rbp-706+0], r10
mov r10w, word[const5+8]
mov word[rbp-706+8], r10w
mov r10, qword [rbp-128]
cmp r10, 0
je label#18
mov r10, qword [rbp-136]
cmp r10, 0
je label#18
mov r10, qword [const24]
mov byte[rbp-696], r10b
jmp label#19
label#18:
mov r10, qword [const25]
mov byte[rbp-696], r10b
label#19:
mov r10b, byte [rbp-696]
mov qword[rbp-714], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-714]
lea rdi, [rbp-706]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-722], rax
add rsp,8
pop rax
jmp label#24
label#20:
mov r10b, byte [rbp-9]
mov r11, qword [const26]
cmp r10, r11
je label#96
mov r10,0
jmp label#97
label#96:
mov r10,1
label#97:
mov byte[rbp-723], r10b
mov r10b, byte [rbp-723]
cmp r10, 0
je label#23
mov r10, qword[const5+0]
mov qword[rbp-734+0], r10
mov r10w, word[const5+8]
mov word[rbp-734+8], r10w
mov r10, qword [rbp-128]
cmp r10, 0
jne label#21
mov r10, qword [rbp-136]
cmp r10, 0
jne label#21
mov r10, qword [const25]
mov byte[rbp-724], r10b
jmp label#22
label#21:
mov r10, qword [const24]
mov byte[rbp-724], r10b
label#22:
mov r10b, byte [rbp-724]
mov qword[rbp-742], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-742]
lea rdi, [rbp-734]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-750], rax
add rsp,8
pop rax
jmp label#24
label#23:
mov r10, qword[const27+0]
mov qword[rbp-766+0], r10
mov r10, qword[const27+8]
mov qword[rbp-766+8], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-766]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-774], rax
add rsp,8
pop rax
label#24:
;copy return value in rax
mov rax , qword[const25]
leave
ret
