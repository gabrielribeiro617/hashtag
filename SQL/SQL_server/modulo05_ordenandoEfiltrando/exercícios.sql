-- Exercício 1
SELECT 
	TOP(100) * 
FROM 
	FactSales
ORDER BY SalesAmount DESC


-- Exercício 2
SELECT 
	TOP(10) * 
FROM 
	DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC


-- Exercício 3
SELECT 
	ProductName AS 'Produto',
	Weight AS 'Peso'
FROM 
	DimProduct
WHERE Weight >= 100
ORDER BY Weight DESC


-- Exercício 4
SELECT
	StoreName AS 'Loja',
	OpenDate AS 'Data de Abertura',
	EmployeeCount AS 'Qtd. Funcionários'
FROM 
	DimStore
WHERE Status = 'On'
ORDER BY StoreName


-- Exercício 5
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	AvailableForSaleDate AS 'Disponibilização'
FROM 
	DimProduct
WHERE BrandName = 'Litware' AND ProductName LIKE '%Home Theater%' AND AvailableForSaleDate = '20090315'
ORDER BY ProductKey


-- Exercício 6
-- A
SELECT * FROM DimStore
WHERE Status = 'Off'

-- B
SELECT * FROM DimStore
WHERE CloseDate IS NOT NULL


-- Exercício 7
-- Categoria 1
SELECT * FROM DimStore
WHERE EmployeeCount BETWEEN 1 AND 20

-- Categoria 2
SELECT *FROM DimStore
WHERE EmployeeCount BETWEEN 21 AND 50

-- Categoria 3
SELECT * FROM DimStore
WHERE EmployeeCount > 50


-- Exercício 8
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice AS 'Preço'
FROM 
	DimProduct
WHERE ProductName LIKE '%LCD%'
ORDER BY ProductName


-- Exercício 9
SELECT * FROM DimProduct
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')
ORDER BY ProductName


-- Exercício 10
SELECT
	*
FROM
	DimProduct
WHERE BrandName = 'Contoso' AND ColorName = 'Silver' AND UnitPrice BETWEEN 10 AND 30
ORDER BY ProductName