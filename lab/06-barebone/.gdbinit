define hook-quit
  kill
end

set architecture i8086
target remote :1234

set disassemble-next-line on
b *0x7c00
c
# lay asm
# lay reg
