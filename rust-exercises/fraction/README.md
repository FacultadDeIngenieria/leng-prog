# Fraction

## Instructions

You have to implement the arithmetic operations over fractions.
You will be using a tuple defined as `(i32, i32)` for the fraction type.
A `type` synonym is already defined as:
```rust
type Fraction = (Int, Int);
```

## 1. Implement the operations `add`, `sub`, `mul` and `divide`.

```rust
> add((1,2), (1,4))
(6, 8)
> add((1,2), (1,4))
(2, 8)
> mul ((1,2), (1,4))
(1,8)
>divide (1,2) (1,4)
(4,2)
```

## 2. Implement the Highest common factor function hcf (AKA greatest common divisor)

```rust
> hcf(4, 2)
2
> hcf(3, 2)
1
> hcf(2, 0)
2
```

## 3. Modify the functions defined above to simplify the results

To test this 
remove the `#[ignore]` marker in the tests.

```rust
> add((1,2), (1,4))
(3, 4)
> sub((1,2), (1,4))
(1, 4)
>mul((1,2), (1,4))
(1,8)
>div((1,2), (1,4))
(2,1)
```