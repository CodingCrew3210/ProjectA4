.section .data
x: .word 1 	@32 bit signed integer
.section .text
.globl _start
_start:
  ldr r1, =x		@load the memory address of x into r1
  ldr r1, [r1]		@load the value x into r1
  cmp r1, #3		@
  ble ifpart		@branch(jump) if true
			@((Z or (N xor V)) == 1 to the ifpart
  b elsepart		@branch(jump) if false to the else part
			@statement body (branch always)
  ifpart:   sub r1, #1	@Subtract 1 from r1
  elsepart: sub r1, #2	@Subtract 2 from r1
	    mov r7, #1	@Program Termination: exit syscall
            svc #0	@Program Termination: wake kernel
           .end
