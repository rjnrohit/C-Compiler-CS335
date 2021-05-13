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
const0 db "a:%ld",LF, NULL
const1 db "b:%ld",LF, NULL
const2 db "c:%ld",LF, NULL
const3 db "d:%ld",LF, NULL
const4 db "e:%ld",LF, NULL
const5 db "f:%ld",LF, NULL
const6 db "g:%ld",LF, NULL
const7 db "h:%ld",LF, NULL
const8 db "i:%ld",LF, NULL
const9 db "j:%ld",LF, NULL
const10 db "k:%ld",LF, NULL
const11 db "l:%f",LF, NULL
const12 db "m:%f",LF, NULL
const13 db "n:%f",LF, NULL
const14 db "o:%f",LF, NULL
const15 db "p:%f",LF, NULL
const16 db "q:%f",LF, NULL
const17 db "r:%f",LF, NULL
const18 db "s:%f",LF, NULL
const19 db "t:%f",LF, NULL
const20 db "u:%f",LF, NULL
const21 dq 1
const22 dq 2
const23 dq 3
const24 dq 4
const25 dq 5
const26 dq 6
const27 dq 7
const28 dd 1.1
const29 dd 0.99
const30 dd 3.0
const31 dd 1.0
const32 dd 4.56
const33 dd 99999.9
const34 dd 9.0
const35 dd -32.0
const36 dd -11.0
const37 db "%f",LF, NULL
const38 dq 0
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
global many_sum@func
many_sum@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 4; adjust rsp for return entry
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
sub rsp, 265
mov r10, qword [rbp-12]
mov r11, qword [rbp-20]
add r10, r11
mov qword[rbp-140], r10
mov r10, qword [rbp-140]
mov r11, qword [rbp-28]
add r10, r11
mov qword[rbp-148], r10
mov r10, qword [rbp-148]
mov r11, qword [rbp-36]
add r10, r11
mov qword[rbp-156], r10
mov r10, qword [rbp-156]
mov r11, qword [rbp-44]
add r10, r11
mov qword[rbp-164], r10
mov r10, qword [rbp-164]
mov r11, qword [rbp-52]
add r10, r11
mov qword[rbp-172], r10
mov r10, qword [rbp-172]
mov r11, qword [rbp-60]
add r10, r11
mov qword[rbp-180], r10
mov r10, qword [rbp-180]
mov r11, qword [rbp-68]
add r10, r11
mov qword[rbp-188], r10
mov r10, qword [rbp-188]
mov r11, qword [rbp-76]
add r10, r11
mov qword[rbp-196], r10
mov r10, qword [rbp-196]
mov r11, qword [rbp-84]
add r10, r11
mov qword[rbp-204], r10
mov r10, qword [rbp-204]
mov r11, qword [rbp-92]
add r10, r11
mov qword[rbp-212], r10
mov r10, qword [rbp-212]
cvtsi2ss xmm0,r10d
movss dword[rbp-216], xmm0
movss xmm0, dword [rbp-216]
movss xmm1, dword [rbp-96]
addss xmm0, xmm1
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
movss dword[rbp-260], xmm0
mov r10d, dword[const0+0]
mov dword[rbp-267+0], r10d
mov r10w, word[const0+4]
mov word[rbp-267+4], r10w
mov r10b, byte[const0+6]
mov byte[rbp-267+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-12]
lea rdi, [rbp-267]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const1+0]
mov dword[rbp-274+0], r10d
mov r10w, word[const1+4]
mov word[rbp-274+4], r10w
mov r10b, byte[const1+6]
mov byte[rbp-274+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-20]
lea rdi, [rbp-274]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const2+0]
mov dword[rbp-281+0], r10d
mov r10w, word[const2+4]
mov word[rbp-281+4], r10w
mov r10b, byte[const2+6]
mov byte[rbp-281+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-28]
lea rdi, [rbp-281]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const3+0]
mov dword[rbp-288+0], r10d
mov r10w, word[const3+4]
mov word[rbp-288+4], r10w
mov r10b, byte[const3+6]
mov byte[rbp-288+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-36]
lea rdi, [rbp-288]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-295+0], r10d
mov r10w, word[const4+4]
mov word[rbp-295+4], r10w
mov r10b, byte[const4+6]
mov byte[rbp-295+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-44]
lea rdi, [rbp-295]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const5+0]
mov dword[rbp-302+0], r10d
mov r10w, word[const5+4]
mov word[rbp-302+4], r10w
mov r10b, byte[const5+6]
mov byte[rbp-302+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-52]
lea rdi, [rbp-302]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const6+0]
mov dword[rbp-309+0], r10d
mov r10w, word[const6+4]
mov word[rbp-309+4], r10w
mov r10b, byte[const6+6]
mov byte[rbp-309+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-60]
lea rdi, [rbp-309]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const7+0]
mov dword[rbp-316+0], r10d
mov r10w, word[const7+4]
mov word[rbp-316+4], r10w
mov r10b, byte[const7+6]
mov byte[rbp-316+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-68]
lea rdi, [rbp-316]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const8+0]
mov dword[rbp-323+0], r10d
mov r10w, word[const8+4]
mov word[rbp-323+4], r10w
mov r10b, byte[const8+6]
mov byte[rbp-323+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-76]
lea rdi, [rbp-323]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const9+0]
mov dword[rbp-330+0], r10d
mov r10w, word[const9+4]
mov word[rbp-330+4], r10w
mov r10b, byte[const9+6]
mov byte[rbp-330+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-84]
lea rdi, [rbp-330]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const10+0]
mov dword[rbp-337+0], r10d
mov r10w, word[const10+4]
mov word[rbp-337+4], r10w
mov r10b, byte[const10+6]
mov byte[rbp-337+6], r10b
;preparing extern function printfi
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-92]
lea rdi, [rbp-337]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const11+0]
mov dword[rbp-343+0], r10d
mov r10w, word[const11+4]
mov word[rbp-343+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-96]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-343]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const12+0]
mov dword[rbp-349+0], r10d
mov r10w, word[const12+4]
mov word[rbp-349+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-100]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-349]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const13+0]
mov dword[rbp-355+0], r10d
mov r10w, word[const13+4]
mov word[rbp-355+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-104]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-355]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const14+0]
mov dword[rbp-361+0], r10d
mov r10w, word[const14+4]
mov word[rbp-361+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-108]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-361]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const15+0]
mov dword[rbp-367+0], r10d
mov r10w, word[const15+4]
mov word[rbp-367+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-112]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-367]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const16+0]
mov dword[rbp-373+0], r10d
mov r10w, word[const16+4]
mov word[rbp-373+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-116]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-373]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const17+0]
mov dword[rbp-379+0], r10d
mov r10w, word[const17+4]
mov word[rbp-379+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-120]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-379]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const18+0]
mov dword[rbp-385+0], r10d
mov r10w, word[const18+4]
mov word[rbp-385+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-124]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-385]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const19+0]
mov dword[rbp-391+0], r10d
mov r10w, word[const19+4]
mov word[rbp-391+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-128]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-391]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10d, dword[const20+0]
mov dword[rbp-397+0], r10d
mov r10w, word[const20+4]
mov word[rbp-397+4], r10w
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-132]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-397]
mov rax, 1
call printf
add rsp,8
pop rax
;copy return value in xmm0
movss xmm0, dword[rbp-260]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 12
push rax
; saving arguments for call
sub rsp, 4
movss xmm0, dword [const36]
movss dword [rsp], xmm0
sub rsp, 4
movss xmm0, dword [const35]
movss dword [rsp], xmm0
movss xmm7, dword [const34]
movss xmm6, dword [const30]
movss xmm5, dword [const33]
movss xmm4, dword [const32]
movss xmm3, dword [const31]
movss xmm2, dword [const30]
movss xmm1, dword [const29]
movss xmm0, dword [const28]
sub rsp, 8
mov r10, qword [const24]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const23]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const24]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const27]
mov qword [rsp], r10
sub rsp, 8
mov r10, qword [const27]
mov qword [rsp], r10
mov r9, qword [const26]
mov r8, qword [const25]
mov rcx, qword [const24]
mov rdx, qword [const23]
mov rsi, qword [const22]
mov rdi, qword [const21]
call many_sum@func
;copy return value from xmm0
movss dword[rbp-12], xmm0
add rsp,48
pop rax
movss xmm0, dword [rbp-12]
movss dword[rbp-16], xmm0
mov r10d, dword[const37+0]
mov dword[rbp-20+0], r10d
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-16]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-20]
mov rax, 1
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const38]
leave
ret
