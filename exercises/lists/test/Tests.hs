-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe)

import Lists (
   member, union, intersection, difference,
   insert, insertionSort,
   binaryToDecimal, toDecimal, toDec,
   decimal,
   firsts,
   binaryAdd)

main :: IO ()
main = hspec $ do
  describe "member" $ do
    it "find it" $ do
      member 2 [1..5] `shouldBe` True
    it "don't find it" $ do
      member 7 [1..5] `shouldBe` False

  describe "union" $ do
    it "Same Set" $ do
      union [1..5] [1..5] `shouldBe` [1..5]
    it "Some common elements" $ do
      union [1..5] [3..7] `shouldBe` [1..7]
    it "Disjoint sets" $ do 
      union [1..5] [6..7] `shouldBe` [1..7]

  describe "intersection" $ do
    it "Same Set" $ do
      intersection [1..5] [1..5] `shouldBe` [1..5]
    it "Some common elements" $ do
      intersection [1..5] [3..7] `shouldBe` [3..5]
    it "Disjoint sets" $ do 
      intersection [1..5] [6..7] `shouldBe` []

  describe "difference" $ do
    it "Same Set" $ do
      difference [1..5] [1..5] `shouldBe` []
    it "Some common elements" $ do
      difference [1..5] [3..7] `shouldBe` [1, 2]
    it "Some common elements reverse" $ do
      difference [3..7] [1..5]`shouldBe` [6, 7]
    it "Disjoint sets" $ do 
      difference [1..5] [6..7] `shouldBe` [1..5]
  
    
  
  describe "insert" $ do
    it "Empty List" $ do
      insert 3 [] `shouldBe` [3]
    it "Front" $ do
      insert 1 [3..7] `shouldBe` [1, 3, 4, 5, 6, 7]
    it "Middle" $ do
      insert 6 [3,5..7] `shouldBe` [3, 5, 6, 7]
    it "End" $ do 
      insert 7 [1..3] `shouldBe` [1, 2, 3, 7]
    it "Duplicate" $ do 
      insert 6 [5, 5, 6, 6, 7] `shouldBe` [5, 5, 6, 6, 6, 7]        

  describe "insertion sort" $ do
    it "Empty List" $ do
      insertionSort [] `shouldBe` []
    it "Already sorted" $ do
      insertionSort [1,3..7] `shouldBe` [1,3..7]
    it "Reversed" $ do
      insertionSort [7,5..1] `shouldBe` [1, 3, 5, 7]
    it "Duplicates" $ do 
      insertionSort [1, 7, 1, 9, 5, 9] `shouldBe` [1, 1, 5, 7, 9, 9]
      

  describe "numeral systems" $ do
    it "Binary 101" $ do
      binaryToDecimal [1, 0, 1] `shouldBe` 5
    it "Binary 1000" $ do
      binaryToDecimal [1, 0, 0, 0] `shouldBe` 8
    it "Base 8" $ do
      toDecimal 8 [7, 3] `shouldBe` 59
    it "Base 16" $ do 
      toDecimal 16 [1, 1] `shouldBe` 17
    it "String 8" $ do
      toDec 8 "73" `shouldBe` 59
    it "String Base 16" $ do 
      toDec 16 "1F" `shouldBe` 31
    it "String 8" $ do
      decimal 8 "73" `shouldBe` 59
    it "String Base 16" $ do 
      decimal 16 "1F" `shouldBe` 31
      
  describe "firsts" $ do
    it "[1, 2, 5]" $ do
      firsts [1, 3, 5] `shouldBe` [[1], [1, 3], [1, 3, 5]]
    it "Hello" $ do          
      firsts "Hello" `shouldBe` ["H", "He", "Hel", "Hell", "Hello"]
  describe "binary add" $ do    
    it "2 + 1 = 3" $ do 
      binaryAdd "11" "1"  `shouldBe` "100"
    it "15 + 3 = 18" $ do 
      binaryAdd "1111" "11"  `shouldBe` "10010"
    it "\"\" + \"\" = \"0\"" $ do 
          binaryAdd "" ""  `shouldBe` "0"  
              
