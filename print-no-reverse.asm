; Convert number to string 
; Prints in reverse order 
;   using win32 api
;   x86 (or) i386 (32 bit)


extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

NULL equ 0
STD_OUTPUT_HANDLE equ -11

section .data
  myNum dw 1235
  mStr2 db "Now its fine", 0xa

section .bss
  dummy   resd 1
  mStr    resb 100
  mStrLen resd 1
  
section .text

global _main
_main:
  push ebp
  mov ebp, esp
  mov dword [mStrLen], 5
  call _numToString

  ; mov byte [mStr], 'A'        

  push STD_OUTPUT_HANDLE
  call _GetStdHandle@4

  push NULL
  push dummy
  push dword [mStrLen]
  push dword mStr
  push eax
  call _WriteConsoleA@20

  push NULL
  call _ExitProcess@4

  pop ebp
  hlt

_numToString:
  push ebp
  mov ebp, esp

  mov edx, mStr
  mov ch, 0
  mov word ax, [myNum]

  l1: mov cl, 10
  idiv cl
  add ah, 48
  mov byte [edx], ah
  inc ch
  inc edx
  cbw
  cmp ax, 0
  jne l1

  pop ebp
  ret