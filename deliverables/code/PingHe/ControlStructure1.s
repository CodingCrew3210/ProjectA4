@ Control Structures
@ This program compute the following if statement construct:
@ if X <= 3 
@   X = X – 1
@ else
@   X = X – 2
.section .data
x: .word 1 @ 32-bit signed integer, you can also use int directive instead of .word directive
.section .text
.globl _start
_start:
	ldr r1, =x 	@ load the memory address of x into r1
	ldr r1, [r1] 	@ load the value x into r1
	cmp r1,#3 	@
	ble thenpart 	@ branch (jump) if true (Z==1) to the thenpart
	sub r1, r1, #2
thenpart: 
	sub r1, r1, #1
endofif:
	mov r7, #1 	@ Program Termination: exit syscall
	svc #0 		@ Program Termination: wake kernel
	.end

