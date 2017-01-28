; Convert number to string - NOT WORKING :( 
; I dont know how, but this prints Hello for me - #trolled 
;   using win32 api
;   x86 (or) i386 (32 bit)


extern _ExitProcess@4, _GetStdHandle@4, _WriteConsoleA@20

NULL equ 0
STD_OUTPUT_HANDLE equ -11

section .data
  myNum db 4
  mStr2 db "asdasd", 0xa

section .bss
  dummy   resd 1
  mStr    resb 100
  mStrLen resb 1
  
section .text

global _main
_main:
  push ebp
  mov ebp, esp
  mov byte [mStrLen], 5
  ; call _numToString        

  push STD_OUTPUT_HANDLE
  call _GetStdHandle@4

  push NULL
  push dummy
  push dword [mStrLen]
  push dword mStr2
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
  mov eax, 6
  mov ch, 0
  ; mov ax, [myNum]
  l1: mov cl, 10
  idiv cl
  ; ah - remainder, al - quotient
  add ah, 48
  mov byte [edx], ah
  inc edx
  inc ch

  cmp al, 0
  jne l1

  pop ebp
  ret