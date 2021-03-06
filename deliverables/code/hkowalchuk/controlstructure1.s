@ Control Structure
@ Hayden Kowalchuk (c) 2020
@ This program compute the following if statement construct:
@ int x = 1;
@ if(x <= 3)
@   x = x-1;
@ else
@   x = x-2;

.section .data

x: .int 1 	@ 32-bit signed integer

.section .text
.globl _start
_start:
  ldr r1, =x    @ load the memory address of x into r1
  ldr r1, [r1]  @ load the value x into r1

  cmp r1, #3    @ the start of our logic for the if construct
  bgt elsepart  @ the branch is taken if x > 3
  thenpart:
    sub r1, r1, #1 @ decrement r1, meaning x = x-1
    ldr r2, =x     @ load the memory address of x into r2
    str r1, [r2]   @ store r1 (x-1) register value into x memory address
    b endofif

  elsepart:
    sub r1, r1, #2 @ subtract 2 from x, x = x-2
    ldr r2, =x	   @ load the memory address of x into r2
    str r1, [r2]   @ store r1 (x-2) register value into x memory address

  endofif:
@ Program termination
  mov r7, #1    @ Program Termination: exit syscall
  svc #0        @ Program Termination: wake kernel
.end
