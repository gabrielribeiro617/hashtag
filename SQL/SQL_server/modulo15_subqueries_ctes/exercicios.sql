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






-- -> EXERC�CIO 4:



-- -> EXERC�CIO 5:



-- -> EXERC�CIO 6:



-- -> EXERC�CIO 7:



-- -> EXERC�CIO 8:



-- -> EXERC�CIO 9:



-- -> EXERC�CIO 10:



