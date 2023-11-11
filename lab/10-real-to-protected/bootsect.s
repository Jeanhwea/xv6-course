[org 0x7c00]                    ; 设置起始地址, BIOS 默认跳转地址为 0x7c00
KERNEL_BASE equ 0x1000		; 内核加载到内存的起始地址

;; 实模式
[bits 16]
start:
	xor	ax, ax
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax

	call	load_disk

	cli			; 1. 关中断
	lgdt	[desc]		; 2. 加载 GDT / GDTr
	mov	eax, cr0
	or	eax, 0x1	; 3. 设置 cr0
	mov	cr0, eax
	jmp	CODE_SEG:start2 ; 4. 长跳转到 32 汇编入口


;; 参考手册 https://stanislavs.org/helppc/int_13-2.html
;; ES:BX = pointer to buffer
load_disk:
	pusha
	mov	ah, 0x02	; function code: 2 = read disk
	mov	al, 8		; nsector
	mov	ch, 0		; cylinder
	mov	cl, 2		; sector
	mov	dh, 0		; header
	mov	dl, 0		; 0 = flappy, 1 = flappy1, 0x80 = hdd
	mov	bx, KERNEL_BASE	;
	int	0x13		; BIOS 中断
	popa
	ret

;; 保护模式
[bits 32]
start2:
	mov	ax, DATA_SEG	; 5. 更新所有段寄存器
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ebp, 0x90000	; 6. 更新系统栈
	mov	esp, ebp
	call	KERNEL_BASE	; 7. 跳转到 C 语言入口代码

	hlt


;; 用于校验，前 8 字节要求置零
gdt_begin:
	dd 0x0
	dd 0x0

;; 代码段 base = 0x00000000, length = 0xfffff
gdt_code:
	dw 0xffff    ; segment length, bits 0-15                    | limit_low(16)
	dw 0x0       ; segment base, bits 0-15                      | base_low(16)
	db 0x0       ; segment base, bits 16-23                     | base_middle(8)
	db 10011010b ; flags (8 bits)                               | flags1(8)
	db 11001111b ; flags (4 bits) + segment length, bits 16-19  | limit_high(4), flags2(4)
	db 0x0       ; segment base, bits 24-31                     | base_high(8)

;; 数据段
gdt_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0

gdt_end:

desc:
	dw gdt_end - gdt_begin - 1 ; size (16 bit), always one less of its true size
	dd gdt_begin               ; address (32 bit)

; define some constants for later use
CODE_SEG equ gdt_code - gdt_begin
DATA_SEG equ gdt_data - gdt_begin

;; BIOS 结束校验码
times 510-($-$$) db 0
	dw 0xaa55
