-module (insert_sort).
-export ([insert_sort/1]).

insert_sort(Data) ->
	insert_sort(Data, []).

insert_sort([], SortList) ->
	SortList;

insert_sort([Head | Tail], SortList) ->
	insert_sort(Tail, head_sort(Head, SortList, [])).

head_sort(Head, [], []) ->
	[Head];

head_sort(Head, [], ResList) ->
	lists:reverse([Head | ResList]);

head_sort(Head, [First | Tail], ResList) ->
	if
		Head < First ->
			head_sort(First, Tail, [Head | ResList]);
		Head >= First ->
			head_sort(Head, Tail, [First | ResList])
	end.

	
