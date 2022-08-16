#  Binary Trie

## Instructions

You have to implement a Binary `Trie`

```haskell
data Trie a = ........ -- complete it
```
## 1. Implement a method to build a simple trie from 2 elements:

```haskell
> t = (Leaf 'A' :-: Leaf 'B') :-: Leaf 'C'
> t
(Leaf 'A' :-: Leaf 'B') :-: Leaf 'C'
````

## 2. Implement the `left` and `right` methods

They should return the left or right trie respectively.

For example:

```haskell
> left t
Leaf 'A' :-: Leaf 'B'
> right $ left t
Leaf 'B'
> left $ right $ left t
*** Exception: Left of: Leaf 'B'
```

## 3. Using the `Bit` type (As way defined in a previous exercise)

```haskell
data Bit = T | F

type Bits = [Bit]
```

Implement a function that search the `Trie` based on a List of Bits (`Bits`) and return the value found.
(`F` moves left and `T` )

```haskell
> find [F, T] t
'B'
> find [T] t
'C'
```


Implement a function `decode`, that given `Bits` and a Trie, generate an `String`.
Consuming the List of Bits until its empty

```haskell
> decode [F, T, F, F, F, T, F, F] t
"BABA"
> decode [T, F, F, F, T, F, F] t
"CABA"
```

## 4. Given a Trie return a List of Tuples with the mapping of the value to `Bits`

```haskell
> toList t
[('A', [F, F]), ('B', [F, T]), ('C', [T])]
```
