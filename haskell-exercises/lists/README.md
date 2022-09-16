# List Exercises

## Instructions

You have to implement exercises working over lists

## 1. List as Sets

Suppose that lists describe a Set of elements.

The `member` and `union` functions are defined as examples.
You need to define the `intersection` and `difference` operations

```haskell
> intersection [1..5] [7, 3, 1]
[1, 3]
> difference [1..5] [7, 3, 1]
[2,4,5]
> difference [7, 3, 1] [1..5]
[7]
```
## 2. Insertion Sort

Implement an operation to insert an element in the right position on an ordered list.

You should keep **duplicated** elements.

```haskell
> insert 4 [1,2,5,7]
[1,2,4,5,7]
> insert 2 [1,2,5,7]
[1, 2, 2, 5, 7]
````

Based on the above implement an insertion sort.

```Haskell
> insertionSort [6, 3, 5]
[3,5,6]
```

Reimplement it using a `foldr`

### 3. Numeral Systems

First define a function that gets a list of Binary digits.

And gets the value of it as an Integer

Remember that if the number is:

x<sub>n</sub> ... x<sub>1</sub> x<sub>0</sub> 

x<sub>0</sub> 2 <sup>0</sup> + x<sub>1</sub> 2 <sup>1</sup> + ... + x<sub>n</sub> 2 <sup>n</sup>


```haskell
> binaryToDecimal [1, 1, 0, 1]
13
```

Hint: Use an auxiliary function that receives the list in reverse order.  


Create an adicional function that receives the base as an argument:

```haskell
> toDecimal 8 [7, 3]
59
> toDecimal 16 [1, 1]
17
```

Create a function that instead of receiving a `list` receives a string

```haskell
> toDec 8 "73"
59
> toDec 16 "1F"
31
```

Hint use `map` and the function `digitToInt` from `Data.Char`


Repeat the last exercise using a List Comprehension and the `zip` function

```haskell
> decimal 8 "73"
59
> decimal 16 "1F"
31
```

## 4. Firsts Elements of a list

Given a List, return a **Nested List** containing:

The first element, the first 2 elements, the first 3 elements, etc.

```haskell
> firsts [1, 3, 5]
[[1],[1,3],[1,3,5]]
> firsts "Hello"
["H","He","Hel","Hell","Hello"]
```


## 5. Binary Operations -- BONUS exercise

Given two `Strings` that represents numbers in binary.
Implement the 'binaryAdd' function.

**DO NOT USE** any predefined arithmetic operation

```haskell
> binaryAdd "10" "1"
"3"
> binaryAdd "1111" "11"
"10010"
```
