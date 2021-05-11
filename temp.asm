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
const0 dq 8
const1 dq 16
const2 dq 1000
const3 db "%ldkm %ldm",LF, NULL
const4 db "Distance: ", NULL
const5 dq 1
const6 dq 500
const7 dq 2
const8 dq 600
const9 dq 200
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
global addDistance@func
addDistance@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 16; adjust rsp for return entry
; copying data in stack of struct_distance
push qword [rbp+16+0]
push qword [rbp+16+8]
; copying data in stack of struct_distance
push qword [rbp+32+0]
push qword [rbp+32+8]
;add space for symbols
sub rsp, 324
lea r10, [rbp-64]
mov qword [rbp-72], r10
mov r10, qword [rbp-72]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-80], r10
lea r10, [rbp-32]
mov qword [rbp-88], r10
mov r10, qword [rbp-88]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [rbp-96]
mov r11,qword [r10]
mov qword[rbp-120], r11
lea r10, [rbp-48]
mov qword [rbp-104], r10
mov r10, qword [rbp-104]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-112], r10
mov r10, qword [rbp-112]
mov r11,qword [r10]
mov qword[rbp-128], r11
mov r10, qword [rbp-120]
mov r11, qword [rbp-128]
add r10, r11
mov qword[rbp-136], r10
lea r10, [rbp-32]
mov qword [rbp-144], r10
mov r10, qword [rbp-144]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-152], r10
mov r10, qword [rbp-152]
mov r11,qword [r10]
mov qword[rbp-176], r11
lea r10, [rbp-48]
mov qword [rbp-160], r10
mov r10, qword [rbp-160]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-168], r10
mov r10, qword [rbp-168]
mov r11,qword [r10]
mov qword[rbp-184], r11
mov r10, qword [rbp-176]
mov r11, qword [rbp-184]
add r10, r11
mov qword[rbp-192], r10
push rax
mov rax, qword[rbp-192]
cqo
idiv qword[const2]
mov qword[rbp-200], rax
pop rax
mov r10, qword [rbp-136]
mov r11, qword [rbp-200]
add r10, r11
mov qword[rbp-208], r10
mov r10, qword [rbp-208]
mov r11, qword [rbp-80]
mov qword[r11], r10
mov r10, qword [rbp-80]
mov r11,qword [r10]
mov qword[rbp-216], r11
lea r10, [rbp-64]
mov qword [rbp-224], r10
mov r10, qword [rbp-224]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-232], r10
lea r10, [rbp-32]
mov qword [rbp-240], r10
mov r10, qword [rbp-240]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-248], r10
mov r10, qword [rbp-248]
mov r11,qword [r10]
mov qword[rbp-272], r11
lea r10, [rbp-48]
mov qword [rbp-256], r10
mov r10, qword [rbp-256]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-264], r10
mov r10, qword [rbp-264]
mov r11,qword [r10]
mov qword[rbp-280], r11
mov r10, qword [rbp-272]
mov r11, qword [rbp-280]
add r10, r11
mov qword[rbp-288], r10
push rax
mov rax, qword[rbp-288]
cqo
idiv qword[const2]
mov qword[rbp-296], rdx
pop rax
mov r10, qword [rbp-296]
mov r11, qword [rbp-232]
mov qword[r11], r10
mov r10, qword [rbp-232]
mov r11,qword [r10]
mov qword[rbp-304], r11
mov r10, qword[const3+0]
mov qword[rbp-364+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-364+8], r10d
lea r10, [rbp-64]
mov qword [rbp-312], r10
mov r10, qword [rbp-312]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-320], r10
mov r10, qword [rbp-320]
mov r11,qword [r10]
mov qword[rbp-328], r11
lea r10, [rbp-64]
mov qword [rbp-336], r10
mov r10, qword [rbp-336]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-344], r10
mov r10, qword [rbp-344]
mov r11,qword [r10]
mov qword[rbp-352], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-352]
mov rsi, qword [rbp-328]
lea rdi, [rbp-364]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-372], rax
add rsp,8
pop rax
;copy return value at addr in rax
mov r10, qword[rbp-64+0]
mov qword[rax+0], r10
mov r10, qword[rbp-64+8]
mov qword[rax+8], r10
leave
ret
global printDistance@func
printDistance@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
; copying data in stack of struct_distance
push qword [rbp+16+0]
push qword [rbp+16+8]
;add space for symbols
sub rsp, 87
mov r10, qword[const4+0]
mov qword[rbp-27+0], r10
mov r10w, word[const4+8]
mov word[rbp-27+8], r10w
mov r10b, byte[const4+10]
mov byte[rbp-27+10], r10b
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-27]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-35], rax
add rsp,8
pop rax
mov r10, qword[const3+0]
mov qword[rbp-95+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-95+8], r10d
lea r10, [rbp-16]
mov qword [rbp-43], r10
mov r10, qword [rbp-43]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-51], r10
mov r10, qword [rbp-51]
mov r11,qword [r10]
mov qword[rbp-59], r11
lea r10, [rbp-16]
mov qword [rbp-67], r10
mov r10, qword [rbp-67]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-75], r10
mov r10, qword [rbp-75]
mov r11,qword [r10]
mov qword[rbp-83], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-83]
mov rsi, qword [rbp-59]
lea rdi, [rbp-95]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-103], rax
add rsp,8
pop rax
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 444
lea r10, [rbp-24]
mov qword [rbp-64], r10
mov r10, qword [rbp-64]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-72], r10
mov r10, qword [const5]
mov r11, qword [rbp-72]
mov qword[r11], r10
mov r10, qword [rbp-72]
mov r11,qword [r10]
mov qword[rbp-80], r11
lea r10, [rbp-24]
mov qword [rbp-88], r10
mov r10, qword [rbp-88]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-96], r10
mov r10, qword [const6]
mov r11, qword [rbp-96]
mov qword[r11], r10
mov r10, qword [rbp-96]
mov r11,qword [r10]
mov qword[rbp-104], r11
lea r10, [rbp-40]
mov qword [rbp-112], r10
mov r10, qword [rbp-112]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-120], r10
mov r10, qword [const7]
mov r11, qword [rbp-120]
mov qword[r11], r10
mov r10, qword [rbp-120]
mov r11,qword [r10]
mov qword[rbp-128], r11
lea r10, [rbp-40]
mov qword [rbp-136], r10
mov r10, qword [rbp-136]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-144], r10
mov r10, qword [const8]
mov r11, qword [rbp-144]
mov qword[r11], r10
mov r10, qword [rbp-144]
mov r11,qword [r10]
mov qword[rbp-152], r11
lea r10, [rbp-56]
mov qword [rbp-160], r10
mov r10, qword [rbp-160]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-168], r10
mov r10, qword [const5]
mov r11, qword [rbp-168]
mov qword[r11], r10
mov r10, qword [rbp-168]
mov r11,qword [r10]
mov qword[rbp-176], r11
lea r10, [rbp-56]
mov qword [rbp-184], r10
mov r10, qword [rbp-184]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-192], r10
mov r10, qword [const9]
mov r11, qword [rbp-192]
mov qword[r11], r10
mov r10, qword [rbp-192]
mov r11,qword [r10]
mov qword[rbp-200], r11
mov r10, qword[const3+0]
mov qword[rbp-260+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-260+8], r10d
lea r10, [rbp-24]
mov qword [rbp-208], r10
mov r10, qword [rbp-208]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-216], r10
mov r10, qword [rbp-216]
mov r11,qword [r10]
mov qword[rbp-224], r11
lea r10, [rbp-24]
mov qword [rbp-232], r10
mov r10, qword [rbp-232]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-240], r10
mov r10, qword [rbp-240]
mov r11,qword [r10]
mov qword[rbp-248], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-248]
mov rsi, qword [rbp-224]
lea rdi, [rbp-260]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-268], rax
add rsp,8
pop rax
mov r10, qword[const3+0]
mov qword[rbp-328+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-328+8], r10d
lea r10, [rbp-40]
mov qword [rbp-276], r10
mov r10, qword [rbp-276]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-284], r10
mov r10, qword [rbp-284]
mov r11,qword [r10]
mov qword[rbp-292], r11
lea r10, [rbp-40]
mov qword [rbp-300], r10
mov r10, qword [rbp-300]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-308], r10
mov r10, qword [rbp-308]
mov r11,qword [r10]
mov qword[rbp-316], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-316]
mov rsi, qword [rbp-292]
lea rdi, [rbp-328]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-336], rax
add rsp,8
pop rax
mov r10, qword[const3+0]
mov qword[rbp-396+0], r10
mov r10d, dword[const3+8]
mov dword[rbp-396+8], r10d
lea r10, [rbp-56]
mov qword [rbp-344], r10
mov r10, qword [rbp-344]
mov r11, qword [const0]
add r10, r11
mov qword[rbp-352], r10
mov r10, qword [rbp-352]
mov r11,qword [r10]
mov qword[rbp-360], r11
lea r10, [rbp-56]
mov qword [rbp-368], r10
mov r10, qword [rbp-368]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-376], r10
mov r10, qword [rbp-376]
mov r11,qword [r10]
mov qword[rbp-384], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-384]
mov rsi, qword [rbp-360]
lea rdi, [rbp-396]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-404], rax
add rsp,8
pop rax
lea rsp, [rsp+16]
lea rax, [rsp]
; saving arguments for call
; copying data in stack of struct_distance
push qword [rbp-40+0]
push qword [rbp-40+8]
; copying data in stack of struct_distance
push qword [rbp-24+0]
push qword [rbp-24+8]
call addDistance@func
;copy return value from addr in rax
mov r10, qword[rax+0]
mov qword[rbp-436+0], r10
mov r10, qword[rax+8]
mov qword[rbp-436+8], r10
add rsp,48
mov r10, qword[rbp-436+0]
mov qword[rbp-420+0], r10
mov r10, qword[rbp-436+8]
mov qword[rbp-420+8], r10
lea rsp, [rsp+16]
lea rax, [rsp]
; saving arguments for call
; copying data in stack of struct_distance
push qword [rbp-56+0]
push qword [rbp-56+8]
; copying data in stack of struct_distance
push qword [rbp-420+0]
push qword [rbp-420+8]
call addDistance@func
;copy return value from addr in rax
mov r10, qword[rax+0]
mov qword[rbp-452+0], r10
mov r10, qword[rax+8]
mov qword[rbp-452+8], r10
add rsp,48
mov r10, qword[rbp-452+0]
mov qword[rbp-420+0], r10
mov r10, qword[rbp-452+8]
mov qword[rbp-420+8], r10
; saving arguments for call
; copying data in stack of struct_distance
push qword [rbp-420+0]
push qword [rbp-420+8]
call printDistance@func
add rsp,16
leave
ret
