import Test.Hspec    (describe, hspec, it, shouldBe)
import ListsPart2 (Bit(..),  charToBits, bits, queens)

main :: IO ()
main = hspec $ do
  describe "charToBits" $ do
    it "A" $ do
      charToBits 'A' `shouldBe` [F,F,T,F,F,F,F,F]
    it "B" $ do
      charToBits 'B' `shouldBe` [F,F,T,F,F,F,F,T]
    it "Char 0" $ do
      charToBits '\0' `shouldBe` [F,F,F,F,F,F,F,F]
      
      
  describe "bits" $ do
    it "AB" $ do
      bits "AB" `shouldBe` [F,F,T,F,F,F,F,F,F,F,T,F,F,F,F,T]
    it "\"\"" $ do
      bits "" `shouldBe` []
      

  describe "queens" $ do
    it "1x1" $ do
      queens 1 `shouldBe` [[1]]     
    it "2x2" $ do
      queens 2 `shouldBe` []      
    it "first (8x8)" $ do
      minimum (queens 8) `shouldBe`[1,5,8,6,3,7,2,4]
    it "number of solutions 8x8" $ do
      length (queens 8) `shouldBe` 92 
               