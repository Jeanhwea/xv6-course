.code16
.global start
start:
	mov	$1, %ax
	mov	$2, %bx
	mov	$3, %cx
	mov	$4, %dx

spin:
	jmp	spin
