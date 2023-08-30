	.data
	
unsortedArray:
	.word 1, 2, 4, 3, 6, 8, 0, 9, 5, 7
	
numArrayElements:
	.word 10
	
unsortedArrayName:
	.asciiz "Unsorted Array: "

sortedArrayName:
	.asciiz "Stalin Sorted Array: "
	
	.text
	.globl main
	.globl stalinSort

# main entry point
main:
	la $a0, unsortedArrayName # put address of unsorted array string name in a0
	lw $a1, numArrayElements # put num of elements in unsorted array in a1
	la $a2, unsortedArray # put start address of unsorted array in a2
	jal printArray # print unsorted array first
	la $a0, unsortedArray # put address of unsorted array in a0 to meet stalinSort arg format
	jal stalinSort # call sort function
	la $a0, sortedArrayName # put address of sorted array string name in a2
	move $a1, $v1 # put num of elements in sorted array into a1
	move $a2, $v0 # put sorted array address into a0 for printing
	jal printArray # now print sorted array
	li $v0, 10 # syscall input for exit
	syscall # terminate program

# Assumes $ra contains return address of calling function
# INPUTS
# $a0 = start address of input array
# $a1 = number of input array elements
# OUTPUTS
# $v0 = mem address of sorted array start
# $v1 = number of sorted array elements
stalinSort:
	move $t0, $a0 # store curr input array address location to t0
	move $t1, $a1 # store number of input elements to t1
	move $t2, $0 # t2 = byte offset of next input array address (init to 0)
	move $a0, $t1 # copy num input elements to a0 for func call
	sw $ra, ($sp) # save return address to main before next jal
	addi $sp, $sp, -4 # move stack pointer 1 word for stored ra
	jal allocArray # allocate enough space for return array
	addi $sp, $sp, 4 # move stack pointer back
	lw $ra, ($sp) # recover ra to main from stack
	move $t3, $v0 # store start address of return address in s2
	li $t4, -4 # t4 = byte offset of last added return element (init to -4 since nothing added)
	
# iterate over elements in input array
forInputElem:
	srl $t5, $t2, 2 # t5 = num iterated elements (t2 byte offset / 4)
	bge $t5, $t1, returnStalinSort # if num iterated elements >= num input elements goto return
	add $t5, $t0, $t2 # t5 = address of next input array element
	lw $t5, ($t5) # t5 = value of next input array element
	addi $t2, $t2, 4 # increment byte offset of next input array address by 4 (word size)
	addu $t6, $t3, $t4 # t6 = address of last added return array element
	beq $t2, 4, addElement # always add first element (happens when t2 == 4 b/c we already iterate)
	lw $t7, ($t6) # load value of last added return array element
	blt $t5, $t7, forInputElem # if input element < last added return element skip adding it

# store input element in next available return array address
addElement:
	sw $t5, 4($t6) # store accepted input element into next available return array location (last added address + 4)
	addi $t4, $t4, 4 # increment byte offset of last added return value by 4 (word size)
	j forInputElem # continue loop over input array

# prep return registers
returnStalinSort:
	addi $t4, $t4, 4 # add 4 bytes to return offset to compensate for starting at -4
	move $v0, $t3 # new array start address goes in v0
	srl $v1, $t4, 2 # num elements in return array = (byte offset) / 4
	jr $ra # go to return address of whoever called stalin-sort

# INPUTS
# $a0 = number of elements to allocate in new array
# OUTPUTS
# $v0 = address of allocated array
allocArray: # allocate new array of size a0 bytes
	sll $a0, $a0, 2 # a0 = num bytes to allocate ;; (num input) * (4 bytes per word)
	li $v0, 9 # load syscall for sbrk
	syscall # sbrk allocates space of $a0 number of bytes and puts addresss of new array in v0
	jr $ra # return

# assumes array of ints and $a2 is a null-terminated string
# INPUTS
# $a0 = address of string to print before array
# $a1 = number of elements in array
# $a2 = start address of array to print
printArray:
	li $v0, 4 # syscall to print a null-terminated string
	syscall # a0 already contains address of string
	move $t0, $0 # t0 = byte offset of next array value address (init to 0)
	
# loop over array elements
forArrayElem:
	srl $t1, $t0, 2 # t1 = num iterated elements (byte offset / 4)
	bge $t1, $a1, returnFromPrintArray # if num iterated elements >= num elements then goto return
	add $t1, $a2, $t0 # get address of next array element to print
	lw $a0, ($t1) # load value of next array element to a0
	li $v0, 1 # load syscall for print integer
	syscall # print integer value
	li $a0, 0x20 # load ascii code for space
	li $v0, 11 # load syscall for print single character
	syscall # print space
	addi $t0, $t0, 4 # increment byte offset by 4 (num bytes in word)
	j forArrayElem # continue loop 

# print new line and return to $ra upon completion of print
returnFromPrintArray:
	li $a0, 0xA # load ascii code for new line
	li $v0, 11 # load syscall for print single character
	syscall # print new line before returning
	jr $ra # return to calling function