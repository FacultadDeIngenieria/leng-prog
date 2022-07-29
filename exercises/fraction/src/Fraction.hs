module Fraction (add, sub, mul, divide, hcf) where

type Fraction = (Int, Int)

-- Implement the `add` Function

add :: Fraction -> Fraction -> Fraction
add f1 f2 = (6, 8)

-- Implement the `sub` Function

sub :: Fraction -> Fraction -> Fraction
sub f1 f2 = (0, 0)

-- Implement the `mul` Function

mul :: Fraction -> Fraction -> Fraction
mul f1 f2 = (0, 0)

-- Implement the `divide` Function

divide :: Fraction -> Fraction -> Fraction
divide f1 f2 = (0, 0)

-- Implement the highest common factor (hcf) (A.K.A greatest common divisor)

hcf :: Int -> Int -> Int
hcf a b
    |   a == b    =a
    |   a > b     = hcf (a-b) b
    |   otherwise = hcf a    (b-a)
  
