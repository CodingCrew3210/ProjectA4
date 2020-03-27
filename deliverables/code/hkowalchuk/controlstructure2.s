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

@!! NEW
  mov r4, #1    @ r4 will be the value we subtract from x eventually, start at 1

  cmp r1, #3    @ the start of our logic for the if construct
  ble endofif   @ the branch is taken if x > 3
 thenpart:
    add r4, r4, #1 @ increment r4, now r4 = 2

 endofif:
    sub r1, r1, r4 @ subtract 1 or 2 from x, depending on the if check earlier
    ldr r2, =x	   @ load the memory address of x into r2
    str r1, [r2]   @ store r1 register value into x memory address

@ Program termination
  mov r7, #1    @ Program Termination: exit syscall
  svc #0        @ Program Termination: wake kernel
.end
