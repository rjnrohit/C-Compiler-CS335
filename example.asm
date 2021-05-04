
a.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <f>:
   0:	f3 0f 1e fa          	endbr64 
   4:	55                   	push   rbp
   5:	48 89 e5             	mov    rbp,rsp
   8:	48 83 ec 50          	sub    rsp,0x50
   c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
   f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  12:	f3 0f 11 45 e4       	movss  DWORD PTR [rbp-0x1c],xmm0
  17:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  1b:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  1e:	f3 0f 11 4d d4       	movss  DWORD PTR [rbp-0x2c],xmm1
  23:	44 89 45 d0          	mov    DWORD PTR [rbp-0x30],r8d
  27:	f3 0f 11 55 cc       	movss  DWORD PTR [rbp-0x34],xmm2
  2c:	44 89 4d c8          	mov    DWORD PTR [rbp-0x38],r9d
  30:	f3 0f 11 5d c4       	movss  DWORD PTR [rbp-0x3c],xmm3
  35:	f3 0f 11 65 c0       	movss  DWORD PTR [rbp-0x40],xmm4
  3a:	f3 0f 11 6d bc       	movss  DWORD PTR [rbp-0x44],xmm5
  3f:	f3 0f 11 75 b8       	movss  DWORD PTR [rbp-0x48],xmm6
  44:	f3 0f 11 7d b4       	movss  DWORD PTR [rbp-0x4c],xmm7
  49:	c7 45 fc 0c 00 00 00 	mov    DWORD PTR [rbp-0x4],0xc
  50:	f2 0f 2a 4d fc       	cvtsi2sd xmm1,DWORD PTR [rbp-0x4]
  55:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 5d <f+0x5d>
  5c:	00 
  5d:	f2 0f 58 c1          	addsd  xmm0,xmm1
  61:	f2 0f 2c c0          	cvttsd2si eax,xmm0
  65:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  68:	48 83 ec 08          	sub    rsp,0x8
  6c:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 74 <f+0x74>
  73:	00 
  74:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  79:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  7e:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 86 <f+0x86>
  85:	00 
  86:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  8b:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  90:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 98 <f+0x98>
  97:	00 
  98:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  9d:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  a2:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # aa <f+0xaa>
  a9:	00 
  aa:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  af:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  b4:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # bc <f+0xbc>
  bb:	00 
  bc:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  c1:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  c6:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # ce <f+0xce>
  cd:	00 
  ce:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  d3:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  d8:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # e0 <f+0xe0>
  df:	00 
  e0:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
  e5:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
  ea:	6a 42                	push   0x42
  ec:	6a 2d                	push   0x2d
  ee:	f3 0f 10 3d 00 00 00 	movss  xmm7,DWORD PTR [rip+0x0]        # f6 <f+0xf6>
  f5:	00 
  f6:	f3 0f 10 35 00 00 00 	movss  xmm6,DWORD PTR [rip+0x0]        # fe <f+0xfe>
  fd:	00 
  fe:	f3 0f 10 2d 00 00 00 	movss  xmm5,DWORD PTR [rip+0x0]        # 106 <f+0x106>
 105:	00 
 106:	f3 0f 10 25 00 00 00 	movss  xmm4,DWORD PTR [rip+0x0]        # 10e <f+0x10e>
 10d:	00 
 10e:	f3 0f 10 1d 00 00 00 	movss  xmm3,DWORD PTR [rip+0x0]        # 116 <f+0x116>
 115:	00 
 116:	41 b9 04 00 00 00    	mov    r9d,0x4
 11c:	f3 0f 10 15 00 00 00 	movss  xmm2,DWORD PTR [rip+0x0]        # 124 <f+0x124>
 123:	00 
 124:	41 b8 04 00 00 00    	mov    r8d,0x4
 12a:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # 132 <f+0x132>
 131:	00 
 132:	b9 04 00 00 00       	mov    ecx,0x4
 137:	ba 2d 00 00 00       	mov    edx,0x2d
 13c:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 144 <f+0x144>
 143:	00 
 144:	be 02 00 00 00       	mov    esi,0x2
 149:	bf 01 00 00 00       	mov    edi,0x1
 14e:	e8 00 00 00 00       	call   153 <f+0x153>
 153:	48 83 c4 50          	add    rsp,0x50
 157:	b8 00 00 00 00       	mov    eax,0x0
 15c:	c9                   	leave  
 15d:	c3                   	ret    

000000000000015e <foo>:
 15e:	f3 0f 1e fa          	endbr64 
 162:	55                   	push   rbp
 163:	48 89 e5             	mov    rbp,rsp
 166:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
 16b:	f3 0f 10 45 fc       	movss  xmm0,DWORD PTR [rbp-0x4]
 170:	f3 0f 2c c0          	cvttss2si eax,xmm0
 174:	5d                   	pop    rbp
 175:	c3                   	ret    

