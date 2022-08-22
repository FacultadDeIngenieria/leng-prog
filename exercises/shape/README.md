# Project Shape

## Create a Point and Shape types

### 1. Implement methods for the `Point` type

```haskell
λ> origin
Point { x = 0.0, y = 0.0 }
λ> point (1.0, 1.0)
Point { x = 1.0, y = 1.0 }
```

### 2. Implement methods for the `Rectangle type`

```haskell
λ> rectangle (1.0, 2.0)
Rectangle (Point {x = 0.0, y = 0.0}) (Point {x = 1.0, y = 2.0})
λ> r = rectangle (1.0, 2.0)
λ> base r
1.0
λ> height r
2.0
```

### 3. Implement methods for the `Circle type`

```haskell
λ> circle 2.0
Circle (Point {x = 0.0, y = 0.0}) 2.0
```

### 4. Create a `Shift` class type with a shift method and implement it

```haskell
λ> shift (point (1, 3)) (1, 2)
Point {x = 2.0, y = 5.0}

λ> shift (circle 2.0) (1, -1)
Circle (Point {x = 1.0, y = -1.0}) 2.0

λ> shift (rectangle (1.0, 2.0)) (1, -1)
Rectangle (Point {x = 1.0, y = -1.0}) (Point {x = 2.0, y = 1.0})
```

### 5. Create a `Surface` class type and implement the surface method for `Rectangle` and `Circle`

```haskell
λ> surface (rectangle (1.0, 2.0))
2.0

λ> surface (circle 2.0)
12.566370614359172
```

