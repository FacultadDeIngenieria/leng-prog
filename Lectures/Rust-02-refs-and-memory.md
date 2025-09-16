---
marp: true
theme: default
paginate: true
---

# References in Rust
A journey into borrowing, dereferencing, and mutability

---

## References

- `&n` → creates a reference to n
- `*pn` → dereferences pn to access the value

```rust
{
    let n = 100;
    let pn = &n;  // pn contains the memory address of n
    println!("n = {} address of n = {:p}, value = {}", n, pn, *pn);
}
```

```bash
n = 100 address of n = 0x16bdd575c, value = 100
```

---
## References with Types

```rust
{
    let n:i64   = 100;   
    let pn:&i64 = &n;  // A reference to a 64-bit int

    println!("{}", *pn);  // Explicit dereference
    println!("{}", pn);   // Often implicit
}
```

---

## Mutable References (The reference itself is mutable)

```rust
{
    let n = 10;
    let m = 100;

    let mut p = &n;   // p is mutable (not the value!)
    println!("{p}");  // p points to n
    
    p = &m;           // now p points to m
    println!("{p}");
}
```
Output

```bash
10
100
```

---

 ## Reference to Mutable Values 
 ### (The value the reference points to is mutable)

```rust
let mut n = 100;
{
    let pn = &mut n; // mutable reference to n 
    println!("pn = {pn}");

    *pn = 1000;      // modify n through the reference
    println!("pn = {pn}");
}
println!("n = {n}");
```

Output:

```bash
pn = 100
pn = 1000
n = 1000
```

---

## Mixing mutability

```rust
{
    let mut n = 100;
    let mut m = 200;
    
    let mut pn = &mut n;
    *pn += 1;
    
    pn = &mut m;   // mutable ref can be reassigned
    *pn += 1;
    
    println!("n = {n}, m = {m}");
}
```

Output:

```bash
n = 101, m = 201
```

---

## References and Functions

```rust
fn inc10(n: &mut i32) {
    *n += 10
}

let mut n = 1;
inc10(&mut n);
inc10(&mut n);

println!("n = {n}");
```

Output

```bash
n = 21
```

---

## Passing by Value vs Passing by Reference

```rust
fn swap(mut a: i32, mut b: i32) {
    let tmp = a;
    a = b;
    b = tmp;
}
let x = 10; let y = 20;
println!("Before: {x}, {y}");
swap(x, y);
println!("After: {x}, {y}");
```
Output
```bash
Before: 10, 20
After: 10, 20
```
⚠️ Doesn’t work! Because values are copied into a and b.

---

## The right way

```rust
fn swap2(a: &mut i32, b: &mut i32) {
    let tmp = *a;
    *a = *b;
    *b = tmp;
}

let mut x = 10;
let mut y = 20;
println!("Before: {x}, {y}");
swap2(&mut x, &mut y);
println!("After: {x}, {y}");
```

✔️ Works because we pass references, not copies.

---

##  Ownership and Memory management

* Each value in Rust has an **owner**
* There can only be one owner at a time.
* When the owner goes out of scope, the value will be dropped.

---

## Example with the `String` type

```Rust
let s: &str = "hello";
let mut s1: String = s.to_string(); // String::from(s)

s1.push_str(", world!"); // Here s1 will point to a different address in memory
println!("s = {s}");
println!("s1 = {s1}"); 
```
```bash
s = hello
s1 = hello, world!
```

Note:

- `"hello"` is a constant it goes into `static` memory
- `s` is a reference to a 'raw' string (`&str`)
- `s1` is a `String` it holds inside a `&str`

---

## Diagram

![string h:500](images/string_01.png)

After executing: `s1.push_str(", world!");` it will point to a different address

---

## Move Semantics

```rust
let s1 = String::from("hello");
let s2 = s1;    // ownership of the heap data moves to s2

println!("{s1}"); // ❌ Error: s1 is no longer valid
println!("{s2}");    // ✅ Works
```

- In Rust, assignment of **NON-**`Copy` types **moves** ownership.
- After the move, the original variable can no longer be used.

---

## Copy Types

```rust
let x = 5;      // i32 is a Copy type
let y = x;      // value is copied, not moved

let t1 = (1, true, 'a'); // all elements are Copy
let t2 = t1;             // the whole tuple is copied

println!("x = {x}, y = {y}");     // ✅ Both are valid
println!("t1 = {t1}, t2 = {t2}"); // ✅ Both are valid
```

- All primitive scalar types (`i32`, `u32`, `bool`, `char`, `f64`, etc.) are `Copy`.
- Tuples (Structs and arrays) are `Copy` **if all their elements are `Copy`**.
- Types with the `Copy` trait do not move, they **copy** the value.

---

# Move into a function

Suppose you define a function like:

```Rust
fn calculate_length(s: String) -> usize {
    s.len()
}
```

Now let's use it:

```rust
let s1 = String::from("hello");
let len = calculate_length(s1); // s1 is moved into the function
println!("The length of '{s1}' is {len}."); // I cannot use s1 here!
```

---

## Discussion

---

## Look at the compiler output

```rust
error[E0382]: borrow of moved value: `s1`
  --> src/main.rs:5:29
   |
3  |     let s1 = String::from("hello");
   |         -- move occurs because `s1` has type `String`, which does not implement the `Copy` trait
4  |     let len = calculate_length(s1);
   |                       -- value moved here
5  |     println!("The length of {s1} is {len}");
   |                             ^^^^ value borrowed here after move
   |
note:
consider changing this parameter type in function `calculate_length`
to borrow instead if owning the value isn't necessary
```

---

### More Help from the compiler

```rust

  --> src/main.rs:34:15
   |
34 | fn calculate_length(s: String) -> usize {
   |    -------    ^^^^^^ this parameter takes ownership of the value
   |    |
   |    in this function
help: consider cloning the value if the performance cost is acceptable
   |
4  |     let len = calculate_length(s1.clone());
   |                         ++++++++

```

---

## Borrowing (Immutable Reference)

```rust
let s1 = String::from("hello");
let len = calculate_length(&s1);  // borrow s1

fn calculate_length(s: &String) -> usize {
    s.len()
}

println!("The length of '{s1}' is {len}");
```

- `&s1` borrows `s1` without taking ownership.
- After the borrow, `s1` is still valid.

---

## Borrowing (Mutable Reference)

```rust
let mut s = String::from("hello");
change(&mut s);

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}

println!("{s}"); // "hello, world"
```

- A mutable reference allows modifying the borrowed value.
- Rule: only **one mutable reference** at a time (or many immutable).

---

## Summary: References, Ownership and Borrowing
 
- **References**: `&T` (immutable), `&mut T` (mutable)
- **Dereference**: use `*` to access the value behind a reference
- **Ownership**: each value has one owner; when it goes out of scope, the value is dropped
- **Move semantics**: non-`Copy` types transfer ownership when assigned
- **Copy types**: simple scalars and tuples/structs of Copy elements
- **Borrowing**: allows using a value without taking ownership
    - Many immutable borrows allowed
    - Only one mutable borrow allowed at a time

💡 These rules guarantee **memory safety** without a garbage collector.

---

## Challenge: Lifetimes

Implement a function that returns the longer of 2 strings.
```rust
fn longer(a: &String, b: &String) -> &String {
    // your code here
}

```