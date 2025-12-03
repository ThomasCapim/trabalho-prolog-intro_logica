% ========================================
% NÍVEL 3 – Sistema Especialista de Diagnóstico
% Tema: Diagnóstico Médico Básico
% ========================================

% ----------------------------------------
% PERGUNTA AO USUÁRIO
% pergunta(Sintoma)
% Exibe uma pergunta e lê (s/n)
% Retorna verdadeiro somente se a resposta for "s".
% ----------------------------------------
pergunta(Sintoma) :-
    write('Você está com '), write(Sintoma), write('? (s/n): '),
    read(Resp),
    Resp == s.

% ----------------------------------------
% CAPTURA DOS SINTOMAS
% Cada sintoma só será verdadeiro se a resposta do usuário for "s".
% Isso permite que as regras de diagnóstico consultem sintomas como fatos lógicos.
% ----------------------------------------
sintoma(febre) :- pergunta('febre').
sintoma(tosse) :- pergunta('tosse').
sintoma(dor_corpo) :- pergunta('dor no corpo').
sintoma(espirros) :- pergunta('espirros').
sintoma(cansaco) :- pergunta('cansaço').
sintoma(nariz_entupido) :- pergunta('nariz entupido').
sintoma(garganta) :- pergunta('dor de garganta').
sintoma(perda_olfato) :- pergunta('perda de olfato/paladar').

% ----------------------------------------
% REGRAS DE DIAGNÓSTICO (IF-THEN)
% Cada doença é definida como um conjunto de sintomas.
% O Prolog tentará cada regra na ordem até encontrar uma que seja verdadeira.
% ----------------------------------------

% gripe – febre + dor no corpo + tosse
doenca(gripe) :-
    sintoma(febre),
    sintoma(dor_corpo),
    sintoma(tosse).

% resfriado – tosse + nariz entupido, mas sem febre
doenca(resfriado) :-
    sintoma(tosse),
    sintoma(nariz_entupido),
    \+ sintoma(febre). % \+ = exclusão

% alergia – espirros + nariz entupido, sem febre e sem dores
doenca(alergia) :-
    sintoma(espirros),
    sintoma(nariz_entupido),
    \+ sintoma(febre),
    \+ sintoma(dor_corpo).

% covid – febre + cansaço + tosse + perda de olfato
doenca(covid) :-
    sintoma(febre),
    sintoma(cansaco),
    sintoma(tosse),
    sintoma(perda_olfato).

% sinusite – nariz entupido + dor de garganta + cansaço, sem febre
doenca(sinusite) :-
    sintoma(nariz_entupido),
    sintoma(garganta),
    sintoma(cansaco),
    \+ sintoma(febre).

% ----------------------------------------
% EXECUÇÃO PRINCIPAL DO SISTEMA
% diagnosticar/0
% O Prolog tenta encontrar o primeiro diagnóstico verdadeiro.
% O operador "!" evita que outras doenças sejam testadas após a primeira bem-sucedida.
% ----------------------------------------

diagnosticar :-
    doenca(D), !, % Encontrou a doença → corta as demais opções
    write('Possível diagnóstico: '), write(D), nl.

diagnosticar :-
    write('Não foi possível determinar um diagnóstico.'), nl.