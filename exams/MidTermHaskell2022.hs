module MidTermHaskell2022  where

import Control.Monad
import qualified Data.Map as Map  
  
encode:: String -> [(Int, Char)]
encode ""     = []
encode (x:xs) = encode' 1 x xs
  where
    encode' n chr "" = [(n, chr)]
    encode' n chr (y:ys)
      | chr == y  = encode' (n+1) y ys
      | otherwise = (n, chr) : encode' 1 y ys

encodeV2 :: String -> [(Int, Char)]
encodeV2 ""     = []
encodeV2 (c:cs) = eV2 (span (==c) cs) 
  where
    eV2 ([], ys) = (1, c) : encodeV2 ys
    eV2 (rs, ys) = (1 + length rs, c) : encodeV2 ys      

--encodeV3 :: String -> [(Int, Char)]
--encodeV3 ""  = []
--encodeV3 [x] = [(1, x)]
--encodeV3 (x:xs) = if x == letter then (count+1, letter) : rest else (1, x) : (count, letter):rest 
--  where encodedTail = encodeV3 xs
--        (count, letter):rest = encodedTail   

decode::[(Int, Char)] -> String
decode = concatMap expand
  where expand (n, chr) = replicate n chr   
  
data Element = One Char | Repeat Char Int deriving (Show, Eq)
  
encode2::String -> [Element]
encode2 l = [if n == 1 then One chr else Repeat chr n | (n, chr) <- encode l]

data Student  = Student { idNumber::Int, name:: String } deriving (Show)


averageScores:: [(Int, Int)] -> Map.Map Int Double
averageScores exams = average <$> foldr addExam Map.empty exams

addExam :: (Int, Int) -> Map.Map Int [Int] -> Map.Map Int [Int]
addExam (studentId, score) = Map.insertWith (++) studentId [score]

average::[Int] -> Double
average l = fromIntegral (sum l) / fromIntegral (length l)        
         
printAverages::[Student] -> Map.Map Int Double -> IO ()
printAverages [] _ = return ()
printAverages (student:students) scores = do
  putStrLn (name student ++ " " ++ scoreAsString (idNumber student) scores)
  printAverages students scores

printAverages2::[Student] -> Map.Map Int Double -> IO ()
printAverages2 students scores =
    forM_ students $ \student ->
       putStrLn (name student ++ " " ++ scoreAsString (idNumber student) scores)
    
scoreAsString::Int -> Map.Map Int Double -> String
scoreAsString studentId scoresMap = toStr $ Map.lookup studentId scoresMap
  where toStr Nothing  = "No Show"
        toStr (Just n) = show n