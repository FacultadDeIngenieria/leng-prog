import System.IO( isEOF )

main = num 1
num n =
    do
       eof <- isEOF
       if eof then return ()
       else do 
                line <- getLine
                putStrLn $ show n ++ ": " ++ line
                num (n + 1)
