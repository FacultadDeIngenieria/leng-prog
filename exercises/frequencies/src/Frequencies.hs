module Frequencies  (Frequency, frequencyMap, frequencies, insert, insertionSort) where

import Data.Map(Map)
import qualified Data.Map as Map
import Data.Tuple(swap)

type Frequency = (Int, Char)

frequencies::String -> [Frequency]
frequencies = error "Implement it"

frequencyMap::(Ord a) => [a] -> Map a Int
frequencyMap = error "Implement it"

insert::(Ord a) => a -> [a] -> [a]
insert = error "Implement it"
