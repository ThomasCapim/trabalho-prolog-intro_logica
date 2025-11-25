%% Isso daqui são fatos. Eles são verdadeiros apenas por existirem. Qualquer coisa além disso não é fato
woman(mia).
woman(tania).
woman(cat).
party.


%% Isso daqui é uma cláusulas. Cláusulas são um grupo de fatos e regras. Abaixo, há uma cláusula de dois fatos e três regras.
%% Regras são implicações. :- é o operador. "esse fato é verdade se" :- "isso for verdade"
%% "head/cabeça" :- "body/corpo"

happy(yolanda).
listens2Music(mia).
listens2Music(yolanda) :- happy(yolanda). %% Por conta de happy(yolanda) ser um fato, o Prolog DEDUZ que listen2Music(yolanda) também é um fato (mas é um predicado que foi validado como verdadeiro)
playsAirGuitar(mia) :- listens2Music(mia).
playsAirGuitar(yolanda) :- listens2Music(yolanda). %% Por ter deduzido que listens2Music(yolanda) é verdadeiro, o Prolog DEDUZ, novamente, que agora playsAirGuitar(yolanda) é verdadeiro também.

%% Os nomes fora dos parênteses são predicados, enquanto os nomes dentro dos parênteses são fatos

%% Abaixo, dois fatos e três regras

happy(vincent).
listens2Music(butch).
%% Um corpo com fatos separados por vírgulas indica conjunção (operador AND/&&)
playsAirGuitar(vincent):-
   listens2Music(vincent),
   happy(vincent).
%% Escrever um predicado mais de uma vez, com corpos diferentes, indica disjunção (operador OR/||)
playsAirGuitar(butch):-
   happy(butch).
playsAirGuitar(butch):-
   listens2Music(butch).
%% A disjunção poderia ser também escrita com um predicado apenas, com fatos no corpo separados por ponto e vírgula
/*
playsAirGuitar(butch):-
   happy(butch);
   listens2Music(butch).
*/



%% Agora há variáveis. Escrever no terminal "nome_do_predicado(X)", ele vai retornar os nomes que fazem parte daquele predicado.
%% woman(X) começa em X = mia
%% dar um tab ou escrever um ponto e vígula mostrará o próximo nome válido para "woman(X)"

%% Abaixo há fatos com mais de um argumento. Escrever no terminal, por exemplo, "loves(vincent, X), woman(X)", que seria algo como "Vincent ama X e X é uma mulher" (já que tem a vírgula que indica conjunção), vai mostrar todos os valores que validam loves(vincent, mia), que no caso é a própria mia.
loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).

%% Aqui uma regra: na linguagem natural, a implicação seria "X tem ciúmes de Y se X ama Z e Y também ama Z"
%% Neste caso, escrever no terminal o nome de alguém em X e deixar o argumento Y em branco, por exemplo, vai mostrar todas as pessoas com quem X tem ciúmes.
%% Fazer o oposto, deixando X em branco e dando um nome a Y, vai mostrar todas as pessoas X que tem ciúmes dessa pessoa nomeada em Y.
%% Por exemplo, escrever "vincent" em X vai ter como resultado "marsellus", pois ambos amam "mia".
jealous(X,Y):- loves(X,Z), loves(Y,Z).