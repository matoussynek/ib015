f :: [Integer] -> Integer
f []        = 0
f (42 : xs) = f xs
f (x  : xs) = x + f xs
