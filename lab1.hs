circleArea r = pi * r ^ 2 
isSucc x y = x < y
max3 x y z = max x (max y z)
mid x y z = max3 (min x y) (min x z) (min z y)

tell x = (if x == 1 then "one" else (if x == 2 then "two" else (if (even x) then "(even)" else "(odd)" ))) 

isWeekend "so" = True
isWeekend "ne" = True
isWeekend x = False

fact 1 = 1
fact n = n * (fact n-1)

mod3 x = if (x<3) then x else (mod3 (x-3))

power z n = if (n <= 1) then (if n<0 then 0 else z)  else (z * (power z (n-1)))


isPowTwo 1 = True
isPowTwo n = if odd n then False else isPowTwo (div n 2)
