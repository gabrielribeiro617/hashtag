-- EXERC�CIO 1
SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales



-- EXERC�CIO 2
SELECT
	AVG(YearlyIncome) AS 'M�dia Anual do Sal�rio'
FROM
	DimCustomer
WHERE Occupation = 'Professional'



-- EXERC�CIO 3
SELECT * FROM DimStore
-- A
SELECT
	MAX(EmployeeCount) AS 'Maior Qtd. de Funcion�rios'
FROM
	DimStore

-- B
SELECT
	TOP(1) StoreName
FROM
	DimStore
ORDER BY EmployeeCount DESC

-- C
SELECT
	MIN(EmployeeCount) AS 'Menor Qtd. de Funcion�rios'
FROM
	DimStore

-- D
SELECT
	TOP(1) StoreName
FROM
	DimStore
ORDER BY EmployeeCount ASC



-- EXERC�CIO 4
SELECT * FROM DimEmployee
-- A
-- Masculinos
SELECT
	COUNT(Gender) AS 'Total de Masculinos'
FROM
	DimEmployee
WHERE Gender = 'M'

-- Femininos
SELECT
	COUNT(Gender) AS 'Total de Femininos'
FROM
	DimEmployee
WHERE Gender = 'F'

-- B
-- Funcion�rio
SELECT TOP(1)
	FirstName AS 'Primeiro Nome',
	LastName AS '�ltimo Nome',
	EmailAddress AS 'E-mail',
	HireDate AS 'Data de Contrata��o'
FROM
	DimEmployee
	WHERE Gender = 'M'
ORDER BY HireDate ASC

-- Funcion�ria
SELECT TOP(1)
	FirstName AS 'Primeiro Nome',
	LastName AS '�ltimo Nome',
	EmailAddress AS 'E-mail',
	HireDate AS 'Data de Contrata��o'
FROM
	DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC



-- EXERC�CIO 5
SELECT * FROM DimProduct
-- 
SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores',
	COUNT(DISTINCT BrandName) AS 'Qtd. de Marcas',
	COUNT(DISTINCT ClassName) AS 'Qtd. de Classes'
FROM
	DimProduct