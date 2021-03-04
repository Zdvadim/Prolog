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

%([],_,_,_):-write("There are no such element in this list_|(q)-(q)|_"),!.
