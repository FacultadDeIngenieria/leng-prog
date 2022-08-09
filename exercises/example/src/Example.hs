module Example (hello, obliqueShot, help) where

-- Greets you.
-- Provide your name
hello:: String -> String
hello name = "Hello: " ++ name ++ "!"

-- Calculate the range (max x) and height (max y) of an oblique shot
-- Provide the angle (in degrees) and initial velocity

obliqueShot::Double -> Double -> (Double, Double)
obliqueShot angle velocity = (range, height)
    where
        radians = angle * pi / 180
        vx = velocity * cos radians
        vy = velocity * sin radians
        g = 9.807
        t = 2 * vy / g
        range = vx * t
        height = vy ^ 2 / (2*g)

help :: IO ()
help = putStrLn $ "Usage:\n" 
               ++ "    hello <your name>\n"
               ++ "    obliqueShot <angle in degrees> <velocity in m/s>\n"
