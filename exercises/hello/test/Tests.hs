-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe)

import Hello (func)

main :: IO ()
main = hspec $ do
  describe "test 1" $ do
    it "Case 1" $ do
      func "Newton" `shouldBe` "Newton"
