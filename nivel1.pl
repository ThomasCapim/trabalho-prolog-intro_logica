% pai(nome, filho(a)).
pai('Philip', 'Charles III').
pai('Philip', 'Anne').
pai('Philip', 'Andrew').
pai('Philip', 'Edward').
pai('Charles III', 'William').
pai('Charles III', 'Harry').
pai('Mark Phillips', 'Peter Phillips').
pai('Mark Phillips', 'Zara Phillips').
pai('Peter Phillips', 'Savannah').
pai('Peter Phillips', 'Isla').
pai('Mike Tindall', 'Mia').
pai('Mike Tindall', 'Lucas').
pai('Mike Tindall', 'Lena').
pai('Andrew', 'Beatrice').
pai('Andrew', 'Eugenie').
pai('Edoardo Mapelli', 'Sienna').
pai('Edoardo Mapelli', 'Athena').
pai('Jack Brooksbank', 'August').
pai('Jack Brooksbank', 'Ernest').
pai('Edward', 'Louise').
pai('Edward', 'Earl').
pai('William', 'George').
pai('William', 'Charlotte').
pai('William', 'Louis').
pai('Harry', 'Archie').
pai('Harry', 'Lilibet').

% mae(nome, filho(a)).
mae('Elizabeth', 'Charles III').
mae('Elizabeth', 'Anne').
mae('Elizabeth', 'Andrew').
mae('Elizabeth', 'Edward').
mae('Anne', 'Peter Phillips').
mae('Anne', 'Zara Phillips').
mae('Autumn Phillips', 'Savannah').
mae('Autumn Phillips', 'Isla').
mae('Zara Phillips', 'Mia').
mae('Zara Phillips', 'Lucas').
mae('Zara Phillips', 'Lena').
mae('Sarah', 'Beatrice').
mae('Sarah', 'Eugenie').
mae('Beatrice', 'Sienna').
mae('Beatrice', 'Athena').
mae('Eugenie', 'August').
mae('Eugenie', 'Ernest').
mae('Sophie', 'Louise').
mae('Sophie', 'Earl').
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

parent(X, Y) :-
    pai(X, Y);
    mae(X, Y).

irmaos(X, Y) :-
    pai(Z, X),
    pai(Z, Y),
    mae(W, X),
    mae(W, Y),
    X \= Y.

avos(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

primos(X, Y) :-
    parent(Z, X),
    parent(W, Y),
    irmaos(Z, W),
    X \= Y.