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
select * from DimCustomer

SELECT TOP(100)
	CustomerKey,
	CompanyName
FROM
	DimCustomer
WHERE CustomerKey = (
					SELECT
						CustomerKey
					FROM
						FactOnlineSales
					WHERE 
						COUNT(OnlineSalesKey) >= 3000
					GROUP BY ProductKey







-- -> EXERCÍCIO 7:



-- -> EXERCÍCIO 8:



-- -> EXERCÍCIO 9:



-- -> EXERCÍCIO 10:



