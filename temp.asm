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
const1 dq 24
const2 dq 8
const3 dq 16
const4 db "insert complete",LF, NULL
const5 dq 3
const6 dq 4
const7 db "here",LF, NULL
const8 dq 1
const9 dq 5
const10 dq 2
const11 dq 69
const12 db "flag",LF, NULL
const13 dq 11
const14 db "%ld %ld",LF, NULL
const15 dd 3.0
const16 dd 4.3
const17 db "%.1f",LF, NULL
const18 db "%ld %ld %ld",LF, NULL
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
sub rsp, 8
mov qword [rsp],rdx
;add space for symbols
sub rsp, 187
mov r10, qword [rbp-16]
mov r11, qword [const0]
cmp r10, r11
je label#1
mov r10,0
jmp label#2
label#1:
mov r10,1
label#2:
mov byte[rbp-33], r10b
mov r10b, byte [rbp-33]
cmp r10, 0
je label#0
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const1]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-41], rax
add rsp,8
pop rax
mov r10, qword [rbp-41]
mov qword[rbp-16], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-49]
mov qword[r11], r10
mov r10, qword [rbp-49]
mov r11,qword [r10]
mov qword[rbp-57], r11
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-65], r10
mov r10, qword [rbp-32]
mov r11, qword [rbp-65]
mov qword[r11], r10
mov r10, qword [rbp-65]
mov r11,qword [r10]
mov qword[rbp-73], r11
mov r10, qword[const4+0]
mov qword[rbp-90+0], r10
mov r10, qword[const4+8]
mov qword[rbp-90+8], r10
mov r10b, byte[const4+16]
mov byte[rbp-90+16], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [const0]
mov rsi, qword [const0]
lea rdi, [rbp-90]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-98], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
label#0:
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-106], r10
;preparing extern function malloc
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [const1]
xor rax, rax
call malloc
;copy return value from rax
mov qword[rbp-114], rax
add rsp,8
pop rax
mov r10, qword [rbp-114]
mov r11, qword [rbp-106]
mov qword[r11], r10
mov r10, qword [rbp-106]
mov r11,qword [r10]
mov qword[rbp-122], r11
mov r10, qword [rbp-16]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-130], r10
mov r10, qword [rbp-130]
mov r11,qword [r10]
mov qword[rbp-138], r11
mov r10, qword [rbp-138]
mov qword[rbp-16], r10
mov r10, qword [rbp-16]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-146], r10
mov r10, qword [rbp-24]
mov r11, qword [rbp-146]
mov qword[r11], r10
mov r10, qword [rbp-146]
mov r11,qword [r10]
mov qword[rbp-154], r11
mov r10, qword [rbp-16]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-162], r10
mov r10, qword [rbp-32]
mov r11, qword [rbp-162]
mov qword[r11], r10
mov r10, qword [rbp-162]
mov r11,qword [r10]
mov qword[rbp-170], r11
mov r10, qword[const4+0]
mov qword[rbp-187+0], r10
mov r10, qword[const4+8]
mov qword[rbp-187+8], r10
mov r10b, byte[const4+16]
mov byte[rbp-187+16], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [const0]
mov rsi, qword [const0]
lea rdi, [rbp-187]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-195], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[rbp-16]
leave
ret
global s@func
s@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 24; adjust rsp for return entry
; copying data in stack of struct_Node
push qword [rbp+16+0]
push qword [rbp+16+8]
push qword [rbp+16+16]
;add space for symbols
sub rsp, 136
lea r10, [rbp-72]
mov qword [rbp-80], r10
mov r10, qword [rbp-80]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-88], r10
lea r10, [rbp-48]
mov qword [rbp-96], r10
mov r10, qword [rbp-96]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-104], r10
mov r10, qword [rbp-104]
mov r11,qword [r10]
mov qword[rbp-112], r11
mov r10, qword [rbp-112]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-120], r10
mov r10, qword [rbp-120]
mov r11, qword [rbp-88]
mov qword[r11], r10
mov r10, qword [rbp-88]
mov r11,qword [r10]
mov qword[rbp-128], r11
lea r10, [rbp-72]
mov qword [rbp-136], r10
mov r10, qword [rbp-136]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-144], r10
lea r10, [rbp-48]
mov qword [rbp-152], r10
mov r10, qword [rbp-152]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-160], r10
mov r10, qword [rbp-160]
mov r11,qword [r10]
mov qword[rbp-168], r11
mov r10, qword [rbp-168]
mov r11, qword [const6]
add r10, r11
mov qword[rbp-176], r10
mov r10, qword [rbp-176]
mov r11, qword [rbp-144]
mov qword[r11], r10
mov r10, qword [rbp-144]
mov r11,qword [r10]
mov qword[rbp-184], r11
mov r10, qword[rbp-48+0]
mov qword[rbp-72+0], r10
mov r10, qword[rbp-48+8]
mov qword[rbp-72+8], r10
mov r10, qword[rbp-48+16]
mov qword[rbp-72+16], r10
;copy return value at addr in rax
mov r10, qword[rbp-72+0]
mov qword[rax+0], r10
mov r10, qword[rbp-72+8]
mov qword[rax+8], r10
mov r10, qword[rbp-72+16]
mov qword[rax+16], r10
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 397
mov r10d, dword[const7+0]
mov dword[rbp-14+0], r10d
mov r10w, word[const7+4]
mov word[rbp-14+4], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const8]
mov rdx, qword [const8]
mov rsi, qword [const8]
lea rdi, [rbp-14]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-22], rax
add rsp,8
pop rax
mov r10, qword [const0]
mov qword[rbp-30], r10
; saving arguments for call
mov rdx, qword [const9]
mov rsi, qword [const6]
mov rdi, qword [rbp-30]
call insert@func
;copy return value from rax
mov qword[rbp-38], rax
add rsp,0
mov r10, qword [rbp-38]
mov qword[rbp-30], r10
; saving arguments for call
mov rdx, qword [const10]
mov rsi, qword [const5]
mov rdi, qword [rbp-30]
call insert@func
;copy return value from rax
mov qword[rbp-46], rax
add rsp,0
mov r10, qword [rbp-46]
mov qword[rbp-30], r10
lea r10, [rbp-70]
mov qword [rbp-78], r10
mov r10, qword [rbp-78]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-86], r10
mov r10, qword [const6]
mov r11, qword [rbp-86]
mov qword[r11], r10
mov r10, qword [rbp-86]
mov r11,qword [r10]
mov qword[rbp-94], r11
lea r10, [rbp-70]
mov qword [rbp-102], r10
mov r10, qword [rbp-102]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-110], r10
mov r10, qword [const11]
mov r11, qword [rbp-110]
mov qword[r11], r10
mov r10, qword [rbp-110]
mov r11,qword [r10]
mov qword[rbp-118], r11
lea rsp, [rsp+24]
lea rax, [rsp]
; saving arguments for call
; copying data in stack of struct_Node
push qword [rbp-70+0]
push qword [rbp-70+8]
push qword [rbp-70+16]
call s@func
;copy return value from addr in rax
mov r10, qword[rax+0]
mov qword[rbp-142+0], r10
mov r10, qword[rax+8]
mov qword[rbp-142+8], r10
mov r10, qword[rax+16]
mov qword[rbp-142+16], r10
add rsp,48
mov r10, qword[rbp-142+0]
mov qword[rbp-70+0], r10
mov r10, qword[rbp-142+8]
mov qword[rbp-70+8], r10
mov r10, qword[rbp-142+16]
mov qword[rbp-70+16], r10
mov r10d, dword[const12+0]
mov dword[rbp-148+0], r10d
mov r10w, word[const12+4]
mov word[rbp-148+4], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const8]
mov rdx, qword [const13]
mov rsi, qword [const8]
lea rdi, [rbp-148]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-156], rax
add rsp,8
pop rax
mov r10, qword[const14+0]
mov qword[rbp-213+0], r10
mov r10b, byte[const14+8]
mov byte[rbp-213+8], r10b
lea r10, [rbp-70]
mov qword [rbp-164], r10
mov r10, qword [rbp-164]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-172], r10
mov r10, qword [rbp-172]
mov r11,qword [r10]
mov qword[rbp-180], r11
lea r10, [rbp-70]
mov qword [rbp-188], r10
mov r10, qword [rbp-188]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-196], r10
mov r10, qword [rbp-196]
mov r11,qword [r10]
mov qword[rbp-204], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [rbp-204]
mov rsi, qword [rbp-180]
lea rdi, [rbp-213]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-221], rax
add rsp,8
pop rax
movss xmm0, dword [const15]
movss dword[rbp-225], xmm0
lea r10, [rbp-225]
mov qword [rbp-233], r10
mov r10, qword [rbp-233]
mov qword[rbp-241], r10
movss xmm0, dword [const16]
mov r11, qword [rbp-241]
movss dword[r11], xmm0
mov r10, qword [rbp-241]
movss xmm0, dword[r10]
movss dword[rbp-245], xmm0
mov r10d, dword[const17+0]
mov dword[rbp-255+0], r10d
mov r10w, word[const17+4]
mov word[rbp-255+4], r10w
mov r10, qword [rbp-241]
movss xmm0, dword[r10]
movss dword[rbp-249], xmm0
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-249]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-255]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-263], rax
add rsp,8
pop rax
mov r10, qword [rbp-30]
;copy return value at addr in rax
mov r11, r10
mov r10, qword[r11+0]
mov qword[rbp-287+0], r10
mov r10, qword[r11+8]
mov qword[rbp-287+8], r10
mov r10, qword[r11+16]
mov qword[rbp-287+16], r10
mov r10, qword[rbp-287+0]
mov qword[rbp-70+0], r10
mov r10, qword[rbp-287+8]
mov qword[rbp-70+8], r10
mov r10, qword[rbp-287+16]
mov qword[rbp-70+16], r10
mov r10, qword[const18+0]
mov qword[rbp-332+0], r10
mov r10d, dword[const18+8]
mov dword[rbp-332+8], r10d
mov r10b, byte[const18+12]
mov byte[rbp-332+12], r10b
mov r10, qword [rbp-30]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-295], r10
mov r10, qword [rbp-295]
mov r11,qword [r10]
mov qword[rbp-303], r11
mov r10, qword [rbp-30]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-311], r10
mov r10, qword [rbp-311]
mov r11,qword [r10]
mov qword[rbp-319], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-319]
mov rdx, qword [rbp-303]
mov rsi, qword [const1]
lea rdi, [rbp-332]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-340], rax
add rsp,8
pop rax
mov r10, qword[const14+0]
mov qword[rbp-397+0], r10
mov r10b, byte[const14+8]
mov byte[rbp-397+8], r10b
lea r10, [rbp-70]
mov qword [rbp-348], r10
mov r10, qword [rbp-348]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-356], r10
mov r10, qword [rbp-356]
mov r11,qword [r10]
mov qword[rbp-364], r11
lea r10, [rbp-70]
mov qword [rbp-372], r10
mov r10, qword [rbp-372]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-380], r10
mov r10, qword [rbp-380]
mov r11,qword [r10]
mov qword[rbp-388], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [rbp-388]
mov rsi, qword [rbp-364]
lea rdi, [rbp-397]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-405], rax
add rsp,8
pop rax
leave
ret
