set fileName=hello.asm
if NOT [%1] == [] set fileName=%1

del a.obj a.exe
nasm -f win32 %fileName% -o a.obj
ld a.obj -o a.exe -L. -lkernel32 -m i386pe
objdump a.exe -d
a.exe