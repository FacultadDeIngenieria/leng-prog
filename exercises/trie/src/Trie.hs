module Trie  (Trie(..), left, right, find, decode, toList) where

import Bit
  
data Trie a = Complete -- Add the Type definition deriving (Eq, Show)
            
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
