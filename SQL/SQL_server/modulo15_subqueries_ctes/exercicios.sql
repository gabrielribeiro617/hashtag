-- -> EXERC�CIO 1:
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



-- -> EXERC�CIO 2:
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



-- -> EXERC�CIO 3:
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



-- -> EXERC�CIO 4:
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



-- -> EXERC�CIO 5:
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



-- -> EXERC�CIO 6:
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



-- -> EXERC�CIO 7:
SELECT
	ProductKey,
	ProductName,
	BrandName,
	UnitPrice,
	(SELECT AVG(UnitPrice) FROM DimProduct) AS 'M�dia de UnitPrice'
FROM
	DimProduct



-- -> EXERC�CIO 8:
SELECT
	MAX(Quantidade) AS 'M�ximo',
	MIN(Quantidade) AS 'M�nimo',
	AVG(Quantidade) AS 'M�dia'
FROM
	(
		SELECT
			BrandName,
			COUNT(*) AS 'Quantidade'
		FROM
			DimProduct
		GROUP BY BrandName
	) AS T



-- -> EXERC�CIO 9:
WITH CTE_QtdProdutosPorMarca AS (
	SELECT
		BrandName AS 'Marca',
		COUNT(*) AS 'Quantidade'
	FROM
		DimProduct
	GROUP BY BrandName
)

SELECT MAX(Quantidade) AS 'M�xima' FROM CTE_QtdProdutosPorMarca



-- -> EXERC�CIO 10:
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


