-- {-# LANGUAGE RecordWildCards #-}

--import Data.Foldable (for_)
import Test.Hspec    (describe, hspec, it, shouldBe)

import Huffman

main :: IO ()
main = hspec $ do
  describe "huffman Trie" $ do
    it "Empty input" $ do
      huffmanTrie "" `shouldBe` Empty
      
    it "Simple Text" $ do
     huffmanTrie "PAPAYA" `shouldBe` Leaf 'A' :-: (Leaf 'Y' :-: Leaf 'P')  

    it "Longer" $ do
     huffmanTrie "zapallo con papa" `shouldBe` 
        ((Leaf 'z' :-: Leaf ' ') :-: Leaf 'a')
           :-:
        (  (Leaf 'l' :-: Leaf 'o')
             :-: 
           ((Leaf 'c' :-: Leaf 'n') :-: Leaf 'p')) 
           
  describe "encode" $ do
    it "Empty input" $ do
      doEncode "" `shouldBe` []
      
    it "Simple Text" $ do
      doEncode "PAPAYA" `shouldBe` [T,T,F,T,T,F,T,F,F] 

    it "Longer" $ do
      doEncode "zapallo con papa" `shouldBe` [F,F,F,F,T,T,T,T,F,T,T,F,F,T,F,F,T,F,T,F,F,
                                              T,T,T,F,F,T,F,T,T,T,F,T,F,F,T,T,T,T,F,T,T,T,T,F,T]

  describe "decode"  $ do
    it "Empty input"  $ do
      doDecode "" [] `shouldBe` ""  
      
    it "Simple Text" $ do
      doDecode "PAPAYA" [T,T,F,T,T,F,T,F,F] `shouldBe` "PAPAYA"
      
    it "Longer" $ do
      doDecode "zapallo con papa"  
        [F,F,F,F,T,T,T,T,F,T,T,F,F,T,F,F,T,F,T,F,F,
         T,T,T,F,F,T,F,T,T,T,F,T,F,F,T,T,T,T,F,T,T,T,T,F,T] `shouldBe` "zapallo con papa"  
      
doEncode :: String -> [Bit]
doEncode s = encode s (huffmanTrie s)

doDecode :: String -> [Bit] -> String
doDecode s bs = decode bs (huffmanTrie s) 