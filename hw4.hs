-- Kostra 4. domaci ulohy IB015
-- Po vyreseni cely obsah souboru vlozte do odpovedniku.

-- Nejprve zadefinujte typovy alias Bitvec 
-- (az po jeho definici bude mozne projekt zkompilovat)
type Bitvec = [Bool]

-- Nasledujici funkce mate za ukol implementovat.
toBitvec :: String -> Bitvec
toBitvec [] = []
toBitvec (x:xs) = if x == '1' then True : toBitvec xs else False : toBitvec xs

fromBitvec :: Bitvec -> String
fromBitvec [] = []
fromBitvec (x:xs) = if x == True then '1' : fromBitvec xs else '0' : fromBitvec xs

bvnot :: Bitvec -> Bitvec
bvnot [] = []
bvnot (x:xs) = (not x) : bvnot xs

bvand :: Bitvec -> Bitvec -> Bitvec
bvand [] [] = []
bvand x y =  ((head (head (checkAndExtend x y))) && (head (last (checkAndExtend x y)))) : (bvand (tail (head (checkAndExtend x y))) (tail (last (checkAndExtend x y))))


bvor :: Bitvec -> Bitvec -> Bitvec
bvor [] [] = []
bvor x y =  ((head (head (checkAndExtend x y))) || (head (last (checkAndExtend x y)))) : (bvor (tail (head (checkAndExtend x y))) (tail (last (checkAndExtend x y))))


bvxor :: Bitvec -> Bitvec -> Bitvec
bvxor [] [] = []
bvxor x y =  (xor (head (head (checkAndExtend x y))) (head (last (checkAndExtend x y)))) : (bvxor (tail (head (checkAndExtend x y))) (tail (last (checkAndExtend x y))))


resize :: Int -> Bitvec -> Bitvec
resize 0 x = x
resize n x = if n <= bvlen x then if n < bvlen x then tail (resize (n+1) x) else x else False : resize (n-1) x

zero :: Int -> Bitvec
zero 0 = []
zero x = False : zero (x-1)

rotRight :: Int -> Bitvec -> Bitvec
rotRight 0 x = x
rotRight n x = rotRight (n-1) (last x : init x)

rotLeft :: Int -> Bitvec -> Bitvec
rotLeft 0 x = x
rotLeft n x = rotLeft (n-1) (reverse((head x) : reverse (tail x)))

shiftRight :: Int -> Bitvec -> Bitvec
shiftRight 0 x = x
shiftRight n x = reverse (resize (bvlen x) (reverse (resize (n + bvlen x) x)))


shiftLeft :: Int -> Bitvec -> Bitvec
shiftLeft 0 x = x
shiftLeft n x = (resize (bvlen x) . reverse . resize (bvlen x + n) . reverse) x

add :: Bitvec -> Bitvec -> Bitvec
add = undefined 

bvlen :: Bitvec -> Int
bvlen [] = 0
bvlen (x:xs) = 1 + bvlen xs

checkAndExtend :: Bitvec -> Bitvec -> [Bitvec]
checkAndExtend x y = if bvlen x > bvlen y then x : (resize (bvlen x) y) : [] else (if bvlen x == bvlen y then x : y : [] else (resize (bvlen y) x) : y : [])

xor :: Bool -> Bool -> Bool
xor x y | x == True && y == False = True
        | x == False && y == True = True
        | otherwise = False
