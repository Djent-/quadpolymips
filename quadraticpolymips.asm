#s/my name/censorbar/
#Program 1
#CS 313 Spring 2015

		.data
xprompt:	.asciiz		"\n Enter value for x "
c2prompt:	.asciiz		"\n Enter value for c2 "
c1prompt:	.asciiz		"\n Enter value for c1 "
c0prompt:	.asciiz		"\n Enter value for c0 "
result:		.asciiz		"\n The result is: "
		.globl		main
		.text
main:
	li	$v0, 4		#syscall code Print String
	la	$a0, xprompt
	syscall
	
	li	$v0, 5		#syscall code Read Int
	syscall
	
	li	$t0, 0		#empty t0
	add	$t0, $t0, $v0	#store x in t0
	
	li	$v0, 4		#syscall code Print String
	la	$a0, c2prompt
	syscall
	
	li	$v0, 5		#syscall code Read Int
	syscall
	
	li	$t1, 0		#empty t1
	add	$t1, $t1, $v0	#store c2 in t1
	
	li	$v0, 4		#syscall code Print String
	la	$a0, c1prompt
	syscall
	
	li	$v0, 5		#syscall code Read Int
	syscall
	
	li	$t2, 0		#empty t2
	add	$t2, $t2, $v0	#store c1 in t2
	
	li	$v0, 4		#syscall code Print String
	la	$a0, c0prompt
	syscall
	
	li	$v0, 5		#syscall code Read Int
	syscall
	
	li	$t3, 0		#empty t0
	add	$t3, $t3, $v0	#store c0 in t3
	
	#square x
	mult	$t0, $t0
	mflo	$t4		#=x^2
	#multiply square of x by c2
	mult	$t4, $t1
	mflo	$t4		#=c2x^2
	#multiply x by c1
	mult	$t0, $t2
	mflo	$t0		#=c1x
	#add xc^2 and xc
	add	$t1, $t4, $t0	#t1 = t4 + t0
				#apologies for reusing registers
	#add result and c0
	add	$t0, $t1, $t3
	
	li	$v0, 4		#syscall code Print String
	la	$a0, result
	syscall			
	
	li	$v0, 1
	move	$a0, $t0
	syscall
	
	li	$v0, 10
	syscall
