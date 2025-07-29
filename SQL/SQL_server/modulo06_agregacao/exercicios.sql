-- EXERCÍCIO 1
SELECT
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total Devolvido'
FROM
	FactSales



-- EXERCÍCIO 2
SELECT
	AVG(YearlyIncome) AS 'Média Anual do Salário'
FROM
	DimCustomer
WHERE Occupation = 'Professional'



-- EXERCÍCIO 3
SELECT * FROM DimStore
-- A
SELECT
	MAX(EmployeeCount) AS 'Maior Qtd. de Funcionários'
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
	MIN(EmployeeCount) AS 'Menor Qtd. de Funcionários'
FROM
	DimStore

-- D
SELECT
	TOP(1) StoreName
FROM
	DimStore
ORDER BY EmployeeCount ASC



-- EXERCÍCIO 4
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
-- Funcionário
SELECT TOP(1)
	FirstName AS 'Primeiro Nome',
	LastName AS 'Último Nome',
	EmailAddress AS 'E-mail',
	HireDate AS 'Data de Contratação'
FROM
	DimEmployee
	WHERE Gender = 'M'
ORDER BY HireDate ASC

-- Funcionária
SELECT TOP(1)
	FirstName AS 'Primeiro Nome',
	LastName AS 'Último Nome',
	EmailAddress AS 'E-mail',
	HireDate AS 'Data de Contratação'
FROM
	DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate ASC



-- EXERCÍCIO 5
SELECT * FROM DimProduct
-- 
SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd. de Cores',
	COUNT(DISTINCT BrandName) AS 'Qtd. de Marcas',
	COUNT(DISTINCT ClassName) AS 'Qtd. de Classes'
FROM
	DimProduct