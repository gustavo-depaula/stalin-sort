implementation module StalinSort

import StdEnv

stalinSort :: [a] -> [a] | < a
stalinSort [] = []
stalinSort [x] = [x]
stalinSort [x, y : zs]
	| x <= y = [x : stalinSort [y : zs]]
	| otherwise = stalinSort [x : zs]
