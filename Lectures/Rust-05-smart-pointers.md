---
marp: true
theme: default
size: 16:9
paginate: true
---

# Smart Pointers

---

### Smart Pointers

> Smart pointers are data structures that act like a pointer but also have additional capabilities.

- Why use Smart Pointers?
    - Memory safety without a garbage collector.
    - Automatic cleanup through RAII (Resource Acquisition Is Initialization).
    - Manage ownership and borrowing of heap-allocated data.
- There are a number of them already defined in the Rust standard Library.
- In particular `Box` and `Rc`.
- But `String` and `Vec<T>` are actually Smart Pointers.
- You can define your own.

---

## Putting data in the Heap with `Box<T>`

```Rust
{
    let n = 101; // n goes into the stack
    let m = 102; // m also

    println!("&n: {:p}, &m: {:p}", &n, &m);
    
    let pn = &n;            // Pointer to n. So it points to the stack
    let bn = Box::new(m);   // bn points to data in the heap
    
    println!("pn: {:p}, *pn: {}", pn, *pn);
    println!("bn: {:p}, *bn: {}", bn, *bn);
} // <- Box is Drop here, and memory in the heap is released
```

Output

```
&n: 0x7ffd3e089f88, &m: 0x7ffd3e089f8c
pn: 0x7ffd3e089f88, *pn: 101
bn: 0x63a56d5b7b80, *bn: 102
```

---

## Box for a Recursive Types

```Rust
enum List {
    Cons(i32, List),
    Nil,
}
```

Compiler Output

```
error[E0072]: recursive type `List` has infinite size
 --> src/lib.rs:1:2
  |
1 |  enum List {
  |  ^^^^^^^^^
2 |     Cons(i32, List),
  |               ---- recursive without indirection
  |
help: insert some indirection (e.g., a `Box`, `Rc`, or `&`) to break the cycle
  |
2 |     Cons(i32, Box<List>),
  |               ++++    +
```

---

## Recursive Type Layout

![width:1500px height:550px](images/list.png)

---

## Using a Box

```Rust
enum List {
    Cons(i32, Box<List>),
    Nil, 
}

let list = Box::new(Cons(1, Box::new(Cons(2, Box::new(Cons(3, Box::new(Nil)))))));
```

Or better:

```Rust
fn cons(value: i32, tail: Box<List>) -> Box<List> { Box::new(Cons(value, tail)) }
let nil: Box<List> = Box::new(Nil);

let list = cons(1, cons(2, cons(3, nil)));
```

---

## Smart Pointers, `Rc<T>`

> `Rc<T>` enables multiple ownership, using reference counting.
>
> It keeps track of the number of references. It only cleans the value when the number of references reaches zero.

• Non-mutably shared ownership.  
• Immutable references only, as mutable references would cause data races.

---

### Example of using `Rc`

```Rust
struct Person { name: String }
struct Account { number: i32, owner: Person }
let p = Person { name: "John".to_string() };
let ac1 = Account { number: 1, owner: p };
let ac2 = Account { number: 2, owner: p };

println!("{} & {}", ac1.owner.name, ac2.owner.name);
```

Compiler Output

```
error[E0382]: use of moved value: `p`
  --> src/main.rs:15:39
13 |    let p = Person { name: "John".to_string() };
   |        - move occurs because `p` has type `Person`, which does not implement the `Copy` trait
14 | let ac1 = Account { number: 1, owner: p };
   |                                       - value moved here
15 | let ac2 = Account { number: 2, owner: p };
   |                                       ^ value used here after move
```

---

### Example of using `Rc`

```Rust
use std::rc::Rc;

struct Account { number: i32, owner: Rc<Person> }
{
    let p = Person { name: "John".to_string() };
    let rp = Rc::new(p);
    let ac1 = Account { number: 1, owner: rp.clone() };
    let ac2 = Account { number: 2, owner: rp.clone() };
    
    println!("{} & {}", ac1.owner.name, ac2.owner.name);
}
```

Output

```
John & John
```

---

### Print Reference Count

```Rust
fn print_count(p: &Rc<Person>) { println!("{}", Rc::strong_count(&p)) }

let rp = Rc::new(Person { name: "John".to_string() });
print_count(&rp);
{ 
    let ac1 = Account { number: 1, owner: rp.clone() };
    print_count(&rp);
    {
        let ac2 = Account { number: 2, owner: rp.clone() };
        print_count(&rp);
    }
    print_count(&rp);
}
print_count(&rp);
```

```
1 <- Create Rc
2 <- First clone create Account ac1
3 <- Second clone create Account ac2
2 <- Block closed ac2 is dropped
1 <- Block closed ac1 is dropped
```

---

### Another `Rc` Example

![images/rc.svg](images/rc.svg)

```rust
fn cons(value: i32, tail: &Rc<List>) -> Rc<List> { Rc::new(Cons(value, tail.clone())) }

fn main() {
    let a = cons(5, &cons(10, &nil));
    let b = cons(3, &a);
    let c = cons(4, &a);
    println!("{:?}", a);
    println!("{:?}", b);
    println!("{:?}", c);
}
```

---

### `Arc` (Atomic Reference Counted)

- Like Rc<T>, but safe to share across threads.
- Allows multi-threaded, shared ownership.
- More expensive due to need to synchronize between threads.

---

### `RefCell` Reference to a mutable cell

