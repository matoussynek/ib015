import System.Directory

main :: IO ()
main = getLine >>= fu

fu :: FilePath -> IO ()
fu path = doesFileExist path >>= \s -> putStrLn (if s then "Exists" else "Does not exist")
