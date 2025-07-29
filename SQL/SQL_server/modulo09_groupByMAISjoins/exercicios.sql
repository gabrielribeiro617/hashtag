-- -> EXERCÍCIO 1:
-- * A
select * from FactSales
select * from DimChannel

SELECT
	ChannelName AS 'Canal',
	COUNT(SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY COUNT(SalesQuantity) DESC

-- * B
select * from FactSales
select * from DimStore

SELECT
	StoreName AS 'Loja',
	COUNT(SalesQuantity) AS 'Qtd. Vendida',
	COUNT(ReturnQuantity) AS 'Qtd. Devolvida'
FROM
	FactSales
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName
ORDER BY StoreName

-- * C
select * from FactSales
select * from DimDate

SELECT
	CalendarMonthLabel,
	CalendarYear,
	SUM(SalesAmount) AS 'Total Vendido'
FROM
	FactSales
INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
GROUP BY CalendarMonthLabel, CalendarYear
ORDER BY SUM(SalesAmount) DESC


-- -> EXERCÍCIO 2:
select * from FactSales
select * from DimProduct

SELECT
	ProductName,
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ProductName
ORDER BY SUM(SalesQuantity) DESC

-- * A
SELECT
	ColorName,
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
ORDER BY SUM(SalesQuantity) DESC

-- * B
SELECT
	ColorName,
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
HAVING SUM(SalesQuantity) > 3000000
ORDER BY SUM(SalesQuantity) DESC



-- -> EXERCÍCIO 3:
select * from FactSales
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductCategoryName,
	COUNT(SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
	INNER JOIN DimProductSubcategory
		ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
GROUP BY ProductCategoryName
ORDER BY COUNT(SalesQuantity)



-- -> EXERCÍCIO 4:
-- * A
select * from FactOnlineSales
select * from DimCustomer

SELECT TOP(1)
	DimCustomer.CustomerKey AS 'ID Cliente',
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	SUM(SalesQuantity) AS 'Qtd. Compras'
FROM
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY DimCustomer.CustomerKey, FirstName, LastName
HAVING FirstName IS NOT NULL AND LastName IS NOT NULL
ORDER BY SUM(SalesQuantity) DESC

-- * B
SELECT TOP(10)
	ProductName AS 'Produto',
	SUM(SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactOnlineSales
INNER JOIN DimProduct
	ON FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE CustomerKey = 7665
GROUP BY ProductName
ORDER BY SUM(SalesQuantity) DESC



-- -> EXERCÍCIO 5:
select * from FactOnlineSales
select * from DimCustomer

SELECT
	Gender AS 'Gênero',
	SUM(SalesQuantity) AS 'Total de Compras'
FROM
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
GROUP BY Gender
HAVING Gender IS NOT NULL
ORDER BY SUM(SalesQuantity) DESC



-- -> EXERCÍCIO 6:
select * from FactExchangeRate
select * from DimCurrency

SELECT
	CurrencyDescription,
	AVG(AverageRate) AS 'Média da Taxa de Câmbio'
FROM
	FactExchangeRate
INNER JOIN DimCurrency
	ON FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
GROUP BY CurrencyDescription
HAVING AVG(AverageRate) BETWEEN 10 AND 100
ORDER BY AVG(AverageRate) DESC



-- -> EXERCÍCIO 7:
select top(100) * from FactStrategyPlan
select * from DimScenario

SELECT
	ScenarioName,
	SUM(Amount) AS 'Total de Quantia'
FROM
	FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
GROUP BY ScenarioName
HAVING ScenarioName <> 'Forecast'
ORDER BY SUM(Amount) DESC



-- -> EXERCÍCIO 8:
select * from FactStrategyPlan
select * from DimDate

SELECT
	CalendarYear AS 'Ano',
	SUM(Amount) AS 'Total de Quantia'
FROM
	FactStrategyPlan
INNER JOIN DimDate
	ON FactStrategyPlan.Datekey = DimDate.Datekey
GROUP BY CalendarYear
ORDER BY SUM(Amount) DESC



-- -> EXERCÍCIO 9:
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductSubcategoryName AS 'Subcategoria',
	COUNT(*) AS 'Qtd. de Produtos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE BrandName = 'Contoso' AND ColorName = 'Silver'
GROUP BY ProductSubcategoryName
ORDER BY COUNT(*) DESC



-- -> EXERCÍCIO 10:
select * from DimProduct
select * from DimProductSubcategory

SELECT
	BrandName AS 'Marca',
	ProductSubcategoryName AS 'Subcategoria',
	COUNT(*) AS 'Qtd. de Produtos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	On DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey
GROUP BY BrandName, ProductSubcategoryName
ORDER BY BrandName ASC



