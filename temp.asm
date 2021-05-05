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
g@global dq 34
str@global db "string", NULL
const0 dq 12
const1 dd 1.0
const2 dq 1
const3 dq 2
const4 dd 3.2
const5 dq 45
const6 dq 4
const7 dd 3.1
const8 dd 3.4
const9 dd 4.5
const10 dq 66
const11 dd 2.1
const12 dq 0
b@global dq 0
c@global dq 0
def@global dq 1
const13 dd 1.1
const14 dq 8
const15 dq 5
const16 dq 16
const17 dq -1
const18 dd 2.0
section .bss
gg@global resq 1
d@global resq 1
resq 1
a@global resq 20
section .text
global _start
_start:
mov r12,  [rsp]
lea r13, [rsp+8]
mov rdi, r12
mov rsi, r13
call main
end:
mov rax, SYS_exit ; Call code for exit
mov rdi, EXIT_SUCCESS ; Exit program with success
syscall
global wow
wow:
push   rbp
mov    rbp,rsp
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdx
sub rsp, 8
mov qword [rsp],rcx
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 8
mov qword [rsp],r8
sub rsp, 4
movss dword [rsp],xmm2
sub rsp, 8
mov qword [rsp],r9
sub rsp, 4
movss dword [rsp],xmm3
sub rsp, 8
mov r10, qword [rbp+80]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+88]
mov qword[rsp], r10
sub rsp, 4
movss dword [rsp],xmm4
sub rsp, 4
movss dword [rsp],xmm5
sub rsp, 4
movss dword [rsp],xmm6
sub rsp, 4
movss dword [rsp],xmm7
sub rsp, 4
movss xmm0, dword [rbp+112]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+116]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+120]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+124]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+128]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+132]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+136]
movss dword [rsp], xmm0
mov rax , qword[rbp-16]
leave
ret
global f
f:
push   rbp
mov    rbp,rsp
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdx
sub rsp, 8
mov qword [rsp],rcx
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 8
mov qword [rsp],r8
sub rsp, 4
movss dword [rsp],xmm2
sub rsp, 8
mov qword [rsp],r9
sub rsp, 4
movss dword [rsp],xmm3
sub rsp, 8
mov r10, qword [rbp+80]
mov qword[rsp], r10
sub rsp, 8
mov r10, qword [rbp+88]
mov qword[rsp], r10
sub rsp, 4
movss dword [rsp],xmm4
sub rsp, 4
movss dword [rsp],xmm5
sub rsp, 4
movss dword [rsp],xmm6
sub rsp, 4
movss dword [rsp],xmm7
sub rsp, 4
movss xmm0, dword [rbp+112]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+116]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+120]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+124]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+128]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+132]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+136]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
movss xmm7, dword [const11]
movss xmm6, dword [const11]
movss xmm5, dword [const11]
movss xmm4, dword [const11]
sub rsp, 8
mov r10, qword [const10]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const5]
mov qword [rsp], r10
movss xmm3, dword [const9]
mov r9, qword [const6]
movss xmm2, dword [const8]
mov r8, qword [const6]
movss xmm1, dword [const7]
mov rcx, qword [const6]
mov rdx, qword [const5]
movss xmm0, dword [const4]
mov rsi, qword [const3]
mov rdi, qword [const2]
call wow
add rsp,44
mov rax , qword[const12]
leave
ret
global foo
foo:
push   rbp
mov    rbp,rsp
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdi
mov rax , qword[rbp-48]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const11]
movss dword [rsp], xmm0
movss xmm7, dword [const11]
movss xmm6, dword [const11]
movss xmm5, dword [const11]
movss xmm4, dword [const11]
sub rsp, 8
mov r10, qword [const10]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const5]
mov qword [rsp], r10
movss xmm3, dword [const9]
mov r9, qword [const6]
movss xmm2, dword [const8]
mov r8, qword [const6]
movss xmm1, dword [const7]
mov rcx, qword [const6]
mov rdx, qword [const5]
movss xmm0, dword [const4]
mov rsi, qword [const3]
mov rdi, qword [const2]
call f
add rsp,44
lea rdi, [rbp-181]
movss xmm0, dword [rbp-129]
call foo
add rsp,0
mov rax , qword[const12]
leave
ret
