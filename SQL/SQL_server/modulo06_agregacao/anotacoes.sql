-- -> COUNT: Retorna a contagem valores de uma determinada coluna.
SELECT
	COUNT(ProductName) AS 'Total de Produtos',
	COUNT(Size) AS 'Total de Tamanhos'
	-- Não contabiliza as células NULL.
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


-- -> MIN: Retorna o mínimo de uma coluna.
-- -> MAX: Retorna o máximo de uma colna
SELECT
	MAX(UnitPrice) AS 'Máx. do Preço Unit.',
	MIN(UnitPrice) AS 'Mín. do Preço Unit.'
FROM
	DimProduct


-- -> AVG: Retorna a média dos valores de uma coluna.
SELECT
	AVG(YearlyIncome) AS 'Méd. de Ganho Anual'
FROM
	DimCustomer
