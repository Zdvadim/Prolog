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
min_digit_up(N,MinD):-ND is N div 10,min_digit_up(ND,MinND),NM is N mod 10,
                     (NM<MinND -> MinD is NM;MinD is MinND).

min_digit_down(N,MinD):-min_digit_down(N,9,MinD).
min_digit_down(0,CurM,CurM):-!.
min_digit_down(N,CurM,MinD):-NM is N mod 10,(NM<CurM -> NMinD is NM;NMinD is CurM),
                             ND is N div 10,min_digit_down(ND,NMinD,MinD).

small_digit_counter_up(0,1):-!.
small_digit_counter_up(1,1):-!.
small_digit_counter_up(2,1):-!.
small_digit_counter_up(3,0):-!.
small_digit_counter_up(4,0):-!.
small_digit_counter_up(5,0):-!.
small_digit_counter_up(6,0):-!.
small_digit_counter_up(7,0):-!.
small_digit_counter_up(8,0):-!.
small_digit_counter_up(9,0):-!.
small_digit_counter_up(N,Count):-ND is N div 10,small_digit_counter_up(ND,Count1),
                                 NM is N mod 10,(NM<3 -> Count is Count1+1;Count is Count1).

small_digit_counter_down(N,Count):-small_digit_counter_down(N,0,Count).
small_digit_counter_down(0,Counter,Count):-Count is Counter+1,!.
small_digit_counter_down(1,Counter,Count):-Count is Counter+1,!.
small_digit_counter_down(2,Counter,Count):-Count is Counter+1,!.
small_digit_counter_down(3,Counter,Counter):-!.
small_digit_counter_down(4,Counter,Counter):-!.
small_digit_counter_down(5,Counter,Counter):-!.
small_digit_counter_down(6,Counter,Counter):-!.
small_digit_counter_down(7,Counter,Counter):-!.
small_digit_counter_down(8,Counter,Counter):-!.
small_digit_counter_down(9,Counter,Counter):-!.
small_digit_counter_down(N,Counter,Count):-ND is N div 10,NM is N mod 10,
                                           (NM<3 -> Counter1 is Counter+1;Counter1 is Counter),
                                           small_digit_counter_down(ND,Counter1,Count).


maxmin(X,Y,X,Y):-X>Y,!.
maxmin(X,Y,Y,X).

nod(X,X,X):-!.
nod(X,Y,R):-maxmin(X,Y,Max,Min),NMax is Max-Min,nod(NMax,Min,R).

is_simple(1):-write("(@_@)?_1"),nl,!,fail.
is_simple(Num):-Bound is (Num div 2)+1,is_simple(2,Bound,Num).
is_simple(Bound,Bound,_):-!.
is_simple(Cur,Bound,N):-M is N mod Cur,M\=0,NCur is Cur+1,is_simple(NCur,Bound,N).

div_counter(0,Count):-write("<(/_/)>_0_"),nl,read(NNum),div_counter(NNum,Count).
div_counter(Num,Count):-div_counter(Num,Num,0,Count).
div_counter(_,0,Res,Res):-!.
div_counter(Num,Cur,Count,Res):-(0 is Num mod Cur -> NC is Count+1;NC = Count),NCur is Cur-1,div_counter(Num,NCur,NC,Res).

%Max = 837799, MaxLen = 524
%Try memo/chain build
pr_3_13(Max):-pr_3_13(3,1000000,1,2,Max).
pr_3_13(Border,Border,_,IMax,IMax):-!.
pr_3_13(Cur,Border,Max,IMax,Res):-chain(Cur,Len),(Len>Max -> NIMax is Cur,NMax is Len;NIMax is IMax,NMax is Max),Next is Cur+1,pr_3_13(Next,Border,NMax,NIMax,Res).
chain(Num,Res):-chain(Num,0,Res).
chain(1,Res,Res):-!.
chain(Num,Len,Res):-(0 is Num mod 2 -> NNum is Num / 2;NNum is Num*3+1),NLen is Len+1,chain(NNum,NLen,Res).

not_simple_divs_down(Num,Sum):-(is_simple(Num) -> Sum = 1;SSum is Num+1,not_simple_divs_down(Num,SSum,2,Sum)).
not_simple_divs_down(Num,Sum,Num,Sum):-!.
not_simple_divs_down(Num,CSum,Cur,Sum):-(0 is Num mod Cur,not(is_simple(Cur)) -> NCSum is CSum +Cur;NCSum is CSum),Next is Cur+1,not_simple_divs_down(Num,NCSum,Next,Sum).

not_simple_divs_up(Num,Sum):-(is_simple(Num) -> Sum = 1;not_simple_divs_up(Num,Num,Sum)).
not_simple_divs_up(_,1,1):-!.
not_simple_divs_up(Num,Cur,Sum):-Next is Cur-1,not_simple_divs_up(Num,Next,NS),(0 is Num mod Cur,not(is_simple(Cur)) -> Sum is NS+Cur;Sum is NS).
