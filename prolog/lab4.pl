
digits(X,R) :- digitsAcc(X,0,R).

digitsAcc([], Acc, R) :- R = Acc.
digitsAcc([X|XS], Acc, R) :- Temp is Acc*10+X, digitsAcc(XS,Temp,R).


inNeither(X, XS, YS) :- \+ member(X,XS), \+ member(X,YS).

inExactlyOne(X, XS, YS) :- member(X,YS), \+ member(X,XS).
inExactlyOne(X, XS, YS) :- member(X,XS), \+ member(X,YS).
