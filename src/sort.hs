module KNN.Sort
( quickselect
, quicksort' ) where

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

