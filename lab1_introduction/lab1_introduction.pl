man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

man():-man(M),write(M),nl,fail.
woman():-woman(W),write(W),nl,fail.

children(P):-parent(P,C),write(C),nl,fail.

mother(M,C):-parent(M,C),woman(M).
mother(C):-mother(M,C),write(M).

dauther(D,P):-parent(P,D),woman(D).
dauther(P):-dauther(D,P),write(D),nl,fail.

brother(B,C):-mother(M,B),mother(M,C),man(B),B\=C.
brother(C):-brother(B,C),write(B),nl,fail.

husband(H,W):-parent(H,C),mother(W,C),man(H).
husband(W):-husband(H,W),write(H).

b_s(C1,C2):-mother(M,C1),mother(M,C2),C1\=C2.
b_s(C):-b_s(C,B_S),write(B_S),nl,fail.
