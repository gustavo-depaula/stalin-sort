module StalinSort (stalinSort) where 

stalinSort              :: Ord a => [a] -> [a]
stalinSort []           = []
stalinSort [x]          =  [x]
stalinSort (x : y : zs) |  x < y     = x : stalinSort (y : zs)
                        |  otherwise = stalinSort (x : zs)
