module KNN.Dist 
( euclidDist
, calcDists
, parseLn
, Flower(..) ) where

import qualified Text.Regex as Rx

data Flower a = Flower { 
	label :: String, 
	dims :: [a] 
} deriving (Eq, Show)

parseLn :: String -> Flower Double
parseLn str = Flower { label = (last strs), dims = (map read $ init strs) }
				where strs = Rx.splitRegex (Rx.mkRegex ",") str

euclidDist :: Floating a => [a] -> [a] -> a
euclidDist v0 v1 = sqrt $ sum [ (x - y) ^ (2::Int) | (x, y) <- zip v0 v1 ]

calcDists :: Floating a => [a] -> [Flower a] -> [(String, a)]
calcDists un cl = [ (label fl, euclidDist un $ dims fl) | fl <- cl ]
