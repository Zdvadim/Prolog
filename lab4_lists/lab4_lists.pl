read_list(List):-write("Insert list size: "),read(Len),write("Insert list elements:"),nl,read_list(Len,List).
read_list(0,[]):-!.
read_list(Len,[H|T]):-read(H),Next is Len-1,read_list(Next,T).

write_list(List):-write("List: "),write("["),write_list_h(List).
write_list_h([]):-write("[]"),!.
write_list_h([H]):-write(H),write("]."),!.
write_list_h([H|T]):-write(H),write(", "),write_list_h(T).

sum_list_down:-read_list(ToSumm),sum_list_down(ToSumm,Summ),write("Summ = "),write(Summ).
sum_list_down(List,Summ):-sum_list_down(List,0,Summ).
sum_list_down([],Summ,Summ):-!.
sum_list_down([H|T],CS,Summ):-NS is H+CS,sum_list_down(T,NS,Summ).

sum_list_up([],0):-!.
sum_list_up([H],H):-!.
sum_list_up([H|T],Summ):-sum_list_up(T,NS),Summ is NS+H.

list_el_numb(List,Elem,Number):-list_el_numb(List,Elem,0,Number).
list_el_numb([El|_],El,Number,Number):-!.
list_el_numb([_|T],El,Counter,Number):-Next is Counter+1,list_el_numb(T,El,Next,Number).

find_num:-read_list(List),write("Insert element"),read(Elem),(list_el_numb(List,Elem,Number) ->
          write("Index: "),write(Number);
          write("There are no such element in this list_|(q)-(q)|_"),fail).
          
find_elem:-read_list(List),write("Insert number"),read(Number),(list_el_numb(List,Elem,Number) ->
          write("Element: "),write(Elem);
          write("Number is too large_|(q)-(q)|_"),fail).
          
min_list_down([H|T],Min):-min_list_down(T,H,Min).
min_list_down([],Min,Min):-!.
min_list_down([H|T],CMin,Min):-(H<CMin -> NMin = H;NMin = CMin),min_list_down(T,NMin,Min).
          
min_list_up([H],H):-!.
min_list_up([H|T],Min):-min_list_up(T,Min1),(H<Min1 -> Min = H;Min = Min1).

min_elem:-read_list(List),min_list_down(List,Min),write("Minimum element: "),write(Min).

my_in_list([Elem|_],Elem):-!.
my_in_list([_|T],Elem):-my_in_list(T,Elem).

reverse_list(List,Result):-reverse_list(List,[],Result).
reverse_list([],Result,Result):-!.
reverse_list([H|T],Buffer,Result):-reverse_list(T,[H|Buffer],Result).

my_append([],List2,List2).
my_append([H1|T1],List2,[H1|RT]):-my_append(T1,List2,RT).

p(Sublist,List):-my_append(Prefix,_,List),my_append(_,Sublist,Prefix),!.

delete_elem([_|T],0,T):-!.
delete_elem([H|T],Number,Result):-delete_elem(T,1,Number,[H],Result).
delete_elem([_|T],Number,Number,Buffer,Result):-my_append(Buffer,T,Result),!.
delete_elem([H|T],Counter,Number,Buffer,Result):-NCounter is Counter+1,my_append(Buffer,[H],NBuffer),
                                                 delete_elem(T,NCounter,Number,NBuffer,Result).
                                                 
delete_all(List,Elem,Res):-delete_all(List,Elem,[],Res).
delete_all([],_,Res,Res):-!.
delete_all([Elem|T],Elem,Buffer,Res):-delete_all(T,Elem,Buffer,Res),!.
delete_all([H|T],Elem,Buffer,Res):-my_append(Buffer,[H],NBuffer),delete_all(T,Elem,NBuffer,Res).

is_set([]):-!.
is_set([H|T]):-not(my_in_list(T,H)),is_set(T).

make_set(List,Res):-make_set(List,[],Res).
make_set([],Res,Res):-!.
make_set([H|T],Buffer,Res):-(not(my_in_list(Buffer,H)) -> my_append(Buffer,[H],NBuffer);NBuffer = Buffer),make_set(T,NBuffer,Res).

repeat_counter(List,Elem,Res):-repeat_counter(List,Elem,0,Res).
repeat_counter([],_,Res,Res):-!.
repeat_counter([Elem|T],Elem,Counter,Res):-NC is Counter+1,repeat_counter(T,Elem,NC,Res),!.
repeat_counter([_|T],Elem,Counter,Res):-repeat_counter(T,Elem,Counter,Res).

list_length(List,Res):-list_length(List,0,Res).
list_length([],Res,Res):-!.
list_length([_|T],Counter,Res):-NC is Counter+1,list_length(T,NC,Res).

%#18 - 5,6,18,20,27,30,42,48,54

%is_minimum(+List,+Index)
is_minimum(List,Index):-list_el_numb(List,Elem,Index),min_list_down(List,Elem).

%move_left([H|T],Res):-my_append(T,[H],Res).

move_left([H|T],Res):-move_left(T,H,Res).
move_left([],Elem,[Elem]):-!.
move_left([H|T],Elem,[H|TR]):-move_left(T,Elem,TR).

pr18_6(List,Res):-move_left(List,R1),move_left(R1,R2),move_left(R2,Res).

min_prefix(List,Res):-min_list_down(List,Min),min_prefix(List,Min,[],Res).
min_prefix([Min|_],Min,Res,Res):-!.
min_prefix([H|T],Min,Buffer,Res):-my_append(Buffer,[H],NBuffer),min_prefix(T,Min,NBuffer,Res).


max_list_down([H|T],Max):-max_list_down(T,H,Max).
max_list_down([],Max,Max):-!.
max_list_down([H|T],CMax,Max):-(H>CMax -> NMax = H;NMax = CMax),max_list_down(T,NMax,Max).

fix_sequence(List,Res):-max_list_down(List,Max),fix_sequence(List,Max,[],Res).
fix_sequence(_,0,Res,Res):-!.
fix_sequence(List,Number,Buffer,Res):-Next is Number-1,(my_in_list(List,Number) ->
                                          fix_sequence(List,Next,Buffer,Res);
                                          fix_sequence(List,Next,[Number|Buffer],Res)).


local_max([H1|[H2|_]],0):-H1>H2,!.
local_max([H1|[H2]],1):-H2>H1,!.
local_max([H1|[H2|[H3|_]]],1):-H2>H1,H2>H3,!.
local_max([_|T],Index):-NI is Index-1,local_max(T,NI).
