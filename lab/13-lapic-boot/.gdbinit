# define hook-quit
#   kill
# end

set disassemble-next-line on
set disassembly-flavor intel
show disassembly-flavor intel
set architecture i8086

target remote :1234
lay asm
lay reg
b *0x7c00
c
