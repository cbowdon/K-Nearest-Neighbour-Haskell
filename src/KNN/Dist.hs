module KNN.Dist 
( euclidDist
, calcDists
, parseLn
, Flower(..)
, makeFlower
, Measured(..)
, makeMeasured ) where

import qualified Text.Regex as Rx

type Label = String

data Flower a = Flower { 
	label 	:: Label, 
	dims 	:: [a] 
} deriving (Eq, Show)

makeFlower :: Label -> [a] -> Flower a
makeFlower l d = Flower { label = l, dims = d }

data Measured a = Measured {
	tag 	:: Label,
	dist	:: a
} deriving (Eq, Show)

instance (Ord a) => Ord (Measured a) where
	compare x y = compare (dist x) (dist y)

makeMeasured :: Label -> a -> Measured a
makeMeasured t d = Measured { tag = t, dist = d }

parseLn :: String -> Flower Double
parseLn str = makeFlower (last strs) (map read $ init strs)
				where strs = Rx.splitRegex (Rx.mkRegex ",") str

euclidDist :: Floating a => [a] -> [a] -> a
euclidDist v0 v1 = sqrt $ sum [ (x - y) ^ (2::Int) | (x, y) <- zip v0 v1 ]

calcDists :: Floating a => [Flower a] -> Flower a -> [Measured a]
calcDists cl un = [ makeMeasured (label fl) (euclidDist (dims un) (dims fl)) | fl <- cl ]
