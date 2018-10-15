import Data.Char

myHead :: [a] -> a
myHead (x:xs) = x

myTail :: [a] -> [a]
myTail (x:xs) =  xs

myLast :: [a] -> a
myLast [x] = x
myLast (x:xs) = myLast xs

oddLength :: [a] -> Bool
oddLength [] = False
oddLength (_:xs) = not (oddLength xs)

listSum :: [Integer] -> Integer
listSum [] = 0
listSum (x:xs) = x + listSum xs 

deleteElem ::Eq a => [a] -> a -> [a]
deleteElem [] n = []
deleteElem (x:xs) n = if x==n then deleteElem xs n else x:(deleteElem xs n)


listEqual :: Eq a => [a] -> [a] -> Bool
listEqual [] [] = True
listEqual (_:_) [] = False
listEqual [] (_:_) = False
listEqual (x:xs) (y:ys) = if x ==y then listEqual xs ys else False

evens :: [Integer] -> [Integer]
evens x = filter even x

toUpperStr ::[Char] -> [Char]
toUpperStr x = map toUpper x
