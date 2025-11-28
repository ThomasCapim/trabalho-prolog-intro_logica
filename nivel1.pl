% pai(nome, filho).
pai('Philip', 'Charles III').
pai('Philip', 'Anne').
pai('Philip', 'Andrew').
pai('Philip', 'Edward').
pai('Charles III', 'William').
pai('Charles III', 'Harry').
pai('William', 'George').
pai('William', 'Charlotte').
pai('William', 'Louis').
pai('Harry', 'Archie').
pai('Harry', 'Lilibet').

% mae(nome, filho).
mae('Elizabeth', 'Charles III').
mae('Elizabeth', 'Anne').
mae('Elizabeth', 'Andrew').
mae('Elizabeth', 'Edward').
mae('Diana', 'William').
mae('Diana', 'Harry').
mae('Catherine', 'George').
mae('Catherine', 'Charlotte').
mae('Catherine', 'Louis').
mae('Meghan', 'Archie').
mae('Meghan', 'Lilibet').

% "casais"
/* 
areParents(X, Y) :-
    pai(X, Z),
    mae(Y, Z).
 */

parents(X, Y) :-
    pai(X, Y);
    mae(X, Y).

irmaos(X, Y) :-
    pai(Z, X),
    pai(Z, Y),
    mae(W, X),
    mae(W, Y),
    X \= Y.

avos(X, Y) :-
    parents(X, Z),
    parents(Z, Y).