; Hello World in nasm
;   using win32 api
;   x86 (or) i386 (32 bit)

; Intro to functions 
; _fn - Zero arg function

extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

NULL equ 0
STD_OUTPUT_HANDLE equ -11

section .data
  msg db "Hello World!", 0xa
  msgLen equ $-msg
  msg2 db "This is a different string!", 0xa
  msgLen2 equ $-msg2

section .bss
  dummy   resd 1
  oMsg    resd 1
  oMsgLen resd 1
  
section .text

global _main
_main:
  mov dword [oMsg], msg
  mov dword [oMsgLen], msgLen
  ; call _fn         ; Uncomment to print the 2nd string
  
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

_fn:
  mov dword [oMsg], msg2
  mov dword [oMsgLen], msgLen2
  ret