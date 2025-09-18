---
marp: true
theme: default
size: 16:9
paginate: true
---

# Dynamic vs Static Polymorphism

---

### Example of a 2 structures that implement a given trait

```Rust
trait Shape {  fn area(&self) -> f64;}

struct Circle(f64);
struct Square(f64);

impl Shape for Circle {
    fn area(&self) -> f64 { 3.14 * self.0 * self.0 }
}
impl Shape for Square {
    fn area(&self) -> f64 { self.0 * self.0 }
}
```

---

### Define and use a polymorphic function

```rust
fn print_area<T: Shape>(x: &T) {
    println!("{}", x.area())
}

print_area(&Square(4.0));
print_area(&Circle(4.0));
```

Polymorphism is static and it is achieved through monomorphization.

---

### Dynamic Polymorphism

Defining a function that retrieves a `Vec<T>` where `T` is a `Shape` and returns the sum of the areas

```Rust
fn sum_areas<T:Shape>(ts: Vec<T>) -> f64 
{
   let mut s = 0.0;
   for t in ts.iter() { s += t.area(); }
   s
}

let shapes = vec!(Square(2.0), Square(1.0));
let s = sum_areas(shapes);
println!("{s}")
```

This works well because `sum_areas` is monomorphized.

---

### Dynamic Polymorphism

Try over a `Vec` with different types

```Rust
let shapes = vec!(Square(2.0), Circle(1.0));   
let s = sum_areas(shapes);
println!("{s}");
```

Compiler Output

```rust
error[E0308]: mismatched types
  --> src/main.rs:31:36
   |
31 |     let shapes = vec!(Square(2.0), Circle(1.0));
   |                                    ^^^^^^^^^^^ expected `Square`, found `Circle`
```

Actually `shapes` is a `Vec<Square>`.

---

## Changing `Vec` type

First try, make it a `Vec<Shape>`.

```rust
let shapes: Vec<Shape> = vec!(Square(2.0), Circle(1.0));
```

- I will receive an error saying that `Vec<Shape>` doesn't have a size known at compile-time
- Makes sense because a `Shape` can be of any size
- Solution: Use references!

```rust
let shapes: Vec<&Shape> = vec!(&Square(2.0), &Circle(1.0));
```

---

## Type of the parameter in the function

When I try to change the type to a `&Shape`

```rust
fn sum_areas(ts: Vec<&Shape>) -> f64
```

I will receive an error:

```rust
error[E0782]: trait objects must include the `dyn` keyword
...
help: add `dyn` keyword before this trait
   fn sum_areas(ts: Vec<&dyn Shape>) -> f64
```

Let's fix it:

```rust
fn sum_areas(ts: Vec<&dyn Shape>) -> f64
```

---

## Dynamic polymorphism - Summary

- You need to use a reference to the trait (It can be a smart one, like `Box`, etc.)
- You need to mark the type of the trait as dynamic: `dyn T`

