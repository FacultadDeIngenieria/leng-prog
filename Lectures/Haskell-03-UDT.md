---
marp: true
theme: default
paginate: true
class: lead
---


## User‑Defined Types (UDTs)
- **Product/sum types**: `data`
- **Records**
- **Parametric & recursive types**
- ** Either/Maybe**
- **`type` and `newtype`**

---

## `data` — Sum & Product
- **Product** = “has” composition
- **Sum** = alternatives (disjoint union)

```haskell
-- Product
data User = U String Int
-- Or simpler
data User = User String Int
-- Sum
data Shape  = Circle Double
            | Rect   Double Double
-- Enums are just Sum without arguments
data Weekday = Monday | Tuesday | ...            
```

---

## Records (named fields)
- Syntactic sugar for products plus generated accessors

```haskell
data Book = Book { title::String , author::String , year::Int }
            deriving (Show, Eq)
```
Usage:
```haskell
lotr = Book {title="LOTR", author="Tolkien", year=1954}
title lotr -- "LOTR"
lotrFull = lotr {title = "Lord of the Rings" } 
```

---

## Parametric & Recursive Types

```haskell
-- Recursive Type
data IntTree = Leaf Int
            | Node IntTree IntTree
            
-- Parametric type
data Tree a = Leaf a
            | Node (Tree a) (Tree a)

size :: Tree a -> Int
size (Leaf _)   = 1
size (Node l r) = size l + size r
```
---

## Pattern Matching Essentials

```haskell
area :: Shape -> Double
area (Circle r)   = pi * r * r
area (Rect w h)   = w * h
```
---

## `Maybe` — presence/absence

```haskell
data Maybe a = Nothing
             | Just a
```
Usage
```haskell
safeHead :: [a] -> Maybe a
safeHead []    = Nothing
safeHead (x:_) = Just x
```

---

## `Either e a` — explain failures
```haskell
data Either e a = Left e
                | Right a   
```
```haskell

safeDiv :: Int -> Int -> Either String Int
safeDiv _ 0 = Left "Division by zero"
safeDiv n m = Right (n `div` m)

```

---

## `type` and `newtype`

**type** = alias for a type