#!/bin/bash

# Script to assemble, link and thus effectively get binary
nasm -f macho64 hello.asm -o out.o
ld -macosx_version_min 10.7.0 -lSystem -o hello -e _main out.o
