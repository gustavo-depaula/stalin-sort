/* REXX */

/* Implementation of Stalin Sort in Rexx */



list_length = 9

/* ordered list */
ordered_list. = ''
ordered_list.0 = 0
do i = 1 to list_length
  ordered_list.i = i
  ordered_list.0 = ordered_list.0 + 1
  end

/* reversed list */
reversed_list. = ''
reversed_list.0 = 0
do i = 1 to list_length
  reversed_list.i = list_length + 1 - i
  reversed_list.0 = reversed_list.0 + 1
  end

/* random list */
random_list. = ''
random_list.0 = 0
do i = 1 to list_length * 2
  random_list.i = RANDOM(1, 9)
  random_list.0 = random_list.0 + 1
  end


say "Original list"
call print_list 'ordered_list.'
say "Sorted list"
call stalin_sort 'ordered_list.'
call print_list 'ordered_list.'
say ""

say "Original list"
call print_list 'reversed_list.'
say "Sorted list"
call stalin_sort 'reversed_list.'
call print_list 'reversed_list.'
say ""

say "Original list"
call print_list 'random_list.'
say "Sorted list"
call stalin_sort 'random_list.'
call print_list 'random_list.'
say ""


exit



/* sort list routine */
stalin_sort:
	parse arg _sort_list_name
	call _stalin_sort_helper
	return

_stalin_sort_helper: procedure expose (_sort_list_name)
	list_size = VALUE( _sort_list_name||0 )
	if list_size <= 1 then
		return
	list_item_name = _sort_list_name||1
	list_item = value( list_item_name )
	max_value = list_item
	new_list_size = 1
	do i = 2 to list_size
		list_item_name = _sort_list_name||i
		list_item = value( list_item_name )
		if list_item >= max_value
		then do
			queue list_item
			max_value = list_item
			new_list_size = new_list_size + 1
			end
		else
			nop
		end
	do i = 2 to new_list_size
		list_item_name = _sort_list_name||i
		pull list_item
		call value list_item_name, list_item
		end
	do i = new_list_size to list_size
		list_item_name = _sort_list_name||i
		drop list_item_name
		end
	list_item_name = _sort_list_name||0
	call value list_item_name, new_list_size
	return


/* print list routine */
print_list: 
  parse arg _print_list_name
	call _print_list_helper
	return

_print_list_helper: procedure expose (_print_list_name)
	list_size = VALUE( _print_list_name||0 )
	do i = 1 to list_size
		list_item_name = _print_list_name||i
		call charout, value( list_item_name )
		call charout, " "
		end
	say ""
	return


