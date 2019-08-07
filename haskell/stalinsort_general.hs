module stalinsort_general (stalinSort) where

stalinSort :: (Monoid (t a), Foldable t, Applicative t, Ord a) => t a -> t a
stalinSort = 
  let
    f a (Nothing, bs) = (Just a, pure a <> bs)
    f a (Just a', bs) = if a <= a' then (Just a, pure a <> bs) else (Just a', bs)
  in  
    snd . foldr f (Nothing, mempty)
