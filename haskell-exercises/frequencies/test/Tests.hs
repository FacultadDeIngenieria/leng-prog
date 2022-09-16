import Test.Hspec    (describe, hspec, it, shouldBe)

import Frequencies (frequencyMap, insertionSort, insert, frequencies)
import qualified Data.Map as M

main :: IO ()
main = hspec $ do
  describe "frequencies" $ do
    it "Int Frequencies" $ do
      frequencyMap [1, 20, 1, 7, 20, 1] `shouldBe` M.fromList [(1, 3), (20, 2), (7, 1)]
    it "Words Frequency" $ do
      frequencyMap (words "Hello pal, Hello") `shouldBe` M.fromList [("Hello",2),("pal,",1)] 
    it "Char Frequencies" $ do
      frequencyMap "PAPAYA" `shouldBe` M.fromList [('A',3),('P',2),('Y',1)]
      
  describe "insertionSort" $ do
    it "Sort Integers" $ do
      insertionSort [10, 3, 1, 2] `shouldBe` [1, 2, 3, 10]
    it "Sort Tuples" $ do
      insertionSort [(10, 'C'), (10, 'A'), (1, 'B')] `shouldBe` [(1,'B'),(10,'A'),(10,'C')]
      
  describe "insert" $ do
    it "insert an Int" $ do
      insert 5 [1, 3..10] `shouldBe` [1,3,5,5,7,9]   
  
  describe "frequencies" $ do
    it "empty list" $ do
      frequencies "" `shouldBe` []  
    it "PAPAYA" $ do
      frequencies "PAPAYA" `shouldBe` [(1,'Y'),(2,'P'),(3,'A')]    
    it "Zapallo con Papa" $ do
      frequencies "Zapallo con Papa" `shouldBe` [(1,'P'),(1,'Z'),(1,'c'),(1,'n'),(2,' '),(2,'l'),(2,'o'),(2,'p'),(4,'a')]    