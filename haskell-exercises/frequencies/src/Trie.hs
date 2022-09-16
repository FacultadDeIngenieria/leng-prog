module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
data Trie a = Leaf a
            | Trie a :-: Trie a deriving (Eq, Show, Ord)

-- Bring definition from previous TP

left::Trie a -> Trie a
left = error "Define it"

right::Trie a -> Trie a
left = error "Define it"
  
find::Bits -> Trie a -> a
find = error "Define it"

decode::Bits -> Trie Char -> String
decode = error "Define it"

toList::Trie a -> [(a, Bits)]
toList = error "Define it"            
