# Guía 10 – Haskell, parte 3.  

#### Lenguajes de Programación – 2C 20251. 

##### Primera parte. Módulos. #####

1. Investigue las funciones *group*, *sort* y *words* del módulo **Data.List**. Combínelos para obtener una función que para una cadena de entrada devuelva una lista de tuplas. Cada tupla contiene una palabra y su frecuencia de apariciones. 

**Ejemplo**: si tenemos **"ab aa bb aa cc ab aa"**, el programa debe devolver **[("aa", 3), ("ab", 2), ("bb", 1), ("cc", 1)]**. 

¿De qué tipo es la función resultante?

2. Investigue las funciones *tails* y *isPrefixOf* del módulo **Data.List**. Combínelos para obtener una función que determine si una lista está enteramente contenida en otra.

**Ejemplo**: la lista **[2, 3]** está enteramente contenida en la lista **[1, 2, 3, 4, 5]**. La lista **[1, 3]** no está enteramente contenida en la lista **[1, 2, 3, 4, 5]**.

¿Qué sucede si utilizamos su función para determinar si la cadena **"ove"** está contenida en la cadena **"Beethoven"**? Explique su resultado. ¿De qué tipo es la función?

3. Defina un módulo que implemente el *código de César*. Esta codificación, que seguramente vio en Análisis y diseño de algoritmos, se basa en un desplazamiento de todas las letras en un número dado. Por ejemplo, la palabra **casa** codificada con 1 es **dbtb**; la palabra 
**paz** codificada con 3 es **rcb**. Su módulo debe ofrecer los métodos **cifrar**, que debe recibir un número y una palabra y devolver la palabra cifrada de acuerdo con ese número, y un método **descifrar**, que recibe también un número y la palabra cifrada y, como es de esperarse, la descifra.

4. Defina un módulo que ofrezca funciones que calculen diferentes distancias entre dos puntos $`(x_{1},y_{1})`$ y $`(x_{2},y_{2})`$ del plano. Las distancias por ser calculadas son: la distancia euclidiana $`\sqrt{(x_{1}-x_{2})^{2}+(y_{1}-y_{2})^{2}}`$, la distancia de Manhattan $`|(x_{1}-x_{2})|+|(y_{1}-y_{2})|`$ y la distancia de Chebyshev $`\max(|(x_{1}-x_{2})|, |(y_{1}-y_{2})|)`$. 

**Nota**: estas distancias se usan en *Data Science*. La distancia euclideana es la distancia geométrica; la distancia de Manhattan es la distancia que se recorrería en la grilla de calles de una ciudad. La distancia de Chebyshev, menos usada, se puede ver como la cantidad de 
movidas que ejecutaría un rey de ajedrez en un tablero cuadriculado para unir ambos puntos. 

##### Segunda parte. Tipos. #####

5. Defina un tipo de datos *Stack* que representa una pila. Este tipo de datos permite las siguientes operaciones: *top*, que devuelve el primer elemento de la pila o *Nothing* si la pila está vacía; *emptyStack* que devuelve *true* o *false* dependiendo de que la pila esté o 
no vacía; *pop* que elimina y devuelve el tope de la pila (si la pila está vacía, devuelve *Nothing*); y *push*, que agrega un elemento a la pila (es innecesario decir que lo coloca en el tope. Es una pila, ¿no?)

6. Defina un tipo de datos *Set*, que representa un conjunto. Este tipo de datos permite las siguientes operaciones: *isIn*, que recibe un parámetro y devuelve *true* si el elemento pertenece al conjunto y *false* en caso contrario; *add*, que agrega un elemento al conjunto; 
*delete*, que elimina un elemento del conjunto; *isEmpty*, que devuelve *true* o *false* dependiendo de que el conjunto esté o no vacío; y 
*choose* que devuelve un elemento cualquiera del conjunto o *Nothing* si el conjunto está vacío. 

7. Una pequeña variante: defina ahora *Bag*, un tipo de datos que representa multiconjuntos. Recordemos que un multiconjunto es un conjunto que admite duplicados. Entonces reemplazamos la pertenencia (lo que en el ejercicio anterior era *isIn*) por *multiplicity*, que nos devuelve la multiplicidad de un elemento pasado como parámetro en el multiconjunto. Si el elemento no está en el conjunto, tiene multiplicidad 0. Además, tenemos las funciones *add* (como antes, pero aquí agregamos una ocurrencia del parámetro); *deleteOne* y *deleteAll* (borramos una o todas las ocurrencias del elemento pasado como parámetro); *isEmpty* (como antes) y *choose* (como antes). 

8. Defina un tipo de datos *Books* que contiene información de libros. Tendremos diversos libros con los siguientes datos: *author*, *title*, *pages*. Este tipo de datos debe tener las funciones *add*, que permite agregar un registro, *show*, que permite mostrar los registros, *showAuthor* que permite mostrar todos los libros de un autor, y *delete* que permite eliminar una entrada. 
