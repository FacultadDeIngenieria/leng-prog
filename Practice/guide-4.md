# Guía 3 – Introducción a Rust

#### Lenguajes de Programación – 2C 2025

Escriba un programa que determine si un número representa un año bisiesto o no. Recuerde que las reglas para efectuar esta determinación son las siguientes:
- Un año divisible por 4 es en general bisiesto; por ejemplo, 1980 y 2016 son años bisiestos;
- La excepción a la regla anterior ocurre con los años que son fines de siglo, que en general no son bisiestos: 1900 y 1700 no fueron años bisiestos;
- La excepción a la regla anterior ocurre con los años que son divisibles por 400, que, a pesar de ser fines de siglo, son bisiestos: 1600 y 2000 fueron años bisiestos.

Explique la diferencia entre los siguientes programas:

```rust
// Programa 1
fn main () {
      let x = 1;
      println (“El valor de x es {}”, x);
      x = 2;
      println (“El valor de x es {}”, x);
}
```
```rust
// Programa 2
fn main () {
      let mut x = 1;
      println (“El valor de x es {}”, x);
      x = 2;
      println (“El valor de x es {}”, x);
}
```

```rust
// Programa 3
fn main () {
      let x = 1;
      println (“El valor de x es {}”, x);
      let x = 2;
      println (“El valor de x es {}”, x);
}
```

Escriba un programa para determinar si un número es primo o no. Recuerde que un número es primo si es mayor que 1 y no admite otro divisor que 1 y sí mismo.

Escriba un programa que, utilizando el código del ejercicio del ejercicio 3, imprima en pantalla los números primos entre 0 y 100.

Explique el siguiente programa:

```rust
// Programa 4
fn main () {
      let num = Some(7);
      if let Some(x) = num {
             println! (“Match: {:?}”, x);

      }
}
```

Escriba un programa que calcule el promedio de los números de una tupla de enteros de 32 bits. El programa debe devolver el resultado en un formato que permita decimales. En otras palabras, queremos que el promedio de (1, 3, 4, 6) sea 3.5 y no 3.

Escriba un programa que calcule la desviación estándar de los números de una tupla de enteros de 32 bits.  Recuerde que la desviación estándar es la raíz cuadrada del promedio de los cuadrados de las restas de cada elemento menos el promedio. Utilice el código del ejercicio 7 para obtener el promedio (aquí, 3.5).

Tenemos dos tuplas de n y m enteros respectivamente ordenadas de manera creciente. Queremos combinar (merge) los elementos de ambos arreglos en una tercera tupla de m+n elementos que debe estar igualmente ordenada. Por ejemplo, si tenemos las tuplas (1, 3, 4, 7) y (1, 2, 2, 8, 11, 14) deberíamos obtener la tupla (1, 1, 2, 2, 3, 4, 7, 8, 11, 14).

Queremos obtener el máximo común divisor (mcd) de dos números a y b. Para ello, utilizaremos el algoritmo de Euclides. Recuerde que este algoritmo funciona como sigue:
- si a y b son iguales, entonces devolver a (o b, tanto da);
- si a > b, entonces devolver el mcd de (a-b) y b;
- si no, devolver el mcd de a y (b-a).

En aritmética modular, el inverso multiplicativo de un número n módulo z es el número q tal que (n * q) mod z = 1. Por ejemplo, el inverso multiplicativo de 5 módulo 7 es 3, puesto que 3 * 5 = 15 mod 7 = 1. El inverso multiplicativo sólo existe si el mcd de n y z es 1.  Por ejemplo, no existe inverso multiplicativo de 2 módulo 8. Escriba un programa que devuelva el inverso multiplicativo de dos números o algún código de error si no existe. Puede usar el código del ejercicio 11 para esta comprobación. Nota: observe que, dado que trabajamos módulo z, el inverso multiplicativo, si existe, debe estar entre 1 y z-1.

Escriba un programa que, dado un número entero, encuentre la suma de sus dígitos individuales. Por ejemplo, la suma de 4122 es 4+1+2+2 = 9.

Tenemos un polinomio de segundo grado $`(ax^2 + bx + c = 0)`$, donde \(a\), \(b\) y \(c\) son números reales. La fórmula para encontrar sus raíces (los valores de x para que la expresión valga 0) es la siguiente:

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

