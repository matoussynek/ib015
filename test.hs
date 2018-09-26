fand True True = True
fand _ _ = False

fimp True False = False
fimp _ _ = True

evalF a b c d = fand d (fimp b (fand c a))

toBin 0 = "0"
toBin 1 = "1"
toBin n =  if mod n 2 == 0 then (toBin (div n 2) ++ "0") else (toBin (div n 2) ++ "1")


foo x y =  if x<=y then (x*x*(foo (x+1) y)) else 1

