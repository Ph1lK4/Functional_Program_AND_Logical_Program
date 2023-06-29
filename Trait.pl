list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

list_insert(X,L,R) :- list_delete(X,R,L).

prime(A) :-
    A > 1,
    Y is A//2,
    findall(X, (between(2, Y, X), A mod X =:= 0), []).

possible(X,Y,Z) :-
    between(0, 360, X),
    between(0, 360, Y),
    between(0, 360, Z).

non_prime(A) :-
    A>1,
	Y is A//2,
    findall(X, (between(2, Y, X), A mod X =:= 0), P).

evaluate(A,L) :-
    A >1,
    X is A//100,
    Y is (A//10),
    J is Y mod 10,
    Z is A mod 10,
	append([X],[],L1),
    append([J],L1,L2),
    append([Z],L2,L).

acceptable(X,Y,Z) :-
    non_prime(X),
    non_prime(Y),
    non_prime(Z),
    evaluate(X,L1),
    evaluate(Y,L2),
    evaluate(Z,L3),
    flatten([L1, L2, L3], NewList),
    subtract(NewList,[1,2,3,4,5,6,7,8,9],[]),
    Z< 360,
    X< 360,
    Y< 360.

trait(X,Y,Z) :-
    acceptable(X,Y,Z),
    possible(X,Y,Z).