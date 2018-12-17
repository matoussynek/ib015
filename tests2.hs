
data BinTree a = Empty
               | Node a (BinTree a) (BinTree a)
               deriving Show

data NTree a = NNode a [NTree a] deriving (Show, Eq)

ntreeFold :: (a -> [b] -> b) -> NTree a -> b
ntreeFold f (NNode v ts) = f v (map (ntreeFold f) ts)

--g :: (a -> a) -> b -> b
g f (NNode val xs) = if f val < val then NNode (f val) xs else NNode val xs

maybeApply :: Ord a => (a -> a) -> NTree a -> NTree a
maybeApply f t = ntreeFold (g f) t
