list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

possibleCheck([],[]).
possibleCheck(L,[X|P]) :- list_delete(X,L,L1),possibleCheck(L1,P).

possible(X) :- possibleCheck([1,2,3,4,5,6,7,8,9],X).

indices([], _, []).
indices([Index|Indexes], ElementList, [Element|Elements]) :-
nth0(Index, ElementList, Element),
indices(Indexes, ElementList, Elements).

sum_list([], 0).
sum_list([H|T], Sum) :-
   sum_list(T, Rest),
   Sum is H + Rest.

acceptable(A,B,C,D,L1,E,L2,F,L3,G,L4) :-
    indices([0,1,3,4],L4,X),
	sum_list(X,Sum1),
    A=:=Sum1,
    indices([1,2,4,5],L4,Y),
	sum_list(Y,Sum2),
    B=:=Sum2,
    indices([3,4,6,7],L4,Z),
	sum_list(Z,Sum3),
    C=:=Sum3,
    indices([4,5,7,8],L4,I),
	sum_list(I,Sum4),
    D=:=Sum4,
    indices(L1,L4,J),
	sum_list(J,Sum5),
    E=:=Sum5,
    indices(L2,L4,H),
	sum_list(H,Sum6),
    F=:=Sum6,
    indices(L3,L4,K),
	sum_list(K,Sum7),
    G=:=Sum7.

suko(A,B,C,D,L1,E,L2,F,L3,G,X) :-
    possible(X),
    acceptable(A,B,C,D,L1,E,L2,F,L3,G,X).
