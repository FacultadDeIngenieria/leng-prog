# Guía 7 – Prolog. Algunos ejercicios. 

#### Lenguajes de Programación – 2C 20251. 

##### Primera parte. Bases de datos.

Trabajamos aquí con la base de datos vista en clase. 

```
father(terach, abraham).        male(terach).
father(abraham,isaac).	        male(abraham).
father(abraham,ishmael).        male(isaac).
father(terach, nachor).	        male(ishmael).
father(terach, haran).	        male(nachor).
father(isaac, esau).	        male(haran).
father(isaac, jacob).       	male(esau).
father(haran, lot).	            male(jacob).
father(haran, milcah).          male(lot).
father(haran, yiscah).
                                female(sarah).
mother(sarah, isaac).           female(hagar).
mother(hagar, ishmael).         female(milcah).
mother(rebecah, esau).          female(yiscah).
mother(rebecah, jacob).         female(rebecah).
```

1. Un *tío abuelo* es un hermano de un abuelo. Tome la base de datos bíblica y escriba un predicado **grandoncle(X, Y)** que sea verdadero si **X** es tío abuelo de **Y**.  Aplíque este predicado a Jacob. 

2. Un *medio hermano* es una persona que es hija del mismo padre pero de distinta madre, o de la 
misma madre pero diferente padre. Escriba un predicado **halfsibling(X, Y)** que sea verdadero si **X** e **Y** son medio hermanos. Aplíque este predicado a Isaac. 

3. Escriba una regla para encontrar todas las hijas una persona dada. Aplíquela a Haran. 

4. Compare los siguientes conjuntos de reglas:

``` 
% Conjunto de reglas 1

sublista(L1, L2) :- prefijo(L1, L2).
sublista(L1, [_|T2]) :- sublista(L1, T2).

prefijo([], _).
prefijo([H|T1], [H|T2]) :- prefijo(T1, T2).

% Conjunto de reglas 2

subsecuencia([], L2).
subsecuencia([H|T1],[H|T2]) :- subsecuencia(T1, T2).
subsecuencia(L1, [_|T2]) :- subsecuencia(L1, T2).
```

¿Cuál es la diferencia entre ambos?  **Ayuda**: considere los pares de datos de entrada **([3, 4], [1, 2, 3, 4, 5])** y **([3, 5], [1, 2, 3, 4, 5])**.

5. Escriba un predicado **norepetitions(L1, L2)** que sea verdadero si la lista **L2** es la lista **L1** sin repeticiones. De cada elemento sólo debe quedar la última ocurrencia. Por ejemplo, si **L1** es **[5, 3, 7, 1, 3, 5, 7] **, entonces **L2** debe ser **[1, 3, 5, 7]**. **Ayuda**: use **member**. 

6. Escriba un predicado **replace(X, Y, L1, L2)** que sea verdadero si todas las ocurrencias de **X** en **L1** han sido reemplazadas por **Y** en **L2**. 

7. Podemos describir un grafo dirigido a través de las aristas entre sus vértices. Tomemos el siguiente grafo:
```
edge(a, b).
edge(b, c).
edge(b, d).
edge(b, e).
edge(d, f).
edge(e, f).
```
Diseñe un predicado **reachable(X, Y)** que determine si un nodo **Y** es alcanzable desde un nodo **X**. 

8. ¿Qué sucede con su predicado si agregamos la arista **edge(b, a)** inmediatamente después de **edge(a, b)**? ¿Continúa funcionando? Si la respuesta es negativa, sugiera alguna razón por la cual esto sucede. ¿Cómo se podría resolver?

9. Definimos un árbol binario según las siguientes reglas:
* El árbol binario vacío **nil** es un árbol binario. 
* La estructura **bintree(Elem, Tree1, Tree2)** donde **Elem** es un elemento y **Tree1** y **Tree2** son árboles binarios. 
Escriba un predicado **istree(T)** que sea verdadero si **T** es un árbol binario construido conforme a las reglas arriba. 

10. Escriba un predicado **searchtree(X, T)** que efectúe una búsqueda recursiva de un número **X** en un árbol binario **T**. El predicado debe ser verdadero si **X** está en **T**.