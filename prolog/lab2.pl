firstnums(0,X) :- X=0.
firstnums(Num,Res) :- Temp is Num -1, firstnums(Temp,R), Res is R + Num.

powOfTwo(1).
powOfTwo(X) :- 0 =:= mod(X,2), X1 is div(X,2), powOfTwo(X1).

fact(1,Res) :- Res = 1. % == fact(1,1).
fact(X,Res) :- X > 0, Temp is X -1, fact(Temp,R), Res is R * X.

split([X|XS],X,XS).

head(X, Res) :- split(X, Res, _).
tail(X, Res) :- split(X, _, Res).

last([X], X).
last([X|XS],Res) :- last(XS,Res).

init([X],[]).
init([X|XS], Res) :- init(XS,Y), Res = [X|Y].

nth(0,[X|XS],X).
nth(N,[X|XS],Res) :- Temp is N-1, nth(Temp, XS, Y), Res = Y.
