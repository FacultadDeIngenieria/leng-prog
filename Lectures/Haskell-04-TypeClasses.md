---
marp: true
theme: default
paginate: true
class: lead
---


## Type Classes
- **What are they?**
- **Defining a type class**
- **Defining a type class instance**
- **Common type classes**
- `Eq`, `Ord`, `Read`, etc
- **Deriving type classes**

---

## What is a Type Class?

A **type class** defines a set of functions that can be implemented for different types.

* It’s similar to an **interface**
* It defines *behavior* that types can implement.
* A type that implements a class is said to be an **instance** of that class.
* Actually, it’s more flexible than an **interface**.
* For example, Any existing type can be made an instance of a new type class without modifying the original type (unlike interfaces in many OO languages).
* This makes type classes **open** — new behavior can be added for types after their definition.
* In this sense, they are closer to **traits** in Rust or **typeclasses** in Scala.

---

## Example: Type Class `Eq`

The `Eq` class defines equality operations.

### Example:
```haskell
class Eq a where
  (==), (/=) :: a -> a -> Bool
  x /= y = not (x == y)
```
```haskell
data Fraction = Fraction Int Int

instance Eq Fraction where
  (==) (Fraction n1 d1) (Fraction n2 d2) = n1 * d2 == n2 * d1
```
---

## Defining a Type Class

You can define your own type class using the `class` keyword.

```haskell
class Shape a where
    area :: a -> Double
```

This says: any type `a` that is *Shape* must define a function `area`.

Now let's define a type `Circle`:

```Haskell
data Circle = Circle Double
instance Shape Circle where
  area (Circle r) = pi * r * r
```
For example:
```haskell
area (Circle 1.0) -- returns 3.141592653589793.
```

---

## Inherited Type Classes

A type class can inherit from other type classes.

For example: 

```haskell
class (Shape a) => ColoredShape a where
    color :: a -> String
```

---

## Common Type Classes

| Class | Description | Example Function |
|-------|--------------|------------------|
| `Eq` | Equality testing | `(==)`, `(/=)` |
| `Ord` | Ordering | `(<)`, `(>)`, `(<=)` |
| `Show` | Convert to string | `show` |
| `Read` | Parse from string | `read` |
| `Num` | Numeric operations | `+`, `*`, `abs` |
| `Enum` | Sequential types | `succ`, `pred` |
| `Bounded` | Min/Max values | `minBound`, `maxBound` |

---
## Example: `Ord`

```haskell
class (Eq a) => Ord a where
  compare :: a -> a -> Ordering
  (<), (<=), (>=), (>) :: a -> a -> Bool
  max, min             :: a -> a -> a
  
  -- Default definitions
  
  x == y       =  compare x y == EQ
  x /= y       =  compare x y /= EQ
  x <= y       =  compare x y /= GT
  x <  y       =  compare x y == LT
  x >= y       =  compare x y /= LT
  x >  y       =  compare x y == GT
  max x y 
   | x >= y    =  x
   | otherwise =  y
  min x y
   | x <  y    =  x
   | otherwise =  y

data Ordering = LT | EQ | GT

```
--- 

## Relationship between `Eq` and `Ord`

- Every type that implements `Ord` **must also implement `Eq`**.  
- This ensures that equality and ordering are **consistent**.  
  - If `x == y`, then `compare x y == EQ`.
  - If `x < y`, then `compare x y == LT`, and so on.
- You can think of `Ord` as **extending** `Eq` — similar to inheritance in OO languages.

---  

## Implement `Ord` for fraction

```haskell
instance Ord Fraction where
  compare (Fraction n1 d1) (Fraction n2 d2) =
    compare (n1 * d2) (n2 * d1)
```
---

## Derived Comparison Functions

Once you define `compare`, the others come automatically:

```haskell
Fraction 1 2 > Fraction 3 8   -- True
Fraction 1 2 < Fraction 2 3   -- True
```

because `(>)`, `(<)`, `>=`, `<=` are defined in terms of `compare`.

---

## Deriving Type Classes

Haskell can **automatically generate** instances for some common classes.

```haskell
data Point = Point Int Int
  deriving (Eq, Show)
```

This adds:
```haskell
(==) :: Point -> Point -> Bool
show :: Point -> String
```
Where the derived default implementations are:
```haskell
(==) (Point x1 y1) (Point x2 y2) = x1 == x2 && y1 == y2
show (Point x y) = "Point " ++ x1 ++ " " ++ x2
```

---

## Discussion: Partial vs Total Order

- Not all types can be fully ordered.  
  For example, comparing complex numbers is not well-defined.  
- Haskell allows `Eq` without `Ord` (equality but not ordering).  
- `Ord` assumes a **total order** — any two values are comparable.
---
