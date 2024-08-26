main :: IO ()
main = do
         putStrLn "Enter your name: "
         name <- readReversed
         putStrLn ("Hello " ++ name)

readReversed::IO String
readReversed = do
                 name <- getLine
                 return (reverse name)
