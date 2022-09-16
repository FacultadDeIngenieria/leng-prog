module Huffman  (huffmanTrie, encode, decode, Trie(..), Bit(..)) where

import qualified Data.Map as M 

data Bit = F | T deriving (Eq, Show)
type Bits = [Bit]  

data Trie a = Empty
            | Leaf a
            | Trie a :-: Trie a deriving (Eq, Show, Ord)

huffmanTrie::String -> Trie Char
huffmanTrie input =  error "Implement it"

encode :: String -> Trie Char -> Bits
encode input code = error "Implement it"
  
decode::Bits -> Trie Char -> String
decode bits trie = error "Implement it"