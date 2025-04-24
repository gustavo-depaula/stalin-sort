# RISC-V assembly program for Stalin-sort
#


.macro int_input(%var)

	li		a7, 5

	ecall

	mv		%var, a0

.end_macro	

.macro print_str(%str)

	.data

		str:	.asciz %str

	.text

	li 		a7, 4
	
	la 		a0, str

	ecall

.end_macro

	

.macro print_int(%var)

	li 		a7, 1

	mv 		a0, %var

	ecall

.end_macro

	

.macro newline

	print_char('\n')

.end_macro



.macro null.exit()

	li 		a7, 10

	ecall

.end_macro	


    .text

    .globl _start



_start:

    # Read the number of elements

    print_str		"Please, enter the number of elements:	"
    
    int_input		t0
    addi 		sp sp -100
    mv			s0 sp
    li			t1 0
    
    print_str		"Now, please enter "
    print_int		t0	
    print_str		" elemets, one per line:\n"

read_loop:

    beq			t1 t0 end_read_loop 
    int_input		t2
    sw			t2 0(sp)
    addi		sp sp 4
    addi		t1 t1 1
    j			read_loop

end_read_loop:

    mv			sp, s0
    li			t3, -2147483648
    mv			s1, s0
    li			t4, 0
    li			t5, 0

sort_loop:

    beq			t5, t0, end_sort_loop
    lw			t6, 0(sp)
    addi		sp, sp, 4
    bge			t6, t3, keep
    j			next

keep:

    mv			t3, t6
    sw			t6, 0(s1)
    addi		s1, s1, 4
    addi		t4, t4, 1

next:

    addi		t5, t5, 1
    j			sort_loop

end_sort_loop:

    li			t1, 0
    mv			s1, s0
    print_str		"\nStalin-sorted array:	"
    print_str		"["

print_loop:

    beq			t1, t4, end_print_loop
    lw			t6, 0(s1)
    addi		s1, s1, 4
    print_int		t6
    addi		t1, t1, 1
    bge			t1, t4, end_print_comma
    print_str		", "

end_print_comma:

    j			print_loop

end_print_loop:

    print_str		"]\n"
    null.exit
