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
const0 db "%ld", NULL
const1 dq 50
const2 db "array size should be less than 50",LF, NULL
const3 dq -1
const4 dq 0
const5 dq 1
const6 dq 8
const7 db "%ld ", NULL
const8 db "",LF, NULL
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
global swap@func
swap@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
sub rsp, 8
mov qword [rsp],rdi
sub rsp, 8
mov qword [rsp],rsi
;add space for symbols
sub rsp, 40
mov r10, qword [rbp-8]
mov r11,qword [r10]
mov qword[rbp-24], r11
mov r10, qword [rbp-24]
mov qword[rbp-32], r10
mov r10, qword [rbp-16]
mov r11,qword [r10]
mov qword[rbp-40], r11
mov r10, qword [rbp-40]
mov r11, qword [rbp-8]
mov qword[r11], r10
mov r10, qword [rbp-8]
mov r11,qword [r10]
mov qword[rbp-48], r11
mov r10, qword [rbp-32]
mov r11, qword [rbp-16]
mov qword[r11], r10
mov r10, qword [rbp-16]
mov r11,qword [r10]
mov qword[rbp-56], r11
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 671
mov r10d, dword[const0+0]
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
mov r11, qword [const1]
cmp r10, r11
jge label#14
mov r10,0
jmp label#15
label#14:
mov r10,1
label#15:
mov byte[rbp-437], r10b
mov r10b, byte [rbp-437]
cmp r10, 0
je label#0
mov r10, qword[const2+0]
mov qword[rbp-472+0], r10
mov r10, qword[const2+8]
mov qword[rbp-472+8], r10
mov r10, qword[const2+16]
mov qword[rbp-472+16], r10
mov r10, qword[const2+24]
mov qword[rbp-472+24], r10
mov r10w, word[const2+32]
mov word[rbp-472+32], r10w
mov r10b, byte[const2+34]
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
mov rax , qword[const3]
leave
ret
label#0:
mov r10, qword [const4]
mov qword[rbp-488], r10
label#1:
mov r10, qword [rbp-488]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#16
mov r10,0
jmp label#17
label#16:
mov r10,1
label#17:
mov byte[rbp-497], r10b
mov r10b, byte [rbp-497]
cmp r10, 0
je label#3
mov r10d, dword[const0+0]
mov dword[rbp-541+0], r10d
lea r10, [rbp-416]
mov qword [rbp-521], r10
mov r10, qword [rbp-488]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-529], r10
mov r10, qword [rbp-521]
mov r11, qword [rbp-529]
add r10, r11
mov qword[rbp-537], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-537]
lea rdi, [rbp-541]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-549], rax
add rsp,8
pop rax
label#2:
mov r10, qword [rbp-488]
mov qword[rbp-505], r10
mov r10, qword [rbp-488]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-513], r10
mov r10, qword [rbp-513]
mov qword[rbp-488], r10
jmp label#1
label#3:
mov r10, qword [const4]
mov qword[rbp-488], r10
label#4:
mov r10, qword [rbp-16]
mov r11, qword [const5]
sub r10, r11
mov qword[rbp-557], r10
mov r10, qword [rbp-488]
mov r11, qword [rbp-557]
cmp r10, r11
jl label#18
mov r10,0
jmp label#19
label#18:
mov r10,1
label#19:
mov byte[rbp-558], r10b
mov r10b, byte [rbp-558]
cmp r10, 0
je label#8
mov r10, qword [const4]
mov qword[rbp-496], r10
label#5:
mov r10, qword [rbp-16]
mov r11, qword [rbp-488]
sub r10, r11
mov qword[rbp-582], r10
mov r10, qword [rbp-582]
mov r11, qword [const5]
sub r10, r11
mov qword[rbp-590], r10
mov r10, qword [rbp-496]
mov r11, qword [rbp-590]
cmp r10, r11
jl label#20
mov r10,0
jmp label#21
label#20:
mov r10,1
label#21:
mov byte[rbp-591], r10b
mov r10b, byte [rbp-591]
cmp r10, 0
je label#7
lea r10, [rbp-416]
mov qword [rbp-615], r10
mov r10, qword [rbp-496]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-623], r10
mov r10, qword [rbp-615]
mov r11, qword [rbp-623]
add r10, r11
mov qword[rbp-631], r10
mov r10, qword [rbp-631]
mov r11,qword [r10]
mov qword[rbp-671], r11
lea r10, [rbp-416]
mov qword [rbp-639], r10
mov r10, qword [rbp-496]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-647], r10
mov r10, qword [rbp-647]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-655], r10
mov r10, qword [rbp-639]
mov r11, qword [rbp-655]
add r10, r11
mov qword[rbp-663], r10
mov r10, qword [rbp-663]
mov r11,qword [r10]
mov qword[rbp-679], r11
mov r10, qword [rbp-671]
mov r11, qword [rbp-679]
cmp r10, r11
jg label#22
mov r10,0
jmp label#23
label#22:
mov r10,1
label#23:
mov byte[rbp-680], r10b
mov r10b, byte [rbp-680]
cmp r10, 0
je label#6
lea r10, [rbp-416]
mov qword [rbp-688], r10
mov r10, qword [rbp-496]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-696], r10
mov r10, qword [rbp-688]
mov r11, qword [rbp-696]
add r10, r11
mov qword[rbp-704], r10
lea r10, [rbp-416]
mov qword [rbp-712], r10
mov r10, qword [rbp-496]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-720], r10
mov r10, qword [rbp-720]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-728], r10
mov r10, qword [rbp-712]
mov r11, qword [rbp-728]
add r10, r11
mov qword[rbp-736], r10
push rax
; saving arguments for call
mov rsi, qword [rbp-736]
mov rdi, qword [rbp-704]
call swap@func
add rsp,0
pop rax
label#6:
mov r10, qword [rbp-496]
mov qword[rbp-599], r10
mov r10, qword [rbp-496]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-607], r10
mov r10, qword [rbp-607]
mov qword[rbp-496], r10
jmp label#5
label#7:
mov r10, qword [rbp-488]
mov qword[rbp-566], r10
mov r10, qword [rbp-488]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-574], r10
mov r10, qword [rbp-574]
mov qword[rbp-488], r10
jmp label#4
label#8:
mov r10, qword [const4]
mov qword[rbp-488], r10
label#9:
mov r10, qword [rbp-488]
mov r11, qword [rbp-16]
cmp r10, r11
jl label#24
mov r10,0
jmp label#25
label#24:
mov r10,1
label#25:
mov byte[rbp-608], r10b
mov r10b, byte [rbp-608]
cmp r10, 0
je label#11
mov r10d, dword[const7+0]
mov dword[rbp-661+0], r10d
mov r10b, byte[const7+4]
mov byte[rbp-661+4], r10b
lea r10, [rbp-416]
mov qword [rbp-632], r10
mov r10, qword [rbp-488]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-640], r10
mov r10, qword [rbp-632]
mov r11, qword [rbp-640]
add r10, r11
mov qword[rbp-648], r10
mov r10, qword [rbp-648]
mov r11,qword [r10]
mov qword[rbp-656], r11
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-656]
lea rdi, [rbp-661]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-669], rax
add rsp,8
pop rax
label#10:
mov r10, qword [rbp-488]
mov qword[rbp-616], r10
mov r10, qword [rbp-488]
mov r11, qword [const5]
add r10, r11
mov qword[rbp-624], r10
mov r10, qword [rbp-624]
mov qword[rbp-488], r10
jmp label#9
label#11:
mov r10w, word[const8+0]
mov word[rbp-671+0], r10w
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-671]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-679], rax
add rsp,8
pop rax
leave
ret
