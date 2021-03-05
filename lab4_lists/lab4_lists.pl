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
