data BonPari = BonPari Int deriving Show

applyOnBonPari :: (Int -> Int) -> BonPari -> BonPari
applyOnBonPari f (BonPari val) = BonPari (f val)


convertToInt :: String -> Int
convertToInt s = read s -- also read s :: Int

compareInputs :: IO ()
compareInputs = do
    putStrLn "fst input"
    x <- getLine
    putStrLn "snd input"
    y <- getLine
    putStrLn (if length x > length y then x else y)
    
getInt :: IO Int
getInt = do
    x <- getLine
    pure (read x)

main :: IO ()
main = do
    putStrLn "Enter fst number:"
    a <- getInt
    putStrLn "Enter snd number:"
    b <- getInt
    putStrLn "Enter trd number:"
    c <- getInt
    putStrLn (if (a < b +c && b < a +c && c < a + b) then "ano" else "ne")

    
main' = do
      getLine >>= (\f -> getLine >>= (\s -> appendFile f (s ++ "\n")))
