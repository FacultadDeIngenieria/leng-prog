import Test.Hspec    (describe, hspec, it, shouldBe)

import Trie (Trie(..), left, right, find, decode, toList)
import Bit (Bit(T, F))

main :: IO ()
main = hspec $ do
  let trie = (Leaf 'A' :-: Leaf 'B') :-: Leaf 'C'
  describe "Binary Trie - Basic" $ do
    it "left" $ do
      left trie `shouldBe` (Leaf 'A' :-: Leaf 'B')
      
    it "right" $ do
      right trie `shouldBe` Leaf 'C'

    it "left, left" $ do
      left (left trie) `shouldBe` Leaf 'A'

  describe "find" $ do
    it "T -> A" $ do
      [T] `find` trie `shouldBe` 'C'
      
    it "FT -> B" $ do
      [F, T] `find` trie `shouldBe` 'B'

  describe "decode" $ do
    it "FTFFFTFF -> BABA" $ do
      [F, T, F, F, F, T, F, F] `decode` trie `shouldBe` "BABA" 

    it "TFFFTFF -> CABA" $ do
      [T, F, F, F, T, F, F] `decode` trie `shouldBe` "CABA" 

  describe "toList" $ do
    it "(Leaf 'A' :-: Leaf 'B') :-: Leaf 'C'" $ do
      toList trie `shouldBe` [('A',[F,F]),('B',[F,T]),('C',[T])]
    it "Leaf 'A' :-: Leaf 'B'" $ do
      toList (left trie) `shouldBe` [('A',[F]),('B',[T])]
