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

	print $ head ul
	print $ knn 5 cl $ head ul

	hClose cHandle
	hClose uHandle

knn :: (Ord a, Floating a) => Int -> [Flower a] -> Flower a -> Measured a
knn k c u = modal $ take k $ quickselect k $ calcDists c u
