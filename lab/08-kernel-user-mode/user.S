.global _start

.text
_start:
	cli

	xor	%ebx, %ebx
	mov	$1, %eax
	int	$0x80

loop:
	jmp   loop
