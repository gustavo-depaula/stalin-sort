module StalinSort (stalinSort) where 
stalinSort :: Ord a => [a] -> [a]
stalinSort [] = []
stalinSort (x:xs) = x : stalinSort' x xs

stalinSort' :: Ord a => a -> [a] -> [a]
stalinSort' _ [] = []
stalinSort' x (y:ys) = if (x <= y)
    then y : (stalinSort' y ys)
    else stalinSort' x ys


