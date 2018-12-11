section .text
global _main
_main:
  call n2b

  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, num
  mov rdx, 9
  syscall

  mov rax, 0x2000001
  mov rdi, 0
  syscall

n2b:  ; number to buffer
  mov rcx, qword 12342
  mov r9, num
  
  loop:
  mov rax, rcx
  cmp rax, qword 0
  je endloop
  xor rdx, rdx
  mov r8, qword 10
  div r8

  mov rcx, rax
  mov rax, rdx
  add al, '0'
  mov byte [r9], al
  inc r9
  jmp loop
  
  endloop:
  mov byte [r9], 0xA ; append new line
  ret

section .bss
  num: resb 8

