[org 0x7c00]
[bits 16]

start:
	xor	ax, ax
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax

	cli
	lgdt	[desc]
	mov	eax, cr0
	or	eax, 0x1
	mov	cr0, eax
	jmp	CODE_SEG:start32


start32:
	mov	ax, DATA_SEG
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ebp, 0x90000
	mov	esp, ebp

	hlt


gdt_begin:
    dd 0, 0

gdt_code:
    dd 0x0000ffff, 0x00cf9b00

gdt_data:
    dd 0x0000ffff, 0x00cf9300

gdt_end:

desc:
    dw gdt_end - gdt_begin - 1
    dd gdt_begin

CODE_SEG equ gdt_code - gdt_begin
DATA_SEG equ gdt_data - gdt_begin

times 510-($-$$) db 0
	dw 0xaa55
