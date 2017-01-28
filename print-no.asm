; Convert number to string - NOT WORKING :( 
;   using win32 api
;   x86 (or) i386 (32 bit)


extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

NULL equ 0
STD_OUTPUT_HANDLE equ -11

section .data
  myNum db 43

section .bss
  dummy   resd 1
  mStr    resb 100
  mStrLen resd 1
  
section .text

global _main
_main:
  ; call _numToString        

  push STD_OUTPUT_HANDLE
  call _GetStdHandle@4

  mov word [mStr], 'B'
  mov word [mStr+1], 'C'
  mov word [mStrLen], 2

  push NULL
  push dummy
  push dword mStrLen
  push dword mStr
  push eax
  call _WriteConsoleA@20

  push NULL
  call _ExitProcess@4
  hlt

_numToString:
  mov ax, [myNum]
  mov cl, 10
  div cl   ; quotient al, remainder ah
  add ah, 65h
  ; movzx cx, ah
  mov byte [mStr], ah
  mov byte [mStrLen], 1
  ret