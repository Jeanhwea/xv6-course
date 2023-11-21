[org 0x7c00]
;; COMMON
VGA         equ 0x000b8a00	; VGA Address
PT_AP_ENTRY equ 0x8000		; AP Entry Address
PT_STACK    equ 0x9000		; Stack Pointer

;; APIC
APIC_ID     equ 0xfee00020	; Local APIC ID Register
APIC_SVR    equ 0xfee000f0	; Spurious interrupt Vector Register
APIC_ICR    equ 0xfee00300	; Interrupt Command Register

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BSP: Bootstrap Processor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[bits 16]
bsp_start:
	cli
	xor	ax, ax
	mov	ds, ax
	lgdt	[desc]
	mov	eax, cr0
	or	eax, 0x1
	mov	cr0, eax
	jmp	CODE_SR:bsp_start32

[bits 32]
bsp_start32:
	mov	ax, DATA_SR
	mov	ds, ax
	mov	ebp, PT_STACK
	mov	esp, ebp

	;; Load AP's Jump Code to PT_AP_ENTRY
	mov	esi, ap_start
	mov	edi, PT_AP_ENTRY
	mov	ecx, ap_entry - ap_start
	cld
	rep movsb

	;; Step 1 - Enable APIC
	mov	eax, [APIC_SVR]
	or	eax, 0x100	; APIC software enable
	mov	[APIC_SVR], eax
	; mov	eax, [APIC_ID]	; barrier

	;; Step 2 - Send INIT to other APs, bit(9-10) 101=INIT
	mov	eax, 0x000c4500
	mov	[APIC_ICR], eax

	;; Step 3 - Send STARTUP to other APs, bit(9-10) 110=STARTUP, bit(0-7) vector
	mov	eax, 0x000c4600 | (PT_AP_ENTRY >> 12)
	mov	[APIC_ICR], eax

	;; Read APIC ID
	mov	ebx, [APIC_ID]	; wait for write finish, by reading
	shr	ebx, 24
	mov	dl, 0xcf	; RED
	call	print_lsb_digit

	hlt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AP: Application Processor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[bits 16]
ap_start:
	jmp	0x0000:ap_entry

ap_entry:
	cli
	xor	ax, ax
	mov	ds, ax
	mov	ss, ax
	mov	es, ax

	lgdt	[desc]
	mov	eax, cr0
	or	eax, 0x1
	mov	cr0, eax
	jmp	CODE_SR:s32_ap

[bits 32]
s32_ap:
	;; Init Core
	mov	ax, DATA_SR
	mov	ds, ax
	mov	ebp, PT_STACK
	mov	esp, ebp

	;; Read APIC ID
	mov	ebx, [APIC_ID]
	shr	ebx, 24
	mov	dl, 0xaf	; GREEN
	call	print_lsb_digit

	hlt

;; print lsb digit in ebx, bl:digit, bh:color
print_lsb_digit:
	pusha
	; xor	eax, eax
	mov	edi, VGA
	mov	eax, ebx
	mov	cl, 10
	div	cl
	add	ah, '0'
	mov	[edi+2*ebx], ah	       ; char
	mov	byte [edi+2*ebx+1], dl ; color
	popa
	ret

;; setup gdt
gdt_begin:
	dd 0, 0			; dummy

gdt_code:
	dd 0x0000ffff
	dd 0x00cf9a00

gdt_data:
	dd 0x0000ffff
	dd 0x00cf9200

gdt_end:

desc:
	dw gdt_end - gdt_begin - 1
	dd gdt_begin

CODE_SR equ gdt_code - gdt_begin
DATA_SR equ gdt_data - gdt_begin

times 510-($-$$) db 0
	dw 0xaa55
