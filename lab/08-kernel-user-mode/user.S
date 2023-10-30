.global _start

.text
_start:
	cli

loop:
	jmp   loop
