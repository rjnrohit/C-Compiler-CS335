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
const0 dq 8
const1 dq 1
const2 dq 0
<<<<<<< HEAD
const3 db "%ld", NULL
const4 dq 50
const5 db "array size should be less than 50", NULL
const6 db "%ld ", NULL
const7 db "",LF, NULL
||||||| 35696b8
const3 dq 1
const4 dq 2
const5 dd -10.0
const6 dd 0.001
const7 dq 100
const8 db "%f",LF, NULL
=======
const3 dq 1
const4 dd -10.0
const5 dd 0.001
const6 dq 100
const7 db "%f",LF, NULL
>>>>>>> 9dbe9d0966d6fe19747bb1b4adbbae43710c2434
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
global quicksort@func
quicksort@func:
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
sub rsp, 303
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
cmp r10, r11
jge label#17
mov r10,0
jmp label#18
label#17:
mov r10,1
label#18:
mov byte[rbp-57], r10b
mov r10b, byte [rbp-57]
cmp r10, 0
je label#0
xor rax, rax
leave
ret
label#0:
mov r10, qword [rbp-16]
mov qword[rbp-48], r10
mov r10, qword [rbp-16]
mov qword[rbp-32], r10
mov r10, qword [rbp-24]
mov qword[rbp-40], r10
label#1:
mov r10, qword [rbp-32]
mov r11, qword [rbp-40]
cmp r10, r11
jl label#19
mov r10,0
jmp label#20
label#19:
mov r10,1
label#20:
mov byte[rbp-58], r10b
mov r10b, byte [rbp-58]
cmp r10, 0
je label#8
label#2:
mov r10, qword [rbp-32]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-66], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-66]
add r10, r11
mov qword[rbp-74], r10
mov r10, qword [rbp-74]
mov r11,qword [r10]
mov qword[rbp-98], r11
mov r10, qword [rbp-48]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-82], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-82]
add r10, r11
mov qword[rbp-90], r10
mov r10, qword [rbp-90]
mov r11,qword [r10]
mov qword[rbp-106], r11
mov r10, qword [rbp-98]
mov r11, qword [rbp-106]
cmp r10, r11
jle label#21
mov r10,0
jmp label#22
label#21:
mov r10,1
label#22:
mov byte[rbp-107], r10b
mov r10b, byte [rbp-107]
cmp r10, 0
je label#3
mov r10, qword [rbp-32]
mov r11, qword [rbp-24]
cmp r10, r11
jl label#23
mov r10,0
jmp label#24
label#23:
mov r10,1
label#24:
mov byte[rbp-108], r10b
mov r10b, byte [rbp-108]
cmp r10, 0
je label#3
mov r10, qword [const1]
mov byte[rbp-109], r10b
jmp label#4
label#3:
mov r10, qword [const2]
mov byte[rbp-109], r10b
label#4:
mov r10b, byte [rbp-109]
cmp r10, 0
je label#5
mov r10, qword [rbp-32]
mov qword[rbp-117], r10
mov r10, qword [rbp-32]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-125], r10
mov r10, qword [rbp-125]
mov qword[rbp-32], r10
jmp label#2
label#5:
mov r10, qword [rbp-40]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-133], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-133]
add r10, r11
mov qword[rbp-141], r10
mov r10, qword [rbp-141]
mov r11,qword [r10]
mov qword[rbp-165], r11
mov r10, qword [rbp-48]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-149], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-149]
add r10, r11
mov qword[rbp-157], r10
mov r10, qword [rbp-157]
mov r11,qword [r10]
mov qword[rbp-173], r11
mov r10, qword [rbp-165]
mov r11, qword [rbp-173]
cmp r10, r11
jg label#25
mov r10,0
jmp label#26
label#25:
mov r10,1
label#26:
mov byte[rbp-174], r10b
mov r10b, byte [rbp-174]
cmp r10, 0
je label#6
mov r10, qword [rbp-40]
mov qword[rbp-182], r10
mov r10, qword [rbp-40]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-190], r10
mov r10, qword [rbp-190]
mov qword[rbp-40], r10
jmp label#5
label#6:
mov r10, qword [rbp-32]
mov r11, qword [rbp-40]
cmp r10, r11
jl label#27
mov r10,0
jmp label#28
label#27:
mov r10,1
label#28:
mov byte[rbp-191], r10b
mov r10b, byte [rbp-191]
cmp r10, 0
je label#7
mov r10, qword [rbp-32]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-199], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-199]
add r10, r11
mov qword[rbp-207], r10
mov r10, qword [rbp-207]
mov r11,qword [r10]
mov qword[rbp-215], r11
mov r10, qword [rbp-215]
mov qword[rbp-56], r10
mov r10, qword [rbp-32]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-223], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-223]
add r10, r11
mov qword[rbp-231], r10
mov r10, qword [rbp-40]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-239], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-239]
add r10, r11
mov qword[rbp-247], r10
mov r10, qword [rbp-247]
mov r11,qword [r10]
mov qword[rbp-255], r11
mov r10, qword [rbp-255]
mov r11, qword [rbp-231]
mov qword[r11], r10
mov r10, qword [rbp-231]
mov r11,qword [r10]
mov qword[rbp-263], r11
mov r10, qword [rbp-40]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-271], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-271]
add r10, r11
mov qword[rbp-279], r10
mov r10, qword [rbp-56]
mov r11, qword [rbp-279]
mov qword[r11], r10
mov r10, qword [rbp-279]
mov r11,qword [r10]
mov qword[rbp-287], r11
label#7:
jmp label#1
label#8:
mov r10, qword [rbp-48]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-199], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-199]
add r10, r11
mov qword[rbp-207], r10
mov r10, qword [rbp-207]
mov r11,qword [r10]
mov qword[rbp-215], r11
mov r10, qword [rbp-215]
mov qword[rbp-56], r10
mov r10, qword [rbp-48]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-223], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-223]
add r10, r11
mov qword[rbp-231], r10
mov r10, qword [rbp-40]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-239], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-239]
add r10, r11
mov qword[rbp-247], r10
mov r10, qword [rbp-247]
mov r11,qword [r10]
mov qword[rbp-255], r11
mov r10, qword [rbp-255]
mov r11, qword [rbp-231]
mov qword[r11], r10
mov r10, qword [rbp-231]
mov r11,qword [r10]
mov qword[rbp-263], r11
mov r10, qword [rbp-40]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-271], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-271]
add r10, r11
mov qword[rbp-279], r10
mov r10, qword [rbp-56]
mov r11, qword [rbp-279]
mov qword[r11], r10
mov r10, qword [rbp-279]
mov r11,qword [r10]
mov qword[rbp-287], r11
mov r10, qword [rbp-40]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-295], r10
; saving arguments for call
mov rdx, qword [rbp-295]
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-8]
call quicksort@func
add rsp,0
mov r10, qword [rbp-40]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-303], r10
; saving arguments for call
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-303]
mov rdi, qword [rbp-8]
call quicksort@func
add rsp,0
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
<<<<<<< HEAD
sub rsp, 620
mov r10d, dword[const3+0]
mov dword[rbp-428+0], r10d
lea r10, [rbp-16]
mov qword [rbp-424], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-424]
lea rdi, [rbp-428]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-436], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const4]
cmp r10, r11
jge label#29
mov r10,0
jmp label#30
label#29:
mov r10,1
label#30:
mov byte[rbp-437], r10b
mov r10b, byte [rbp-437]
cmp r10, 0
je label#9
mov r10, qword[const5+0]
mov qword[rbp-471+0], r10
mov r10, qword[const5+8]
mov qword[rbp-471+8], r10
mov r10, qword[const5+16]
mov qword[rbp-471+16], r10
mov r10, qword[const5+24]
mov qword[rbp-471+24], r10
mov r10w, word[const5+32]
mov word[rbp-471+32], r10w
;preparing extern function printf1
||||||| 35696b8
sub rsp, 40
mov r10, qword [const4]
mov qword[rbp-16], r10
push rax
mov rax, qword[rbp-16]
cqo
idiv qword[const4]
mov qword[rbp-24], rax
pop rax
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10d, dword[const8+0]
mov dword[rbp-40+0], r10d
=======
sub rsp, 40
movss xmm0, dword [const0]
movss dword[rbp-12], xmm0
divss xmm0, xmm1
movss dword[rbp-16], xmm0
movss xmm0, dword [rbp-16]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-24], r10
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10d, dword[const7+0]
mov dword[rbp-40+0], r10d
>>>>>>> 9dbe9d0966d6fe19747bb1b4adbbae43710c2434
; saving arguments for call
<<<<<<< HEAD
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-471]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-479], rax
add rsp,8
pop rax
label#9:
mov r10, qword [const2]
mov qword[rbp-487], r10
label#10:
mov r10, qword [rbp-487]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#31
mov r10,0
jmp label#32
label#31:
mov r10,1
label#32:
mov byte[rbp-488], r10b
mov r10b, byte [rbp-488]
cmp r10, 0
je label#12
mov r10d, dword[const3+0]
mov dword[rbp-532+0], r10d
lea r10, [rbp-416]
mov qword [rbp-512], r10
mov r10, qword [rbp-487]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-520], r10
mov r10, qword [rbp-512]
mov r11, qword [rbp-520]
add r10, r11
mov qword[rbp-528], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-528]
lea rdi, [rbp-532]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-540], rax
add rsp,8
pop rax
label#11:
mov r10, qword [rbp-487]
mov qword[rbp-496], r10
mov r10, qword [rbp-487]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-504], r10
mov r10, qword [rbp-504]
mov qword[rbp-487], r10
jmp label#10
label#12:
lea r10, [rbp-416]
mov qword [rbp-548], r10
mov r10, qword [rbp-16]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-556], r10
; saving arguments for call
mov rdx, qword [rbp-556]
mov rsi, qword [const2]
mov rdi, qword [rbp-548]
call quicksort@func
||||||| 35696b8
mov rdi, qword [const7]
movss xmm1, dword [const6]
movss xmm0, dword [const5]
call newton_raphson@func
;copy return value from xmm0
movss dword[rbp-36], xmm0
=======
mov rdi, qword [const6]
movss xmm1, dword [const5]
movss xmm0, dword [const4]
call newton_raphson@func
;copy return value from xmm0
movss dword[rbp-36], xmm0
>>>>>>> 9dbe9d0966d6fe19747bb1b4adbbae43710c2434
add rsp,0
mov r10, qword [const2]
mov qword[rbp-487], r10
label#13:
mov r10, qword [rbp-487]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#33
mov r10,0
jmp label#34
label#33:
mov r10,1
label#34:
mov byte[rbp-557], r10b
mov r10b, byte [rbp-557]
cmp r10, 0
je label#15
mov r10d, dword[const6+0]
mov dword[rbp-610+0], r10d
mov r10b, byte[const6+4]
mov byte[rbp-610+4], r10b
lea r10, [rbp-416]
mov qword [rbp-581], r10
mov r10, qword [rbp-487]
mov r11, qword [const0]
imul r10, r11
mov qword[rbp-589], r10
mov r10, qword [rbp-581]
mov r11, qword [rbp-589]
add r10, r11
mov qword[rbp-597], r10
mov r10, qword [rbp-597]
mov r11,qword [r10]
mov qword[rbp-605], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-605]
lea rdi, [rbp-610]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-618], rax
add rsp,8
pop rax
label#14:
mov r10, qword [rbp-487]
mov qword[rbp-565], r10
mov r10, qword [rbp-487]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-573], r10
mov r10, qword [rbp-573]
mov qword[rbp-487], r10
jmp label#13
label#15:
mov r10w, word[const7+0]
mov word[rbp-620+0], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-620]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-628], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const2]
leave
ret
