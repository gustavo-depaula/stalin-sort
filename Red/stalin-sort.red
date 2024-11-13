Red [
	title: "Stalin Sort"
	sample: [
		stalin-sort [1 2 5 3 2 1 5 7]  ;[1 2 5 5 7]
		stalin-sort "chaotic"          ;"chot"
		stalin-sort #{deadbeef}        ;#{DEEF}
	]
]

stalin-sort: func ["Stalin-sorts a series (modified)." values [series!] /local foo bar][
	parse values [any [
		set foo skip
		remove any [set bar skip if (lesser? bar foo)]
	]]
	values
]
