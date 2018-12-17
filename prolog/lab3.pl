sorted([]).
sorted([_]).
sorted([X,Y|XS]) :- Y>X, sorted([Y|XS]).

max(X,Y,Z) :- X>=Y, !, Z = X.
max(X,Y,Y).


remove(X,[Y|YS],R) :- X \== Y, T = [Y|R], remove(X,YS,T).
remove(X,[Y|YS],R) :-remove(X,YS,R).
