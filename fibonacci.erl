-module (fibonacci).
-export ([number/1]).

number(N) ->
	number(N, 1, 1).

number(1, _Acc, Bcc) -> Bcc;
number(2, _Acc, Bcc) -> Bcc;
number(N, Acc, Bcc) when N > 2 ->
	number(N-1, Bcc, Acc + Bcc). 