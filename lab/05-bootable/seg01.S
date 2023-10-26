.global _start

	.text
_start:
	xor	%eax, %eax

loop:
	jmp	loop
