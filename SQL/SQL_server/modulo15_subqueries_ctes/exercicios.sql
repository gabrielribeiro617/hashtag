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






-- -> EXERCÍCIO 4:



-- -> EXERCÍCIO 5:



-- -> EXERCÍCIO 6:



-- -> EXERCÍCIO 7:



-- -> EXERCÍCIO 8:



-- -> EXERCÍCIO 9:



-- -> EXERCÍCIO 10:



