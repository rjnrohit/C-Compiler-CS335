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
const7 dq 200
const8 dq 1
const9 dq 100
const10 db "%lf",LF, NULL
const11 db "here",LF, NULL
const12 dq 5
const13 dq 2
const14 dq 69
const15 db "flag",LF, NULL
const16 dq 11
const17 db "%ld %ld",LF, NULL
const18 dd 3.0
const19 dd 4.3
const20 db "%.1f",LF, NULL
const21 db "%ld %ld %ld",LF, NULL
;add bss section for unintialized variables
section .bss
glo@global resd 200
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
je label#6
mov r10,0
jmp label#7
label#6:
mov r10,1
label#7:
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
sub rsp, 508
mov r10, qword [const0]
mov qword[rbp-16], r10
label#1:
mov r10, qword [rbp-16]
mov r11, qword [const7]
cmp r10, r11
jl label#8
mov r10,0
jmp label#9
label#8:
mov r10,1
label#9:
mov byte[rbp-17], r10b
mov r10b, byte [rbp-17]
cmp r10, 0
je label#3
lea r10, [glo@global]
mov qword [rbp-41], r10
mov r10, qword [rbp-16]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-49], r10
mov r10, qword [rbp-41]
mov r11, qword [rbp-49]
add r10, r11
mov qword[rbp-57], r10
mov r10, qword [rbp-16]
cvtsi2ss xmm0,r10d
movss dword[rbp-61], xmm0
;preparing extern function sqrt
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-61]
cvtss2sd xmm0,xmm0
mov rax, 1
call sqrt
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-65], xmm0
add rsp,8
pop rax
movss xmm0, dword [rbp-65]
mov r11, qword [rbp-57]
movss dword[r11], xmm0
mov r10, qword [rbp-57]
movss xmm0, dword[r10]
movss dword[rbp-69], xmm0
label#2:
mov r10, qword [rbp-16]
mov qword[rbp-25], r10
mov r10, qword [rbp-16]
mov r11, qword [const8]
add r10, r11
mov qword[rbp-33], r10
mov r10, qword [rbp-33]
mov qword[rbp-16], r10
jmp label#1
label#3:
mov r10, qword [const8]
mov qword[rbp-16], r10
label#4:
mov r10, qword [rbp-16]
mov r11, qword [const9]
cmp r10, r11
jl label#10
mov r10,0
jmp label#11
label#10:
mov r10,1
label#11:
mov byte[rbp-70], r10b
mov r10b, byte [rbp-70]
cmp r10, 0
je label#5
mov r10d, dword[const10+0]
mov dword[rbp-103+0], r10d
mov r10b, byte[const10+4]
mov byte[rbp-103+4], r10b
lea r10, [glo@global]
mov qword [rbp-78], r10
mov r10, qword [rbp-16]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-86], r10
mov r10, qword [rbp-78]
mov r11, qword [rbp-86]
add r10, r11
mov qword[rbp-94], r10
mov r10, qword [rbp-94]
movss xmm0, dword[r10]
movss dword[rbp-98], xmm0
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-98]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-103]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-111], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const8]
add r10, r11
mov qword[rbp-119], r10
mov r10, qword [rbp-119]
mov qword[rbp-16], r10
jmp label#4
label#5:
mov r10d, dword[const11+0]
mov dword[rbp-125+0], r10d
mov r10w, word[const11+4]
mov word[rbp-125+4], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const8]
mov rdx, qword [const8]
mov rsi, qword [const8]
lea rdi, [rbp-125]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-133], rax
add rsp,8
pop rax
mov r10, qword [const0]
mov qword[rbp-141], r10
; saving arguments for call
mov rdx, qword [const12]
mov rsi, qword [const6]
mov rdi, qword [rbp-141]
call insert@func
;copy return value from rax
mov qword[rbp-149], rax
add rsp,0
mov r10, qword [rbp-149]
mov qword[rbp-141], r10
; saving arguments for call
mov rdx, qword [const13]
mov rsi, qword [const5]
mov rdi, qword [rbp-141]
call insert@func
;copy return value from rax
mov qword[rbp-157], rax
add rsp,0
mov r10, qword [rbp-157]
mov qword[rbp-141], r10
lea r10, [rbp-181]
mov qword [rbp-189], r10
mov r10, qword [rbp-189]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-197], r10
mov r10, qword [const6]
mov r11, qword [rbp-197]
mov qword[r11], r10
mov r10, qword [rbp-197]
mov r11,qword [r10]
mov qword[rbp-205], r11
lea r10, [rbp-181]
mov qword [rbp-213], r10
mov r10, qword [rbp-213]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-221], r10
mov r10, qword [const14]
mov r11, qword [rbp-221]
mov qword[r11], r10
mov r10, qword [rbp-221]
mov r11,qword [r10]
mov qword[rbp-229], r11
lea rsp, [rsp+24]
lea rax, [rsp]
; saving arguments for call
; copying data in stack of struct_Node
push qword [rbp-181+0]
push qword [rbp-181+8]
push qword [rbp-181+16]
call s@func
;copy return value from addr in rax
mov r10, qword[rax+0]
mov qword[rbp-253+0], r10
mov r10, qword[rax+8]
mov qword[rbp-253+8], r10
mov r10, qword[rax+16]
mov qword[rbp-253+16], r10
add rsp,48
mov r10, qword[rbp-253+0]
mov qword[rbp-181+0], r10
mov r10, qword[rbp-253+8]
mov qword[rbp-181+8], r10
mov r10, qword[rbp-253+16]
mov qword[rbp-181+16], r10
mov r10d, dword[const15+0]
mov dword[rbp-259+0], r10d
mov r10w, word[const15+4]
mov word[rbp-259+4], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const8]
mov rdx, qword [const16]
mov rsi, qword [const8]
lea rdi, [rbp-259]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-267], rax
add rsp,8
pop rax
mov r10, qword[const17+0]
mov qword[rbp-324+0], r10
mov r10b, byte[const17+8]
mov byte[rbp-324+8], r10b
lea r10, [rbp-181]
mov qword [rbp-275], r10
mov r10, qword [rbp-275]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-283], r10
mov r10, qword [rbp-283]
mov r11,qword [r10]
mov qword[rbp-291], r11
lea r10, [rbp-181]
mov qword [rbp-299], r10
mov r10, qword [rbp-299]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-307], r10
mov r10, qword [rbp-307]
mov r11,qword [r10]
mov qword[rbp-315], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [rbp-315]
mov rsi, qword [rbp-291]
lea rdi, [rbp-324]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-332], rax
add rsp,8
pop rax
movss xmm0, dword [const18]
movss dword[rbp-336], xmm0
lea r10, [rbp-336]
mov qword [rbp-344], r10
mov r10, qword [rbp-344]
mov qword[rbp-352], r10
movss xmm0, dword [const19]
mov r11, qword [rbp-352]
movss dword[r11], xmm0
mov r10, qword [rbp-352]
movss xmm0, dword[r10]
movss dword[rbp-356], xmm0
mov r10d, dword[const20+0]
mov dword[rbp-366+0], r10d
mov r10w, word[const20+4]
mov word[rbp-366+4], r10w
mov r10, qword [rbp-352]
movss xmm0, dword[r10]
movss dword[rbp-360], xmm0
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-360]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-366]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-374], rax
add rsp,8
pop rax
mov r10, qword [rbp-141]
;copy return value at addr in rax
mov r11, r10
mov r10, qword[r11+0]
mov qword[rbp-398+0], r10
mov r10, qword[r11+8]
mov qword[rbp-398+8], r10
mov r10, qword[r11+16]
mov qword[rbp-398+16], r10
mov r10, qword[rbp-398+0]
mov qword[rbp-181+0], r10
mov r10, qword[rbp-398+8]
mov qword[rbp-181+8], r10
mov r10, qword[rbp-398+16]
mov qword[rbp-181+16], r10
mov r10, qword[const21+0]
mov qword[rbp-443+0], r10
mov r10d, dword[const21+8]
mov dword[rbp-443+8], r10d
mov r10b, byte[const21+12]
mov byte[rbp-443+12], r10b
mov r10, qword [rbp-141]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-406], r10
mov r10, qword [rbp-406]
mov r11,qword [r10]
mov qword[rbp-414], r11
mov r10, qword [rbp-141]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-422], r10
mov r10, qword [rbp-422]
mov r11,qword [r10]
mov qword[rbp-430], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [rbp-430]
mov rdx, qword [rbp-414]
mov rsi, qword [const1]
lea rdi, [rbp-443]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-451], rax
add rsp,8
pop rax
mov r10, qword[const17+0]
mov qword[rbp-508+0], r10
mov r10b, byte[const17+8]
mov byte[rbp-508+8], r10b
lea r10, [rbp-181]
mov qword [rbp-459], r10
mov r10, qword [rbp-459]
mov r11, qword [const2]
add r10, r11
mov qword[rbp-467], r10
mov r10, qword [rbp-467]
mov r11,qword [r10]
mov qword[rbp-475], r11
lea r10, [rbp-181]
mov qword [rbp-483], r10
mov r10, qword [rbp-483]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-491], r10
mov r10, qword [rbp-491]
mov r11,qword [r10]
mov qword[rbp-499], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rcx, qword [const0]
mov rdx, qword [rbp-499]
mov rsi, qword [rbp-475]
lea rdi, [rbp-508]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-516], rax
add rsp,8
pop rax
leave
ret
