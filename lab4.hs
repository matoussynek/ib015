longStringInitials :: [String] -> [Char]
longStringInitials x = map head (filter (\y -> (length y) >= 5) x)


connectEven :: Integral b => [a] -> [b] -> [(a,b)]
connectEven x y = filter (even . snd) (zip x y)

nextEq :: Eq a => [a] -> Bool
nextEq x = or (zipWith (==) x (tail x))

naturals :: Integer -> [Integer]
naturals x = x : naturals (x+1)
 
nat :: [Integer]
nat = [0..]

fstOdd2s xs = [(x,y) | x <- xs , y <- xs , odd x]
