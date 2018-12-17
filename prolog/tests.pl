male(tywin).
male(tommen).
male(joffrey).
male(jaime).

female(myrcella).
female(cersei).
female(joanna).

parent(cersei, tommen).
parent(cersei, myrcella).
parent(cersei, joffrey).
parent(jaime, myrcella).
parent(jaime, joffrey).
parent(jaime, tommen).
parent(joanna, cersei).
parent(joanna, tyrion).
parent(joanna, jaime).
parent(tywin, jaime).
parent(tywin, cersei).
parent(tywin, tyrion).

maleGrandchild(X, Z) :- parent(X, Y), parent(Y, Z), male(Z).

f(21).
f(42).
f(84).

g(X, Y) :- f(Y), X =< Y, !, X =\= Y.
g(42, 42).

snft([], 0).
snft([42|XS], R) :- !, snft(XS, R).
snft([X|XS], R) :- snft(XS, ROld), R is ROld + X.

