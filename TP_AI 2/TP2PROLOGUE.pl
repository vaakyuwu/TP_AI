% 1
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% 2
first(E, [E|_]).

% 3
last(E, [E]).
last(E, [_|T]) :- last(E, T).

% 4
penultimate(X, [X, _]).
penultimate(X, [_|T]) :- penultimate(X, T).

% 5
del_k(X, [X|T], 1, T).
del_k(X, [H|T], K, [H|R]) :- 
    K > 1, 
    K1 is K - 1, 
    del_k(X, T, K1, R).

% 6 (renamed to my_length)
my_length([], 0).
my_length([_|T], N) :- 
    my_length(T, N1), 
    N is N1 + 1.

% 7
even([]).
even([_, _|T]) :- even(T).

% 8
concat([], L, L).
concat([H|T], L2, [H|L3]) :- 
    concat(T, L2, L3).

% 9
palindrome(L) :- reverse(L, L).
reverse([], []).
reverse([H|T], R) :- 
    reverse(T, RevT), 
    concat(RevT, [H], R).

