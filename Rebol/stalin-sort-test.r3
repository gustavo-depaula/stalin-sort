Rebol [
	title:  "Stalin Sort usage example"
	needs:   2.101.0 ;; or newer (https://github.com/Oldes/Rebol3/releases/)
]

import %stalin-sort.reb

foreach input [
	[1 2 5 3 2 1 5 7]
	"chaotic"
	#{deadbeef}
	[#"s" #"t" #"a" #"l" #"i" #"n"]
][
	print ["Input: " mold input]
	print ["Output:" mold stalin-sort input]
	print ""
]
ask "Press enter to quit."