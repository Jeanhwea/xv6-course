.global _start

	.text
_start:
	mov	$1, %eax
	mov	$2, %ebx
	add	%ebx, %eax

loop:
	jmp	loop
