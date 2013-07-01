import KNN.Dist

main :: IO ()
main = do
	contents <- getContents
	print $ map parseLn $ lines contents
