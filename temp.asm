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
g@global dd 34
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
b@global dd 0
c@global dd 0
def@global dq 1
const13 dq 5
const14 dq -1
const15 dq 8
const16 dd 1.1
const17 dd 2.0
section .bss
gg@global resd 1
d@global resd 1
resq 1
a@global resd 20
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
sub rsp, 4
mov dword [rsp],edi
sub rsp, 4
mov dword [rsp],esi
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdx
sub rsp, 4
mov dword [rsp],ecx
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 4
mov dword [rsp],r8d
sub rsp, 4
movss dword [rsp],xmm2
sub rsp, 4
mov dword [rsp],r9d
sub rsp, 4
movss dword [rsp],xmm3
sub rsp, 4
mov r10d, dword [rbp+60]
mov dword[rsp], r10d
sub rsp, 4
mov r10d, dword [rbp+64]
mov dword[rsp], r10d
sub rsp, 4
movss dword [rsp],xmm4
sub rsp, 4
movss dword [rsp],xmm5
sub rsp, 4
movss dword [rsp],xmm6
sub rsp, 4
movss dword [rsp],xmm7
sub rsp, 4
movss xmm0, dword [rbp+84]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+88]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+92]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+96]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+100]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+104]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+108]
movss dword [rsp], xmm0
leave
ret
global f
f:
push   rbp
mov    rbp,rsp
sub rsp, 4
mov dword [rsp],edi
sub rsp, 4
mov dword [rsp],esi
sub rsp, 4
movss dword [rsp],xmm0
sub rsp, 8
mov qword [rsp],rdx
sub rsp, 4
mov dword [rsp],ecx
sub rsp, 4
movss dword [rsp],xmm1
sub rsp, 4
mov dword [rsp],r8d
sub rsp, 4
movss dword [rsp],xmm2
sub rsp, 4
mov dword [rsp],r9d
sub rsp, 4
movss dword [rsp],xmm3
sub rsp, 4
mov r10d, dword [rbp+60]
mov dword[rsp], r10d
sub rsp, 4
mov r10d, dword [rbp+64]
mov dword[rsp], r10d
sub rsp, 4
movss dword [rsp],xmm4
sub rsp, 4
movss dword [rsp],xmm5
sub rsp, 4
movss dword [rsp],xmm6
sub rsp, 4
movss dword [rsp],xmm7
sub rsp, 4
movss xmm0, dword [rbp+84]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+88]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+92]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+96]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+100]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+104]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [rbp+108]
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
sub rsp, 4
mov r10d, dword [const10]
mov dword [rsp], r10d
sub rsp, 4
mov r10d, dword [const5]
mov dword [rsp], r10d
movss xmm3, dword [const9]
mov r9d, dword [const6]
movss xmm2, dword [const8]
mov r8d, dword [const6]
movss xmm1, dword [const7]
mov ecx, dword [const6]
mov rdx, qword [const5]
movss xmm0, dword [const4]
mov esi, dword [const3]
mov edi, dword [const2]
call wow
add rsp,36
leave
ret
global foo
foo:
push   rbp
mov    rbp,rsp
sub rsp, 4
movss dword [rsp],xmm0
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
sub rsp, 4
mov dword [rsp],edi
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
sub rsp, 4
mov r10d, dword [const10]
mov dword [rsp], r10d
sub rsp, 4
mov r10d, dword [const5]
mov dword [rsp], r10d
movss xmm3, dword [const9]
mov r9d, dword [const6]
movss xmm2, dword [const8]
mov r8d, dword [const6]
movss xmm1, dword [const7]
mov ecx, dword [const6]
mov rdx, qword [const5]
movss xmm0, dword [const4]
mov esi, dword [const3]
mov edi, dword [const2]
call f
add rsp,36
movss xmm0, dword [rbp-100]
call foo
add rsp,0
leave
ret
