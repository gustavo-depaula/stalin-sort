Rebol [
	title:  "Stalin Sort"
	name:    stalin-sort
	type:    module
	exports: [stalin-sort]
	needs:   2.101.0 ;; or newer (https://github.com/Oldes/Rebol3/releases/)
	note:    "Ported from the @gurzgri's Red version as a module"
]

stalin-sort: function ["Stalin-sorts a series (modified)." values [series!]][
	parse values [any [
		set foo: skip
		remove any [set bar: skip if (lesser? bar foo)]
	]]
	values
]
