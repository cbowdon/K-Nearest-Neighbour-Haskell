module KNN.Dist 
( euclidDist
, calcDists
, parseLn
, Flower(..)
, Measured(..) ) where

import qualified Text.Regex as Rx

type Label = String

data Flower a = Flower { 
	getLabel 	:: Label, 
	getDims 	:: [a] 
} deriving (Eq, Show)

data Measured a = Measured {
	getTag 	:: Label,
	getDist	:: a
} deriving (Eq, Show)

instance Ord a => Ord (Measured a) where
	compare x y = compare (getDist x) (getDist y)

parseLn :: String -> Flower Double
parseLn str = Flower (last strs) (map read $ init strs)
				where strs = Rx.splitRegex (Rx.mkRegex ",") str

euclidDist :: Floating a => [a] -> [a] -> a
euclidDist v0 v1 = sqrt $ sum [ (x - y) ^ (2::Int) | (x, y) <- zip v0 v1 ]

calcDists :: Floating a => [Flower a] -> Flower a -> [Measured a]
calcDists cl un = [ Measured (getLabel fl) (euclidDist (getDims un) (getDims fl)) | fl <- cl ]
