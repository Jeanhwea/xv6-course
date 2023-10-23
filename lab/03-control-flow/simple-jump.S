.global _start

.text
_start:
	mov	$4, %eax

	cmp	$4, %eax
	je	eax_eq_four
	jmp	eax_ne_four
	jmp	endif

eax_eq_four:
	xor	$1, %ebx
	jmp	endif
eax_ne_four:
	mov	$2, %ebx
	jmp	endif

endif:
	mov	$1, %eax        # eax 为中断号
	int	$0x80		# ebx 为返回值
