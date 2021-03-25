read_str(Str,Len):-get0(X),read_str(X,Str,[],Len,0).
read_str(10,Str,Str,Len,Len):-!.
read_str(X,Str,Buffer,Len,CLen):-NCLen is CLen+1,append(Buffer,[X],NBuffer),get0(XN),read_str(XN,Str,NBuffer,Len,NCLen).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

delete_spaces([32|T],Res):-delete_spaces(T,Res),!.
delete_spaces(Res,Res):-!.

skip_name([H|T],Res):-H > 64, H < 91, skip_name(T,Res),!.
skip_name([H|T],Res):-H > 96, H < 123,skip_name(T,Res),!.
skip_name(Res,Res):-!.

check_full_name:-read_str(Str,_),check_full_name(Str).
check_full_name(SLnSFnSPanS):-delete_spaces(SLnSFnSPanS,LnSFnSPanS),
                              skip_name(LnSFnSPanS,SD1SLn2SFnSPanS),
                              delete_spaces(SD1SLn2SFnSPanS,[D1|SLn2SFnSPanS]),
                              (D1=45 -> delete_spaces(SLn2SFnSPanS,Ln2SFnSPanS),skip_name(Ln2SFnSPanS,SFnSPanS),
                                        delete_spaces(SFnSPanS,FnSPanS);[D1|SLn2SFnSPanS] = FnSPanS),
                              skip_name(FnSPanS,SD2DFn2SPanS),
                              delete_spaces(SD2DFn2SPanS,[D2|SFn2SPanS]),
                              (D2=45 -> delete_spaces(SFn2SPanS,Fn2SPanS),skip_name(Fn2SPanS,SPanS),
                                        delete_spaces(SPanS,PanS);[D2|SFn2SPanS] = PanS),
                              skip_name(PanS,SPan2S),delete_spaces(SPan2S,Pan2S),
                              (Pan2S=[] -> true;skip_name(Pan2S,S),delete_spaces(S,[])).


