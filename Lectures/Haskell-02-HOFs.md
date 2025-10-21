
## Higher-Order Functions

### Functions as arguments

```haskell
applyTwice f x = f (f x)
```

```haskell
ghci> applyTwice sqrt 16
2.0

ghci> applyTwice (\x -> x * x) 2
16

ghci> applyTwice (*10) 2
200
```

---

### Returning functions

```haskell
compose f g = \x -> f (g x)
sqrtRound = compose round sqrt
```
```haskell
ghci> sqrtRound 3
2

ghci> (compose round sqrt) 10
3 
```
---
## Using `$`

```haskell
ghci> sqrt $ sqrt $ 16
2.0
ghci> compose round sqrt $ 10
3
```
How is `$` Defined
```haskell
infixr 0 $
($) :: (a -> b) -> a -> b
f $ x = f x
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

![folds](images/folds.png)

---

## Folds in action
---
Useful for rewriting recursive patterns:
```haskell
sum = foldl (+) 0
reverse = foldl (\acc x -> x:acc) []
```

```haskell
f1 = foldl (++) ""
f2 = foldr (&&) True
f3 = foldl (\acc _ -> acc + 1) 0
f4 x = foldr f1 False
       where f1 y rest = (y == x) || rest
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

## 🧩 Partial Application and Function Type Signatures
### Understanding Currying in Haskell

---

## 🧠 Every Function Takes One Argument

Even if it *looks* like it takes several.

```haskell
add :: Int -> Int -> Int
add x y = x + y
```
Haskell interprets this as:

```haskell
add :: Int -> (Int -> Int)
```
So `add` is a function that takes one `Int`
and returns another function that also takes an `Int` (and returns an `Int`).

---

## ⚙️ Currying: Functions Returning Functions

```haskell
add 5 :: Int -> Int
add 5 3 :: Int
```

| Expression | Type | Meaning |
|-------------|------|----------|
| `add` | `Int -> Int -> Int` | A function taking two `Int`s |
| `add 5` | `Int -> Int` | A partially applied function |
| `add 5 3` | `Int` | Fully applied, gives a value |

---

## 🧩 Partial Application in Action

You can define new functions easily:

```haskell
add5 :: Int -> Int
add5 = add 5
```

Equivalent to:

```haskell
add5 y = 5 + y
```

✅ `add5 3` → `8`

---

## 🧮 The Type Signature Reveals It

Each arrow `->` means “takes one argument and returns ...”

```haskell
add :: Int -> Int -> Int
```

Expands as:

```
add :: Int -> (Int -> Int)
```

This structure *enables partial application* naturally.

---

## 🧰 Example: `foldl`

```haskell
foldl :: (b -> a -> b) -> b -> [a] -> b
```

We can read it step-by-step:

| Expression | Type | Meaning |
|-------------|------|----------|
| `foldl` | `(b -> a -> b) -> b -> [a] -> b` | needs 3 args |
| `foldl (+)` | `b -> [b] -> b` | function expecting init and list |
| `foldl (+) 0` | `[b] -> b` | sums a list |
| `(foldl (+) 0) [1,2,3]` | `b` | final result |

---

## 💡 Defining `sum` with Partial Application

```haskell
sum' = foldl (+) 0
```

Because:
```
foldl (+) 0 :: [Int] -> Int
```

✅ So `sum' [1,2,3,4] → 10`

---

## 🎨 Visual 1: How Application Unfolds

```text
foldl :: (b -> a -> b) -> b -> [a] -> b
           │
           │ apply (+)
           ▼
foldl (+) :: b -> [b] -> b
               │
               │ apply 0
               ▼
foldl (+) 0 :: [b] -> b
                 │
                 │ apply [1,2,3]
                 ▼
(foldl (+) 0) [1,2,3] :: b
```

Each step consumes one argument  
and returns a new function (or the final result).

---

## 🎨 Visual 2: Arrows as “Argument Slots”

```text
add :: Int -> Int -> Int
        ↑     ↑
        │     └─ second argument
        │
        └────── first argument
```

Partial application fills arguments from **left to right**:

```
add 5 :: Int -> Int
add 5 3 :: Int
```

So:
```
(Int -> Int -> Int)
       ↓
   (Int -> Int)
       ↓
        Int
```

---

## 🔍 Summary

| Concept | Description |
|----------|--------------|
| **Currying** | Multi-arg functions are chains of single-arg ones |
| **Partial application** | Applying fewer args returns a new function |
| **Type signatures** | Each `->` reveals another layer of application |
| **Power** | Enables concise definitions like `sum' = foldl (+) 0` |

---

## 🧭 Visualization Recap

```
add :: Int -> Int -> Int
↓
add :: Int -> (Int -> Int)
↓
add 5 :: Int -> Int
↓
add 5 3 :: Int
```

Each step *applies one argument* and returns
either another function or the final value.

---

## 🧩 Big Idea

💬 *In Haskell, “function application” and “function definition”  
are symmetrical and composable.*

This is what makes higher-order functions like `map`, `foldr`, and `filter`
so expressive and reusable.

---

## 🏁 Recap

✅ Function types show the **number and order of arguments**  
✅ Partial application uses **some arguments now, others later**  
✅ Thanks to currying, this happens **automatically**  
✅ That’s why **`foldl (+) 0`** is valid and elegant!

---

# 🎓 Practice

Try defining these using partial application:

```haskell
incrementAll = map (+1)
multiplyBy2  = map (*2)
allTrue      = foldr (&&) True
```

Then inspect their **type signatures** in GHCi:
```
:t incrementAll
:t multiplyBy2
:t allTrue
```

Observe how **each arrow** tells you what’s still “missing”.

---
