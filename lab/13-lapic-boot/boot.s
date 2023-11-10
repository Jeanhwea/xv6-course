[org 0x7c00]

APIC_ID  equ 0xfee00020
APIC_SVR equ 0xfee000f0
APIC_ICR equ 0xfee00300

VGA      equ 0x000b8a00
AP_ENTRY equ 0x00008000


;; bootstrap processor
[bits 16]
s_bsp:
	xor	ax, ax
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax

	lgdt	[desc]
	mov	eax, cr0
	or	eax, 0x1
	mov	cr0, eax
	jmp	CODE_SEG:s32_bsp

[bits 32]
s32_bsp:
	mov	ax, DATA_SEG
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ebp, 0x90000
	mov	esp, ebp

	; mov	esi, s_ap_entry
	; mov	edi, AP_ENTRY
	; mov	ecx, s_ap_entry - s_ap
	; cld
	; rep movsb

	; ; enable APIC
	; mov	eax, [APIC_SVR]
	; or	eax, 0x00000100	; APIC software enable
	; mov	[APIC_SVR], eax

	; ; sync other APs
	; mov	eax, 0x000c4500
	; mov	[APIC_ICR], eax

	; mov	ecx, 100000000	; sleep for while
	; loop	$

	; ;; send SIPI to other APs
	; mov	eax, 0x000c4600 | (AP_ENTRY) >> 12
	; mov	[APIC_SVR], eax

	; mov	ecx, 100000000	; sleep for while
	; loop	$

	; mov	ebx, [APIC_ID]
	mov	ebx, 5
	; shr	ebx, 24

	mov	edi, VGA
	mov	eax, ebx
	mov	cl, 10
	div	cl
	add	ah, '0'
	mov	[edi+2*ebx], ah	; print local_apic_id % 10
	mov	byte [edi+2*ebx+1], 0x1f

	; hlt
	jmp	$


;; application processor
[bits 16]
s_ap:
	jmp	0x0000:s_ap_entry

s_ap_entry:
	xor	ax, ax
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax

	lgdt	[desc]
	mov	eax, cr0
	or	eax, 0x1
	mov	cr0, eax
	jmp	CODE_SEG:s32_ap

[bits 32]
s32_ap:
	mov	ax, DATA_SEG
	mov	ds, ax
	mov	ss, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ebp, 0x90000
	mov	esp, ebp

	mov	ebx, [APIC_ID]
	shr	ebx, 24

	mov	edi, VGA
	mov	eax, ebx
	mov	cl, 10
	div	cl
	add	ah, '0'
	mov	[edi+2*ebx], ah	; print local_apic_id % 10
	mov	byte [edi+2*ebx+1], 0x1f

	hlt
	jmp	$

gdt_begin:
    dd 0, 0

gdt_code:
    dd 0x0000ffff, 0x00cf9a00

gdt_data:
    dd 0x0000ffff, 0x00cf9200

gdt_end:

desc:
    dw gdt_end - gdt_begin - 1
    dd gdt_begin

CODE_SEG equ gdt_code - gdt_begin
DATA_SEG equ gdt_data - gdt_begin

times 510-($-$$) db 0
	dw 0xaa55