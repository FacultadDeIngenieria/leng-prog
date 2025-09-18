# Introduction to Unsafe Code in Rust

---

## Why unsafe code ?

- Unsafe code allows bypassing Rust safety guarantees (like borrowing rules).
- Usefull for certain low-level operations like:
  - raw pointer manipulation
  - interacting with hardware
  - calling C functions.
- Unsafe code still adheres to some safety checks, such as type checks.

---
### Using Unsafe Code to Call External C Functions

Rust can call functions from other languages like C, but you must use an unsafe block to ensure that Rust knows it cannot guarantee the safety of external functions.
```rust
extern "C" {
    fn abs(input: i32) -> i32;
}
```

 Using unsafe block to call C function
```rust
fn main() {
    unsafe {
        let result = abs(-5);
    }
}
```
---

### Usually I wrap unsafe code in functions of a module

```rust
fn c_abs(input: i32) -> i32 {
    unsafe  {
        return abs(input);
    }
}
```
```rust
fn main() {
    let result = c_abs(-5);
    println!("Absolute value of -5 is: {}", result);
}
```

---

### Raw Pointers


Declare and using Raw Pointers
```rust
fn main() {
    let x = 42;
    let r1 = &x as *const i32;
    let r2 = &x as *mut i32;

    unsafe {
        println!("r1 points to: {}", *r1);
        println!("r2 points to: {}", *r2);
    }
}

```

Raw pointers can be created from references, but dereferencing them requires an unsafe block because the compiler cannot guarantee their safety.

---

### Standard library to deal with memory

`std::mem` Module provides functions for directly manipulating memory.

For example, `std::mem::transmute` converts a value of one type into another type without checking that the conversion is valid.

```rust
use std::mem;
fn main() {
    let num: u32 = 65;

    // Unsafe conversion of a u32 to a char
    let character: char = unsafe { mem::transmute(num) };

    println!("Character: {}", character);
}
// Output
Character: A
```

---

## Safe functions in `std::mem`

There are also safe functions in `std::mem` that can be used to manipulate memory.
(Internally they have an unsafe block)

For example: trying to move a value out of a `Vec` getting the old one

```rust
fn main() {
    let mut v = vec![
        String::from("apple"),
        String::from("banana"),
    ];
    let old_value = v[1];  // ❌ This won't compile
    v[1] = String::from("kiwi");
    println!("Old value: {}", old_value);
    println!("New value: {}", v[1]);
}
```
---

## Solution using replace

```rust
fn main() {
  let mut v = vec![
    String::from("apple"),
    String::from("banana"),
  ];
  let old_value = mem::replace(&mut v[1], String::from("kiwi"));
  println!("Old value: {}", old_value);
  println!("New value: {}", v[1]);
}
```

