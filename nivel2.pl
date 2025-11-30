%------------------------------

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

% X é ancestral de Y (Recursiva)
ancestral(X, Y) :-
    parent(X, Y);
    parent(X, Z),
    ancestral(Z, Y).

% Os ancestrais de Y são [Lista de ancestrais]. (Manipulação de listas)
listaAncestrais(Y, Lista) :-
    findall(A, ancestral(A, Y), Lista).

% Y é descendente de X (Recursiva, mas praticamente a mesma coisa de ancestral(X, Y))
descendente(Y, X) :-
    parent(X, Y);
    parent(X, Z),
    descendente(Y, Z).

% Os descendentes de X são [Lista de descendentes].
listaDescendentes(X, Lista) :-
    findall(Y, descendente(Y, X), Lista).

ancestralEmComum(X, Y, Z) :-
    ancestral(Z, X),
    ancestral(Z, Y),
    X \= Y.

% distância entre um ancestral X até um descendente Y [recursiva e manipulação de listas (retorna uma lista, na verdade)].
distMembros(X, Y, [X, Y]) :-
    parent(X, Y).
distMembros(X, Y, [X | Resto]) :-
    parent(X, Z),
    distMembros(Z, Y, Resto).

