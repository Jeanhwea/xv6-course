define hook-quit
  kill
end

set architecture i8086
target remote :1234

set disassemble-next-line on
set disassembly-flavor intel
show disassembly-flavor intel

lay asm
lay reg
b *0x7c00
c
