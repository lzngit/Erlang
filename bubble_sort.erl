-module (bubble_sort).
-export ([bubble_sort/1]).

bubble_sort(Data) ->
	% sort(Data, []).
	append(Data, []).


append([_, _ | []] = SorceList, DestList) ->
	[First, Second | []] = sort(SorceList, []),
	[Second, First | DestList];
append(SorceList, DestList) ->
	[First | Tail] = sort(SorceList, []),
	append(Tail, [First | DestList]).


sort([First, Second | []], SortList) ->
	case compare(First, Second, asc) of
		true  ->
			[First, Second | SortList];
		false ->
			[Second, First | SortList]
	end;

sort([First, Second | Tail], SortList) ->
	case compare(First, Second, asc) of
		true  ->
			sort([First | Tail], [Second | SortList]);
		false ->
			sort([Second | Tail], [First | SortList])
	end.	

compare(First, Second, asc) ->
	First > Second;
compare(First, Second, desc) ->
	First < Second.


