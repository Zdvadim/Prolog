max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is X1*N.

fact_d(N,X,N,X):-!.
fact_d(I,F,N,X):-I1 is I+1,F1 is F*I1,fact_d(I1,F1,N,X).

fact_d(N,X):-fact_d(0,1,N,X).


