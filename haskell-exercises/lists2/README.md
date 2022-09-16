# List Exercises

## Instructions

You have to implement exercises working over lists

You have a type defined as:

```haskell
data Bit = F | T

type Bits = [Bit]
```

## 1. Convert a `Char` to `Bits`

You need to create function to convert a `Char` to a list of bits `Bits`

```haskell
> charToBits 'A'
[F,T,F,F,F,F,F,T]

> charToBits 'a'
[F,T,T,F,F,F,F,T]

> charToBits '\0'
[F,F,F,F,F,F,F,F]

```

### Hints:

You have already being provided with a function: 

`bitAt :: Int -> Char -> Bit`

That given a `Char` and an `Int` (The position of the bit) returns `T` if the bit at that offset is set 

So you can implement `charToBits` with a simple List Comprehension


##


## 2. Convert a `String` to `Bits`

Using the function defined in the previous exercise define a function `bits` to convert an `String` to a list of bits (`Bits`)

```haskell
> bits "AB"  
[F,T,F,F,F,F,F,T,F,T,F,F,F,F,T,F]
```

It is a plus if it works with infinite lists:

```haskell
> take 15 $ bits $ cycle "AB"
[F,T,F,F,F,F,F,T,F,T,F,F,F,F,T]
```

Try to use the `map` and `foldr` functions to implement it

## 4.BONUS Solve the '8' Queens problem

The eight queens problem is the problem of placing eight queens 
on an 8×8 chessboard such that none of them attack one another.

You Should return a List of the solutions. Where each solution is a List of rows 
with the position of a queen in this row.

For example: `[2, 1]` means a queen in column 2 in row 1 and a queen in column 1 in row 2. 

Actually the function accepts any board size:

```haskell
> queens 4 
[[2,4,1,3],[3,1,4,2]]
```

