-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe)

import Shape

main :: IO ()
main = hspec $ do
  describe "Points" $ do
    it "origin" $ do
      origin `shouldBe` point (0.0, 0.0)
    it "point" $ do
      point (1.0, -1.0) `shouldBe` Point { x = 1.0, y = -1.0}
    it "shift" $ do
      shift origin (1.0, 1.0) `shouldBe` point (1.0, 1.0)
      
  describe "Rectangles" $ do
    let r01 = Rectangle origin Point {x = 1.0, y = 1.0}
    it "rectanle" $ do
      rectangle (1.0, 1.0) `shouldBe` r01
    it "base" $ do
      base r01 `shouldBe` 1.0
    it "height" $ do
      base r01 `shouldBe` 1.0
    it "shift" $ do
      shift r01 (1.0, 2.0) `shouldBe` Rectangle (Point {x = 1.0, y = 2.0}) (Point {x = 2.0, y = 3.0})
    it "surface" $ do
      surface r01 `shouldBe` 1.0

  describe "Circles" $ do
    let c01 = Circle origin 1.0
    it "circle" $ do
      circle 1.0 `shouldBe` c01
    it "shift" $ do
      shift c01 (1.0, 2.0) `shouldBe` Circle Point {x = 1.0, y = 2.0} 1.0
    it "surface" $ do
      surface c01 `shouldBe` pi  
    