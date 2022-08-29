module Main(main) where

import Frequencies
import System.Environment

main :: IO ()
main = do
   args <- getArgs
   if null args then do
       putStrLn "Please specify the filename"
       return ()
   else 
       freq (head args)
       
freq :: FilePath -> IO ()
freq fileName = do
   content <- readFile fileName
   printLines $ reverse $ frequencies content

printLines::[Frequency] -> IO ()
printLines [] = return ()
printLines ((n,c):xs) = do
                         putStrLn $ show c ++ ": "++ show n
                         printLines xs       