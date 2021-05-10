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
const0 db "%ld",LF, NULL
const1 dq 1
const2 dq 2
const3 dq 3
const4 dq 4
const5 dq 5
const6 dq 6
const7 dq 7
const8 dq 8
const9 dq 9
const10 dq 10
const11 dq 11
const12 dd 11.7
const13 dd 12.7
const14 dd 13.0
const15 dd 12.0
const16 dd 11.0
const17 dd 1.3
const18 dd 0.1
const19 dd 0.01
const20 dd 4.999
const21 dd 1.0
const22 dq 0
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
global many_sum
many_sum:
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
sub rsp, 8
mov qword [rsp],rcx
sub rsp, 8
mov qword [rsp],r8
sub rsp, 8
mov qword [rsp],r9
sub rsp, 8
mov r10, qword [rbp+16]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+24]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+32]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+40]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+48]
mov qword[rsp], r10
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 4
movss dword [rsp],xmm2
sub rsp, 4
movss dword [rsp],xmm3
sub rsp, 4
movss dword [rsp],xmm4
sub rsp, 4
movss dword [rsp],xmm5
sub rsp, 4
movss dword [rsp],xmm6
sub rsp, 4
movss dword [rsp],xmm7
sub rsp, 4
movss xmm0, dword [rbp+56]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+60]
movss dword [rsp], xmm0
;add space for symbols
sub rsp, 229
mov r10, qword [rbp-16]
mov r11, qword [rbp-24]
add r10, r11
mov qword[rbp-144], r10
mov r10, qword [rbp-144]
mov r11, qword [rbp-32]
add r10, r11
mov qword[rbp-152], r10
mov r10, qword [rbp-152]
mov r11, qword [rbp-40]
add r10, r11
mov qword[rbp-160], r10
mov r10, qword [rbp-160]
mov r11, qword [rbp-48]
add r10, r11
mov qword[rbp-168], r10
mov r10, qword [rbp-168]
mov r11, qword [rbp-56]
add r10, r11
mov qword[rbp-176], r10
mov r10, qword [rbp-176]
mov r11, qword [rbp-64]
add r10, r11
mov qword[rbp-184], r10
mov r10, qword [rbp-184]
mov r11, qword [rbp-72]
add r10, r11
mov qword[rbp-192], r10
mov r10, qword [rbp-192]
mov r11, qword [rbp-80]
add r10, r11
mov qword[rbp-200], r10
mov r10, qword [rbp-200]
mov r11, qword [rbp-88]
add r10, r11
mov qword[rbp-208], r10
mov r10, qword [rbp-208]
mov r11, qword [rbp-96]
add r10, r11
mov qword[rbp-216], r10
mov r10, qword [rbp-216]
cvtsi2ss xmm0,r10d
movss dword[rbp-220], xmm0
movss xmm0, dword [rbp-220]
movss xmm1, dword [rbp-100]
addss xmm0, xmm1
movss dword[rbp-224], xmm0
movss xmm0, dword [rbp-224]
movss xmm1, dword [rbp-104]
addss xmm0, xmm1
movss dword[rbp-228], xmm0
movss xmm0, dword [rbp-228]
movss xmm1, dword [rbp-108]
addss xmm0, xmm1
movss dword[rbp-232], xmm0
movss xmm0, dword [rbp-232]
movss xmm1, dword [rbp-112]
addss xmm0, xmm1
movss dword[rbp-236], xmm0
movss xmm0, dword [rbp-236]
movss xmm1, dword [rbp-116]
addss xmm0, xmm1
movss dword[rbp-240], xmm0
movss xmm0, dword [rbp-240]
movss xmm1, dword [rbp-120]
addss xmm0, xmm1
movss dword[rbp-244], xmm0
movss xmm0, dword [rbp-244]
movss xmm1, dword [rbp-124]
addss xmm0, xmm1
movss dword[rbp-248], xmm0
movss xmm0, dword [rbp-248]
movss xmm1, dword [rbp-128]
addss xmm0, xmm1
movss dword[rbp-252], xmm0
movss xmm0, dword [rbp-252]
movss xmm1, dword [rbp-132]
addss xmm0, xmm1
movss dword[rbp-256], xmm0
movss xmm0, dword [rbp-256]
movss xmm1, dword [rbp-136]
addss xmm0, xmm1
movss dword[rbp-260], xmm0
movss xmm0, dword [rbp-260]
movss dword[rbp-264], xmm0
mov r10d, dword[const0+0]
mov dword[rbp-277+0], r10d
mov r10b, byte[const0+4]
mov byte[rbp-277+4], r10b
movss xmm0, dword [rbp-264]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-272], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-272]
lea rdi, [rbp-277]
xor rax, rax
call printf
add rsp,8
pop rax
movss xmm0, dword [rbp-264]
cvttss2si r10d,xmm0
movsxd r10,r10d
mov qword[rbp-285], r10
;copy return value in rax
mov rax , qword[rbp-285]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
;add space for symbols
sub rsp, 21
mov r10d, dword[const0+0]
mov dword[rbp-29+0], r10d
mov r10b, byte[const0+4]
mov byte[rbp-29+4], r10b
; saving arguments for call
sub rsp, 4
movss xmm0, dword [const21]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const20]
movss dword [rsp], xmm0
movss xmm7, dword [const19]
movss xmm6, dword [const18]
movss xmm5, dword [const17]
movss xmm4, dword [const16]
movss xmm3, dword [const15]
movss xmm2, dword [const14]
movss xmm1, dword [const13]
movss xmm0, dword [const12]
sub rsp, 8
mov r10, qword [const11]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const10]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const9]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const8]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const7]
mov qword [rsp], r10
mov r9, qword [const6]
mov r8, qword [const5]
mov rcx, qword [const4]
mov rdx, qword [const3]
mov rsi, qword [const2]
mov rdi, qword [const1]
call many_sum
;copy return value from rax
mov qword[rbp-24], rax
add rsp,48
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-24]
lea rdi, [rbp-29]
xor rax, rax
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const22]
leave
ret
