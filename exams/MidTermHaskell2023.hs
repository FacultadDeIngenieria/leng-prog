module MidTermHaskell2023 where

-- Ejercicio 1 --

addZeros :: Int -> String -> String
addZeros n s = s ++ replicate n '0'

binaryMultiply :: Char -> String -> String
binaryMultiply '0' _ = replicate (length s) '0' -- Si el dígito es 0, el producto es 0
binaryMultiply '1' s = s -- Si el dígito es 1, el producto es igual al número

binaryProduct :: String -> String -> String
binaryProduct x y = foldr (\(i, d) acc -> binaryAdd (addZeros i (binaryMultiply d x)) acc) "0" (zip [0..] (reverse y))

-- Ejercicio 2 --

data BQueue a = BQueue { front :: [a], back :: [a] }

empty :: BQueue a
empty = BQueue { front = [], back = [] }

enqueue :: a -> BQueue a -> BQueue a
enqueue x (BQueue f b) = BQueue f (x : b)

dequeue :: BQueue a -> (a, BQueue a)
dequeue (BQueue [] []) = error "La cola está vacía"  -- Caso 1: Ambas listas están vacías
dequeue (BQueue (x : xs) b) = (x, BQueue xs b)       -- Caso 2: Front tiene elementos
dequeue (BQueue [] b) = dequeue (BQueue (reverse b) [])  -- Caso 3: Front está vacío pero back tiene elementos

fromList :: [a] -> BQueue a
fromList xs = BQueue xs []

-- Ejercicio 3 --

class Queue q where
    empty :: q a
    enqueue :: a -> q a -> q a
    dequeue :: q a -> (a, q a)
    fromList :: [a] -> q a

instance Queue BQueue where
    empty = BQueue { front = [], back = [] }

    enqueue x (BQueue f b) = BQueue f (x : b)

    dequeue (BQueue [] []) = error "La cola está vacía"
    dequeue (BQueue (x : xs) b) = (x, BQueue xs b)
    dequeue (BQueue [] b) = dequeue (BQueue (reverse b) [])

    fromList xs = BQueue xs []


-- Ejercicio 4 --

instance (Show a) => Show (BQueue a) where
    show (BQueue f b) = show (f ++ reverse b)
