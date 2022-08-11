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

## 2. Implement the Highest common factor function hcf (AKA greatest common divisor)

```Haskell
> hcf 4 2
2
> hcf 3 2
1
> hcf 2 0
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

To Tests this go to **Test.hs** and comment/uncomment the 2 main functions alternatives

```haskell
-- Comment this line and uncomment the line below to run the tests doing simplification
main = hspec $ test id
-- main = hspec $ test simplify
```

Should become
```haskell
-- Comment this line and uncomment the line below to run the tests doing simplification
-- main = hspec $ test id
main = hspec $ test simplify
```