-module (selection_sort).
-export ([selection_sort/1]).


selection_sort(Data) ->
	selection_sort(Data, []).

selection_sort([], SortList) -> 
	SortList;

selection_sort(SourceData, SortList) -> 
	% 使用系统函数
	% Max = lists:max(SourceData),
	% 使用自定义函数
	Max = sort_max(SourceData, []),
	NewData = lists:delete(Max, SourceData),
	selection_sort(NewData, [Max | SortList]).

sort_max([First| []], _) ->
	First;

sort_max([First, Second | []], _) ->
	case compare(First, Second, asc) of
		true  ->
			First;
		false ->
			Second
	end;

sort_max([First, Second | Tail], SortList) ->
	case compare(First, Second, asc) of
		true  ->
			sort_max([First | Tail], [Second | SortList]);
		false ->
			sort_max([Second | Tail], [First | SortList])
	end.	

compare(First, Second, asc) ->
	First > Second;
compare(First, Second, desc) ->
	First < Second.



