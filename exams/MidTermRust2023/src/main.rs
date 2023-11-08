mod mutable_stack;

use stack;
use stack::Stack;

fn main() {
    let stack = Stack::new();

    let stack1 = stack.push(1);
    let stack2 = stack1.push(2);


    if let Some((&item, stack3)) = stack2.pop() {
        println!("Popped item: {}", item);
        println!("Stack 3: {stack3:?}");
    }
    println!("Stack: {:?}", stack.peek());

    println!("Stack: {stack:?}");
    println!("Stack1: {stack1:?}");
    println!("Stack 2: {stack2:?}");

    test_swap();
}

fn test_swap() {
    let mut x = 100;
    let mut y = 200;
    println!("x= {x}, y= {y}");
    swap(&mut x, &mut y);
    println!("x= {x}, y= {y}");

    swap2(&mut x, &mut y);
    println!("x= {x}, y= {y}");

    let mut x2 = "Hello".to_string();
    let mut y2 = "World".to_string();
    println!("x2= {x2}, y= {y2}");
    swap_clone(&mut x2, &mut y2);
    println!("x2= {x2}, y= {y2}");
}

fn swap<T:Copy>(a: &mut T, b: &mut T) {
    let temp = *a;
    *a = *b;
    *b = temp;
}
fn swap2<T:Copy>(a: &mut T, b: &mut T) {
    (*b, *a) = (*a, *b);
}
fn swap_clone<T:Clone>(a: &mut T, b: &mut T) {
    let temp = a.clone();
    *a = b.clone();
    *b = temp;
}