@ Fourth program
@ This program compute the following if statement construct:
@ int x;
@ int y;
@ if(x == 0)
@   y = 1;

.section .data

x: .word 0 @ 32-bit signed integer, you can also use int directive instead of .word directive
y: .word 0 @ 32-bit signed integer,

.section .text
.globl _start
_start:
  ldr r1, =x    @ load the memory address of x into r1
  ldr r1, [r1]  @ load the value x into r1

  cmp r1,#0     @
  bne endofif   @ branch (jump) if (Z != 0) false to the end of IF statement body

  thenpart:
    mov r2, #1
    ldr r3, =y   @ load the memory address of y into r3
    str r2, [r3] @ store r2 register value into y memory address

  endofif:
  mov r7, #1  @ Program Termination: exit syscall
  svc #0        @ Program Termination: wake kernel
.end
