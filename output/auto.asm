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
const0 dq 67
const1 db "size %ld",LF, NULL
const2 dq 1
const3 dq 3
const4 dq 8
const5 dd 3.4
const6 dq 4
const7 dq 0
const8 dq 2
const9 dq 16
const10 db "struct a:%ld, b:%ld",LF, NULL
const11 db "a:%c b:%ld c:%ld d:%f *e:%ld",LF, NULL
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
sub rsp, 381
mov r10, qword [const0]
mov byte[rbp-9], r10b
mov r10, qword[const1+0]
mov qword[rbp-19+0], r10
mov r10w, word[const1+8]
mov word[rbp-19+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const2]
lea rdi, [rbp-19]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-27], rax
add rsp,8
pop rax
mov r10, qword [const2]
mov byte[rbp-28], r10b
mov r10, qword[const1+0]
mov qword[rbp-38+0], r10
mov r10w, word[const1+8]
mov word[rbp-38+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const2]
lea rdi, [rbp-38]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-46], rax
add rsp,8
pop rax
mov r10b, byte [rbp-9]
movsx r10,r10b
mov qword[rbp-54], r10
mov r10, qword [rbp-54]
mov r11, qword [const3]
sub r10, r11
mov qword[rbp-62], r10
mov r10, qword [rbp-62]
mov qword[rbp-70], r10
mov r10, qword[const1+0]
mov qword[rbp-80+0], r10
mov r10w, word[const1+8]
mov word[rbp-80+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const4]
lea rdi, [rbp-80]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-88], rax
add rsp,8
pop rax
mov r10b, byte [rbp-28]
movsx r10d,r10b
cvtsi2ss xmm0,r10d
movss dword[rbp-92], xmm0
movss xmm0, dword [const5]
movss xmm1, dword [rbp-92]
addss xmm0, xmm1
movss dword[rbp-96], xmm0
movss xmm0, dword [rbp-96]
movss dword[rbp-100], xmm0
mov r10, qword[const1+0]
mov qword[rbp-110+0], r10
mov r10w, word[const1+8]
mov word[rbp-110+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const6]
lea rdi, [rbp-110]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-118], rax
add rsp,8
pop rax
lea r10, [rbp-70]
mov qword [rbp-126], r10
mov r10, qword [rbp-126]
mov qword[rbp-134], r10
mov r10, qword[const1+0]
mov qword[rbp-144+0], r10
mov r10w, word[const1+8]
mov word[rbp-144+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const4]
lea rdi, [rbp-144]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-152], rax
add rsp,8
pop rax
lea r10, [rbp-168]
mov qword [rbp-176], r10
mov r10, qword [rbp-176]
mov r11, qword [const7]
add r10, r11
mov qword[rbp-184], r10
mov r10, qword [const8]
mov r11, qword [rbp-184]
mov qword[r11], r10
mov r10, qword [rbp-184]
mov r11,qword [r10]
mov qword[rbp-192], r11
lea r10, [rbp-168]
mov qword [rbp-200], r10
mov r10, qword [rbp-200]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-208], r10
mov r10, qword [const6]
mov r11, qword [rbp-208]
mov qword[r11], r10
mov r10, qword [rbp-208]
mov r11,qword [r10]
mov qword[rbp-216], r11
mov r10, qword[rbp-168+0]
mov qword[rbp-232+0], r10
mov r10, qword[rbp-168+8]
mov qword[rbp-232+8], r10
mov r10, qword[const1+0]
mov qword[rbp-242+0], r10
mov r10w, word[const1+8]
mov word[rbp-242+8], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [const9]
lea rdi, [rbp-242]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-250], rax
add rsp,8
pop rax
mov r10, qword[const10+0]
mov qword[rbp-319+0], r10
mov r10, qword[const10+8]
mov qword[rbp-319+8], r10
mov r10d, dword[const10+16]
mov dword[rbp-319+16], r10d
mov r10b, byte[const10+20]
mov byte[rbp-319+20], r10b
lea r10, [rbp-232]
mov qword [rbp-258], r10
mov r10, qword [rbp-258]
mov r11, qword [const7]
add r10, r11
mov qword[rbp-266], r10
mov r10, qword [rbp-266]
mov r11,qword [r10]
mov qword[rbp-274], r11
lea r10, [rbp-232]
mov qword [rbp-282], r10
mov r10, qword [rbp-282]
mov r11, qword [const4]
add r10, r11
mov qword[rbp-290], r10
mov r10, qword [rbp-290]
mov r11,qword [r10]
mov qword[rbp-298], r11
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-298]
mov rsi, qword [rbp-274]
lea rdi, [rbp-319]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-327], rax
add rsp,8
pop rax
mov r10, qword[const11+0]
mov qword[rbp-365+0], r10
mov r10, qword[const11+8]
mov qword[rbp-365+8], r10
mov r10, qword[const11+16]
mov qword[rbp-365+16], r10
mov r10d, dword[const11+24]
mov dword[rbp-365+24], r10d
mov r10w, word[const11+28]
mov word[rbp-365+28], r10w
mov r10b, byte [rbp-9]
movsx r10,r10b
mov qword[rbp-373], r10
mov r10b, byte [rbp-28]
movsx r10,r10b
mov qword[rbp-381], r10
mov r10, qword [rbp-134]
mov r11,qword [r10]
mov qword[rbp-335], r11
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov r8, qword [rbp-335]
movss xmm0, dword [rbp-100]
cvtss2sd xmm0,xmm0
mov rcx, qword [rbp-70]
mov rdx, qword [rbp-381]
mov rsi, qword [rbp-373]
lea rdi, [rbp-365]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-389], rax
add rsp,8
pop rax
leave
ret
