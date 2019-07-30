-module(stalin_sort).
-export([sort/1]).

-spec sort(List1) -> List2 when
      List1 :: [T],
      List2 :: [T],
      T :: term().
sort([X, Y | L]) when X =< Y ->
    [X | sort([Y | L])];
sort([X, _Y | L]) ->
    sort([X | L]);
sort([X | L]) ->
    [X | L];
sort([] = L) ->
    L.
