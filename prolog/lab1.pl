woman(pavla).
woman(vlasta).
woman(jarmila).
woman(zuzana).
woman(tereza).

man(radek).
man(jirka).
man(michal).
man(filip).
man(martin).
man(petr).
man(adam).
man(vaclav).

parent(radek, michal).
parent(radek, filip).
parent(pavla, michal).
parent(pavla, filip).
parent(pavla, martin).
parent(jirka, martin).
parent(jarmila, petr).
parent(michal, petr).
parent(filip, adam).
parent(vlasta, adam).
parent(adam, tereza).
parent(adam, vaclav).
parent(zuzana, tereza).
parent(zuzana, vaclav).

father(Father, Child) :- parent(Father, Child), man(Father).

child(Parent,Child) :- parent(Parent, Child).

brother(X,Y) :- parent(Z,X), parent(Z,Y), man(X), X \= Y.

stepbrother(X,Y) :- parent(Z,X), parent(A,Y), A \= Z, brother(X,Y).

grandmother(X,Y) :- parent(X,Z), parent(Z,Y), woman(X).

descendent(X,Y) :- parent(Y,X).
descendent(X,Y) :- parent(Y,Z), descendent(X,Z). 

hasDaughter(X) :- parent(X,Y), woman(Y).

parentOfTwo(Parent) :- parent(Parent,X), parent(Parent,Y), X\=Y.

human(X) :- man(X).
human(X) :- woman(X).

animal(X) :- \+ human(X).

