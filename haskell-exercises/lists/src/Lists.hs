module Lists (member, union, intersection, difference,
              insert, insertionSort, firsts,
              binaryToDecimal, toDecimal, toDec, decimal,
              binaryAdd) where
  
import Data.Char(digitToInt)  

member:: Int -> [Int] -> Bool
member _ []      = False
member e (x:xs)  = e == x || member e xs


union:: [Int] -> [Int] -> [Int]
union [] ys     = ys
union (x:xs) ys 
  | member x ys = union xs ys
  | otherwise   = x : union xs ys

intersection:: [Int] -> [Int] -> [Int]
intersection = error "Implement it"

difference:: [Int] -> [Int] -> [Int]
difference  = error "Implement it"

insert:: Int -> [Int] -> [Int]
insert = error "Implement it"

insertionSort :: [Int] -> [Int]
insertionSort = error "Implement it"

binaryToDecimal :: [Int] -> Int
binaryToDecimal = error "Implement it"
    
toDecimal :: Int -> [Int] -> Int
toDecimal = error "Implement it"
    
toDec::Int -> String -> Int
toDec base s = error "Implement it"

-- Same as `toDec` But use a list comprehension

decimal::Int -> String -> Int
decimal  = error "Implement it"

firsts::[a] -> [[a]]
firsts = error "Implement it"

-- Given two String that represents numbers in binary implement the 'binaryAdd' function
-- DO NOT USE a predefined '+' operation

binaryAdd::String -> String -> String
binaryAdd  = error "Implement it"
