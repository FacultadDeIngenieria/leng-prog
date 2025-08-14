# **Guía 2 – Structs y problemas de memoria**

#### Lenguajes de Programación – 2C 2025

_Tip: tanto `realloc` como `malloc` pueden fallar. Contemplar eso._

### Programar una LinkedList

_Nota: Cada operación cuenta como una oportunidad de presentar por separado que cada alumno por separado puede presentar_

Se debe implementar usando un Node, como los presentados en clase, que almacena ints

```c
struct Node {
    int value;
    struct Node* next;
};
```

La lista tiene que soportar las siguientes operaciónes
- append: suma un elemento al final de la lista
- prepend: suma un elemento al principio de la lista
- delete: elimina la primera ocurrencia del valor dado. Devuelve 1 si encontró y eliminó el valor, 0 si no lo pudo encontrar
- find: devuelve 1 si existe en la lista y 0 si no
- print: Imprime la lista
- free: libera el espacio de memoria reservado para la lista
- len: devuelve la longitud de la lista

### Sorting

_Nota: Cada algoritmo cuenta como una oportunidad de presentar por separado que cada alumno por separado puede presentar_

Implementar sobre la LinkedList los algoritmos de sorting, de forma ascendente
- Selection
- Insertion
- Bubble 

### Programar una Queue

_Nota: Cada operación cuenta como una oportunidad de presentar por separado que cada alumno por separado puede presentar_

Se debe usar tambien la `struct Node`

La queue tiene que soportar las siguientes operaciónes
- enqueue: encolar un elemento
- dequeue: desencola un elemento y lo devuelve. Devuelve -1 si no hay elementos
- is_empty: devolver 1 si la queue esta vacia, 0 sino
- free: liberar el espacio de memoria dedicado a la queue

### Imprimir un array usando aritmetica de punteros

No se debe usar el acceso de tipo `a[i]`.

### Calcular la longitud de una string usando aritmetica de punteros

No se debe usar el acceso de tipo `a[i]`.

### Invertir un array in place

Se debe revertir el orden de un array. Se debe reordenar la lista sobre el mismo array.

### Ampliar un array con `realloc`

Se debe demostrar cómo expandir un array de tamaño N a tamaño M (donde M > N) usando `realloc`, preservando la información original.

### Concatenar strings

Concatenar dos strings dinámicas en una tercera usando `malloc`. Tener en cuenta _edge cases_, como un NULL o una string vacia.

