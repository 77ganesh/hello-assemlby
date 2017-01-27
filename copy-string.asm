; Copy string from one memory to another
;   using win32 api
;   x86 (or) i386 (32 bit)


extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

NULL equ 0
STD_OUTPUT_HANDLE equ -11

section .data
  msg db "Hello World!", 0xa
  msgLen equ $-msg
  msg2 db "Hi there! We copied this to location -> mStr", 0xa
  msgLen2 equ $-msg2

section .bss
  dummy   resd 1
  oMsg    resd 1
  oMsgLen resd 1
  mStr    resb 100
  
section .text

global _main
_main:
  mov dword [oMsg], msg
  mov dword [oMsgLen], msgLen
  call _fn3        

  push STD_OUTPUT_HANDLE
  call _GetStdHandle@4

  push NULL
  push dummy
  push dword [oMsgLen]
  push dword [oMsg]
  push eax
  call _WriteConsoleA@20

  push NULL
  call _ExitProcess@4
  hlt

_fn3:
  mov cl, msgLen2
  mov eax, mStr
  mov edx, msg2
  fn2_loop: mov ch, [edx]
  mov [eax], ch 
  inc eax
  inc edx
  dec cl
  jne fn2_loop
  mov dword [oMsg], mStr
  mov dword [oMsgLen], msgLen2
  ret