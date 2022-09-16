# Project Huffman

## Build an App to compress/decompress using the Huffman method

You can use the functions defined in the previous TPs

### 1. Create the Huffman Trie for a given `String`

Huffman coding uses a specific method for choosing the representation for each symbol.
Resulting in a prefix code:

That is, the bit string representing some particular symbol is never a prefix of the bit string representing any other symbol.

A Binary `Trie` provides a representation of this code:

* Each `Leaf` corresponds to a symbol to be coded. (A `Char` in our case)
* The Path to the leaf corresponds to the code to be assigned to that symbol

The function Should have the following type:

```haskell
huffmanTrie::String -> Trie Char
```
How to build the `Trie` ?

You are going to work with a List of Pairs representing the frequency and a partial Trie:

```haskell
[(Int, Trie Char)]
```

1. Start with the `frequencyMap` and create an ordered list in the form: `[(Int, Leaf Char)]`
2. Remove the first 2 elements and join them in a new Pair: (n+m, a :-: b)
3. Insert this new pair in the list, keeping the order
4. When the list has only one element you are done.

### 2. Encode/Decode a String to/from a List of Bits

```encode :: String -> Trie Char -> Bits```

```decode::Bits -> Trie Char -> String```

### 3. Create an app (function `main`) to run it from the command line

You should accept the file as the first argument, and print the % of compression

### 4. (Optional) Add a step to the encode/decode process to convert the output to/from an String

On the main app write the result to a File