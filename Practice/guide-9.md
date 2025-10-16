# Guía 9 – Haskell, parte 2.  

#### Lenguajes de Programación – 2C 2025. 

##### Primera parte. Miscelánea. #####

1. Escriba un programa que enumere todas las ternas $`[p,q,r]`$ tales que $`p,q,r\leq10`$.

2. Supongamos ahora que cada terna representan los lados de un triángulo. Dentro de la colección de ternas que hemos encontrado en el ejercicio anterior, queremos ahora dejar sólo las que representan triángulos rectángulos. Recuerde que, si llamamos $`c`$ a la hipotenusa y $`a`$ y $`b`$ a los catetos, debe cumplirse el teorema de Pitágoras: 

$\sqrt{p^{2}+q^{2}}=r$

3. Finalmente, queremos que una terna que represente un triángulo rectángulo tal que su perímetro sea 24. 

4. El código de César. Rote una lista $`n`$ lugares hacia la izquierda. Por ejemplo, la entrada "abcdefghijklmnop" con el parámetro 3 debería dar como resultado "defghijklmnopabc".

5. Explique por qué las siguientes fragmentos de código son equivalentes: 
```
max 4 5
```
```
(max 4) 5
```

##### Segunda parte. Funciones de orden superior. #####

6. Explique a qué llamamos "funciones de orden superior."

7. ¿Verdadero o falso? "Una función que toma $`n`$ parámetros ($`n > 1`$) en realidad está tomando un parámetro y devolviendo una función de $`n-1`$ parámetros."

8. Implemente una función "myMap" que funcione exactamente como "map". Está prohibido usar "map" en esta implementación. 

9. La secuencia de Collatz. La *secuencia de Collatz# se define como sigue: 

- collatz 1 = [1]
- collatz $`n`$ = $`n`$ : collatz $`(n/2)`$ si $`n`$ es par
- collatz $`n`$ = $`n`$ : collatz $`(3\cdot n+1)`$ si $`n`$ es impar

Queremos una lista de los números del 1 al 100 que tienen una secuencia de Collatz más larga que 10. 

**Nota**: Lo curioso de esta secuencia es que no se sabe si siempre termina o si existe algún número que genere una secuencia infinita. Pero no entren en pánico: si existe ese número, no está entre 1 y 100. 

10. Explique por qué las siguientes expresiones son equivalentes. ¿Cuál preferiría y por qué?
```
map (+1) [7, 3, 5, 1]
```
```
map (\x -> x + 1) [7, 3, 5, 1]
```

11. ¿Es posible definir la función *elem* utilizando *fold*? 

12. Tenemos la siguiente función: 

```
suma :: (Num a) => [a] -> a
suma = foldl (+) 0
```

¿Es posible redefinir esta función utilizando *foldl1*?