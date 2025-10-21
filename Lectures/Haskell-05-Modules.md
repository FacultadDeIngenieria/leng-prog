---
marp: true
theme: default
paginate: true
class: lead
---


## Modules

- Modules are a way to organize code into separate files.
- They help manage complexity and prevent naming conflicts.
- Modules can be imported and exported to share functionality.

---

## What is a Module?

A **module** is a collection of related definitions:
- Functions, types, and type classes.
- Usually stored in a separate file.
- Each file defines one module.

```haskell
module Geometry (area, perimeter) where

area :: Double -> Double
area r = pi * r * r

perimeter :: Double -> Double
perimeter r = 2 * pi * r
```

---

## Importing Modules

You can import other modules to use their functions.

```haskell
import Geometry
```

You can also import selectively:

```haskell
import Geometry (area)
```

Or use **qualified imports** to avoid name clashes:

```haskell
import qualified Data.List as L

L.sort [3,1,2]
```

---

## Prelude and Common Modules

- The **Prelude** is automatically imported into every Haskell program.
- It contains standard types and functions:
  - Numbers, lists, `Maybe`, `Either`, etc.

Commonly used modules:
- `Data.List` — list manipulation
- `Data.Maybe` — optional values
- `System.IO` — input/output
- `Data.Map` — key-value maps

---

## The `Map` Type

- Provided by the module **`Data.Map`**.
- Implements an efficient key-value mapping (like a dictionary).
- Usually imported **qualified** to avoid name conflicts.

```haskell
import qualified Data.Map as Map
```

---

## Creating and Using a Map

```haskell
let prices = Map.fromList [("Apples", 2.5), ("Oranges", 3.0)]
Map.lookup "Apples" prices     -- Just 2.5
Map.lookup "Bananas" prices    -- Nothing
```

Maps are **immutable** — inserting or deleting returns a new map:

```haskell
let newPrices = Map.insert "Bananas" 4.0 prices
```

---

## Common Map Functions

| Function | Description | Example |
|-----------|--------------|----------|
| `Map.fromList` | Build a map from a list of pairs | `Map.fromList [("a",1)]` |
| `Map.lookup` | Find a value by key | `Map.lookup "a" m` |
| `Map.insert` | Add a new key-value pair | `Map.insert "b" 2 m` |
| `Map.delete` | Remove a key | `Map.delete "a" m` |
| `Map.keys` / `Map.elems` | Get all keys or values | `Map.keys m` |
| `Map.empty` | `Map.empty` | `fromList []` |
| `Map.member` | `Map.member 3 (Map.fromList [(3,6)])` | `True` |

---

## Combining Duplicate Keys

`fromListWith` lets you decide how to handle duplicates.

```haskell
phoneBookToMap :: (Ord k) => [(k,String)] -> Map.Map k String
phoneBookToMap xs =
  Map.fromListWith (\n1 n2 -> n1 ++ ", " ++ n2) xs
```

Also, useful:
- `insertWith` — insert or combine with an existing key
- `fromListWith (+)` — sum values with the same key

---

## Example Counting Words

```haskell
wordCount :: String -> Map.Map String Int
wordCount text =
  foldl addWord Map.empty (words text)
  where
    addWord m w = Map.insertWith (+) w 1 m
```
Example usage:

```haskell
wordCount "Haskell is fun and Haskell is powerful"
```
Result:
```haskell
fromList [("and",1),("fun",1),("haskell",2),("is",2),("powerful",1)]
```

---
