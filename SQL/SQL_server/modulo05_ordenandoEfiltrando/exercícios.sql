-- Exerc�cio 1
SELECT 
	TOP(100) * 
FROM 
	FactSales
ORDER BY SalesAmount DESC


-- Exerc�cio 2
SELECT 
	TOP(10) * 
FROM 
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC


-- Exerc�cio 3
SELECT 
	ProductName AS 'Produto',
	Weight AS 'Peso'
FROM 
	DimProduct
WHERE Weight >= 100
ORDER BY Weight DESC


-- Exerc�cio 4
SELECT
	StoreName AS 'Loja',
	OpenDate AS 'Data de Abertura',
	EmployeeCount AS 'Qtd. Funcion�rios'
FROM 
	DimStore
WHERE Status = 'On'
ORDER BY StoreName


-- Exerc�cio 5
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	AvailableForSaleDate AS 'Disponibiliza��o'
FROM 
	DimProduct
WHERE BrandName = 'Litware' AND ProductName LIKE '%Home Theater%' AND AvailableForSaleDate = '20090315'
ORDER BY ProductKey


-- Exerc�cio 6
-- A
SELECT * FROM DimStore
WHERE Status = 'Off'

-- B
SELECT * FROM DimStore
WHERE CloseDate IS NOT NULL


-- Exerc�cio 7
-- Categoria 1
SELECT * FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20

-- Categoria 2
SELECT *FROM DimStore
WHERE EmployeeCount BETWEEN 21 AND 50

-- Categoria 3
SELECT * FROM DimStore
WHERE EmployeeCount > 50


-- Exerc�cio 8
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice AS 'Pre�o'
FROM 
	DimProduct
WHERE ProductName LIKE '%LCD%'
ORDER BY ProductName


-- Exerc�cio 9
SELECT * FROM DimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')
ORDER BY ProductName


-- Exerc�cio 10
SELECT
	*
FROM
	DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY ProductName