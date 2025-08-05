# Guía 1 – Introducción a C

#### Lenguajes de Programación – 2C 2025

<!-- ### 1. Hola Mundo

Escriba un programa que imprima “Hello, World!” en la terminal. -->

### Conversor Celsius → Fahrenheit

Programe un conversor de Celsius a Fahrenheit y escriba en pantalla la conversión desde 0 a 300 grados Celsius en N pasos.

- Sin funciones
- Sin números mágicos (`#define`)

### Tabla Celsius ↔ Fahrenheit con N pasos

Extienda el ejercicio anterior para mostrar ambas columnas: Celsius y Fahrenheit.
_Ejemplo de salida:_

```
C     F
0     32
20    68
...
```

### Par o impar

Lea un número desde teclado e imprima si es par o impar.

### Suma de 1 a N

Lea un número N y calcule la suma de los números del 1 al N.

- Resolver con `for` y luego con `while`

### Factorial de un número

Calcule el factorial de un número ingresado por teclado usando `while`.
_Ejemplo:_

```
Ingrese un número: 5
Factorial = 120
```

### Serie de Fibonacci

Imprima los primeros N números de la serie de Fibonacci.

### Imprimir archivo

Lea un archivo de texto y muestre todas sus líneas por pantalla.

### Contar saltos de línea, espacios y tabs

Lea un archivo de texto y cuente:

- Cantidad de `\n` (líneas)
- Cantidad de espacios `' '`
- Cantidad de tabs `\t`

### Compactar espacios

Lea un archivo y reemplace cualquier secuencia de múltiples espacios por uno solo. Guardar el resultado en otro archivo.

### Contar palabras por línea

Lea un archivo y genere un nuevo archivo donde para cada línea se indique cuántas palabras tiene.
_Ejemplo:_

Archivo entrada:

```
Hola mundo
Esto es un ejemplo
C es divertido
```

Archivo salida:

```
2
4
3
```

### Histograma de longitudes de palabras
Genere un histograma con la frecuencia de longitudes de palabras de un archivo.
- Considerar solo palabras de hasta 15 letras (ignorar más largas)
- Una palabra es una secuencia de letras separada por espacios, tabs o saltos de línea
- Ignorar signos de puntuación al contar letras
- Usar '#' para representar cada ocurrencia

_Ejemplo:_

```
2 | #
4 | ##
5 | #
6 | #
9 | #
```

### Frecuencia de letras

Cuente cuántas veces aparece cada letra (a-z) en un archivo. Ignore mayúsculas/minúsculas.

### Estadísticas de 10 enteros

Lea 10 enteros y calcule:

- Promedio
- Máximo
- Mínimo

### Rotar arreglo

Lea N enteros en un arreglo y rotar a la derecha una posición.

_Ejemplo:_

```
[1, 2, 3, 4, 5] => [5, 1, 2, 3, 4]
```

### Comparar strings

Implemente su propia versión de `strcmp` para comparar dos strings.

### Palíndromos

Determine si una string es palíndroma ignorando espacios y mayúsculas.

### Crear arreglo dinámico

Cree un arreglo dinámico de N enteros, inicialícelo con números pares e imprímalo.

### Persona más alta

Defina:

```c
struct Person {
    char name[50];
    int age;
    float height;
};
```

Cree 5 personas desde teclado e imprima la más alta.

_Ejemplo de salida:_

```
Name: Shaquille O'Neal
Age: 53
Height: 216cm
```

### Búsqueda binaria clásica

Implemente el algoritmo de búsqueda binaria.

### Búsqueda binaria con goto

Reescriba el algoritmo de búsqueda binaria reemplazando loops por `goto`.