Varios casos son posibles. El discriminante $`(\Delta = b^2 - 4ac)`$ puede valer 0, en cuyo caso hay un único valor que hace 0 la ecuación; puede ser positivo y entonces tenemos dos soluciones; o puede ser negativo y entonces no hay ninguna solución real. Escriba una función que calcule las raíces de una ecuación de este tipo. Utilice una enumeración para tratar separadamente los tres casos, incluso el caso de que no hay soluciones.

Una solución un poco más elaborada. Como recordará, los números complejos tienen una parte real y una parte imaginaria: son de la forma $`a + bi`$, donde $`a`$ y $`b`$ son números reales y tenemos $`i^2 = -1`$. Entonces podemos manejar el caso del discriminante negativo del ejercicio anterior. Cree una estructura para números complejos que tenga una parte real y una parte imaginaria (ambos números reales) y una función que devuelva las raíces del polinomio. En el caso de raíces reales, la parte imaginaria será obviamente 0; en el caso de que el discriminante sea 0, se devolverá la única solución y en el caso de discriminante negativo se devolverán los complejos conjugados correspondientes.

Escriba un programa que calcule recursivamente el factorial de un número. Recuerde que el factorial de un número se define como sigue:
- el factorial de 0 es 1;
- el factorial de un número n > 1 es n * factorial (n-1).
Si el número ingresado es negativo, debe devolverse un error.

Dado un arreglo de n elementos ordenados de manera creciente, efectúe la búsqueda binaria de la posición de un número (que puede o no estar en el arreglo). Recuerde que vamos cortando el arreglo en dos mitades y elegimos una en cada paso. El programa debe devolver el índice de la primera aparición del número o -1 si el número buscado no se encuentra en el arreglo.

Cree una estructura según el siguiente esquema, que representan cuentas en su banco:

numCuenta (número entero)
nombreTitular (String)
apellidoTitular (String)
saldoPesos (número real)
saldoDolares (número real)

Escriba un programa que agregue algunos clientes ficticios a su banco. Estos clientes tendrán también algunos saldos iniciales.

Escriba un programa que permita efectuar depósitos y extracciones de las cuentas. El programa deberá recibir el nombre de la estructura, un código de operación (por ejemplo, 1 es depósito en pesos, 2 depósito en dólares, 3 extracción en pesos y 4 extracción en dólares) y efectúe la operación con las siguientes condiciones:
- se debe modificar de manera acorde el saldo correspondiente con la excepción mencionada abajo;
- los descubiertos permitidos son 10000 pesos y 8 dólares;
- si la operación no es posible (saldo negativo menor que el descubierto permitido), no se producirán modificaciones.

En la Universidad Municipal de Fraile Muerto (UMFM) se tiene el siguiente esquema de aprobación de materias:
- Hay tres instancias de evaluación que deben aprobarse durante la cursada con una posibilidad de recuperación.
- Si se aprueban las tres sin recuperación y con nota superior a 8 en todos los casos, la materia se aprueba directamente sin examen. Esto se llama promoción. La nota final es el promedio de las tres instancias redondeada al primer entero superior (por ejemplo, 8-10-8 da 9).
- Si se aprueban las tres instancias pero al menos una nota está por debajo de 8 o una de las instancias debió recuperarse, se aprueba la cursada pero debe rendirse un examen final. La nota de aprobación es cuatro.
- Si se reprueban dos o más de las instancias de evaluación o se reprueba una de ellas y no se aprueba el examen de recuperación, se debe recursar la materia.
- En el caso de que el alumno deba rendir examen final, la nota final es el promedio de la nota del examen y de las instancias de evaluación aprobadas redondeada al primer entero superior (por ejemplo, 4-4-4-9 da 6).

Diseñe una estructura que almacene la información completa de un alumno. Además, queremos un programa con una función que nos determine si un alumno debe o no rendir el examen final. En el caso de que no deba rendirlo por promoción, debe colocar la nota final. Si no, otra función debe calcular la nota final dada la nota del examen final. En el caso de que el alumno no se presente, la nota del examen final y la nota final son ambas A (ausente). Utilice Option para manejar esto.

Imagine que tenemos un arreglo [1, 2, 3] y tratamos de leer la posición 20. Esto va a provocar un panic! A pesar de que no queremos escribir nada sino sólo leer. ¿Está justificado que esto ocurra? ¿Por qué o por qué no? Incidentalmente, esto se llama overread.