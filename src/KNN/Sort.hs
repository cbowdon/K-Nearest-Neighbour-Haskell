module KNN.Sort
( modal
, quickselect
, quicksort' ) where

import qualified Data.Map as Map

modal :: Ord a => [a] -> a
modal = fst . maxValue . count

count :: Ord a => [a] -> Map.Map a Int
count = foldl addOrInsert Map.empty
	where addOrInsert m k = case Map.lookup k m of
							Nothing -> Map.insert k 1 m
							Just _ 	-> Map.update (\x -> Just (x + 1)) k m

maxValue :: Eq a => Map.Map a Int -> (a, Int)
maxValue mp = Map.foldlWithKey hasMaxVal (head $ Map.assocs mp) mp
	where hasMaxVal p k v
		| v > snd p = (k,v)
		| otherwise	= p


quickselect :: Ord a => Int -> [a] -> [a]
quickselect n ls
	| n == n' 	= lss ++ eq ++ gtr
	| n < n' 	= (quickselect n lss) ++ eq ++ gtr
	| n < n''	= lss ++ eq ++ gtr
	| otherwise	= lss ++ (quickselect (n - n') (eq ++ gtr))
		where 
			(lss, eq, gtr) = quicksort' n ls
			n' = length lss
			n'' = n' + length eq

quicksort' :: Ord a => Int -> [a] -> ([a], [a], [a])
quicksort' n ls = qiter (ls!!n) ls [] [] []
	where
		qiter _ [] lt eq gt 	= (lt, eq, gt)
		qiter y (x:xs) lt eq gt = case compare x y of
									EQ -> qiter y xs lt (x:eq) gt
									LT -> qiter y xs (x:lt) eq gt
									GT -> qiter y xs lt eq (x:gt)

