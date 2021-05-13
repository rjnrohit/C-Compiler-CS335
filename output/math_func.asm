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
const0 db "enter a number to output absolute: ", NULL
const1 db "%f", NULL
const2 db "value: %f",LF, NULL
const3 db "enter a number, power to output pow: ", NULL
const4 db "%f, %f", NULL
const5 db "enter a number to output square root of it: ", NULL
const6 db "enter a number to output ceil: ", NULL
const7 db "enter a number to output floor: ", NULL
const8 db "enter a number to output cos: ", NULL
const9 db "enter a number to output sin: ", NULL
const10 db "enter a number to output tan: ", NULL
const11 db "enter a number to output exp: ", NULL
const12 db "enter a number to output log: ", NULL
const13 db "enter a number to output log2: ", NULL
const14 db "enter a number to output log10: ", NULL
const15 dq 0
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
sub rsp, 736
mov r10, qword[const0+0]
mov qword[rbp-48+0], r10
mov r10, qword[const0+8]
mov qword[rbp-48+8], r10
mov r10, qword[const0+16]
mov qword[rbp-48+16], r10
mov r10, qword[const0+24]
mov qword[rbp-48+24], r10
mov r10d, dword[const0+32]
mov dword[rbp-48+32], r10d
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-48]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-59+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-59+2], r10b
lea r10, [rbp-12]
mov qword [rbp-56], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-56]
lea rdi, [rbp-59]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-74+0], r10
mov r10w, word[const2+8]
mov word[rbp-74+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-74+10], r10b
;preparing extern function fabs
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call fabs
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-63], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-63]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-74]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const3+0]
mov qword[rbp-116+0], r10
mov r10, qword[const3+8]
mov qword[rbp-116+8], r10
mov r10, qword[const3+16]
mov qword[rbp-116+16], r10
mov r10, qword[const3+24]
mov qword[rbp-116+24], r10
mov r10d, dword[const3+32]
mov dword[rbp-116+32], r10d
mov r10w, word[const3+36]
mov word[rbp-116+36], r10w
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-116]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-139+0], r10d
mov r10w, word[const4+4]
mov word[rbp-139+4], r10w
mov r10b, byte[const4+6]
mov byte[rbp-139+6], r10b
lea r10, [rbp-12]
mov qword [rbp-124], r10
lea r10, [rbp-78]
mov qword [rbp-132], r10
;preparing extern function scanf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-132]
mov rsi, qword [rbp-124]
lea rdi, [rbp-139]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-154+0], r10
mov r10w, word[const2+8]
mov word[rbp-154+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-154+10], r10b
;preparing extern function pow
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm1, dword [rbp-78]
cvtss2sd xmm1,xmm1
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 2
call pow
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-143], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-143]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-154]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const5+0]
mov qword[rbp-199+0], r10
mov r10, qword[const5+8]
mov qword[rbp-199+8], r10
mov r10, qword[const5+16]
mov qword[rbp-199+16], r10
mov r10, qword[const5+24]
mov qword[rbp-199+24], r10
mov r10, qword[const5+32]
mov qword[rbp-199+32], r10
mov r10d, dword[const5+40]
mov dword[rbp-199+40], r10d
mov r10b, byte[const5+44]
mov byte[rbp-199+44], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-199]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-210+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-210+2], r10b
lea r10, [rbp-12]
mov qword [rbp-207], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-207]
lea rdi, [rbp-210]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-225+0], r10
mov r10w, word[const2+8]
mov word[rbp-225+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-225+10], r10b
;preparing extern function sqrt
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call sqrt
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-214], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-214]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-225]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const6+0]
mov qword[rbp-257+0], r10
mov r10, qword[const6+8]
mov qword[rbp-257+8], r10
mov r10, qword[const6+16]
mov qword[rbp-257+16], r10
mov r10, qword[const6+24]
mov qword[rbp-257+24], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-257]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-268+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-268+2], r10b
lea r10, [rbp-12]
mov qword [rbp-265], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-265]
lea rdi, [rbp-268]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-283+0], r10
mov r10w, word[const2+8]
mov word[rbp-283+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-283+10], r10b
;preparing extern function ceil
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call ceil
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-272], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-272]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-283]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const7+0]
mov qword[rbp-316+0], r10
mov r10, qword[const7+8]
mov qword[rbp-316+8], r10
mov r10, qword[const7+16]
mov qword[rbp-316+16], r10
mov r10, qword[const7+24]
mov qword[rbp-316+24], r10
mov r10b, byte[const7+32]
mov byte[rbp-316+32], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-316]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-327+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-327+2], r10b
lea r10, [rbp-12]
mov qword [rbp-324], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-324]
lea rdi, [rbp-327]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-342+0], r10
mov r10w, word[const2+8]
mov word[rbp-342+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-342+10], r10b
;preparing extern function floor
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call floor
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-331], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-331]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-342]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const8+0]
mov qword[rbp-373+0], r10
mov r10, qword[const8+8]
mov qword[rbp-373+8], r10
mov r10, qword[const8+16]
mov qword[rbp-373+16], r10
mov r10d, dword[const8+24]
mov dword[rbp-373+24], r10d
mov r10w, word[const8+28]
mov word[rbp-373+28], r10w
mov r10b, byte[const8+30]
mov byte[rbp-373+30], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-373]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-384+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-384+2], r10b
lea r10, [rbp-12]
mov qword [rbp-381], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-381]
lea rdi, [rbp-384]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-399+0], r10
mov r10w, word[const2+8]
mov word[rbp-399+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-399+10], r10b
;preparing extern function cos
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call cos
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-388], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-388]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-399]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const9+0]
mov qword[rbp-430+0], r10
mov r10, qword[const9+8]
mov qword[rbp-430+8], r10
mov r10, qword[const9+16]
mov qword[rbp-430+16], r10
mov r10d, dword[const9+24]
mov dword[rbp-430+24], r10d
mov r10w, word[const9+28]
mov word[rbp-430+28], r10w
mov r10b, byte[const9+30]
mov byte[rbp-430+30], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-430]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-441+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-441+2], r10b
lea r10, [rbp-12]
mov qword [rbp-438], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-438]
lea rdi, [rbp-441]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-456+0], r10
mov r10w, word[const2+8]
mov word[rbp-456+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-456+10], r10b
;preparing extern function sin
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call sin
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-445], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-445]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-456]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const10+0]
mov qword[rbp-487+0], r10
mov r10, qword[const10+8]
mov qword[rbp-487+8], r10
mov r10, qword[const10+16]
mov qword[rbp-487+16], r10
mov r10d, dword[const10+24]
mov dword[rbp-487+24], r10d
mov r10w, word[const10+28]
mov word[rbp-487+28], r10w
mov r10b, byte[const10+30]
mov byte[rbp-487+30], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-487]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-498+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-498+2], r10b
lea r10, [rbp-12]
mov qword [rbp-495], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-495]
lea rdi, [rbp-498]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-513+0], r10
mov r10w, word[const2+8]
mov word[rbp-513+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-513+10], r10b
;preparing extern function tan
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call tan
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-502], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-502]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-513]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const11+0]
mov qword[rbp-544+0], r10
mov r10, qword[const11+8]
mov qword[rbp-544+8], r10
mov r10, qword[const11+16]
mov qword[rbp-544+16], r10
mov r10d, dword[const11+24]
mov dword[rbp-544+24], r10d
mov r10w, word[const11+28]
mov word[rbp-544+28], r10w
mov r10b, byte[const11+30]
mov byte[rbp-544+30], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-544]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-555+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-555+2], r10b
lea r10, [rbp-12]
mov qword [rbp-552], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-552]
lea rdi, [rbp-555]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-570+0], r10
mov r10w, word[const2+8]
mov word[rbp-570+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-570+10], r10b
;preparing extern function exp
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call exp
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-559], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-559]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-570]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const12+0]
mov qword[rbp-601+0], r10
mov r10, qword[const12+8]
mov qword[rbp-601+8], r10
mov r10, qword[const12+16]
mov qword[rbp-601+16], r10
mov r10d, dword[const12+24]
mov dword[rbp-601+24], r10d
mov r10w, word[const12+28]
mov word[rbp-601+28], r10w
mov r10b, byte[const12+30]
mov byte[rbp-601+30], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-601]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-612+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-612+2], r10b
lea r10, [rbp-12]
mov qword [rbp-609], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-609]
lea rdi, [rbp-612]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-627+0], r10
mov r10w, word[const2+8]
mov word[rbp-627+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-627+10], r10b
;preparing extern function log
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call log
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-616], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-616]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-627]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const13+0]
mov qword[rbp-659+0], r10
mov r10, qword[const13+8]
mov qword[rbp-659+8], r10
mov r10, qword[const13+16]
mov qword[rbp-659+16], r10
mov r10, qword[const13+24]
mov qword[rbp-659+24], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-659]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-670+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-670+2], r10b
lea r10, [rbp-12]
mov qword [rbp-667], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-667]
lea rdi, [rbp-670]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-685+0], r10
mov r10w, word[const2+8]
mov word[rbp-685+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-685+10], r10b
;preparing extern function log2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call log2
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-674], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-674]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-685]
mov rax, 1
call printf
add rsp,8
pop rax
mov r10, qword[const14+0]
mov qword[rbp-718+0], r10
mov r10, qword[const14+8]
mov qword[rbp-718+8], r10
mov r10, qword[const14+16]
mov qword[rbp-718+16], r10
mov r10, qword[const14+24]
mov qword[rbp-718+24], r10
mov r10b, byte[const14+32]
mov byte[rbp-718+32], r10b
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-718]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10w, word[const1+0]
mov word[rbp-729+0], r10w
mov r10b, byte[const1+2]
mov byte[rbp-729+2], r10b
lea r10, [rbp-12]
mov qword [rbp-726], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-726]
lea rdi, [rbp-729]
xor rax, rax
call scanf
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-744+0], r10
mov r10w, word[const2+8]
mov word[rbp-744+8], r10w
mov r10b, byte[const2+10]
mov byte[rbp-744+10], r10b
;preparing extern function log10
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-12]
cvtss2sd xmm0,xmm0
mov rax, 1
call log10
;copy return value from xmm0
cvtsd2ss xmm0, xmm0
movss dword[rbp-733], xmm0
add rsp,8
pop rax
;preparing extern function printff
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
movss xmm0, dword [rbp-733]
cvtss2sd xmm0,xmm0
lea rdi, [rbp-744]
mov rax, 1
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const15]
leave
ret
