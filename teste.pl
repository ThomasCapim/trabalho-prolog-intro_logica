% Arquivo: ['/home/bernardo/Documentos/UFSJ/1° Semestre/Introdução a Lógica/Trabalho Prolog/teste.pl'].

% Básico
% Define homens
homem(lima).
homem(hamilton).

% Define mulheres
mulher(ana).
mulher(maria).

% Define regra
marido(lima, maria).
casado(hamilton, ana).

% casado(hamilton, Quem).
% casado(Quem, X).
% casado(hamilton, _).
% casado(_,ana).

pai(lima,rodrigo).
pai(lima,teresa).
pai(rodrigo,marta).
pai(borge,lima).
pai(borge,hamilton).

mae(maria,rodrigo).
mae(maria,teresa).
mae(rosa,marta).
mae(paula,lima).
mae(paula,hamilton).
mae(joana,rosa).

filho(X, Y) :-
  pai(Y, X).

irmao(X, Y) :-
  pai(P, X),
  pai(P, Y),
  X \= Y.

tio(X, Y) :-
  pai(P,X),
  pai(P,Z),
  pai(Z, Y),
  X \= Z.

avo(X, Y) :-
  pai(X, Z),
  pai(Z, Y).

% Estruturas
cidade(luanda,pais(angola)).
cidade(accra,pais(ghana)).
cidade(nairobi,pais(kenya)).

pessoa(lucas, data(12,maio,1986)).
pessoa(bernardo, data(17,setembro,1985)).

aniversario(X, Y) :-
  pessoa(X, data(Y, Z, A)),
  % A =:= 1986.
  A < 1997.

% Listas
compra([bananas, banana, manga, pera, uva]).
nomes([ana, bela, carla, dina, fefa]).

inserir(X, Y, [X | Y]).

% Recursividade
pertence(X, [X | _]).
pertence(X, [_ | Y]) :-
  pertence(X, Y).

% Entrada e Saida de Dados
dialogo :-
  write('Boa noite'), nl,
  write('Qual seu nome?'),
  read(Nome), nl,
  write('Senhor(a) '), write(Nome), write(' como vai a noite?'),
  read(R).