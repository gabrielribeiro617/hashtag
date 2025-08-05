-- -> O que é CRUD?
/*
	* C -> CREATE: Permi criar BDs, Tabelas ou Exibições (Views).
	* R -> READ: Permite ler os dados do BD.
	* U -> UPDATE: Permite atualizar os dados do BD.
	* D -> DELETE: Permite deletar dados de um BD.

	* LEMBRANDO: 
		- Um BD é compo por um conjunto de tabelas.

		- As tabelas armazenam dados em linhas e colunas.

		- Uma linha abrange varias colunas que juntas descrevem alguma caracterísitca de um objeto. Desta forma, acoluna é como se fosse uma categoria.

		- Portanto, cada objeto (registro/record) possui características que pertencem a essas categorias.

		- As tabelas de um BD devem ter algum tipo de relação entre si.
*/



-- -> CREATE DATABASE: Cria um BD.
/*
	Estrutura Base:
		CREATE DATABASE nome_bd
*/
-- Ex:
CREATE DATABASE Teste



-- -> DROP DATABASE: Exclui um BD
/*
	Estrutura Base:
		DROP DATABASE nome_bd
*/
-- Ex:
DROP DATABASE Teste



-- -> CREATE TABLE: Cria uma tabela.
/*
	Estrutura Base:
		CREATE TABLE nome_tabela(
			nome_categoria1 [int/varchar(n)/date/datetime/decimal(tot_num, num_pos_virgula)],
			...
		)
*/
-- Ex:



-- -> INSERT SELECT: Adiciona dados a uma tabela, de outra tabela.
/*
	Estrutura Base:
		INSERT INTO nome_tabela(nome_categoria1, ...)
		SELECT ...
*/
-- Ex:



-- -> INSERT INTO: Adiciona informações em uma tabela.
/*
	Estrutura Base:
		INSERT INTO nome_tabela(nome_categoria1, ...)
		VALUES
			(valor_categoria1, ...),
			...
*/
-- Ex:



-- -> UPDATE: Permite atualizar informações num BD.
/*
	Estrutura Base:
		UPDATE nome_tabela
		SET nome_categoria1 = novo_valor_categoria1
		WHERE nome_categoria2 = valor_categoria2
*/
-- Ex:



-- -> DELETE: Permite deletar dados de uma tabela.
/*
	Estrutura Base:
		DELETE
		FROM nome_tabela
		WHERE nome_categoria1 = valor_categoria1
*/
-- Ex:



-- -> DROP TABLE: Deleta uma tabela.
/*
	Estrutura Base:
		DROP TABLE nome_tebela
*/
-- Ex:



-- -> ALTER TABLE: Adiciona colunas; altera tipo de dados de uma coluna; deletar coluna.
/*
	Estrutura Base:
		ALTER TABLE nome_tabela
		ADD nova_coluna1 tipo_de_dado, ...

		ALTER TABLE nome_tabela
		ATER COLMN coluna tipo_de_dado

		ALTER TABLE nome_tabela
		DROP COLUMN coluna1, ...
*/
-- Ex:



