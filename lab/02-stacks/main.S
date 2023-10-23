.global _start

.text
_start:
	push	%ebp
	mov	%esp, %ebp

	push	$0xa
	push	$0xb
	push	$0xc
	pop	%eax
	push	$4
	pop	%eax
	pop	%eax

loop:
	jmp	loop
