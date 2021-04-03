read_str_from_file(Str,Len):-get0(X),read_str_from_file(X,Str,[],Len,0).
read_str_from_file(-1,Str,Str,Len,Len):-!.
read_str_from_file(X,Str,Buffer,Len,CLen):-NCLen is CLen+1,append(Buffer,[X],NBuffer),get0(XN),read_str_from_file(XN,Str,NBuffer,Len,NCLen).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

repeat_counter(List,Elem,Res):-repeat_counter(List,Elem,0,Res).
repeat_counter([],_,Res,Res):-!.
repeat_counter([Elem|T],Elem,Counter,Res):-NC is Counter+1,repeat_counter(T,Elem,NC,Res),!.
repeat_counter([_|T],Elem,Counter,Res):-repeat_counter(T,Elem,Counter,Res).

delete_all(List,Elem,Res):-delete_all(List,Elem,[],Res).
delete_all([],_,Res,Res):-!.
delete_all([Elem|T],Elem,Buffer,Res):-delete_all(T,Elem,Buffer,Res),!.
delete_all([H|T],Elem,Buffer,Res):-append(Buffer,[H],NBuffer),delete_all(T,Elem,NBuffer,Res).

sort_letters(Text,Res):-sort_letters(Text,[],Res).
sort_letters([],Res,Res):-!.
sort_letters([H|T],Buffer,Res):-repeat_counter([H|T],H,Count),delete_all(T,H,NText),char_code(Letter,H),append(Buffer,[[Letter,Count]],NBuffer),sort_letters(NText,NBuffer,Res).

sort_letters_list(List,Res):-sort_letters_list(List,[],Res).
sort_letters_list([Last],Buffer,Res):-append(Buffer,[Last],Res),!.
sort_letters_list(List,Buffer,Res):-find_max_and_swap(List,[Max|Rest]),append(Buffer,[Max],NBuffer),sort_letters_list(Rest,NBuffer,Res).
find_max_and_swap([H|T],Res):-find_max_and_swap(T,[],[H],Res).
find_max_and_swap([],PreBuffer,[Max|PostBuffer],Res):-append(PreBuffer,PostBuffer,NText),append([Max],NText,Res),!.
find_max_and_swap([[H,Count]|T],PreBuffer,[[MaxH,MaxCount]|PostBuffer],Res):-(Count>MaxCount ->
                 append(PreBuffer,[[MaxH,MaxCount]|PostBuffer],NPreBuffer),find_max_and_swap(T,NPreBuffer,[[H,Count]],Res);
                 append(PostBuffer,[[H,Count]],NPostBuffer),find_max_and_swap(T,PreBuffer,[[MaxH,MaxCount]|NPostBuffer],Res)).

                 
build_code(LetList,Res):-build_code(LetList,[],Res).
build_code([[Letter,_]],Code,[[Letter,Code]]):-!.
build_code(List,CurCode,Res):-list_split(List,Part1,Part2),append(CurCode,[48],Part1CurCode),append(CurCode,[49],Part2CurCode),build_code(Part1,Part1CurCode,Part1Code),build_code(Part2,Part2CurCode,Part2Code),append(Part1Code,Part2Code,Res).

list_split([H|T],Res1,Res2):-counter([H|T],Sum),list_split([H],T,[H],T,Sum,Res1,Res2).
list_split(_,[],Res1,Res2,_,Res1,Res2):-!.
list_split(Part1,[H|T],MinPart1,MinPart2,MinSum,Res1,Res2):-counter(Part1,Part1Sum),counter([H|T],Part2Sum),Dif is Part1Sum-Part2Sum,abs(Dif,ADif),append(Part1,[H],NPart1),(ADif<MinSum -> list_split(NPart1,T,Part1,[H|T],ADif,Res1,Res2);
                                                                list_split(NPart1,T,MinPart1,MinPart2,MinSum,Res1,Res2)).

counter([[_,Num]|T],Res):-counter(T,Num,Res).
counter([],Res,Res):-!.
counter([[_,Num]|T],Sum,Res):-NSum is Sum+Num,counter(T,NSum,Res).
                 
output([]):-!.
output([[Char,Code]|T]):-write(Char),write(" - "),write_str(Code),nl,output(T).
                 
build_Shannon_Fano_code:-see('GitHub:/prolog/lab8_files/input.txt'),read_str_from_file(Text,_),seen,sort_letters(Text,LetList),sort_letters_list(LetList,SortedLetList),build_code(SortedLetList,Res),tell('GitHub:/prolog/lab8_files/output.txt'),output(Res),told.
