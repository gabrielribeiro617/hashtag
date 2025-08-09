-- -> EXERCÍCIO 1:
SELECT
	*
FROM
	FactSales
WHERE StoreKey = (
	SELECT
		StoreKey
	FROM
		DimStore
	WHERE 
		StoreName = 'Contoso Orlando Store'
		AND FactSales.StoreKey = DimStore.StoreKey
)



-- -> EXERCÍCIO 2:
-- A e B:
SELECT
	ProductKey,
	ProductName,
	UnitPrice,
	(SELECT UnitPrice FROM DimProduct WHERE ProductKey = 1893) AS 'UnitPrice ID 1893'
FROM
	DimProduct
WHERE UnitPrice >= (
	SELECT
		UnitPrice
	FROM
		DimProduct
	WHERE ProductKey = 1893
)



-- -> EXERCÍCIO 3:
SELECT
	*
FROM
	DimEmployee
WHERE DepartmentName = (
	SELECT
		DepartmentName
	FROM
		DimEmployee
	WHERE 
		FirstName = 'Miguel'	
		AND LastName = 'Severino'
)



-- -> EXERCÍCIO 4:
select * from DimCustomer

SELECT
	CustomerKey,
	FirstName,
	LastName,
	EmailAddress,
	YearlyIncome
FROM
	DimCustomer
WHERE 
	YearlyIncome > (
	SELECT
		AVG(YearlyIncome)
	FROM
		DimCustomer
	WHERE CustomerType = 'Person'
)



-- -> EXERCÍCIO 5:
SELECT * FROM FactOnlineSales

SELECT * FROM DimPromotion where PromotionName = 'Asian Holiday Promotion'

SELECT
	OnlineSalesKey,
	CustomerKey,
	PromotionKey
FROM
	FactOnlineSales
WHERE PromotionKey = ANY(
						SELECT
							PromotionKey
						FROM
							DimPromotion
						WHERE PromotionName = 'Asian Holiday Promotion'
					)



-- -> EXERCÍCIO 6:
SELECT
	CustomerKey,
	CompanyName
FROM
	DimCustomer
WHERE CustomerKey IN (
					SELECT
						CustomerKey
					FROM
						FactOnlineSales
					GROUP BY CustomerKey, ProductKey
					HAVING COUNT(*) >= 3000
	)



-- -> EXERCÍCIO 7:
SELECT
	ProductKey,
	ProductName,
	BrandName,
	UnitPrice,
	(SELECT AVG(UnitPrice) FROM DimProduct) AS 'Média de UnitPrice'
FROM
	DimProduct



-- -> EXERCÍCIO 8:
SELECT
	MAX(Quantidade) AS 'Máximo',
	MIN(Quantidade) AS 'Mínimo',
	AVG(Quantidade) AS 'Média'
FROM
	(
		SELECT
			BrandName,
			COUNT(*) AS 'Quantidade'
		FROM
			DimProduct
		GROUP BY BrandName
	) AS T



-- -> EXERCÍCIO 9:
WITH CTE_QtdProdutosPorMarca AS (
	SELECT
		BrandName AS 'Marca',
		COUNT(*) AS 'Quantidade'
	FROM
		DimProduct
	GROUP BY BrandName
)

SELECT MAX(Quantidade) AS 'Máxima' FROM CTE_QtdProdutosPorMarca



-- -> EXERCÍCIO 10:
GO
WITH CTE_ProdutosAdventureWorks AS (
	SELECT
		ProductKey,
		ProductName,
		ProductSubcategoryKey,
		BrandName,
		UnitPrice
	FROM
		DimProduct
	WHERE BrandName = 'Adventure Works'
),
CTE_CategoriaTelevisionERadio AS (
	SELECT
		ProductSubcategoryKey,
		ProductSubcategoryName
	FROM
		DimProductSubcategory
	WHERE ProductSubcategoryName IN ('Televisions', 'Monitors')
)


SELECT
	*
FROM
	CTE_ProdutosAdventureWorks
LEFT JOIN CTE_CategoriaTelevisionERadio
	ON CTE_ProdutosAdventureWorks.ProductSubcategoryKey = CTE_CategoriaTelevisionERadio.ProductSubcategoryKey
GO


