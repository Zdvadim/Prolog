read_list(List):-write("Insert list size: "),read(Len),write("Insert list elements:"),nl,read_list(Len,List).
read_list(0,[]):-!.
read_list(Len,[H|T]):-read(H),Next is Len-1,read_list(Next,T).

write_list(List):-write("List: "),write("["),write_list_h(List).
write_list_h([]):-write("[]"),!.
write_list_h([H]):-write(H),write("]."),!.
write_list_h([H|T]):-write(H),write(", "),write_list_h(T).
