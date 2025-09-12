# Guía 6 – Seguimos con Rust.  

#### Lenguajes de Programación – 2C 20251. 

1. Defina una _struct_ **Punto** que represente un punto en el plano. 

2. Defina una función a continuación que reciba tres instancias de **Punto** y determine si los tres puntos están alineados. 

3. Ahora redefina su función de manera que sea un método de **Punto**. Este método debe recibir dos instancias de **Punto** y debe devolver _true_ o _false_ dependiendo de que los dos puntos determinen una recta que incluya a _self_.

4. Construya los siguientes _structs_: Rectangulo, Cuadrado, Circulo, Elipse, Triangulo y Rombo. El rectángulo y el triángulo deben tener las dimensiones de la base y la altura. La elipse debe tener las dimensiones de los radios menor y mayor y el rombo debe tener las dimensiones de las diagonales menor y mayor. El círculo debe tener la dimensión del radio y el cuadrado la del lado. Todas las dimensiones están en f32.

5. A continuación, cree un _trait_ **Superficie** que tenga una función _sup_ que devuelva la superficie. Implemente este _trait_ para cada una de las _structs_ que definió arriba. Puede tomar el valor 3.1416 para $`\pi`$. 

6. Construya una _struct_ **Rectangle** que tenga dos campos, *esq1* y esq*. ambos campos son de tipo i32 y representan dos esquinas esquinas opuestas de un rectángulo en el plano. Puede ser cómodo para lo que sigue que las esquinas sean la izquierda inferior y la derecha superior en ese orden. 

7. Defina ahora una función que reciba una instancia de **Rectangle** y devuelva la superficie. 

8. Defina ahora la función anterior como un método de **Rectangle**. 

9. Este ejercicio puede plantear alguna dificultad técnica. Queremos una función que reciba dos instancias de **Rectangle** y nos devuelva la superficie de la intersección de ambos. 

10. Defina la función anterior como un método de **Rectangle**. 

11. Escriba una función que encuentre el máximo elemento de una lista de números y de pares ordenados utilizando _generics_. Para comparar dos pares $`p_{1} = (x_{1},y_{1})`$ y $`p_{2} = (x_{2},y_{2})`$, utilizamos la siguiente regla: $`p_{1} > p_{2}`$ si $`x_{1} > x_{2}`$ o si $`x_{1} = x_{2}`$ y $`y_{1} > y_{2}`$. 

12. Considere el siguiente fragmento de código:

```rust
enum List {
    Cons(i32, List),
    Nil,
}

use crate::List::{Cons, Nil};

fn main() {
    let list = Cons(1, Cons(2, Cons(3, Nil)));
}
```

Esto no compila. Explique el problema, dé una solución y explique por qué su solución efectivamente funciona. 

13. Considere ahora el siguiente fragmento de código. La idea es tener una lista $`a =[5, 10]`$ y dos listas, $`b`$ y $`c`$. La lista $`b`$ comienza con 3 y la lista $`c`$ comienza con 4. Luego ambas se empalman con $`a`$. En otras palabras, queremos tener además las listas $`b=[3,5,10]`$ y $`c=[4,5,10]`$. 

```rust
enum List {
    Cons(i32, Box<List>),
    Nil,
}
use crate::List::{Cons, Nil};

fn main() {
    let a = Cons(5,
        Box::new(Cons(10,
            Box::new(Nil))));
    u let b = Cons(3, Box::new(a));
    v let c = Cons(4, Box::new(a));
}
```

Pero esto no compila. Explique el problema, dé una solución y explique por qué esta solución efectivamente funciona. 