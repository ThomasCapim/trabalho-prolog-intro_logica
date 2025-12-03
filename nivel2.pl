% ========================================
% NÍVEL 2 – Recursão e Listas
% Família Real Britânica
% ========================================

% ----- FATOS: Relações de pai -----
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

% ----- FATOS: Relações de mãe -----
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

% ----- REGRAS -----

% parent(X, Y) – X é pai ou mãe de Y
parent(X, Y) :-
    pai(X, Y);
    mae(X, Y).

% irmaos(X, Y) – X e Y têm o mesmo pai E a mesma mãe
irmaos(X, Y) :-
    pai(Z, X),
    pai(Z, Y),
    mae(W, X),
    mae(W, Y),
    X \= Y.

% avos(X, Y) – X é avô/avó de Y
avos(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% ----- REGRAS RECURSIVAS -----

% ancestral(X, Y) – X é ancestral de Y
ancestral(X, Y) :-
    parent(X, Y). % caso base

ancestral(X, Y) :-
    parent(X, Z), % X é pai/mãe de Z
    ancestral(Z, Y). % e Z é ancestral de Y (recursão)

% listaAncestrais(Y, Lista)
listaAncestrais(Y, Lista) :-
    findall(A, ancestral(A, Y), Lista).

% descendente(Y, X) – Y é descendente de X
descendente(Y, X) :-
    parent(X, Y).

descendente(Y, X) :-
    parent(X, Z),
    descendente(Y, Z).

% listaDescendentes
listaDescendentes(X, Lista) :-
    findall(Y, descendente(Y, X), Lista).

% ancestralEmComum(X, Y, Z) – Z é ancestral comum de X e Y
ancestralEmComum(X, Y, Z) :-
    ancestral(Z, X),
    ancestral(Z, Y),
    X \= Y.

% distMembros(X, Y, Caminho)
distMembros(X, Y, [X, Y]) :-
    parent(X, Y).  % Caso base

distMembros(X, Y, [X | Resto]) :-
    parent(X, Z),
    distMembros(Z, Y, Resto).
