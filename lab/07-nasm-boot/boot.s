[org 0x7c00]                    ; 设置起始地址, BIOS 默认跳转地址为 0x7c00
[bits 16]                       ; 设置 16 位汇编

start:
	mov	si, msg		; 读取 msg 地址到 SI
	call	puts
	hlt

puts:
	lodsb			; 从 si 中读取 1 byte 到 al, 然后 si++
	cmp	al, 0		; al 是否为 0
	je	done		; if al == 0, 函数返回
	mov	ah, 0x0e	; 设置中断为输出一个字符
	int	0x10		; 中断向屏幕输出一个字符
	jmp	puts		; 循环读取下一个字符
done:
	ret


msg:
	db 0x0d, 0x0a,
	db 'Hello from Kernel!', 0x0d, 0x0a
	db 0x0d, 0x0a,
	db 0			; \0

times 510-($-$$) db 0		; 填充多余的 510 个字节为零值
	dw 0xaa55		; BIOS 结束校验码
