% estado(estado, regiao).
estado(Amazonas, Norte).
estado('Pará', Norte).
estado(Rondônia, Norte).

estado(Bahia, Nordeste).
estado(Pernambuco, Nordeste).
estado(Alagoas, Nordeste).

estado('Minas Gerais', Sudeste).
estado('São Paulo', Sudeste).
estado('Rio de Janeiro', Sudeste).

estado('Goiás', 'Centro-oeste').
estado('Mato Grosso do Sul', 'Centro-oeste').
estado('Mato Grosso', 'Centro-oeste').

estado('Paraná', Sul).
estado('Santa Catarina', Sul).
estado('Rio Grande do Sul', Sul).

% vizinho(estado1, estado2).
vizinho(Amazonas, Pará).
vizinho(Amazonas, Rondônia).
vizinho(Rondônia, 'Mato Grosso').
vizinho('Pará', 'Mato Grosso').
vizinho(Bahia, Pernambuco).
vizinho(Bahia, Alagoas).
vizinho(Bahia, 'Minas Gerais').
vizinho(Bahia, 'Goiás').
vizinho('Minas Gerais', 'São Paulo').
vizinho('São Paulo', 'Rio de Janeiro').
vizinho('Minas Gerais', 'Rio de Janeiro').
vizinho('Minas Gerais', 'Goiás').
viinho('Minas Gerais', 'Mato Grosso do Sul').
vizinho('São Paulo', 'Paraná').
vizinho('São Paulo', 'Mato Grosso do Sul').
vizinho('Mato Grosso do Sul', 'Mato Grosso').
vizinho('Mato Grosso do Sul', 'Goiás').
vizinho('Goiás', 'Mato Grosso').
vizinho('Paraná', 'Mato Grosso do Sul').
vizinho('Paraná', 'Santa Catarina').
vizinho('Santa Catarina', 'Rio Grande do Sul').

% estado da mesma região, vizinhos, conexão indireta, distância em passos, região diferente, caminho entre estados

mesmaRegiao(X, Y) :- 
    estado(X, A), 
    estado(Y, A), 
    X \= Y.

saoVizinhos(X, Y) :-
    vizinho(X, Y);
    vizinho(Y, X).



/* Norte:
	Amazonas
	Pará
	Rondônia
Nordeste:
	Bahia
	Pernambuco
	Alagoas
Sudeste:
	Minas Gerais
	São Paulo
	Rio de Janeiro
Centro-oeste:
	Goiás
	Mato Grosso do Sul
	Tocantins
Sul:
	Paraná
	Santa Catarina
	Rio Grande do Sul */