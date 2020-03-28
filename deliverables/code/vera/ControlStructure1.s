.section .data
x: .word 1 	@32 bit signed integer
.section .text
.globl _start
_start:
  ldr r1, =x			@load the memory address of x into r1
  ldr r1, [r1]			@load the value x into r1
  cmp r1, #3			@
  ble thenpart			@branch(jump) if true
				@((Z or (N xor V)) == 1 to the thepart
  sub r1,r1,#2			@Subtract 2 from r1
  thenpart: sub r1, r1,#1	@Subtract 1 from r1
  endofif: 
	    mov r7, #1		@Program Termination: exit syscall
            svc #0		@Program Termination: wake kernel
           .end
