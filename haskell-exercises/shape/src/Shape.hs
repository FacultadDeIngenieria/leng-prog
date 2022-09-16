module Shape where

data Point = Point { x::Double, y:: Double} deriving (Eq, Show)

data Circle    = Circle    Point Double deriving (Eq, Show)
data Rectangle = Rectangle Point Point deriving (Eq, Show)


-- A point from a tuple Pair
point::(Double, Double) -> Point
point = error "Implement it"

-- The origin
origin::Point
origin = error "Implement it"

-- Rectangle from a Tuple where (x0 y0) == origin
rectangle::(Double, Double) -> Rectangle
rectangle = error "Implement it" 

base::Rectangle -> Double
base = error "Implement it"

height::Rectangle -> Double
height = error "Implement it"

-- Circle from radius
circle::Double -> Circle
circle = error "Implement it" 

-- Clase Shift

class Shift a where
   shift::a -> (Double, Double) -> a
   
instance Shift Point where
   shift  = error "Implement it"
   
instance Shift Rectangle where
   shift  = error "Implement it"
   
instance Shift Circle where
   shift  = error "Implement it"
   
-- Define the Surface class
   
