.global _start

.text
_start:
	mov	$3, %eax
	mov	$4, %ebx

	call	add

	mov	$1, %eax
	int	$0x80

# func add(%eax, %ebx) => %ebx
add:
	add	%eax, %ebx
	ret
