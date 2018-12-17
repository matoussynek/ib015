idFold :: [a] -> [a]
idFold x = foldr (:) [] x

evenFold :: [Int] -> Int
evenFold x = foldl (\x v -> if even x then x * v else v) 1 x  


data NTree a = NNode a [NTree a]
           deriving (Show)

nTreeSize :: NTree a -> Integer
nTreeSize (NNode v children) = 1 + sum(map nTreeSize children)

nTreeSum :: Num a => NTree a -> a
nTreeSum (NNode v children) = v + sum(map nTreeSum children)

nTreeMap :: (a -> b) -> NTree a -> NTree b
nTreeMap f (NNode v children) = NNode (f v) (map (nTreeMap f) children)

data BinTree a = Empty
               | Node a (BinTree a) (BinTree a)
               deriving Show

treeFold :: (a -> b -> b -> b) -> b -> BinTree a -> b
treeFold f e Empty = e
treeFold f e (Node v l r) = f v (treeFold f e l) (treeFold f e r)

treeSum :: Num a => BinTree a -> a
treeSum t = treeFold (\val resL resR -> val+resL+resR) 0 t

treeProduct :: Num a => BinTree a -> a
treeProduct t = treeFold (\val resL resR -> val*resL*resR) 1 t

treeOr :: BinTree Bool -> Bool
treeOr t = treeFold (\val resL resR -> val || resL || resR) False t

treeSize :: BinTree a -> Int
treeSize t = treeFold (\_ l r -> 1+l+r) 0 t

treeHeight :: BinTree a -> Int
treeHeight t = treeFold (\_ l r -> 1+ max l r) 0 t

treeList :: BinTree a -> [a]
treeList t = treeFold (\val l r -> l ++ val : r) [] t 

treeConcat :: BinTree [a] -> [a]
treeConcat t = treeFold (\val l r -> l ++ val ++ r) [] t 

treeMax :: (Ord a, Bounded a) => BinTree a -> a
treeMax t = treeFold (\val l r -> max val (max l r)) minBound t

