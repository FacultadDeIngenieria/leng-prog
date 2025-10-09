# Guía 8 – Introducción a Haskell

#### Lenguajes de Programación – 2C 2025

### Conjuntos como listas. En los ejercicios 1-4 representaremos conjuntos como listas. 

1. Escriba un programa Haskell que, dados dos conjuntos, nos devuelva su unión. 

2. Escriba un programa Haskell que, dados dos conjuntos, nos devuelva su intersección. 

3. Escriba un programa Haskell que, dados dos conjuntos, nos devuelva su diferencia. Recuerde que $`A-B =\{x : x\in A\text{ y }x\not\in B\}`$. 

4. Escriba un programa Haskell que, dados dos conjuntos, nos devuelva su diferencia simétrica. Recuerde que la diferencia simétrica entre dos conjuntos $`A`$y $`B`$ es 
$`(A-B)\cup(B-A)`$.

### Otros ejercicios sobre listas. 

5. Tenemos un número octal (en base 8) expresado como una lista donde los exponentes de los dígitos van en sentido ascendente: primero aparecen los dígitos menos significativos. En otras palabras, el número $`127_{8}`$ se expresa como $`[7, 2, 1]`$. Escriba un programa Haskell para obtener el número decimal equivalente (en este caso, sería $`7\cdot8^{0}+2\cdot8^{1}+1\cdot8^{2}=7+8+64=79`$).

6. Generalice el programa del ejercicio anterior para obtener el valor decimal de un número expresado en cualquier base entre 1 y 10. El número se expresa en una lista como en el ejercicio 5. 

7. Escriba un programa que encuentre el valor decimal de un número hexadecimal. El número se expresa en una lista como en el ejercicio 5. 

8. Escriba un programa Haskell para calcular el máximo común divisor de dos números positivos usando el algoritmo de Euclides. 

9. Escriba un programa Haskell que inserte un número en una lista ordenada, de manera que la lista continúe ordenada. Por ejemplo, si se inserta 3 en la lista 
$`[1, 2, 5, 7]`$, debe resultar la lista $`[1, 2, 3, 5, 7]`$. 

10. Escriba un programa Haskell que ordene una lista con el algoritmo de ordenamiento por inserción. Puede usar la función del ejercicio anterior. 

11. Escriba un programa Haskell que combine dos listas ordenadas en una única lista ordenada. Lo que se llama popularmente *merge*.

12. Calcule el valor de la función de Fibonacci de un número $`n`$ como una lista $`[0, 1, 1, 2, 3,\ldots, f(n)]`$ donde $`f(n)`$ es el número buscado. 

