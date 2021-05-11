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
const0 dq -1
const1 dq 2
const2 dq 8
const3 dq 1
const4 db "%ld", NULL
const5 dq 50
const6 db "array size should be less than 50",LF, NULL
const7 db "Enter array in sorted order",LF, NULL
const8 dq 0
const9 db "Enter element to search: ", NULL
const10 db "Element not found",LF, NULL
const11 db "Element found at position %ld",LF, NULL
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
global binary_search@func
binary_search@func:
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
;add space for symbols
sub rsp, 147
mov r10, qword [rbp-32]
mov r11, qword [rbp-24]
cmp r10, r11
jl label#9
mov r10,0
jmp label#10
label#9:
mov r10,1
label#10:
mov byte[rbp-41], r10b
mov r10b, byte [rbp-41]
cmp r10, 0
je label#0
;copy return value in rax
mov rax , qword[const0]
leave
ret
label#0:
mov r10, qword [rbp-32]
mov r11, qword [rbp-24]
sub r10, r11
mov qword[rbp-49], r10
push rax
mov rax, qword[rbp-49]
cqo
idiv qword[const1]
mov qword[rbp-57], rax
pop rax
mov r10, qword [rbp-24]
mov r11, qword [rbp-57]
add r10, r11
mov qword[rbp-65], r10
mov r10, qword [rbp-65]
mov qword[rbp-73], r10
mov r10, qword [rbp-73]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-81], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-81]
add r10, r11
mov qword[rbp-89], r10
mov r10, qword [rbp-89]
mov r11,qword [r10]
mov qword[rbp-97], r11
mov r10, qword [rbp-97]
mov r11, qword [rbp-40]
cmp r10, r11
je label#11
mov r10,0
jmp label#12
label#11:
mov r10,1
label#12:
mov byte[rbp-98], r10b
mov r10b, byte [rbp-98]
cmp r10, 0
je label#1
;copy return value in rax
mov rax , qword[rbp-73]
leave
ret
label#1:
mov r10, qword [rbp-73]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-106], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-106]
add r10, r11
mov qword[rbp-114], r10
mov r10, qword [rbp-114]
mov r11,qword [r10]
mov qword[rbp-122], r11
mov r10, qword [rbp-122]
mov r11, qword [rbp-40]
cmp r10, r11
jg label#13
mov r10,0
jmp label#14
label#13:
mov r10,1
label#14:
mov byte[rbp-123], r10b
mov r10b, byte [rbp-123]
cmp r10, 0
je label#2
mov r10, qword [rbp-73]
mov r11, qword [const3]
sub r10, r11
mov qword[rbp-131], r10
; saving arguments for call
mov rcx, qword [rbp-40]
mov rdx, qword [rbp-131]
mov rsi, qword [rbp-24]
mov rdi, qword [rbp-16]
call binary_search@func
;copy return value from rax
mov qword[rbp-139], rax
add rsp,0
;copy return value in rax
mov rax , qword[rbp-139]
leave
ret
label#2:
mov r10, qword [rbp-73]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-147], r10
; saving arguments for call
mov rcx, qword [rbp-40]
mov rdx, qword [rbp-32]
mov rsi, qword [rbp-147]
mov rdi, qword [rbp-16]
call binary_search@func
;copy return value from rax
mov qword[rbp-155], rax
add rsp,0
;copy return value in rax
mov rax , qword[rbp-155]
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 739
mov r10d, dword[const4+0]
mov dword[rbp-428+0], r10d
lea r10, [rbp-16]
mov qword [rbp-424], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-424]
lea rdi, [rbp-428]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-436], rax
add rsp,8
pop rax
mov r10, qword [rbp-16]
mov r11, qword [const5]
cmp r10, r11
jge label#15
mov r10,0
jmp label#16
label#15:
mov r10,1
label#16:
mov byte[rbp-437], r10b
mov r10b, byte [rbp-437]
cmp r10, 0
je label#3
mov r10, qword[const6+0]
mov qword[rbp-472+0], r10
mov r10, qword[const6+8]
mov qword[rbp-472+8], r10
mov r10, qword[const6+16]
mov qword[rbp-472+16], r10
mov r10, qword[const6+24]
mov qword[rbp-472+24], r10
mov r10w, word[const6+32]
mov word[rbp-472+32], r10w
mov r10b, byte[const6+34]
mov byte[rbp-472+34], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-472]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-480], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const0]
leave
ret
label#3:
mov r10, qword[const7+0]
mov qword[rbp-509+0], r10
mov r10, qword[const7+8]
mov qword[rbp-509+8], r10
mov r10, qword[const7+16]
mov qword[rbp-509+16], r10
mov r10d, dword[const7+24]
mov dword[rbp-509+24], r10d
mov r10b, byte[const7+28]
mov byte[rbp-509+28], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-509]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-517], rax
add rsp,8
pop rax
mov r10, qword [const8]
mov qword[rbp-525], r10
label#4:
mov r10, qword [rbp-525]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#17
mov r10,0
jmp label#18
label#17:
mov r10,1
label#18:
mov byte[rbp-526], r10b
mov r10b, byte [rbp-526]
cmp r10, 0
je label#6
mov r10d, dword[const4+0]
mov dword[rbp-570+0], r10d
lea r10, [rbp-416]
mov qword [rbp-550], r10
mov r10, qword [rbp-525]
mov r11, qword [const2]
imul r10, r11
mov qword[rbp-558], r10
mov r10, qword [rbp-550]
mov r11, qword [rbp-558]
add r10, r11
mov qword[rbp-566], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-566]
lea rdi, [rbp-570]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-578], rax
add rsp,8
pop rax
label#5:
mov r10, qword [rbp-525]
mov qword[rbp-534], r10
mov r10, qword [rbp-525]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-542], r10
mov r10, qword [rbp-542]
mov qword[rbp-525], r10
jmp label#4
label#6:
mov r10, qword[const9+0]
mov qword[rbp-604+0], r10
mov r10, qword[const9+8]
mov qword[rbp-604+8], r10
mov r10, qword[const9+16]
mov qword[rbp-604+16], r10
mov r10w, word[const9+24]
mov word[rbp-604+24], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-604]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-612], rax
add rsp,8
pop rax
mov r10d, dword[const4+0]
mov dword[rbp-632+0], r10d
lea r10, [rbp-620]
mov qword [rbp-628], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-628]
lea rdi, [rbp-632]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-640], rax
add rsp,8
pop rax
lea r10, [rbp-416]
mov qword [rbp-648], r10
mov r10, qword [rbp-16]
mov r11, qword [const3]
sub r10, r11
mov qword[rbp-656], r10
; saving arguments for call
mov rcx, qword [rbp-620]
mov rdx, qword [rbp-656]
mov rsi, qword [const8]
mov rdi, qword [rbp-648]
call binary_search@func
;copy return value from rax
mov qword[rbp-664], rax
add rsp,0
mov r10, qword [rbp-664]
mov qword[rbp-672], r10
mov r10, qword [rbp-672]
mov r11, qword [const0]
cmp r10, r11
je label#19
mov r10,0
jmp label#20
label#19:
mov r10,1
label#20:
mov byte[rbp-673], r10b
mov r10b, byte [rbp-673]
cmp r10, 0
je label#7
mov r10, qword[const10+0]
mov qword[rbp-692+0], r10
mov r10, qword[const10+8]
mov qword[rbp-692+8], r10
mov r10w, word[const10+16]
mov word[rbp-692+16], r10w
mov r10b, byte[const10+18]
mov byte[rbp-692+18], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-692]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-700], rax
add rsp,8
pop rax
jmp label#8
label#7:
mov r10, qword[const11+0]
mov qword[rbp-739+0], r10
mov r10, qword[const11+8]
mov qword[rbp-739+8], r10
mov r10, qword[const11+16]
mov qword[rbp-739+16], r10
mov r10d, dword[const11+24]
mov dword[rbp-739+24], r10d
mov r10w, word[const11+28]
mov word[rbp-739+28], r10w
mov r10b, byte[const11+30]
mov byte[rbp-739+30], r10b
mov r10, qword [rbp-672]
mov r11, qword [const3]
add r10, r11
mov qword[rbp-708], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-708]
lea rdi, [rbp-739]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-747], rax
add rsp,8
pop rax
label#8:
leave
ret