> It is a smart pointer type that provides interior mutability.

- It allows you to mutate the data it holds
- Even when the RefCell itself is accessed through an immutable reference.
- It enforces Rust’s borrowing rules at runtime rather than compile time

```rust
let value = RefCell::new(5);
*(value.borrow_mut()) += 1;
println!("value = {:?}", value.borrow());
```

---

### `RefCell` inside an `Rc`

```rust
let person = Rc::new(Person {name: "John".to_string()});
person.name = "Sean".to_string();
```

Compiler Output

```rust
error[E0594]: cannot assign to data in an `Rc`
  --> src/main.rs:15:5
   |
15 |     person.name = "Sean".to_string();
   |     ^^^^^^^^^^^ cannot assign
```

---

### `RefCell` inside an `Rc`

```rust
let person = Rc::new(RefCell::new(Person {name: "John".to_string()}));
person.borrow_mut().name = "Sean".to_string();
println!("{}", person.borrow().name);
```

```
Sean
```

```rust
let person = Rc::new(RefCell::new(Person {name: "John".to_string()}));
let person_alias = person.clone();

person.borrow_mut().name = "Sean".to_string();

println!("{} or {}", person.borrow().name, person_alias.borrow().name);
```

```
Sean or Sean
```

---

## Lifetimes in Rust

- What are Lifetimes?
    - Lifetimes are a way for Rust to track how long references are valid.
    - Ensures memory safety by preventing dangling references.
- Explicit lifetime annotations are required when the compiler can’t infer them automatically.
- Why are Lifetimes important?
    - Rust’s ownership system guarantees memory safety, and lifetimes help enforce these guarantees.
    - Prevents the use of references that could point to invalid or freed memory.

---

## Lifetimes

> Every reference in Rust has a lifetime, which is the scope for which the reference is valid.

```Rust
{
    let x = 5;            // ----------+-- 'b
                          //           |
    let r = &x;           // --+-- 'a  |
                          //   |       |
    println!("r: {}", r); //   |       |
                          // --+       |
}                         // ----------+
```

```
r: 5
```

---

## Lifetimes. Wrong

```Rust
{
    let r;                // ---------+-- 'a
                          //          |
    {                     //          |
         let x = 5;       // -+-- 'b  |
         r = &x;          //  |       |
    }                     // -+       |
                          //          |
    println!("r: {}", r); //          |
}                         // ---------+
```

```rust
error[E0597]: `x` does not live long enough
   |
17 |         let x = 5;                       
   |             - binding `x` declared here
18 |         r = &x;                          
   |             ^^ borrowed value does not live long enough
19 |     }                                    
   |     - `x` dropped here while still borrowed
```

---

## Lifetimes in Functions

```Rust
fn longest(x: &str, y: &str) -> &str {
    if x.len() > y.len() { x } else { y }
}

let string1 = String::from("abcd");
let string2 = "xyz";

let result = longest(&string1, string2);
println!("The longest string is '{}'", result);
```

```
error[E0106]: missing lifetime specifier
 --> src/main.rs:1:33
  |
1 | fn longest(x: &str, y: &str) -> &str {
  |               ----     ----     ^ expected named lifetime parameter
  |
  = help: this function's return type contains a borrowed value, but the signature does not say whether it is borrowed from `x` or `y`
help: consider introducing a named lifetime parameter
  |
1 | fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
  |           ++++     ++          ++          ++
```

---

### Fixed

```rust
fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() { x } else { y }
}
```

Now this will help the compiler to detect errors like the following one:

```rust
let string1 = String::from("hello");
let result;
{
    let string2 = String::from("world!");
    result = longest(&string1, &string2);
} // string2 goes out of scope here

// Attempting to use `result` here would be invalid
println!("The longest string is: {}", result);  // This would cause a compile-time error
```

---

## Lifetime in structures

Lifetimes are also necessary when structs contain references.  
Because the lifetime of the structure needs to be tied someway to the lifetime of the references.

```rust
struct Name {
    first_name: &str, last_name: &str
}
```

```
error[E0106]: missing lifetime specifier
 --> src/main.rs:3:17
  |
3 |     first_name: &str, last_name: &str
  |                 ^ expected named lifetime parameter
  |
help: consider introducing a named lifetime parameter
  |
2 ~ struct Name<'a> {
3 ~     first_name: &'a str, last_name: &str
```

---

### Fix and show usages

```rust
struct Name<'a> { first_name: &'a str, last_name: &str }
```

OK:

```rust
let s = "John Smith".to_string();
let name = Name {first_name: &s[..4], last_name: &s[5..] };
println!("{name:?}")
```

WRONG:

```rust
let name;
{
   let s = "John Smith".to_string();
   name = Name { first_name: &s[..4], last_name: &s[5..] };
}
println!("{name:?}")
```

---

## Static Lifetimes

> `'static` is a special lifetime that applies to references that live for the entire duration of the program.

String literals have `'static` lifetime because they are hardcoded into the program and exist for its entire runtime.

```rust
let s: &'static str = "I live for the whole program!";
```

Because `John` and `Smith` have `'static` lifetime a `Name` constructed from them also has an `'static` lifetime:

```rust
fn john_smith() -> &'static Name {
    &Name { first_name: "John", last_name: "Smith"}
}   
```

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

### Define and use a polymorhic function

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
    ts.iter().map(|x| x.area()).sum()
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

