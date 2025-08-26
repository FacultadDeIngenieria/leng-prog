---
marp: true
html: true
paginate: true
title: Introduction to Rust
---

# Introduction to Rust

- System programming language
- Memory safety without GC
- Zero-cost abstractions
- Inspired by C, C++, Haskell, etc.

---

## History

- 2006: Personal project by Graydon Hoare
- 2009: Sponsored by Mozilla
- 2015: 1.0 release
- 2021: Rust Foundation (AWS, Google, Microsoft, Huawei, Mozilla)

---

## Hello World

```rust
fn main() {
    println!("Hello, world!");
}
```

[Run on Playground](https://play.rust-lang.org/?code=fn%20main()%20%7Bprintln!(%22Hello,%20world!%22);%7D)

---

## Variables & formatting

```rust
fn main() {
    let answer = 42;
    println!("Hello {}", answer);
}
```
---

## Loops & conditions

```rust
for i in 0..5 {       // 0..5 is 0..=4
    if i % 2 == 0 {
        println!("even {i}");
    } else {
        println!("odd {i}");
    }
}
```

- Ranges are **exclusive** on the right by default.
- No parentheses around `if` conditions; **braces are required** for blocks.

---

## `if` as an expression

```rust
for i in 0..5 {
    let even_odd = if i % 2 == 0 { "even" } else { "odd" };
    println!("{} {}", even_odd, i);
}
```

- Rust favors **expressions**; the ternary `?:` is unnecessary.

---

## Mutability is explicit

```rust
// add2.rs
fn main() {
    let mut sum = 0;
    for i in 0..5 {
        sum += i;
    }
    println!("sum is {}", sum);
}
```

- `let` is **immutable** by default; use `mut` to allow writes.

---

## Type inference & casting

```rust
let mut sum = 0.0;
for i in 0..5 {
    sum += i as f64;  // explicit cast
}
```

---

## Function types are explicit

```rust
fn sqr(x: f64) -> f64 { x * x }

fn main() {
    let res = sqr(2.0);
    println!("square is {}", res);
}
```

- Function **parameters and returns** require type annotations.
- The last expression is the return value (no `return` needed).

---

## Watch those semicolons

[Playground](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=fb85855e8d01f7948063fd51457e944c)

If you add a trailing `;` to the last expression, the type becomes `()`:

```
help: consider removing this semicolon
```

- `()` is the “unit” type (like `void`).

---

## Exercise 📝 Functions

**Starter code:**

```rust
fn cube(x: f64) -> f64 { todo!() }
fn hypotenuse(a: f64, b: f64) -> f64 { todo!() }

fn main() {
    println!("{}", cube(3.0));
    println!("{}", hypotenuse(3.0, 4.0));
}
```
1. **Implement** `fn cube(x: f64) -> f64` (return x³).
2. **Implement** `fn hypotenuse(a: f64, b: f64) -> f64` (return √(a²+b²)). Hint: `sqrt` is a method: `(a*a + b*b).sqrt()`.
3. **Test** from `main()` printing results for a few inputs.

---

## Do it

[Open in Playground](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=8c30bf0a6e9ad346ff73b85f0d1001fb)

### Variations
- Write `fn abs(x: f64) -> f64` **with** and **without** `return`.
- Implement a recursive `factorial(n: u64)`.


---

## Tuples

- Fixed-size, ordered collections with possibly **different** types.
- Can be Access by index: `.0`, `.1`, …
- Or **destructured** into variables.
- Special case:
    - **Unit**: `()` — zero elements

---
## Example 

```rust
let tup: (i32, f64, bool) = (500, 6.4, true);
println!("first = {}, second = {}", tup.0, tup.1);

let (a, b, c) = tup; // destructuring
println!("a={a}, b={b}, c={c}");

let unit = ();
let pair = ("hello", 42);

```
---

## Exercise 📝 Quadratic Equation

Write a function that returns the two **real roots** of `ax² + bx + c = 0` when they exist.

$$
x_{1,2} = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}, \quad \text{where } b^2 - 4ac \geq 0
$$

```rust
fn solve_quadratic(a: f64, b: f64, c: f64) -> (f64, f64) {
    todo!()
}

fn main() {
    println!("{:?}", solve_quadratic(1.0, -3.0, 2.0)); 
    // (1.0, 2.0)
    println!("{:?}", solve_quadratic(1.0,  2.0, 5.0));
    // ???
}
```

---

## The `Option` Type

- Used when a value **may or may not exist**.
- Optional values are represented by `Option<T>`:
    - `Some(T)` The value exists. 👍🏻
    - `None`    The value does not exists 👎🏻
- `Option<T>` is a **sum type** (like `enum`). 

---

## For example in the `solve_quadratic` function, above

```rust
fn solve_quadratic(a: f64, b: f64, c: f64) -> Option<(f64, f64)> {
    // If Delta is negative, there are no real roots.
    let delta = b * b - 4.0 * a * c;
    if delta < 0.0 { 
      None
    }
    else {
        // ...
        Some((x1, x2))
    }
}
```

---

## Usage in `main`

