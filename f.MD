# Fraction

## Instructions

You have to implement the arithmetic operations over fractions.
You will be using a Tuple `(Int, Int)` as the fraction type.
A `type` synonym is already defined as:
```haskell
type Fraction = (Int, Int)
```

## 1. Implement the operations `add`, `sub`, `mul` and `divide`.


```haskell
> add (1,2) (1,4)
(6, 8)
> sub (1,2) (1,4)
(2, 8)
>mul (1,2) (1,4)
(1,8)
>divide (1,2) (1,4)
(4,2)
```

## 2. Implement the Greatest Common Denominator Function (`gCD`)

```Haskell
> gCD 4 2
2
> gCD 3 2
1
> gCD 2 0
2
```

## 3. Modify the functions defined above to simplify the results

```haskell
> add (1,2) (1,4)
(3, 4)
> sub (1,2) (1,4)
(1, 4)
>mul (1,2) (1,4)
(1,8)
>div (1,2) (1,4)
(2,1)
```