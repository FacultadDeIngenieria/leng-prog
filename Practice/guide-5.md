# Guía 4 – Introducción a Rust 

#### Lenguajes de Programación – 2C 20251. 

1. ¿Dónde se almacena una variable de tipo _String_? ¿Por qué?

2. Explique la diferencia entre los siguientes segmentos de código. 
```rust
// Programa 1
fn main() {
    let x = 5;
    let y = x;
    println!("El valor de x es {} y el valor de y es {}.", x, y);
}
```

```rust
// Programa 2
fn main() {
    let st1 = String::from("hello");
    let st2 = st1;
    println!("El valor de st1 es {} y el valor de st2 es {}.", st1, st2);
}
```

3. Explique por qué razón en el código anterior _st2_ toma la propiedad (_ownership_) del valor en memoria de _st1_ y no la mantienen ambos. 

4. Considere la siguiente solución al problema anterior: 
```rust
fn main() {
    // Programa 3
    let st1 = String::from("hello");
    let st2 = st1.clone();
    println!("El valor de st1 es {} y el valor de st2 es {}.", st1, st2);
}
```
¿Qué inconveniente puede acarrear esta solución? ¿Qué sucedió en la memoria? ¿Por qué en el primer ejemplo del ejercicio 2 (Programa 1) no fue necesario llamar al método _clone()_?

5. Explique qué sucede en el siguiente fragmento de código. 
```rust
// Programa 4
fn main() {
    let s1 = toma_prop();
    let s2 = String::from("hello");
    let s3 = toma_y_devuelve_prop(s2);
    println!("El valor de s1 es {}", s1);
    println!("El valor de s2 es {}", s2);
    println!("El valor de s3 es {}", s3);
} 

fn toma_prop() -> String {
    let cadena = String::from("hello");
    cadena
}
```

6. Explique la diferencia entre los siguientes fragmentos de código. ¿Cuál le parece mejor? ¿Por qué?
```rust
// Programa 5
fn main() {
    let s1 = String::from("hello");
    let (s2, len) = calcular_longitud(s1);
    println!("La longitud de {} es {}.", s2, len);
}

fn calcular_longitud(s: String) -> (String, usize) {
    let length = s.len(); 
    (s, length)
}
```

```rust
// Programa 6
fn main() {
    let s1 = String::from("hello");
    let len = calcular_longitud(&s1);
    println!("La longitud de {} es {}.", s1, len);
}

fn calcular_longitud(s: &String) -> usize {
    s.len()
}
```

7. Haga funcionar el siguiente código sin modificar el _main_. Explique el problema. 
```rust
// Programa 7 
// ¡No tocar esto!
fn main() {
    let s1 = String::from("Hello world");
    let s2 = take_ownership(s1);
    println!("{}", s2);
}

// ¡Modificar únicamente el código abajo!
fn take_ownership(s: String) {
    println!("{}", s);
}
```

8. El siguiente programa no compila. Explique el error y resuélvalo sin tocar el _main_. 
```rust
// Programa 8
// ¡No tocar esto!
fn main() {
    let s = give_ownership();
    let _s = s.into_bytes(); 
    println!("{}", s);
}

// ¡Modificar únicamente el código abajo!
fn give_ownership() -> String {
    let s = String::from("hello, world");
    s
}
```

9. El siguiente programa no compila. Explique el error y resuélvalo. ¿Qué conclusión puede sacar?
```rust
// Programa 9
fn main() {
    let s = String::from("Hello ");   
    let s1 = s;
    s1.push_str("World!");
    println!("¡Final feliz!");
}
```

10. En el siguiente ejercicio, haga una pequeña investigación acerca del significado de _Box_ y modifique la línea señalada para que el programa tenga un final feliz. 
```rust
// Programa 10
fn main() {
    let x = Box::new(5);  
    let ...      // Modificar esta línea. ¡No tocar las otras!
    *y = 4;
    assert_eq!(*x, 5);
    println!("¡Final feliz!");
}
```

11. Explique el error en el siguiente programa. Haga alguna modificación en la línea indicada para que funcione. ¿Qué conclusión puede sacar de esto?
```rust
// Programa 11
fn main() {
   let t = (String::from("Anton"), String::from("Webern"));
   let _s = t.0;
   println!("{:?}", t); // Modifique sólo esta línea. No use '_s'
}
```

12. Llene los blancos para que el programa ejecute. En otras palabras, reemplace los _underscores_ en la línea indicada. Explique qué sucede aquí. 
```rust
// Programa 12
fn main() {
   let t = (String::from("Alban"), String::from("Berg"));
   let (__, __) = __; // Reemplace los underscores en esta línea. 
   println!("{:?}, {:?}, {:?}", s1, s2, t); // Queremos la salida -> "Alban", "Berg", ("Alban", "Berg")
}
```
13. Llene los blancos para que se imprima la referencia de la variable _x_. En otras palabras, reemplace los _underscores_ en la línea indicada.  

```rust
// Programa 13
fn main() {
   let x = 5;
   let p = __;	// Reemplace los underscores en esta línea. 
   println!("La dirección de 'x' es {:p}", p); // El aspecto de la salida es algo como: 0x16fa3ac84
}
```

14. Llene los blancos para que el siguiente programa termine con éxito. Para ello, reemplace los _underscores_ en la línea indicada. 
```rust
fn main() {
    let x = 5;
    let y = &x;
    assert_eq!(5, y); // Modificar sólo esta línea
    println!("¡Éxito!");
}
```

15. Escriba una función que reciba dos parámetros de tipo _&String_ y devuelva el más largo de ambos. El esquema es el siguiente:
```
// Programa 9 (aún inconcluso)
fn longer(s1: *String, s2: *String) -> *String {
    // Aquí viene su código; podría ser necesario cambiar algo arriba
}
```




