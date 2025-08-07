-- -> O que � uma Subquery (ou Subconsulta ou SubSELECT)?
/*
	* � uma consulta dentro de outra consulta. Ou seja, com uma subquery conseguimos utilizar o resultado de uma query (consulta ou SELECT) dentro de outra consulta/SELECT.

	* SELECT dentro de outro SELECT.
*/


-- -> Onde utilizamos uma Subquery?
/*
	* 4 situa��es poss�veis:

		- Junto com WHERE, funcionando como um filtro din�mico e escalar (valor �nico).
			# Estrutura Base:
				SELECT
					Coluna1,
					Coluna2
				FROM
					Tabela
				WHERE Coluna1 = (SELECT)


		- Junto com WHERE, como um filtro din�mico e em lista (v�rios valores).
			# Estrutura Base:
				SELECT
					Coluna1,
					Colun2
				FROM
					Tabela
				WHERE Coluna1 IN (SELECT)


		- Junto com o SELECT, como uma nova coluna na tabela.
			# Estrutura Base:
				SELECT
					Coluna1,
					Coluna2,
					(SELECT)
				FROM
					Tabela
				

		- Junto com o FROM, como uma nova tabela.
			# Estrutura Base:
				SELECT
					Coluna1,
					Coluna2
				FROM
					(SELECT) AS T


	EX:
		Imagina que eu quero selecionar os produtos com o pre�o maior do que a m�dia.

		SELECT
			*
		FROM
			DimProduct
		WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM DimProduct)
*/



-- -> ANY/SOME: Equivalente ao IN, retorna as linhas da tabela que sejam igual, ou maior (etc) ao valor1, Ou valor2, Ou valor 3. Possui maior felxibilidade que o IN, pois � poss�vel usar operadores.
/*
	Estrutura Base:
		SELECT
			*
		FROM
			Tabela
		WHERE Coluna1 > ANY (SELECT)
*/



-- -> ALL: Retorna as linhas da tabela contendo os valore maiores, ou iguais (etc) que o valor1, E valor2, E valor3. Ou seja, visando todos, n�o qualquer um dos valores (como � com o ANY ou SOME).
/*
	Estrutura Base:
		SELECT
			*
		FROM
			Tabela
		WHERE Coluna1 > ALL (SELECT)
*/



-- -> EXISTS: 
/*
	Estrutura Base:
		
*/



-- -> CTE: Common Table Expression - Tabela tempor�ria reaproveit�vel.
/*
	Estrutura Base:
		WITH cte(nome_coluna1, nome_coluna2, ...) AS (
		SELECT...
		)
*/
