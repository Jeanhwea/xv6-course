;; 实模式
[bits 16]
start:
	cli			; 1. 关中断
	lgdt	[desc]		; 2. 加载 GDT
	mov	eax, cr0
	or	eax, 0x1	; 3. 设置 cr0
	mov	cr0, eax
	jmp	CODE_SEG:start2 ; 4. 长跳转到 32 汇编入口

;; 保护模式
[bits 32]
start32:
	mov	ax, DATA_SEG	; 5. 更新所有段寄存器
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ebp, 0x90000	; 6. 更新系统栈
	mov	esp, ebp
	call	main		; 7. 跳转到 C 语言入口代码

	hlt


;; 空段，用于校验
gdt_start:
    dd 0x0			; 4 byte
    dd 0x0			; 4 byte

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
    dw gdt_end - gdt_start - 1 ; size (16 bit), always one less of its true size
    dd gdt_start               ; address (32 bit)

; define some constants for later use
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
