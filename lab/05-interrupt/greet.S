.global _start

.text
_start:
	# sys_write(unsigned int fd, const char *buf, size_t count)
	mov	$len, %edx	# count 字符串长度
	mov	$msg, %ecx	# buf 字符串缓冲区
	mov	$1, %ebx	# fd 输出文件描述符
	mov	$4, %eax	# Linux 系统调用号 (sys_write)
	int	$0x80		# syscall 中断

	# sys_exit(int code)
	mov	$0, %ebx	# 程序退出码 code
	mov	$1, %eax	# Linux 系统调用号 (sys_exit)
	int	$0x80		# syscall 中断


.data
msg:
	.ascii	"Hello from ASM!\n"	# 字符串缓存
	len = . - msg			# 当前位置减去 msg 地址 = 字符串 msg 的长度
