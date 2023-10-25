.text

.global _start
_start:


.data
msg:
	.ascii    "Hello, world!\n"
	len = . - msg
