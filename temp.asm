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
b@global dq 64
a@global db "abc", NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
const0 dq 45
const1 dq 567
const2 dq 56
const3 dq 345435
const4 dq 97
const5 dd 3.456
const6 db "%ld %ld  %ld %ld %ld  %c %f %d", NULL
const7 dq 67
const8 dq 72
const9 dq 0
;add bss section for unintialized variables
section .bss
;add extern symbols
extern printf
extern scanf
extern malloc
extern exit
section .text
global foo
foo:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 4; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 4
movss dword [rsp],xmm0
;add space for symbols
sub rsp, 8
mov r10, qword [rbp-12]
cvtsi2ss xmm0,r10d
movss dword[rbp-20], xmm0
movss xmm0, dword [rbp-20]
movss xmm1, dword [rbp-16]
addss xmm0, xmm1
movss dword[rbp-24], xmm0
;copy return value in xmm0
movss xmm0, dword[rbp-24]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 145
mov r10, qword [const0]
mov qword[rbp-16], r10
mov r10, qword [const1]
mov qword[rbp-24], r10
mov r10, qword [const2]
mov qword[rbp-32], r10
mov r10, qword [const3]
mov qword[rbp-40], r10
mov r10, qword [const4]
mov byte[rbp-41], r10b
movss xmm0, dword [const5]
movss dword[rbp-45], xmm0
mov r10, qword[const6+0]
mov qword[rbp-145+0], r10
mov r10, qword[const6+8]
mov qword[rbp-145+8], r10
mov r10, qword[const6+16]
mov qword[rbp-145+16], r10
mov r10d, dword[const6+24]
mov dword[rbp-145+24], r10d
mov r10w, word[const6+28]
mov word[rbp-145+28], r10w
mov r10b, byte[const6+30]
mov byte[rbp-145+30], r10b
;preparing extern function printf
; saving arguments for call
push r12
push rax
mov r12, rsp
and spl, 0xf0
sub rsp, 8
mov r10, qword [const8]
mov qword [rsp], r10
movss xmm0, dword [rbp-45]
cvtss2sd xmm0,xmm0
sub rsp, 8
mov r10b, byte [rbp-41]
movsx r10,r10b
mov qword [rsp], r10
mov r9, qword [rbp-40]
mov r8, qword [rbp-32]
mov rcx, qword [const7]
mov rdx, qword [rbp-24]
mov rsi, qword [rbp-16]
lea rdi, [rbp-145]
mov rax, 1
call printf
;copy return value from rax
mov qword[rbp-153], rax
add rsp,16
mov rsp , r12
pop rax
pop r12
;copy return value in rax
mov rax , qword[const9]
leave
ret
