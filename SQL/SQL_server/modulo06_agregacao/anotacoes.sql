-- -> COUNT: Retorna a contagem valores de uma determinada coluna.
SELECT
	COUNT(ProductName) AS 'Total de Produtos',
	COUNT(Size) AS 'Total de Tamanhos'
	-- N�o contabiliza as c�lulas NULL.
FROM
	DimProduct

-- * COUNT + DISNTINCT
SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores'
FROM
	DimProduct


-- -> SUM: Retorna a soma dos valores de determinada coluna.
SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) As 'Total Devolvido'
FROM 
	FactSales


-- -> MIN: Retorna o m�nimo de uma coluna.
-- -> MAX: Retorna o m�ximo de uma colna
SELECT
	MAX(UnitPrice) AS 'M�x. do Pre�o Unit.',
	MIN(UnitPrice) AS 'M�n. do Pre�o Unit.'
FROM
	DimProduct


-- -> AVG: Retorna a m�dia dos valores de uma coluna.
SELECT
	AVG(YearlyIncome) AS 'M�d. de Ganho Anual'
FROM
	DimCustomer
