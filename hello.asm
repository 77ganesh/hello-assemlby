; Hello World in nasm
;   using win32 api
;   x86 (or) i386 (32 bit)

extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

NULL equ 0
STD_OUTPUT_HANDLE equ -11

section .data
  msg db "Hello World!", 0xa	; 0xa - new line
  msgLen equ $-msg

section .bss
  dummy resd 1
  
section .text

global _main

_main:
  push STD_OUTPUT_HANDLE
  call _GetStdHandle@4

  push NULL
  push dummy
  push msgLen
  push msg
  push eax
  call _WriteConsoleA@20

  push NULL
  call _ExitProcess@4
  hlt