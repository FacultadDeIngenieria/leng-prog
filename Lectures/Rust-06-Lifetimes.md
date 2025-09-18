---
marp: true
theme: default
size: 16:9
paginate: true
---

# Lifetimes

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

---

## Lifetimes. Wrong

```Rust
{
    let r;                // ---------+-- 'a
    {                     //          |
         let x = 5;       // -+-- 'b  |
         r = &x;          //  |       |
    }                     // -+       |
    println!("r: {}", r); //          |
}                         // ---------+
```

```rust
error[E0597]: `x` does not live long enough
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


fn main() {
    let string1 = String::from("abcd");
    let mut result = "";
    {
        let string2 = String::from("xyz");
        result = longest(&string1, &string2);
    } // string2 goes out of scope here

    // Attempting to use `result` here could be invalid
    println!("The longest string is '{}'", result);
}

```

---
### Compiler error

```rust
--> src/main.rs:2:32
  |
2 | fn longest(x: &str, y:&str) -> &str {
  |               ----    ----     ^ expected named lifetime parameter
  |
  = help: this function's return type contains a borrowed value,
          but the signature does not say whether it is borrowed from `x` or `y`
   help: consider introducing a named lifetime parameter
  |
2 | fn longest<'a>(x: &'a str, y:&'a str) -> &'a str {
  |           ++++     ++         ++          ++
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
       let string2 = String::from("xyz");
           ------- binding `string2` declared here
       result = longest(&string1, &string2);
                                  ^^^^^^^^ borrowed value does not live long enough
   }
   - `string2` dropped here while still borrowed
   println!("The longest string is '{}'", result);
                                          ------ borrow later used here
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

---
