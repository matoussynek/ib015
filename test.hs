fand True True = True
fand _ _ = False

fimp True False = False
fimp _ _ = True

evalF a b c d = fand d (fimp b (fand c a))

toBin 0 = "0"
toBin 1 = "1"
toBin n =  if mod n 2 == 0 then (toBin (div n 2) ++ "0") else (toBin (div n 2) ++ "1")


foo x y =  if x<=y then (x*x*(foo (x+1) y)) else 1


binMul :: [Integer] -> [Integer]
binMul [] = []
binMul [x] = []
binMul (x:y:zs) = (x*y) : binMul(y:zs)


maxIndices :: Ord a => [a] -> [Integer]
maxIndices [] = []
maxIndices x = helper x x 0

helper :: (Ord a) => [a] -> [a] -> Integer -> [Integer]
helper _ [] _ = []
helper a (x:xs) y = if x == maximum a then (helper a xs (y+1)) ++ [y] else helper a xs (y+1) 




rleDecode :: [(Int, Char)] -> String
rleDecode [] = ""
rleDecode (x:xs) = (write (fst x) (snd x))  ++ rleDecode xs

write :: Int -> Char -> String
write 0 _ = ""
write x y = [y] ++ (write (x-1) y)


allContain :: Eq a => a -> [[a]] -> Bool
allContain _ [] = True
allContain _ [[]] = False
allContain n (x:xs) = all id (allContain n xs : any (n==) x : [])


increasingSubseq :: Ord a => [a] -> [a]
increasingSubseq [] = []
increasingSubseq [x] = [x]
increasingSubseq (x:xs) = x : increasingSubseq (filter (>x) xs)


raiseWith :: Ord a => (a -> a) -> [a] -> [a]
--raiseWith f [] = []
raiseWith f x = map (\y -> if (f y) > y then f y else y) x
