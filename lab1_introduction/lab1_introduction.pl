woman(alla).
woman(veronika).
woman(diana).
woman(zhanna).
woman(izabella).
woman(lolita).

man(boris).
man(german).
man(efim).
man(zahar).
man(kim).
man(miron).

parent(alla,efim).
parent(alla,veronika).
parent(boris,efim).
parent(boris,veronika).
parent(zhanna,german).
parent(zhanna,diana).
parent(zahar,german).
parent(zahar,diana).
parent(veronika,izabella).
parent(veronika,kim).
parent(veronika,lolita).
parent(veronika,miron).
parent(german,izabella).
parent(german,kim).
parent(german,lolita).
parent(german,miron).

man:-man(M),write(M),nl,fail.
woman:-woman(W),write(W),nl,fail.

children(P):-parent(P,C),write(C),nl,fail.

mother(M,C):-parent(M,C),woman(M).
mother(C):-mother(M,C),write(M),!.

daughter(D,P):-parent(P,D),woman(D).
daughter(P):-daughter(D,P),write(D),nl,fail.

brother(B,C):-mother(M,B),mother(M,C),man(B),B\=C.
brother(C):-brother(B,C),write(B),nl,fail.

husband(H,W):-parent(H,C),mother(W,C),man(H).
husband(W):-husband(H,W),write(H),!.

b_s(C1,C2):-mother(M,C1),mother(M,C2),C1\=C2.
b_s(C):-b_s(C,B_S),write(B_S),nl,fail.

grand_pa(G,C):-parent(P,C),parent(G,P),man(G).
grand_pas(C):-grand_pa(G,C),write(G),nl,fail.
