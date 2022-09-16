# Project Frequencies

## Create a Char Frequency App

#### You should use the `Trie` implemented in the previous TP

### 1. Create a Function that given any List `[a]` returns a `Map a Int`.

The `Int` is the count of the number of instances of `a` in the List

```haskell
> frequencyMap [1, 2, 3, 1, 3, 1]
fromList [(1,3),(2,1),(3,2)]
```

### 2. Adapt the `insert` and `insertionSort` from TP1 to work with any `Ord` type

```haskell
> insertionSort "PAPAYA"
"AAAPPY"
> insert 'T' $ insertionSort "PAPAYA"
"AAAPPTY"
```

### 3. Create a function that returns a List of Frequencies ordered by number of occurrences

The `Frequency` type, is defined by:

```haskell
type Frequency = (Int, Char)
```

You should use the `frequencyMap` and `insertionSort` functions

You can also use the `swap` function from `Data.Tuple`

Examples:

```haskell
> frequencies "PAPAYA"
[(1,'Y'),(2,'P'),(3,'A')]
> frequencies "Zapallo con Papa"
[(1,'P'),(1,'Z'),(1,'c'),(1,'n'),(2,' '),(2,'l'),(2,'o'),(2,'p'),(4,'a')]
```

### 4.Create a `main` function that:
* Takes as an argument a file name (Use `getArgs`)
* If the file name is not specified prints an error message
* Reads the file (Using `readFile`).
* Counts the frequencies of the letters in the file
* Prints the table of frequencies in **REVERSE** order (Starting from the higher ones).

```shell
> freq example.txt | head
' ': 292
'e': 148
'o': 124
't': 98
'h': 96
'n': 95
'a': 93
's': 92
'r': 68
'i': 65
```