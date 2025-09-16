
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

## Collections

- Slices
- Vectors
- Iterators
- Maps

---

## Slices
### String slices
> It is a reference to a part of a `String`

For example:

```rust
{
    let s = String::from("hello world");

    let hello = &s[..5];
    let world: &str = &s[6..];
    
    println!("s[0..5] = {hello}, s[6..11] = {world}");
}
```

![bg right:40%](images/slices.png)

---

## Example: Implementing a first_word function

```rust
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();
    for (i, &c) in bytes.iter().enumerate() {
        if c == b' ' {
            return &s[0..i];
        }
    }
    &s[..]
}
```

---

## Slices are references (They follow borrowing rules)

Where is the error ???

```rust
{
    let mut hw = "Hello World".to_string();
    let fw = first_word( & hw);
    
    hw.clear();
    println ! ("{fw}");
}
```

---

## Other Slices

You can create slices to any array:

```rust
{
    let a = [1, 2, 3, 4, 5];
    let sa = &a[3..];
    println!("{sa:?}");
}
```

---

## Vectors

Vectors are list of items (like arrays, but you can grow and shrink them).
Similar to the `ArrayList` in **Java**.


```rust
let mut v = Vec::new();
v.push(10);
v.push(20);
println!("{v:?}")
```

Or using the `vec!` macro:

```rust
let v = vec![10, 20];
```

---

## Accessing elements

```rust
let mut v = vec![10, 20, 30, 40];

// copy the element 
let first = v[0];
v[0] = 100;

// Using a reference
let second = &v[1];

// Using slices
let last2 = &v[v.len()-2..];
println!("All: {v:?}, first = {first}, second = {second}, last2 = {last2:?}")
```
<div data-marpit-fragment>

Output
```rust
All: [100, 20, 30, 40], first = 10, second = 20, last2 = [30, 40]
```

---

## Using get (Handling errors)

```rust
{
    let n = 100;
    let mut v = vec![10, 20, 30, 40];
    // println!("{}", v[n]); Ka boom !
    match v.get(n) { 
        Some(e) => println!("Element {n} = {e}"),
        None => println!("There is no element {n}."),
    }
    // Using if let
     if let Some(e) = v.get(n) {
         println!("Element {n} = {e}")
     }
}
```

## Iterating with for

```rust
let v = vec![100, 32, 57];
for i in &v {
    println!("{:p} {}", i, i); 
}
```

Output
```rust
0x600002fc0000 100
0x600002fc0004 32
0x600002fc0008 57
```

---

## Mutable iteration

```rust
let mut v = vec![0; 5];
let mut n = 0;
for i in &mut v {
    *i = n;
    n += 1;
}
println!("{v:?}");
```

Output

```rust
 [0, 1, 2, 3, 4]

```
---

---

## Maps

```rust
let mut prices = HashMap::new();
prices.insert("Apples", 2.50);
prices.insert("Oranges", 3.00);

println!("{}", prices["Apples"]);

if let Some(price) = prices.get("Apples") {
    println!("Apples cost: {price}")
}
```
Output:

<div data-marpit-fragment>

```rust
2.5
Apples cost: 2.5
```
---

## Ownership in HashMap
- If the value is a Copy type, the value will be copied into the HashMap
- Other values will be moved into the HashMap

#### If we insert references, their value will not be moved 

So the values that the references point to must be valid for at least as long as the HashMap is valid.

---

## Ownership in HashMap – Example

```rust
let mut map = HashMap::new(); 
{
    let fruit = String::from("Apples");
    let price = String::from("10.20");
    map.insert(fruit, &price);    
}
println!("{map:?}");

```

Where is the error ???


---

## Iterating a Map

```rust
let prices: HashMap<_,_> = HashMap::from_iter([
    ("Apples", 2.50),
    ("Oranges", 3.00)
]);
for (fruit, price) in &prices {
    println!("{fruit:10} = {price}");
}
```

---

## Using entry

```rust
let mut stock: HashMap<_,_> = HashMap::from_iter([
    ("Apples", 10),
    ("Oranges", 3)
]);
let a = stock.entry("Apples").or_insert(0);
*a += 20;

let p = stock.entry("Pears").or_default();
*p += 20;

println!("{stock:?}")

```



