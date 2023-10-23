.global _start

.text
_start:
	push	%ebp
	mov	%esp, %ebp

	push	$1
	push	$2
	push	$3
	push	$4

loop:
	jmp	loop
