read_str(A,N):-get0(X),read_str(X,A,[],N,0).
read_str(10,A,A,N,N):-!.
read_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),read_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

in_list_counter(List,El,Count):-in_list_counter(List,El,0,Count).
in_list_counter([],_,Count,Count):-!.
in_list_counter([El|T],El,CurCount,Count):-NCount is CurCount+1,!,in_list_counter(T,El,NCount,Count).
in_list_counter([_|T],El,CurCount,Count):-in_list_counter(T,El,CurCount,Count).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).
list_exlude(List,[],List):-!.
list_exlude(List,[H|T],Res):-in_list_exlude(List,H,NList),!,list_exlude(NList,T,Res).

b_a_rp(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,b_a_r(A1,N1,[El|Perm]).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet:-read_str(A,_),read(K),sochet(B,K,A),write_str(B),nl,fail.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p:-read_str(A,_),read(K),sochet_p(B,K,A),write_str(B),nl,fail.

make_n(0,[]):-!.
make_n(N,[N|T]):-Prev is N-1,make_n(Prev,T).

make_word(0,[]):-!.
make_word(Len,[_|T]):-NLen is Len-1,make_word(NLen,T).

combine(RawAlph,RawPos,K,Word):-combine(RawAlph,RawPos,K,[],Word).
combine([],_,_,Word,Word):-!.
combine([Let|T],RawPos,K,Buffer,Word):-in_list_counter(RawPos,K,RawCount),Count is RawCount+1,append([[Let,Count]],Buffer,NBuffer),NK is K-1,combine(T,RawPos,NK,NBuffer,Word).



build_word(AlphNPos,N,Word):-make_n(N,Positions),build_word(AlphNPos,Positions,N,Word).
build_word([],_,_,_):-!.
build_word([[Let,Count]|T],Positions,N,Word):-sochet(CurPositions,Count,Positions),set_letter(Let,CurPositions,Word),list_exlude(Positions,CurPositions,RemainPos),build_word(T,RemainPos,N,Word).

list_el_num1(List,El,Num):-list_el_num1(List,El,1,Num).
list_el_num1([El|_],El,Num,Num):-!.
list_el_num1([_|T],El,Counter,Num):-Next is Counter+1,list_el_num1(T,El,Next,Num).

set_letter(_,[],_):-!.
set_letter(Letter,[H|T],Word):-list_el_num1(Word,Letter,H),set_letter(Letter,T,Word).

build_and_output(N,M,K):-tell('GitHub:/prolog/lab9_combinatorics/words.txt'),not(build_all_words(N,M,K)),told.
build_all_words(N,M,K):-make_word(N,Word),read_str(Alph,M),sochet(RawAlph,K,Alph),PosLen is N-K,make_n(K,Positions),sochet_p(RawPos,PosLen,Positions),combine(RawAlph,RawPos,K,AlphNPos),
build_word(AlphNPos,N,Word),write_str(Word),nl,fail.
