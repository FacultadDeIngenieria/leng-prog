-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe)

import Example (help, hello, obliqueShot)

main :: IO ()
main = hspec $ do
  describe "help" $ do
    it "Newton" $ do
      hello "Newton" `shouldBe` "Hello: Newton!"
  describe "obliqueShot" $ do
    it "45 degrees,  10 m/s" $ do
        let (t, r) = obliqueShot 45 10
        let time = round (t * 1000)
        let range = round (r * 1000)
        (time, range) `shouldBe` (10197,2549)
