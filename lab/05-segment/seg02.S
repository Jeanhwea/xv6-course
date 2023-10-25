.text

.global _start
_start:
	mov	vector, %eax
	mov	vector+1, %ebx
	mov	vector+2, %ecx
	mov	vector+3, %edx
	add	$4, %eax
	;; mov	(%eax), %ecx

loop:
	jmp	loop


.data
vector:
	.long 0x11111111
	.long 0x22222222
	.long 0x33333333
	.long 0x44444444
