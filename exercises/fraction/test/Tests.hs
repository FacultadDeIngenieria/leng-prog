-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe, Spec)

import Fraction (Fraction, add, sub, mul, divide, hcf)

main :: IO ()

-- Comment this line and uncomment the line below to run the tests doing simplification
main = hspec $ test id
-- main = hspec $ test simplify

test :: (Fraction -> Fraction) -> Spec
test s = do 
  describe "add" $ do
    it "1/2 + 1/4" $ do
      (1, 2) `add` (1, 4) `shouldBe` s (6, 8)
  describe "sub" $ do
    it "1/2 - 1/4" $ do
      (1, 2) `sub` (1, 4) `shouldBe` s (2, 8)
  describe "mul" $ do
    it "1/2 * 1/4" $ do
      (1, 2) `mul` (1, 4) `shouldBe` s (1, 8)
  describe "divide" $ do
    it "1/2 / 1/4" $ do
       (1, 2) `divide` (1, 4) `shouldBe` s (4, 2)
  describe "highest common factor"  $ do
    it "24 and 30" $ do
      hcf 24 30 `shouldBe` 6
    it "30 and 24" $ do
      hcf 30 24 `shouldBe` 6
      
simplify::Fraction -> Fraction
simplify (n, d) = (n `div` h, d `div` h)
  where h = gcd n d           
      
      
         