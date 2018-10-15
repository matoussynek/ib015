
justDivisibleBy3 :: Integral a => [a] -> [a]
justDivisibleBy3 xs = filter ((==0) . (`mod` 3)) xs

addOneOrNothing :: Integral a => [a] -> [a]
addOneOrNothing xs = map (\x -> if (even x) then (+1) x  else x) xs

sumOfLists :: (Num a, Ord a) => [[a]] -> [a]
sumOfLists xss = map sum (filter (\xs -> all (>5) xs) xss)
