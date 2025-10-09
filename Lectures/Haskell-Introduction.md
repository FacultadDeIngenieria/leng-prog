---
marp: true
theme: default
paginate: true
---

# Haskell — Functional Programming

---

## Functional Programming Overview

- Emphasizes **functions as first-class citizens**
- Avoids **mutable state**
- Programs are **expressions** that can be reasoned about mathematically
- **Pure** functions always return the same result for the same inputs

---

## A Brief History

- 1930s — *Lambda Calculus* (Alonzo Church, Haskell Curry)
- 1960 — *LISP* (and later Scheme, Clojure)
- 1980 — *ML* and *Miranda*
- 1990 — Haskell Language Report
- 1992 — Glasgow Haskell Compiler (GHC)

---

## Haskell Key Features

- **Statically typed**, with **type inference**
- **Purely functional**
- **Referential transparency** — reasoning by substitution
- **Lazy evaluation** — evaluated only when needed
- **Side effects** (I/O) are explicit through monads

---

## Expressions and Basic Operations

```haskell
3 + 4
5 * 10
(50 * 100) - 4999 / 3
2 ^ 3
4 ** 0.5
```

Everything in Haskell is an **expression** (it returns a value).

---

## Boolean Expressions

```haskell
10 == 20      -- False
5  /=  2      -- True
3 > 2 && 7 > 2
not ("Hello" == "He" ++ "llo")
```

- Logical operators: `&&`, `||`, `not`
- String concatenation with `++`

---

## Defining Simple Functions

```haskell
succ n   = n + 1
square n = n * n
double n = 2 * n
```

```haskell
succ 2      -- 3
square 5    -- 25
double 12   -- 24
```

Haskell functions are **pure** and **typed automatically** (type inference).

---

## Explicit Type Annotations

```haskell
succ :: Int -> Int
succ n = n + 1
```

Type errors are caught at compile time, e.g.:

```haskell
succ 10.3  -- error: expected Int, got Fractional
```

---

## Conditionals

```haskell
max :: Int -> Int -> Int
max a b =
  if a > b
  then a
  else b
```

```haskell
factorial :: Int -> Int
factorial n =
  if n <= 1 then 1 else n * factorial (n - 1)
```

---

## Guards

```haskell
factorial n
  | n <= 1    = 1
  | otherwise = n * factorial (n - 1)
```

Guards are more readable than nested `if` expressions.

---

## Where and Let

```haskell
max4 i j k n =
  let max12 = max i j
      max34 = max k n
  in  max max12 max34
```

Equivalent using `where`:

```haskell
max4 i j k n = max max12 max34
  where
    max12 = max i j
    max34 = max k n
```

---

## Pattern Matching

```haskell
fibo :: Int -> Int
fibo 1 = 1
fibo 2 = 2
fibo n = fibo (n-1) + fibo (n-2)
```

Pattern matching simplifies recursive definitions.

---

## Tuples

```haskell
oranges :: (String, Int, Float)
oranges = ("Oranges", 10, 0.25)
```

Pattern matching with tuples:

```haskell
price :: (String, Int, Float) -> Float
price (_, _, p) = p
```

---
## Exercise: Quadratic Equation

### Given a quadratic equation:

$$
ax^2 + bx + c = 0
$$

### The solutions are given by:

$$
x_{1,2} = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

---

## Real roots

```haskell
quadratic :: Float -> Float -> Float -> (Float, Float)

quadratic a b c
  | r < 0     = error "No real roots"
  | otherwise = ((-b + sqrt r)/a2, (-b - sqrt r)/a2)
  where
    r  = b^2 - 4*a*c
    a2 = 2*a
```

---
## Lists

List are Homogeneous collections

```haskell
fibo = [1,1,2,3,5]
fact = [1,2,6,24,120]
fibo ++ fact
fact !! 3     -- 24
```

---
## Head and Tail

![Image](images/listmonster.png)

```haskell
l = [1, 5, 6, 8]
head l -- 1
tail l -- [5,6,8]
head (tail l) -- 6
```

---

## Type of head and tail

### if l type is `[a]` then:

* `head l` is  `a`
* `tail l` is [a]

---

## List Operations

- `head`, `tail`, `take`, `drop`
- Ranges: `[1..10]`, `[1,3..12]`
- Infinite lists: `[1..]`

---

## Pattern Matching over lists

```haskell
member x [] = False
member x (y:ys) = 
    if x == y then True else (member x ys)
```

Or using guards:
```haskell
member x [] = False
member x (y:ys)
    | x == y    = True
    | otherwise = member x ys
```

---
## Other example

```haskell
union [] ys = ys
union (x:xs) ys 
   | member x ys = ys
   | otherwise   = x : (union xs ys)
```

---

## List Comprehensions

```haskell
squares = [n * n | n <- [1..10]]
multiplesOf7 = [x | x <- [1..], x `mod` 7 == 0]
take 10 multiplesOf7
```

Comprehensions combine generation and filtering elegantly.

---

## Higher-Order Functions

### Functions as arguments

```haskell
applyTwice f x = f (f x)
applyTwice (*2) 3    -- 12
```

### Returning functions

```haskell
compose f g = \x -> f (g x)
sqrtRound = compose round sqrt
sqrtRound 3  -- 2
```

---

## Map and Filter

```haskell
map square [1..5]    -- [1,4,9,16,25]
filter even [1..10]  -- [2,4,6,8,10]
```

`map` applies a function to every element.  
`filter` keeps only elements that match a condition.

---

## Folds

```haskell
foldl (+) 0 [1..4]   -- (((0+1)+2)+3)+4
foldr (-) 0 [1..4]   -- 1-(2-(3-(4-0))) = -2
```

Useful for rewriting recursive patterns:
```haskell
sum = foldl (+) 0
reverse = foldl (\acc x -> x:acc) []
```

---

## Partial Application

Functions can be applied to some arguments to produce new functions:

```haskell
multiply x y = x * y
triple = multiply 3
triple 5  -- 15
```

Operators can also be partially applied:
```haskell
map (+2) [1..5]
```

---
