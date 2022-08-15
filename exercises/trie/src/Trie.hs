module Trie  (Trie(..), left, right, find, decode) where

import Bit
  
data Trie a = Complete -- Add the Type definition deriving (Eq, Show)
            
left::Trie a -> Trie a
left = error "Define it"

right::Trie a -> Trie a
left = error "Define it"
  
find::Bits -> Trie a -> a
left = error "Define it"

decode::Bits -> Trie Char -> String
left = error "Define it"
             