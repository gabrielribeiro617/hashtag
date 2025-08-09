-- -> O que são Window Functions?
/*
	* Para que serve?
		- São utilizadas para cálculos mais avançados de AD;
		- Possuem um uso semelhante ao GROUP BY, só que mais avançado e personalizável;
		- A instrução OVER permite definir qual será a "janela" (conjunto de linhas) a ser considerado no cálculo;
		- A instrução PARTITION BY divide o conjunto em "partições" nas quais as funções de janela são aplicadas.

	* As funções de janela possuem as seguintes finalidades:
		1. Cálculos de agregação: COUNT, SUM, AVG, MIN, MAX
		2. Cálculos de deslocamento: FIRST_VALUE, LAST_VALUE, LEAD, LAG
		3. Cálculos estatísticos: RANK, DENSE_RANK, NTILE
*/


select * from Lojas
-- -> Funções de Agregação:
/*
	Estrutura Base 1:
		FUNCAO(coluna) OVER() AS 'nome coluna'

	Estrutura Base 2:
		FUNCAO(coluna1) OVER(PARTITION BY coluna2) AS 'nome coluna'
*/
-- Ex: 
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Total Vendas'
FROM
	Lojas

--
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER() AS 'Total Vendido',
	FORMAT(Qtd_Vendida / SUM(Qtd_Vendida) OVER(), '0.00%') AS '% do Total'
FROM
	Lojas

--
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Total Vendido',
	FORMAT(Qtd_Vendida / SUM(Qtd_Vendida) OVER(PARTITION BY Regiao), '0.00%') AS '% por Região'
FROM
	Lojas
ORDER BY ID_Loja



-- -> Funções de Classificação: ROW_NUMBER, RANK, DENSE_RANK, NTILE
/*
	* ROW_NUMBER: Classifica de forma ordenada, sem muita condição para valores iguais.
	* RANK: Classifica de forma ordenada, igualando o rank para valores iguais, apagando o seu posterior e pulando para o após. (EX: 8, 8, 10)
	* DENSE_RANK: Classifica de forma ordenada, semelhante ao RANK, mas sem apagar ou pular rank. (EX: 8, 8, 9, 10)
	* NTILE: Classifica de forma ordenada. Possui um parâmetro de qtd. de grupos.

	Estrutura Base 1:
		FUNCAO() OVER(ORDER BY Coluna [ASC/DESC]) AS 'nome coluna'

	Estrutura Base 2:
		FUNCAO() OVER(PARTITION BY Coluna1 ORDER BY Coluna2 [ASC/DESC]) AS 'nome coluna'
*/
-- Ex:
SELECT
	ID_Loja,
	Nome_Loja,
	Regiao,
	Qtd_Vendida,
	ROW_NUMBER() OVER(PARTITION BY Regiao ORDER BY Qtd_Vendida DESC) AS 'Row Number',
	RANK() OVER(PARTITION BY Regiao ORDER BY Qtd_Vendida DESC) AS 'Rank',
	DENSE_RANK() OVER(PARTITION BY Regiao ORDER BY Qtd_Vendida DESC) AS 'Dense',
	NTILE(2) OVER(PARTITION BY Regiao ORDER BY Qtd_Vendida DESC) AS 'NTile'
FROM
	Lojas
ORDER BY ID_Loja

--
SELECT
	Regiao,
	SUM(Qtd_Vendida) AS 'Total Vendido',
	RANK() OVER(ORDER BY SUM(Qtd_Vendida) DESC) AS 'Ranking'
FROM
	Lojas
GROUP BY Regiao
ORDER BY [Total Vendido] DESC



-- -> Soma Móvel e Média Móvel:
/*
	Estrutura Base:
		[SUM/AVG](coluna_de_numeros) OVER(ORDER BY coluna_ordenada ROWS BETWEEN 1 PRECEDING AND CURRENT ROW)
*/
-- Ex:
/*
	SELECT
		Data_Fechamento,
		Mes_Ano,
		Faturamento_MM,
		SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Soma Móvel'
	FROM
		Resultado
*/



-- -> Cálculo de Acumulado:
/*
	Estrutura Base:
		SUM(coluna_de_numeros) OVER(ORDER BY coluna_ordenada ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
*/
-- Ex:
/*
	SELECT
		Data_Fechamento,
		Mes_Ano,
		Faturamento_MM,
		SUM(Faturamento_MM) OVER(ORDER BY Data_Fechamento ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Acumulado'
	FROM
		Resultado
*/



-- -> Funções de Offset:
/*
	* LAG: Permite retornar o valor da linha anterior.
	* LEAD: Permite retornar o valor da linha posterior.
	
	Estrutura Base:
		[LAG/LEAD](valor_para_desloc, qtd_linhas_acessar, valor_senao_encontrar) OVER(ORDER BY coluna_de_ordenamento) 

	* FIRST_VALUE: Retorna o primeiro valor de uma coluna em uma determinada ordenação.
	* LAST_VALUE: Retorna o último valor de uma coluna em uma determinada ordenação.

	Estrutura Base:
		FIRST_VALUE(Coluna) OVER(ORDER BY coluna_ordenada),

		LAST_VALUE(Coluna) OVER(ORDER BY coluna_ordenada ROWS BETWEEN UNBOUNDED AND UNBOUNDED FOLLOWING),
*/



-- -> Cálculo MoM (Month over Month): Cálculo de variação de crescimento ao mês.
/*
	Estrutura Base:
		FORMAT((valor_mes_atual / LAG(valor_mes_anterior, 1) OVER(ORDER BY coluna_de_ordenamento)) - 1, '0.00%')
*/

