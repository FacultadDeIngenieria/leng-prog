quadratic:: Float -> Float -> Float -> (Float, Float)
quadratic a b c
    | a == c && b == 0 = error "Invalid a == 0, b == 0"
    | r < 0            = error "Imaginary root"
    | a == 0           = (cb, cb)
    | otherwise        = (t1 + t2, t1 - t2)
    where
        r = b**2 - 4 * a * c
        t1 = -b / (2 * a)
        t2 = sqrt r / (2*a)
        cb = (-c) / b
