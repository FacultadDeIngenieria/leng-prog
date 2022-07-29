-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe)

import Fraction (add, sub, mul, divide, hcf)

main :: IO ()
main = hspec $ do
  describe "add" $ do
    it "1/2 + 1/4" $ do
      (1, 2) `add` (1, 4) `shouldBe` (6, 8)
  describe "sub" $ do
    it "1/2 - 1/4" $ do
      (1, 2) `sub` (1, 4) `shouldBe` (2, 8)
  describe "mul" $ do
    it "1/2 * 1/4" $ do
      (1, 2) `mul` (1, 4) `shouldBe` (1, 8)
  describe "divide" $ do
    it "1/2 / 1/4" $ do
       (1, 2) `divide` (1, 4) `shouldBe` (4, 2)
  describe "highest common factor"  $ do
    it "4 and 2" $ do
      hcf 4 2 `shouldBe` 2
         
