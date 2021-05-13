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
const0 db "enter string1:", NULL
const1 db "enter string2:", NULL
const2 db "length of string1:", NULL
const3 db "%ld",LF, NULL
const4 db "length of string2:", NULL
const5 db "concatenated string: ", NULL
const6 db "copy of string1:", NULL
const7 db "copy of string2:", NULL
const8 db "string1 and string2 are same", NULL
const9 db "string1 and string2 are not same", NULL
const10 db "1234", NULL
const11 dq 0
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
sub rsp, 2719
mov r10, qword[const0+0]
mov qword[rbp-2023+0], r10
mov r10d, dword[const0+8]
mov dword[rbp-2023+8], r10d
mov r10w, word[const0+12]
mov word[rbp-2023+12], r10w
mov r10b, byte[const0+14]
mov byte[rbp-2023+14], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2023]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2031], rax
add rsp,8
pop rax
lea r10, [rbp-1008]
mov qword [rbp-2039], r10
;preparing extern function gets
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2039]
xor rax, rax
call gets
;copy return value from rax
mov qword[rbp-2047], rax
add rsp,8
pop rax
mov r10, qword[const1+0]
mov qword[rbp-2062+0], r10
mov r10d, dword[const1+8]
mov dword[rbp-2062+8], r10d
mov r10w, word[const1+12]
mov word[rbp-2062+12], r10w
mov r10b, byte[const1+14]
mov byte[rbp-2062+14], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2062]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2070], rax
add rsp,8
pop rax
lea r10, [rbp-2008]
mov qword [rbp-2078], r10
;preparing extern function gets
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2078]
xor rax, rax
call gets
;copy return value from rax
mov qword[rbp-2086], rax
add rsp,8
pop rax
mov r10, qword[const2+0]
mov qword[rbp-2105+0], r10
mov r10, qword[const2+8]
mov qword[rbp-2105+8], r10
mov r10w, word[const2+16]
mov word[rbp-2105+16], r10w
mov r10b, byte[const2+18]
mov byte[rbp-2105+18], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2105]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2113], rax
add rsp,8
pop rax
mov r10d, dword[const3+0]
mov dword[rbp-2134+0], r10d
mov r10b, byte[const3+4]
mov byte[rbp-2134+4], r10b
lea r10, [rbp-1008]
mov qword [rbp-2121], r10
;preparing extern function strlen
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2121]
xor rax, rax
call strlen
;copy return value from rax
mov qword[rbp-2129], rax
add rsp,8
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2129]
lea rdi, [rbp-2134]
xor rax, rax
call printf
add rsp,8
pop rax
mov r10, qword[const4+0]
mov qword[rbp-2153+0], r10
mov r10, qword[const4+8]
mov qword[rbp-2153+8], r10
mov r10w, word[const4+16]
mov word[rbp-2153+16], r10w
mov r10b, byte[const4+18]
mov byte[rbp-2153+18], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2153]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2161], rax
add rsp,8
pop rax
mov r10d, dword[const3+0]
mov dword[rbp-2182+0], r10d
mov r10b, byte[const3+4]
mov byte[rbp-2182+4], r10b
lea r10, [rbp-2008]
mov qword [rbp-2169], r10
;preparing extern function strlen
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2169]
xor rax, rax
call strlen
;copy return value from rax
mov qword[rbp-2177], rax
add rsp,8
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2177]
lea rdi, [rbp-2182]
xor rax, rax
call printf
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2390], r10
lea r10, [rbp-1008]
mov qword [rbp-2398], r10
;preparing extern function strcat
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2398]
mov rdi, qword [rbp-2390]
xor rax, rax
call strcat
;copy return value from rax
mov qword[rbp-2406], rax
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2414], r10
lea r10, [rbp-2008]
mov qword [rbp-2422], r10
;preparing extern function strcat
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2422]
mov rdi, qword [rbp-2414]
xor rax, rax
call strcat
;copy return value from rax
mov qword[rbp-2430], rax
add rsp,8
pop rax
mov r10, qword[const5+0]
mov qword[rbp-2452+0], r10
mov r10, qword[const5+8]
mov qword[rbp-2452+8], r10
mov r10d, dword[const5+16]
mov dword[rbp-2452+16], r10d
mov r10w, word[const5+20]
mov word[rbp-2452+20], r10w
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2452]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2460], rax
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2468], r10
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2468]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2476], rax
add rsp,8
pop rax
mov r10, qword[const6+0]
mov qword[rbp-2493+0], r10
mov r10, qword[const6+8]
mov qword[rbp-2493+8], r10
mov r10b, byte[const6+16]
mov byte[rbp-2493+16], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2493]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2501], rax
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2509], r10
lea r10, [rbp-1008]
mov qword [rbp-2517], r10
;preparing extern function strcpy
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2517]
mov rdi, qword [rbp-2509]
xor rax, rax
call strcpy
;copy return value from rax
mov qword[rbp-2525], rax
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2533], r10
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2533]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2541], rax
add rsp,8
pop rax
mov r10, qword[const7+0]
mov qword[rbp-2558+0], r10
mov r10, qword[const7+8]
mov qword[rbp-2558+8], r10
mov r10b, byte[const7+16]
mov byte[rbp-2558+16], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2558]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2566], rax
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2574], r10
lea r10, [rbp-2008]
mov qword [rbp-2582], r10
;preparing extern function strcpy
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2582]
mov rdi, qword [rbp-2574]
xor rax, rax
call strcpy
;copy return value from rax
mov qword[rbp-2590], rax
add rsp,8
pop rax
lea r10, [rbp-2382]
mov qword [rbp-2598], r10
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdi, qword [rbp-2598]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2606], rax
add rsp,8
pop rax
lea r10, [rbp-1008]
mov qword [rbp-2614], r10
lea r10, [rbp-2008]
mov qword [rbp-2622], r10
;preparing extern function strcmp
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2622]
mov rdi, qword [rbp-2614]
xor rax, rax
call strcmp
;copy return value from rax
mov qword[rbp-2630], rax
add rsp,8
pop rax
mov r10, qword [rbp-2630]
cmp r10, 0
je label#2
mov r10,0
jmp label#3
label#2:
mov r10,1
label#3:
mov byte[rbp-2631], r10b
mov r10b, byte [rbp-2631]
cmp r10, 0
je label#0
mov r10, qword[const8+0]
mov qword[rbp-2660+0], r10
mov r10, qword[const8+8]
mov qword[rbp-2660+8], r10
mov r10, qword[const8+16]
mov qword[rbp-2660+16], r10
mov r10d, dword[const8+24]
mov dword[rbp-2660+24], r10d
mov r10b, byte[const8+28]
mov byte[rbp-2660+28], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2660]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2668], rax
add rsp,8
pop rax
jmp label#1
label#0:
mov r10, qword[const9+0]
mov qword[rbp-2701+0], r10
mov r10, qword[const9+8]
mov qword[rbp-2701+8], r10
mov r10, qword[const9+16]
mov qword[rbp-2701+16], r10
mov r10, qword[const9+24]
mov qword[rbp-2701+24], r10
mov r10b, byte[const9+32]
mov byte[rbp-2701+32], r10b
;preparing extern function puts
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2701]
xor rax, rax
call puts
;copy return value from rax
mov qword[rbp-2709], rax
add rsp,8
pop rax
label#1:
mov r10d, dword[const3+0]
mov dword[rbp-2727+0], r10d
mov r10b, byte[const3+4]
mov byte[rbp-2727+4], r10b
mov r10d, dword[const10+0]
mov dword[rbp-2714+0], r10d
mov r10b, byte[const10+4]
mov byte[rbp-2714+4], r10b
;preparing extern function atol
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-2714]
xor rax, rax
call atol
;copy return value from rax
mov qword[rbp-2722], rax
add rsp,8
pop rax
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-2722]
lea rdi, [rbp-2727]
xor rax, rax
call printf
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const11]
leave
ret
