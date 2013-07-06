import System.IO
import KNN.Dist
import KNN.Sort

main :: IO ()
main = do
	cHandle <- openFile "data/classified.csv" ReadMode
	uHandle <- openFile "data/unclassified.csv" ReadMode
	classified <- hGetContents cHandle
	unclassified <- hGetContents uHandle

	let cl = map parseLn $ lines classified
	let ul = map parseLn $ lines unclassified

	let real = map label ul
	let calc = map (tag . (\x -> knn 5 cl x)) ul

	putStrLn "\nUnclassified - real labels:\n"
	print real
	putStrLn "\nPost-KNN - calculated labels:\n"
	print calc

	let score = foldl (\x y -> if y then x + (1::Int) else x) 0 [x == y | (x, y) <- zip real calc]
	let total = length real
	putStrLn "\nScore / total:"
	putStr $ show score
	putStr " / "
	putStrLn $ show total

	hClose cHandle
	hClose uHandle

knn :: (Ord a, Floating a) => Int -> [Flower a] -> Flower a -> Measured a
knn k c = modal . take k . quickselect k . calcDists c
