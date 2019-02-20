-module (binary_search).
-export ([find/2]).

find(N, Data) ->
	SortData = lists:sort(Data),
	search(SortData, N).

search([], _N) ->
	{ok, false};

search([First], N) ->
	if
		First =:= N ->
			{ok, true};
		First =/= N ->
			{ok, false}
	end;

search([First, Second], N) ->
	if
		First =:= N orelse Second =:= N ->
			{ok, true};
		First =/= N orelse Second =/= N ->
			{ok, false}
	end;	

search([First, Second, Third], N) ->
	if
		First =:= N orelse Second =:= N orelse Third =:= N ->
			{ok, true};
		First =/= N orelse Second =/= N orelse Third =/= N ->
			{ok, false}
	end;

search(SortData, N) ->
	Len = length(SortData),
	{L1, L2} = lists:split(Len div 2, SortData),
	[First | L2Tail] = L2,
	if
		First =:= N ->
			{ok, true};
		First < N ->
			search(L2Tail, N);
		First > N ->
			search(L1, N)
	end.





