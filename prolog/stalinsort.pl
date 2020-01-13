stalin-sort([],[]):-!.
stalin-sort([A,B|T],X):- B<A,!,stalin-sort([A|T],X).
stalin-sort([H|T],[H|X]):- stalin-sort(T,X).
