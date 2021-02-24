%	Предикат вопроса q(+Question,-Answer).
%	Question - внутренний номер вопроса, Answer запрашивается у пользователя

q(1,A):-write("Question 1:"),nl,
        write("Is number greater then 20?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(2,A):-write("Question 2:"),nl,
        write("Is number greater then 10?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(3,A):-write("Question 3:"),nl,
        write("Is number greater then 5?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(4,A):-write("Question 4:"),nl,
        write("Is number greater then 3?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(5,A):-write("Question 5:"),nl,
        write("1, 2 or 3?"),nl,
        write("1."),nl,
        write("2."),nl,
        write("3."),nl,
        read(A).

q(6,A):-write("Question 5:"),nl,
        write("4 or 5?"),nl,
        write("4."),nl,
        write("5."),nl,
        read(A).

q(7,A):-write("Question 4:"),nl,
        write("Is number greater then 8?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(8,A):-write("Question 5:"),nl,
        write("6, 7 or 8?"),nl,
        write("6."),nl,
        write("7."),nl,
        write("8."),nl,
        read(A).

q(9,A):-write("Question 5:"),nl,
        write("9 or 10?"),nl,
        write("9."),nl,
        write("10."),nl,
        read(A).

q(10,A):-write("Question 3:"),nl,
        write("Is number greater then 15?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(11,A):-write("Question 4:"),nl,
        write("Is number greater then 13?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(12,A):-write("Question 5:"),nl,
        write("11, 12 or 13?"),nl,
        write("11."),nl,
        write("12."),nl,
        write("13."),nl,
        read(A).

q(13,A):-write("Question 5:"),nl,
        write("14 or 15?"),nl,
        write("14."),nl,
        write("15."),nl,
        read(A).

q(14,A):-write("Question 4:"),nl,
        write("Is number greater then 18?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(15,A):-write("Question 5:"),nl,
        write("16, 17 or 18?"),nl,
        write("16."),nl,
        write("17."),nl,
        write("18."),nl,
        read(A).

q(16,A):-write("Question 5:"),nl,
        write("19 or 20?"),nl,
        write("19."),nl,
        write("20."),nl,
        read(A).

q(17,A):-write("Question 2:"),nl,
        write("Is number greater then 30?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(18,A):-write("Question 3:"),nl,
        write("Is number greater then 25?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(19,A):-write("Question 4:"),nl,
        write("Is number greater then 23?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(20,A):-write("Question 5:"),nl,
        write("21, 22 or 23?"),nl,
        write("21."),nl,
        write("22."),nl,
        write("23."),nl,
        read(A).

q(21,A):-write("Question 5:"),nl,
        write("24 or 25?"),nl,
        write("24."),nl,
        write("25."),nl,
        read(A).

q(22,A):-write("Question 4:"),nl,
        write("Is number greater then 28?"),nl,
        write("0. No"),nl,
        write("1. Yes"),nl,
        read(A).

q(23,A):-write("Question 5:"),nl,
        write("26, 27 or 28?"),nl,
        write("26."),nl,
        write("27."),nl,
        write("28."),nl,
        read(A).

q(24,A):-write("Question 5:"),nl,
        write("29 or 30?"),nl,
        write("29."),nl,
        write("30."),nl,
        read(A).

%	Предикат перехода next_q(+Question,+Answer,-Next_question).
%	Паре Question - внутренний номер вопроса и
%		 Answer - данный на него ответ
%		 ставит в соответствие номер следующего вопроса - New_question
		
next_q(1,0,2).
next_q(1,1,17).

next_q(2,0,3).
next_q(2,1,10).

next_q(3,0,4).
next_q(3,1,7).

next_q(4,0,5).
next_q(4,1,6).

next_q(7,0,8).
next_q(7,1,9).

next_q(10,0,11).
next_q(10,1,14).

next_q(11,0,12).
next_q(11,1,13).

next_q(14,0,15).
next_q(14,1,16).

next_q(17,0,18).
next_q(17,1,25).

next_q(18,0,19).
next_q(18,1,22).

next_q(19,0,20).
next_q(19,1,21).

next_q(22,0,23).
next_q(22,1,24).

%	Факты для проверки a(+Question,+Number,+Answer).
%	Ответ Answer для числа Number на вопрос Question

a(1,1,0).
a(1,2,0).
a(1,3,0).
a(1,4,0).
a(1,5,0).
a(1,6,0).
a(1,7,0).
a(1,8,0).
a(1,9,0).
a(1,10,0).
a(1,11,0).
a(1,12,0).
a(1,13,0).
a(1,14,0).
a(1,15,0).
a(1,16,0).
a(1,17,0).
a(1,18,0).
a(1,19,0).
a(1,20,0).
a(1,21,1).
a(1,22,1).
a(1,23,1).
a(1,24,1).
a(1,25,1).
a(1,26,1).
a(1,27,1).
a(1,28,1).
a(1,29,1).
a(1,30,1).

a(2,1,0).
a(2,2,0).
a(2,3,0).
a(2,4,0).
a(2,5,0).
a(2,6,0).
a(2,7,0).
a(2,8,0).
a(2,9,0).
a(2,10,0).
a(2,11,1).
a(2,12,1).
a(2,13,1).
a(2,14,1).
a(2,15,1).
a(2,16,1).
a(2,17,1).
a(2,18,1).
a(2,19,1).
a(2,20,1).

a(3,1,0).
a(3,2,0).
a(3,3,0).
a(3,4,0).
a(3,5,0).
a(3,6,1).
a(3,7,1).
a(3,8,1).
a(3,9,1).
a(3,10,1).

a(4,1,0).
a(4,2,0).
a(4,3,0).
a(4,4,1).
a(4,5,1).

a(5,1,1).
a(5,2,2).
a(5,3,3).

a(6,4,4).
a(6,5,5).

a(7,6,0).
a(7,7,0).
a(7,8,0).
a(7,9,1).
a(7,10,1).

a(8,6,6).
a(8,7,7).
a(8,8,8).

a(9,9,9).
a(9,10,10).

a(10,11,0).
a(10,12,0).
a(10,13,0).
a(10,14,0).
a(10,15,0).
a(10,16,1).
a(10,17,1).
a(10,18,1).
a(10,19,1).
a(10,20,1).

a(11,11,0).
a(11,12,0).
a(11,13,0).
a(11,14,1).
a(11,15,1).

a(12,11,11).
a(12,12,12).
a(12,13,13).

a(13,14,14).
a(13,15,15).

a(14,16,0).
a(14,17,0).
a(14,18,0).
a(14,19,1).
a(14,20,1).

a(15,16,16).
a(15,17,17).
a(15,18,18).

a(16,19,19).
a(16,20,20).

a(17,21,0).
a(17,22,0).
a(17,23,0).
a(17,24,0).
a(17,25,0).
a(17,26,0).
a(17,27,0).
a(17,28,0).
a(17,29,0).
a(17,30,0).

%31-40

a(18,21,0).
a(18,22,0).
a(18,23,0).
a(18,24,0).
a(18,25,0).
a(18,26,1).
a(18,27,1).
a(18,28,1).
a(18,29,1).
a(18,30,1).

a(19,21,0).
a(19,22,0).
a(19,23,0).
a(19,24,1).
a(19,25,1).

a(20,21,21).
a(20,22,22).
a(20,23,23).

a(21,24,24).
a(21,25,25).

a(22,26,0).
a(22,27,0).
a(22,28,0).
a(22,29,1).
a(22,30,1).

a(23,26,26).
a(23,27,27).
a(23,28,28).

a(24,29,29).
a(24,30,30).

%	Изначальный набор чисел numbers(-Numbers).

numbers([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]).

%	Запуск Акинатора pr.

pr:-numbers(Numbers),pr(1,Numbers).
pr(Q,Numbers):-q(Q,A),check(Q,A,Numbers,[],[Checked|Others]),(is_alone([Checked|Others])->write("Your number is "),write(Checked);next_q(Q,A,New_q),pr(New_q,[Checked|Others])).

%	Предикат отсеивания чисел check(+Question,+Answer,+Check_list,+Temp_list,-Checked_list).
%	Проверяет числа из списка Check_list на соответствие ответа Answer на вопрос Question
%	Temp_list служит буффером, где хранятся числа, прошедшие проверку. Через Checked_list возвращается список прошедших чисел

check(Q,A,[],Correct,Correct):-!.
check(Q,A,[Current|Others],Correct,Numbers):-(a(Q,Current,A)->check(Q,A,Others,[Current|Correct],Numbers);check(Q,A,Others,Correct,Numbers)).

%	Предикат проверки на наличие только одного элемента в списке is_alone(+List).

is_alone([_|Not_alone]):-Not_alone = [].
