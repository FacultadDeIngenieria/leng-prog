# Fraction as a Type

## Instructions

You have to implement the arithmetic operations over fractions.
The idea is now to create tuple `struct` for the fraction type.
The `type` is defined as:
```rust
struct  Fraction(i32, i32);
```

## 1. Implement the operations `add`, `sub`, `mul` and `divide`.

```rust
> Fraction(1, 2).add(Fraction(1,4))
Fraction(3, 4)
> Fraction(1,2).sub(Fraction(1,4))
Fraction(1, 4)
> Fraction(1, 2).mul(Fraction(1, 4))
Fraction(1,8)
>Fraction(1, 2).divide(Fraction(1, 4))
Fraction(2,1)
```

## 2. Implement the `Add` trait

```rust
>  Fraction(1, 2) + Fraction(1,4)
Fraction(3, 4)
```