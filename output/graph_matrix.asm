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
const1 dq 1
const2 db "Node %ld: new tree",LF, NULL
const3 db "Node %ld: Parent: %ld",LF, NULL
const4 dq 0
const5 dq 88
const6 dq 8
const7 dq 11
const8 db "Enter number of vertice (<=10)",LF, NULL
const9 db "%ld", NULL
const10 dq 10
const11 db "invalid number",LF, NULL
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
global dfs@func
dfs@func:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 0; adjust rsp for return entry
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
;add space for symbols
sub rsp, 176
mov r10, qword [rbp-40]
mov r11, qword [const0]
cmp r10, r11
je label#31
mov r10,0
jmp label#32
label#31:
mov r10,1
label#32:
mov byte[rbp-41], r10b
mov r10b, byte [rbp-41]
cmp r10, 0
je label#0
mov r10, qword[const2+0]
mov qword[rbp-69+0], r10
mov r10, qword[const2+8]
mov qword[rbp-69+8], r10
mov r10d, dword[const2+16]
mov dword[rbp-69+16], r10d
mov r10, qword [rbp-24]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-49], r10
;preparing extern function printf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-49]
lea rdi, [rbp-69]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-77], rax
add rsp,8
pop rax
jmp label#1
label#0:
mov r10, qword[const3+0]
mov qword[rbp-116+0], r10
mov r10, qword[const3+8]
mov qword[rbp-116+8], r10
mov r10d, dword[const3+16]
mov dword[rbp-116+16], r10d
mov r10w, word[const3+20]
mov word[rbp-116+20], r10w
mov r10b, byte[const3+22]
mov byte[rbp-116+22], r10b
mov r10, qword [rbp-24]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-85], r10
mov r10, qword [rbp-40]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-93], r10
;preparing extern function printf2
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rdx, qword [rbp-93]
mov rsi, qword [rbp-85]
lea rdi, [rbp-116]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-124], rax
add rsp,8
pop rax
label#1:
mov r10, qword [const4]
mov qword[rbp-132], r10
label#2:
mov r10, qword [rbp-132]
mov r11, qword [rbp-32]
cmp r10, r11
jl label#33
mov r10,0
jmp label#34
label#33:
mov r10,1
label#34:
mov byte[rbp-133], r10b
mov r10b, byte [rbp-133]
cmp r10, 0
je label#6
mov r10, qword [rbp-24]
mov r11, qword [const5]
imul r10, r11
mov qword[rbp-157], r10
mov r10, qword [rbp-8]
mov r11, qword [rbp-157]
add r10, r11
mov qword[rbp-165], r10
mov r10, qword [rbp-132]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-173], r10
mov r10, qword [rbp-165]
mov r11, qword [rbp-173]
add r10, r11
mov qword[rbp-181], r10
mov r10, qword [rbp-181]
mov r11,qword [r10]
mov qword[rbp-189], r11
mov r10, qword [rbp-189]
mov r11, qword [const1]
cmp r10, r11
je label#35
mov r10,0
jmp label#36
label#35:
mov r10,1
label#36:
mov byte[rbp-190], r10b
mov r10b, byte [rbp-190]
cmp r10, 0
je label#3
mov r10, qword [rbp-132]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-198], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-198]
add r10, r11
mov qword[rbp-206], r10
mov r10, qword [rbp-206]
mov r11,qword [r10]
mov qword[rbp-214], r11
mov r10, qword [rbp-214]
mov r11, qword [const4]
cmp r10, r11
je label#37
mov r10,0
jmp label#38
label#37:
mov r10,1
label#38:
mov byte[rbp-215], r10b
mov r10b, byte [rbp-215]
cmp r10, 0
je label#3
mov r10, qword [const1]
mov byte[rbp-216], r10b
jmp label#4
label#3:
mov r10, qword [const4]
mov byte[rbp-216], r10b
label#4:
mov r10b, byte [rbp-216]
cmp r10, 0
je label#5
mov r10, qword [rbp-132]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-224], r10
mov r10, qword [rbp-16]
mov r11, qword [rbp-224]
add r10, r11
mov qword[rbp-232], r10
mov r10, qword [const1]
mov r11, qword [rbp-232]
mov qword[r11], r10
mov r10, qword [rbp-232]
mov r11,qword [r10]
mov qword[rbp-240], r11
; saving arguments for call
mov r8, qword [rbp-24]
mov rcx, qword [rbp-32]
mov rdx, qword [rbp-132]
mov rsi, qword [rbp-16]
mov rdi, qword [rbp-8]
call dfs@func
add rsp,0
label#5:
mov r10, qword [rbp-132]
mov qword[rbp-141], r10
mov r10, qword [rbp-132]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-149], r10
mov r10, qword [rbp-149]
mov qword[rbp-132], r10
jmp label#2
label#6:
leave
ret
global main
main:
push   rbp
mov    rbp,rsp
; saving the arguments values in the stack
sub rsp, 8; adjust rsp for return entry
;add space for symbols
sub rsp, 1308
mov r10, qword [const4]
mov qword[rbp-1072], r10
label#7:
mov r10, qword [rbp-1072]
mov r11, qword [const7]
cmp r10, r11
jl label#39
mov r10,0
jmp label#40
label#39:
mov r10,1
label#40:
mov byte[rbp-1081], r10b
mov r10b, byte [rbp-1081]
cmp r10, 0
je label#11
lea r10, [rbp-1064]
mov qword [rbp-1105], r10
mov r10, qword [rbp-1072]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-1113], r10
mov r10, qword [rbp-1105]
mov r11, qword [rbp-1113]
add r10, r11
mov qword[rbp-1121], r10
mov r10, qword [const4]
mov r11, qword [rbp-1121]
mov qword[r11], r10
mov r10, qword [rbp-1121]
mov r11,qword [r10]
mov qword[rbp-1129], r11
mov r10, qword [const4]
mov qword[rbp-1080], r10
label#8:
mov r10, qword [rbp-1080]
mov r11, qword [const7]
cmp r10, r11
jl label#41
mov r10,0
jmp label#42
label#41:
mov r10,1
label#42:
mov byte[rbp-1130], r10b
mov r10b, byte [rbp-1130]
cmp r10, 0
je label#10
lea r10, [rbp-976]
mov qword [rbp-1154], r10
mov r10, qword [rbp-1072]
mov r11, qword [const5]
imul r10, r11
mov qword[rbp-1162], r10
mov r10, qword [rbp-1154]
mov r11, qword [rbp-1162]
add r10, r11
mov qword[rbp-1170], r10
mov r10, qword [rbp-1080]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-1178], r10
mov r10, qword [rbp-1170]
mov r11, qword [rbp-1178]
add r10, r11
mov qword[rbp-1186], r10
mov r10, qword [const4]
mov r11, qword [rbp-1186]
mov qword[r11], r10
mov r10, qword [rbp-1186]
mov r11,qword [r10]
mov qword[rbp-1194], r11
label#9:
mov r10, qword [rbp-1080]
mov qword[rbp-1138], r10
mov r10, qword [rbp-1080]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-1146], r10
mov r10, qword [rbp-1146]
mov qword[rbp-1080], r10
jmp label#8
label#10:
mov r10, qword [rbp-1072]
mov qword[rbp-1089], r10
mov r10, qword [rbp-1072]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-1097], r10
mov r10, qword [rbp-1097]
mov qword[rbp-1072], r10
jmp label#7
label#11:
mov r10, qword[const8+0]
mov qword[rbp-1186+0], r10
mov r10, qword[const8+8]
mov qword[rbp-1186+8], r10
mov r10, qword[const8+16]
mov qword[rbp-1186+16], r10
mov r10, qword[const8+24]
mov qword[rbp-1186+24], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-1186]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-1194], rax
add rsp,8
pop rax
mov r10d, dword[const9+0]
mov dword[rbp-1206+0], r10d
lea r10, [rbp-1154]
mov qword [rbp-1202], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-1202]
lea rdi, [rbp-1206]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-1214], rax
add rsp,8
pop rax
mov r10, qword [rbp-1154]
mov r11, qword [const10]
cmp r10, r11
jg label#43
mov r10,0
jmp label#44
label#43:
mov r10,1
label#44:
mov byte[rbp-1215], r10b
mov r10b, byte [rbp-1215]
cmp r10, 0
jne label#12
mov r10, qword [rbp-1154]
mov r11, qword [const1]
cmp r10, r11
jl label#45
mov r10,0
jmp label#46
label#45:
mov r10,1
label#46:
mov byte[rbp-1216], r10b
mov r10b, byte [rbp-1216]
cmp r10, 0
jne label#12
mov r10, qword [const4]
mov byte[rbp-1217], r10b
jmp label#13
label#12:
mov r10, qword [const1]
mov byte[rbp-1217], r10b
label#13:
mov r10b, byte [rbp-1217]
cmp r10, 0
je label#14
mov r10, qword[const11+0]
mov qword[rbp-1233+0], r10
mov r10, qword[const11+8]
mov qword[rbp-1233+8], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-1233]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-1241], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const0]
leave
ret
label#14:
mov r10, qword [const4]
mov qword[rbp-1072], r10
label#15:
mov r10, qword [rbp-1072]
mov r11, qword [rbp-1154]
cmp r10, r11
jl label#47
mov r10,0
jmp label#48
label#47:
mov r10,1
label#48:
mov byte[rbp-1242], r10b
mov r10b, byte [rbp-1242]
cmp r10, 0
je label#23
label#16:
mov r10d, dword[const9+0]
mov dword[rbp-1278+0], r10d
lea r10, [rbp-1266]
mov qword [rbp-1274], r10
;preparing extern function scanf
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
mov rsi, qword [rbp-1274]
lea rdi, [rbp-1278]
xor rax, rax
call scanf
;copy return value from rax
mov qword[rbp-1286], rax
add rsp,8
pop rax
mov r10, qword [rbp-1266]
mov r11, qword [const0]
cmp r10, r11
je label#49
mov r10,0
jmp label#50
label#49:
mov r10,1
label#50:
mov byte[rbp-1287], r10b
mov r10b, byte [rbp-1287]
cmp r10, 0
je label#17
jmp label#22
label#17:
mov r10, qword [rbp-1266]
mov r11, qword [rbp-1154]
cmp r10, r11
jg label#51
mov r10,0
jmp label#52
label#51:
mov r10,1
label#52:
mov byte[rbp-1288], r10b
mov r10b, byte [rbp-1288]
cmp r10, 0
jne label#18
mov r10, qword [rbp-1266]
mov r11, qword [const4]
cmp r10, r11
jle label#53
mov r10,0
jmp label#54
label#53:
mov r10,1
label#54:
mov byte[rbp-1289], r10b
mov r10b, byte [rbp-1289]
cmp r10, 0
jne label#18
mov r10, qword [const4]
mov byte[rbp-1290], r10b
jmp label#19
label#18:
mov r10, qword [const1]
mov byte[rbp-1290], r10b
label#19:
mov r10b, byte [rbp-1290]
cmp r10, 0
je label#20
mov r10, qword[const11+0]
mov qword[rbp-1306+0], r10
mov r10, qword[const11+8]
mov qword[rbp-1306+8], r10
;preparing extern function printf1
; saving arguments for call
and spl, 0x0
push rax
sub rsp, 8
lea rdi, [rbp-1306]
xor rax, rax
call printf
;copy return value from rax
mov qword[rbp-1314], rax
add rsp,8
pop rax
;copy return value in rax
mov rax , qword[const0]
leave
ret
label#20:
lea r10, [rbp-976]
mov qword [rbp-1322], r10
mov r10, qword [rbp-1072]
mov r11, qword [const5]
imul r10, r11
mov qword[rbp-1330], r10
mov r10, qword [rbp-1322]
mov r11, qword [rbp-1330]
add r10, r11
mov qword[rbp-1338], r10
mov r10, qword [rbp-1266]
mov r11, qword [const1]
sub r10, r11
mov qword[rbp-1346], r10
mov r10, qword [rbp-1346]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-1354], r10
mov r10, qword [rbp-1338]
mov r11, qword [rbp-1354]
add r10, r11
mov qword[rbp-1362], r10
mov r10, qword [const1]
mov r11, qword [rbp-1362]
mov qword[r11], r10
mov r10, qword [rbp-1362]
mov r11,qword [r10]
mov qword[rbp-1370], r11
label#21:
mov r10, qword [const1]
cmp r10, 0
jne label#16
label#22:
mov r10, qword [rbp-1072]
mov qword[rbp-1250], r10
mov r10, qword [rbp-1072]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-1258], r10
mov r10, qword [rbp-1258]
mov qword[rbp-1072], r10
jmp label#15
label#23:
mov r10, qword [const4]
mov qword[rbp-1072], r10
label#24:
mov r10, qword [rbp-1072]
mov r11, qword [rbp-1154]
cmp r10, r11
jl label#55
mov r10,0
jmp label#56
label#55:
mov r10,1
label#56:
mov byte[rbp-1267], r10b
mov r10b, byte [rbp-1267]
cmp r10, 0
je label#26
lea r10, [rbp-1064]
mov qword [rbp-1291], r10
mov r10, qword [rbp-1072]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-1299], r10
mov r10, qword [rbp-1291]
mov r11, qword [rbp-1299]
add r10, r11
mov qword[rbp-1307], r10
mov r10, qword [rbp-1307]
mov r11,qword [r10]
mov qword[rbp-1315], r11
mov r10, qword [rbp-1315]
cmp r10, 0
je label#57
mov r10,0
jmp label#58
label#57:
mov r10,1
label#58:
mov byte[rbp-1316], r10b
mov r10b, byte [rbp-1316]
cmp r10, 0
je label#25
lea r10, [rbp-1064]
mov qword [rbp-1324], r10
mov r10, qword [rbp-1072]
mov r11, qword [const6]
imul r10, r11
mov qword[rbp-1332], r10
mov r10, qword [rbp-1324]
mov r11, qword [rbp-1332]
add r10, r11
mov qword[rbp-1340], r10
mov r10, qword [const1]
mov r11, qword [rbp-1340]
mov qword[r11], r10
mov r10, qword [rbp-1340]
mov r11,qword [r10]
mov qword[rbp-1348], r11
lea r10, [rbp-976]
mov qword [rbp-1356], r10
lea r10, [rbp-1064]
mov qword [rbp-1364], r10
; saving arguments for call
mov r8, qword [const0]
mov rcx, qword [rbp-1154]
mov rdx, qword [rbp-1072]
mov rsi, qword [rbp-1364]
mov rdi, qword [rbp-1356]
call dfs@func
add rsp,0
label#25:
mov r10, qword [rbp-1072]
mov qword[rbp-1275], r10
mov r10, qword [rbp-1072]
mov r11, qword [const1]
add r10, r11
mov qword[rbp-1283], r10
mov r10, qword [rbp-1283]
mov qword[rbp-1072], r10
jmp label#24
label#26:
leave
ret