```rust
 match solve_quadratic(1.0, -3.0, 2.0) {
    Some((x1, x2)) => println!("x1 = {x1}, x2 = {x2}"),
    None => println!("Non Real roots"),
 }
 ```
Or using `if let`
```rust
  if let Some((x1, x2)) = solve_quadratic(1.0, -3.0, 2.0) {
    println!("x1 = {x1}, x2 = {x2}");
  }
```

---

## Other ways to deal with `None`

* `unwrap` returns the value if it exists, otherwise panics. (ONLY FOR DEBUGGING)
* `unwrap_or` returns the value if it exists, otherwise returns the default.
* `unwrap_or_else` returns the value if it exists, otherwise returns the result of the closure.`
* `expect` returns the value if it exists, otherwise panics with the given message.
* `expect_or` returns the value if it exists, otherwise returns the default.
* `map` applies a function to the value if it exists, otherwise returns `None`.

---

## Examples

```rust
let roots = solve_quadratic(1.0, -3.0, 2.0).unwrap(); // OK: Some((1,2))
let bad = solve_quadratic(1.0, 2.0, 5.0).unwrap();    // 💥 panic: None
```
```rust
let roots = solve_quadratic(1.0, -3.0, 2.0)
    .expect("Quadratic should have real roots here");

```

```rust
let roots = solve_quadratic(1.0, 2.0, 5.0).unwrap_or((0.0, 0.0));

```

---

## Picking a way to handle `Option`

| Method        | Use when…                                   | Behavior if `None`            |
|---------------|----------------------------------------------|------------------------------|
| `match`       | You want explicit, exhaustive handling       | Your `None` arm runs         |
| `if let`      | You only care about the `Some` case          | Skips the block              |
| `unwrap()`    | You’re **sure** it’s `Some` (e.g., invariants)| **Panics** (crash)          |
| `expect(msg)` | Like `unwrap` but want a clear panic message | **Panics** with `msg`        |
| `unwrap_or(d)`| You have a sensible default                   | Uses `d` as fallback        |
| `map(f)`      | You want to transform only if `Some`         | Stays `None`                 |

> Rule of thumb: prefer `match` / `if let` for control flow;
> use `unwrap_or` for benign defaults;
> reserve `unwrap/expect` for **truly impossible** `None` or quicker debugging.

---

## The `Result` Type

- Used for **operations that may succeed or fail**.
- Has two variants:
  - `Ok(value)` → success, holds the result
  - `Err(error)` → failure, holds an error type
- Enforces explicit error handling instead of ignoring failures.
- Prevalent in I/O, parsing, network calls…

```rust
fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 { Err("divide by zero".to_string() }
    else { Ok(a / b) }
}
```


---

## Enums in Rust

- An **enum** defines a type that can be **one of several variants**.
- Each variant can optionally carry data.
- Powerful when combined with `match`.

```rust
enum TrafficLight { Red, Yellow, Green, }

let light = TrafficLight::Red;

match light {
    TrafficLight::Red    => println!("Stop"),
    TrafficLight::Yellow => println!("Wait"),
    TrafficLight::Green  => println!("Go"),
}
```

---

## Tuples as Structs

- A `struct` lets you bundle multiple values into one type.
- Example: represent a complex number as `(real, imag)`.

```rust
#[derive(Debug)]
struct Complex(f64, f64); // tuple struct

let z = Complex(3.0, 4.0); // 3 + 4i
println!("{:?}", z);
```

---

## Exercise 📝 Quadratic with an Enum

Let’s redesign the quadratic solver using an **enum** to capture the 3 possible cases:

```rust
enum QuadraticResult {
    Reals(f64, f64),                  // Δ > 0
    Single(f64),                      // Δ = 0
    Complexes(Complex, Complex)       // Δ < 0
}

fn solve_quadratic(a: f64, b: f64, c: f64) -> QuadraticResult {
    todo!()
}
```

---

## Exercise 📝 Quadratic with Complex Roots

Let’s extend our quadratic solver to handle **all cases** — real and complex.

```rust
#[derive(Debug)]
struct Complex(f64, f64); // (real, imag)

#[derive(Debug)]
enum QuadraticResult {
    Reals(f64, f64),            // Δ > 0
    Single(f64),                // Δ = 0
    Complexes(Complex, Complex) // Δ < 0
}

fn solve_quadratic(a: f64, b: f64, c: f64) -> QuadraticResult {
    // 1. Compute Δ = b² − 4ac
    // 2. If Δ > 0 → return two real roots
    // 3. If Δ = 0 → return a single real root
    // 4. If Δ < 0 → return two Complex conjugate roots
    todo!()
}

```

---

## Usage in `main`
```
fn main() {
    println!("{:?}", solve_quadratic(1.0, -3.0, 2.0)); // TwoReals(1.0, 2.0)
    println!("{:?}", solve_quadratic(1.0,  2.0, 1.0)); // OneReal(-1.0)
    println!("{:?}", solve_quadratic(1.0,  2.0, 5.0)); // TwoComplex(...)
}
```

[Playground](https://play.rust-lang.org/?version=stable&mode=debug&edition=2021&gist=435aae57ceb549a41ecb58b69dfe447a)