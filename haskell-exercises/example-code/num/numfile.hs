import System.Environment

main = do
   args <- getArgs
   if length args == 0 then return ()
   else numFile (head args)

numFile fileName = do
   content <- readFile fileName
   printLines 1 (lines content)

printLines::Int -> [String] -> IO ()
printLines n [] = return ()
printLines n (x:xs) = do
                         putStrLn $ (show n) ++ ": "++ x
                         printLines (n+1) xs
