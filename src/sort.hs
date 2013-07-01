module KNN.Sort
( quickselect
, quicksort' ) where

quickselect :: Ord a => Int -> [a] -> [a]
quickselect n ls = []
{-
	| n == n' = lss ++ gtr
	| n < n' = quickselect n lss ++ gtr
	| n > n' = lss ++ quickselect (n - n') gtr
		where (n', lss, gtr) = quicksort' n ls
-}

quicksort' :: Ord a => Int -> [a] -> ([a], [a], [a])
quicksort' n ls = qiter (ls!!n) ls [] [] []
	where
		qiter _ [] lt eq gt 	= (lt, eq, gt)
		qiter y (x:xs) lt eq gt = case compare x y of
								EQ -> qiter y xs lt (x:eq) gt
								LT -> qiter y xs (x:lt) eq gt
								GT -> qiter y xs lt eq (x:gt)

