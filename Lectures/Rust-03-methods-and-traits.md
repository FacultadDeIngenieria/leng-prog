

## A Simple `struct`

```Rust
#[derive(Debug)]
struct Rectangle {
    width: u32,
    height: u32,
}
let r = Rectangle { width: 10, height: 20};

println!("{:?}", r);
```

Output

```bash

Rectangle { width: 10, height: 20 }

```

---

## Functions over structures (a.k.a. methods)

```Rust
fn area(rectangle: &Rectangle) -> u32 {
    rectangle.width * rectangle.height
}
area(&r)
```

Instead:


```Rust
impl Rectangle {            // <-- I'm going to implement some methods for Rectangle
    fn area(&self) -> u32 { // <-- &self is a reference to a Rectangle
        self.width * self.height
    }
}
r.area() // Now I can invoke it like a method in other prog. languages
```

---

## Mutating a `struct` in a function

```Rust
#[derive(Debug)]
struct Item { id: i32, stock: i32}

// Add some q to the Item
fn add_stock(item: &mut Item, q: i32) {
    item.stock += q
}
// a is declared as mutable so I can modify it
let mut a = Item { id: 1, stock: 100};
println!("{:?}", a);

// I pass a mutable reference to a 
add_stock(&mut a, 20);

println!("{:?}", a);
```

    Item { id: 1, stock: 100 }
    Item { id: 1, stock: 120 }

---

##  Method syntax


```Rust
#[derive(Debug)]
struct Item { id: i32, stock: i32}

impl Item {
    fn add_stock(&mut self, q: i32) { // self is a mutable reference
        self.stock += q
    }
}

let mut a = Item { id: 1, stock: 100};
println!("{:?}", a);

a.add_stock(20); // Rust knows that it needs to pass a mutable reference

println!("{:?}", a);
```

---

## Traits

> Traits define a set of functions that are shared across multiple types.
>
> Not exactly like `interface`. (They are **open**)


```Rust
trait Named {
    fn first_name(&self) -> &String;
    fn last_name(&self) -> &String;
    fn full_name(&self) -> String { 
        format!("{} {}", self.first_name(), self.last_name())
    }
}
```

---

## Implementing a trait for a type

```Rust
struct Person(String, String);

impl Named for Person { 
    fn first_name(&self) -> &String { &self.0 }
    fn last_name(&self) -> &String  { &self.1 }
}

struct Student {
    name: String, last_name: String
}

impl Named for Student {
    fn first_name(&self) -> &String { &self.name }
    fn last_name(&self) -> &String  { &self.last_name }
}

```

---

## Trait Inheritance


```Rust
trait Person {
    fn name(&self) -> String;
}

// Person is a supertrait of Student.
// Implementing Student requires you to also impl Person.
trait Student: Person {
    fn university(&self) -> String;
}

trait Programmer {
    fn fav_language(&self) -> String;
}

// CompSciStudent (computer science student) is a subtrait of both Programmer 
// and Student. Implementing CompSciStudent requires you to impl both supertraits.
trait CompSciStudent: Programmer + Student {
    fn git_username(&self) -> String;
}
```
---

## Generics


```Rust
fn count<T>(list: &[T]) -> i32 {
    let mut n = 0;
    for _ in list {
        n += 1;
    }
    n
}
println!("{}", count(&[1, 2, 3]));
println!("{}", count(&vec!("aa", "b")))
```

---

## Monomorphization

* **Rust** (Like **C++**) implements generics by performing **monomorphization** of the code using generics at compile time. 

* It essentially generates the code for the needed implementations.

* In contrast **Java** uses **erasure** and **dynamic dispatch** at runtime.

---

## Trait Bounds

```Rust
fn wrong_max<T>(list: &[T]) -> &T { 
    let mut max = &list[0];

    for item in list {
        if item > max { max = item }
    }
    max
}
println!("{}", wrong_max(&[4, 1, 2, 3]));
```

---

## Compile Error

```rust
[E0369] Error: binary operation `>` cannot be applied to type `&T`

   ╭─[command_32:1:1]
   │
 1 │ fn wrong_max<T>(list: &[T]) -> &T {
   │               │ 
   │               ╰─ help: consider restricting type parameter `T`: `: std::cmp::PartialOrd`
   │ 
 5 │         if item > max { max = item }
   │            ──┬─ ┬ ─┬─  
   │              ╰───────── &T
   │                 │  │   
   │                 ╰────── error: binary operation `>` cannot be applied to type `&T`
   │                    │   
   │                    ╰─── &T
───╯
```

---

## Trait Bounds

```Rust
fn max<T: Ord>(list: &[T]) -> &T {                         // Fix adding bound
    let mut max = &list[0];

    for item in list {
        if item > max { max = item }
    }
    max
}
```

---

## Trait Bounds syntax


```Rust
fn max1<T: Ord>(list: &[T]) -> &T {
    
}
```
```rust
fn max2<T>(list: &[T]) -> &T
    where T : Ord
{
    
}
```

---

## The `where` syntax is useful for complex bounds, for example:


```rust
fn example1<T: Ord + Clone, U: Eq + Copy>(t: &T, u: &U) -> i32 
{ 10 }
```
```rust
fn example2<T, U>(t: &T, u: &U) -> i32
where T: Ord + Clone,
      U: Eq + Copy

{ 10 }
```

---

## Trait Bounds syntax

The `&impl` syntax can be used for simpler bounds


```Rust
trait Shape {  fn area(&self) -> f64;}

fn print_area1<T: Shape>(x: &T) {
    println!("{}", x.area())
}

fn print_area2(x: &impl Shape) {
    println!("{}", x.area())
}
```
---
