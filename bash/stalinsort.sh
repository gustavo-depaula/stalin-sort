#!/bin/bash
numeric(){
	(($1 > $2))
}

lexical(){
	[[ $1 > $2 ]]
}

stalin_sort(){
	local max=$1
	local out=()
 	local i cmp
	if [[ "$@" =~ ^[0-9\ ]+$ ]]; then
 		cmp=numeric
  	else
		cmp=lexical
	fi
  	for i in "$@"; do
		if "$cmp" "$max" "$i"; then
			continue;
		fi
		out+=("$i")
		max=$i
	done
	printf '%q ' "${out[@]}"
 	printf '\n'
}
#TEST
#stalin_sort 1 2 10 3 4 5 15 6 30 20
#stalin_sort a c b a c d
#stalin_sort 1 a 2 b 3 c
