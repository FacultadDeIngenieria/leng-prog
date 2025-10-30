## Binary Search Tree

Se debe implementar el tipo `BT` (Binary Tree).

Por ejemplo:

          4
        /   \
       /     \
      2       6
     / \     / \
    1   3   5   7

```haskell
data BT a = Nil 
          | BT a (BT a) (BT a)
          deriving (Show, Eq)
```
---
## Definir los métodos:

* `left :: BT -> Maybe BT`
* `right :: BT -> Maybe BT`
* `singleton :: a -> BT a`
* `insert :: a -> BT a -> BT a`
* `fromList :: [a] -> BT a`
* `toList :: BT a -> [a]`

---

## Examples:

```haskell
> insert 2 (singleton 4)
`BT 4 (BT 2 Nil Nil) Nil`
```
      4
     /
    2
```haskell
> insert 6 (insert 2 (singleton 4))
`BT 4 (BT 2 Nil Nil) (BT 6 Nil Nil)`
```
      4
     / \
    2   6

---

## Examples:
```haskell
> fromList [2, 4, 6]
BT 2 Nil (BT 4 Nil (BT 6 Nil Nil))

> toList $ BT 2 Nil (BT 4 Nil (BT 6 Nil Nil))
[2,4,6]

> toList $ fromList [4, 2, 1]
[1,2,4]
```