0000000000000176 <main>:
 176:	f3 0f 1e fa          	endbr64 
 17a:	55                   	push   rbp
 17b:	48 89 e5             	mov    rbp,rsp
 17e:	48 83 ec 20          	sub    rsp,0x20
 182:	c7 05 00 00 00 00 05 	mov    DWORD PTR [rip+0x0],0x5        # 18c <main+0x16>
 189:	00 00 00 
 18c:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 193 <main+0x1d>
 193:	48 89 05 00 00 00 00 	mov    QWORD PTR [rip+0x0],rax        # 19a <main+0x24>
 19a:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
 1a1:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
 1a8:	f2 0f 2a 4d f0       	cvtsi2sd xmm1,DWORD PTR [rbp-0x10]
 1ad:	f2 0f 10 05 00 00 00 	movsd  xmm0,QWORD PTR [rip+0x0]        # 1b5 <main+0x3f>
 1b4:	00 
 1b5:	f2 0f 58 c1          	addsd  xmm0,xmm1
 1b9:	f2 0f 2c c0          	cvttsd2si eax,xmm0
 1bd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
 1c0:	f2 0f 2a 45 f4       	cvtsi2sd xmm0,DWORD PTR [rbp-0xc]
 1c5:	f2 0f 10 0d 00 00 00 	movsd  xmm1,QWORD PTR [rip+0x0]        # 1cd <main+0x57>
 1cc:	00 
 1cd:	f2 0f 5c c1          	subsd  xmm0,xmm1
 1d1:	f2 0f 5a c0          	cvtsd2ss xmm0,xmm0
 1d5:	f3 0f 11 45 f8       	movss  DWORD PTR [rbp-0x8],xmm0
 1da:	48 83 ec 08          	sub    rsp,0x8
 1de:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 1e6 <main+0x70>
 1e5:	00 
 1e6:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 1eb:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 1f0:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 1f8 <main+0x82>
 1f7:	00 
 1f8:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 1fd:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 202:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 20a <main+0x94>
 209:	00 
 20a:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 20f:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 214:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 21c <main+0xa6>
 21b:	00 
 21c:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 221:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 226:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 22e <main+0xb8>
 22d:	00 
 22e:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 233:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 238:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 240 <main+0xca>
 23f:	00 
 240:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 245:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 24a:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 252 <main+0xdc>
 251:	00 
 252:	48 8d 64 24 f8       	lea    rsp,[rsp-0x8]
 257:	f3 0f 11 04 24       	movss  DWORD PTR [rsp],xmm0
 25c:	6a 42                	push   0x42
 25e:	6a 2d                	push   0x2d
 260:	f3 0f 10 3d 00 00 00 	movss  xmm7,DWORD PTR [rip+0x0]        # 268 <main+0xf2>
 267:	00 
 268:	f3 0f 10 35 00 00 00 	movss  xmm6,DWORD PTR [rip+0x0]        # 270 <main+0xfa>
 26f:	00 
 270:	f3 0f 10 2d 00 00 00 	movss  xmm5,DWORD PTR [rip+0x0]        # 278 <main+0x102>
 277:	00 
 278:	f3 0f 10 25 00 00 00 	movss  xmm4,DWORD PTR [rip+0x0]        # 280 <main+0x10a>
 27f:	00 
 280:	f3 0f 10 1d 00 00 00 	movss  xmm3,DWORD PTR [rip+0x0]        # 288 <main+0x112>
 287:	00 
 288:	41 b9 04 00 00 00    	mov    r9d,0x4
 28e:	f3 0f 10 15 00 00 00 	movss  xmm2,DWORD PTR [rip+0x0]        # 296 <main+0x120>
 295:	00 
 296:	41 b8 04 00 00 00    	mov    r8d,0x4
 29c:	f3 0f 10 0d 00 00 00 	movss  xmm1,DWORD PTR [rip+0x0]        # 2a4 <main+0x12e>
 2a3:	00 
 2a4:	b9 04 00 00 00       	mov    ecx,0x4
 2a9:	ba 2d 00 00 00       	mov    edx,0x2d
 2ae:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 2b6 <main+0x140>
 2b5:	00 
 2b6:	be 02 00 00 00       	mov    esi,0x2
 2bb:	bf 01 00 00 00       	mov    edi,0x1
 2c0:	e8 00 00 00 00       	call   2c5 <main+0x14f>
 2c5:	48 83 c4 50          	add    rsp,0x50
 2c9:	f3 0f 10 05 00 00 00 	movss  xmm0,DWORD PTR [rip+0x0]        # 2d1 <main+0x15b>
 2d0:	00 
 2d1:	f3 0f 11 45 fc       	movss  DWORD PTR [rbp-0x4],xmm0
 2d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 2d9:	66 0f 6e c0          	movd   xmm0,eax
 2dd:	e8 00 00 00 00       	call   2e2 <main+0x16c>
 2e2:	b8 00 00 00 00       	mov    eax,0x0
 2e7:	c9                   	leave  
 2e8:	c3                   	ret    
