uA(L) --> ["u"], a(PrevL), !, {L is PrevL + 1}.
a(L) --> ["u"], a(PrevL), !, {L is PrevL + 1}.
a(0) --> [].

rA(L) --> ["r"], b(PrevL), !, {L is PrevL + 1}.
b(L) --> ["r"], b(PrevL), !, {L is PrevL + 1}.
b(0) --> [].

dA(L) --> ["d"], c(PrevL), !, {L is PrevL + 1}.
c(L) --> ["d"], c(PrevL), !, {L is PrevL + 1}.
c(0) --> [].

lA(L) --> ["l"], d(PrevL), !, {L is PrevL + 1}.
d(L) --> ["l"], d(PrevL), !, {L is PrevL + 1}.
d(0) --> [].


sq --> ["u"], sq, !; ["u"], e, !; ["u"], !.
e --> ["r"], e, !; ["r"], f, !; ["r"], !.
f --> ["d"], f, !; ["d"], g, !; ["d"], !.
g --> ["l"], g, !; ["l"], h, !; ["l"], !.
h --> ["l"], h, !; ["l"], !.

sqA --> uA(L), rA(M), dA(O), lA(P), {L =:= M, L =:= O, L =:= P}.

rctA --> uA(L), rA(M), dA(O), lA(P), {L =:= O, M =:= P}.

appU(1,L,O) :- append([L,["u"]],O),!.
appU(N,L,O) :- append(L,["u"],M), N1 is N - 1, appU(N1,M,O),!.

appR(1,L,O) :- append([L,["r"]],O),!.
appR(N,L,O) :- append(L,["r"],M), N1 is N - 1, appR(N1,M,O),!.

appD(1,L,O) :- append([L,["d"]],O),!.
appD(N,L,O) :- append(L,["d"],M), N1 is N - 1, appD(N1,M,O),!.

appL(1,L,O) :- append([L,["l"]],O),!.
appL(N,L,O) :- append(L,["l"],M), N1 is N - 1, appL(N1,M,O),!.

grect(A,B,C) :-
	appU(A,_,U),
	appR(B,_,V),
	appD(A,_,W),
	appL(B,_,X),
	append([U,V,W,X],C).

m30A(L) --> ["m30"], z(PrevL), !, {L is PrevL + 1}.
z(L) --> ["m30"], z(PrevL), !, {L is PrevL + 1}.
z(0) --> [].

p240A(L) --> ["p240"], y(PrevL), !, {L is PrevL + 1}.
y(L) --> ["p240"], y(PrevL), !, {L is PrevL + 1}.
y(0) --> [].

eqtriA --> uA(L), m30A(M), p240A(N), {L =:= M, L =:= N}.

one_shift([B|C],M) :-
	append(C,[B],M).
