max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max(X,Y,U,X):-X>Y,X>U,!.
max(_,Y,U,Y):-Y>U,!.
max(_,_,U,U).

fact_up(0,1):-!.
fact_up(N,X):-N1 is N-1,fact_up(N1,X1),X is X1*N.

fact_down(N,X,N,X):-!.
fact_down(I,F,N,X):-I1 is I+1,F1 is F*I1,fact_down(I1,F1,N,X).

fact_down(N,X):-fact_down(0,1,N,X).

fib_up(1,1):-!.
fib_up(2,1):-!.
fib_up(N,X):-N1 is N-1,N2 is N-2,fib_up(N2,X2),fib_up(N1,X1),X is X1+X2.

fib_down(N,X):-fib_down(N,1,1,X).
fib_down(1,F2,_,F2):-!.
fib_down(N,F1,F2,X):-N1 is N-1,NF2 is F1 + F2,fib_down(N1,F2,NF2,X).

sum_num_up(0,0):-!.
sum_num_up(N,S):-N1 is N div 10,sum_num_up(N1,S1),S is S1 + N mod 10.

sum_num_down(N,S):-sum_num_down(N,0,S).
sum_num_down(0,S,S):-!.
sum_num_down(N,S,Sum):-N2 is N mod 10,N1 is N div 10,
		       S1 is S+N2,sum_num_down(N1,S1,Sum).
min_digit_up(0,9):-!.
min_digit_up(N,MinD):-ND is N div 10,min_digit_up(ND,MinND),NM is N mod 10,(NM<MinND -> MinD is NM;MinD is MinND).

min_digit_down(N,MinD):-min_digit_down(N,9,MinD).
min_digit_down(0,CurM,CurM):-!.
min_digit_down(N,CurM,MinD):-NM is N mod 10,(NM<CurM -> NMinD is NM;NMinD is CurM),ND is N div 10,min_digit_down(ND,NMinD,MinD).
