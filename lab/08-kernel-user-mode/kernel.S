.code16

.global start
start:
	cli
	mov	$1, %ax
	sti

spin:
	jmp	spin
