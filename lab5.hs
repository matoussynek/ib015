import Data.Maybe

intersection :: [(Float,Float,Float)] -> [((Float,Float,Float),(Float,Float,Float))]
intersection xs = [(a,b) | a <- xs, b <- xs, a/=b,(\(a1,a2,a3) (b1,b2,b3) -> (a3 + b3)^2 >= sqrt ((a1 - b1)^2 + (a2 - b2)^2)) a b]


data Day = Mon | Tue | Wen | Thu | Fri | Sat | Sun deriving (Show, Eq, Ord)

isWeekend :: Day -> Bool
isWeekend x | x == Sun || x == Sat = True
	    | otherwise = False

data Shape = Circle Double
           | Rectangle Double Double
           | Point 
           deriving (Show, Eq)

area :: Shape -> Double
area (Circle r) = pi * r^2
area (Rectangle a b) = a*b
area (Point) = 0

divlist :: Integral a => [a] -> [a] -> [Maybe a]
divlist [] [] = []
divlist (x:xs) (y:ys) = if y == 0 then  Nothing : divlist xs ys else (Just (div x y)) : divlist xs ys

data Expr = Con Float
          | Add Expr Expr | Sub Expr Expr
          | Mul Expr Expr | Div Expr Expr

eval :: Expr -> Float
eval (Con a) = a
eval (Add a b) = eval a + eval b
eval (Sub a b) = eval a - eval b
eval (Mul a b) = eval a * eval b
eval (Div a b) = eval a / eval b

data BinTree a = Empty
               | Node a (BinTree a) (BinTree a)

treeSize :: BinTree s -> Integer
treeSize Empty = 0
treeSize (Node a l r) = 1 + treeSize l + treeSize r

listTree :: BinTree a -> [a]
listTree Empty = []
listTree (Node a l r) = a : listTree l : listTree r

height :: BinTree a -> Int
heigth Empty = 0
heigth (Node a l r) = max (1 + heigth l) (1 + heigth r)

