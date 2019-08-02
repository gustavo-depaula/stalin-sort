stalinSortAux([], _, []).
stalinSortAux([H1|T1], [H2|T2], [H1|R]):- H1>H2, !, stalinSortAux(T1, T2, R).
stalinSortAux([_|T1], [H2|T2], R):- stalinSortAux(T1, [H2|T2], R).

stalinSort([H|T], [H|R]):- stalinSortAux(T, [H|T], R).
