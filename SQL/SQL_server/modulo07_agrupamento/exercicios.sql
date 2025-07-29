-- -> EXERC�CIO 1
select * from FactSales
-- * A
SELECT 
	channelKey AS 'Canal de Vendas', 
	SUM(SalesQuantity) AS Total_Vendida
FROM 
	FactSales
GROUP BY channelKey

-- * B
SELECT 
	COUNT(SalesQuantity) AS Qtd_Vendida,
	COUNT(ReturnQuantity) AS Qtd_Devolvida
FROM
	FactSales

-- * C
SELECT 
	channelKey AS 'Canal de Venda',
	SUM(SalesAmount) AS Total_Vendido
FROM
	FactSales
WHERE DateKey = '2007'
GROUP BY channelKey
ORDER BY Total_Vendido DESC



-- -> EXERC�CIO 2
select * from FactSales
-- * A
SELECT 
	ProductKey AS 'ID do Produto',
	SUM(SalesAmount) AS Total_Vendido
FROM
	FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY Total_Vendido DESC

-- * B
SELECT TOP(10)
	ProductKey AS 'ID do Produto',
	SUM(SalesAmount) AS Total_Vendido
FROM
	FactSales
GROUP BY ProductKey
ORDER BY Total_Vendido DESC



-- -> EXERC�CIO 3
select * from FactOnlineSales
-- * A
SELECT TOP(1)
	CustomerKey AS 'ID Cliente',
	SUM(SalesQuantity) AS Total_de_Compras
FROM
	FactOnlineSales
GROUP BY CustomerKey
ORDER BY Total_de_Compras DESC

-- * B
SELECT TOP(3)
	ProductKey AS 'ID Produto',
	SUM(SalesQuantity) AS Total_de_Compras
FROM
	FactOnlineSales
GROUP BY ProductKey
ORDER BY Total_de_Compras DESC



-- -> EXERC�CIO 4
select * from DimProduct
-- * A
SELECT
	BrandName AS 'Marca',
	COUNT(ProductKey) AS Total_de_Produtos
FROM
	DimProduct
GROUP BY BrandName
ORDER BY Total_de_Produtos DESC

-- * B
SELECT
	ClassName AS 'Classe',
	AVG(UnitPrice) AS Media_de_Pre�o
FROM
	DimProduct
GROUP BY ClassName
ORDER BY Media_de_Pre�o DESC

-- * C
SELECT
	ColorName AS 'Cor',
	MAX(Weight) AS Peso_Maximo
FROM
	DimProduct
GROUP BY ColorName
ORDER BY Peso_Maximo DESC



-- -> EXERC�CIO 5
select * from DimProduct
SELECT
	StockTypeName AS 'Tipo de Produto',
	MAX(Weight) AS Peso_Maximo
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY Peso_Maximo DESC



-- -> EXERC�CIO 6
select * from DimProduct
SELECT
	BrandName AS 'Marca',
	COUNT(DISTINCT ColorName) AS Qtd_de_Cores
FROM
	DimProduct
GROUP BY BrandName
ORDER BY Qtd_de_Cores DESC



-- -> EXERC�CIO 7
select * from DimCustomer
SELECT
	Gender AS 'G�nero',
	COUNT(CustomerKey) AS Qtd_de_Clientes,
	AVG(YearlyIncome) AS Media_Salarial
FROM
	DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY Qtd_de_Clientes DESC



-- -> EXERC�CIO 8
select * from DimCustomer
SELECT
	Education AS 'N�vel Escolar',
	COUNT(CustomerKey) AS Qtd_de_Clientes,
	AVG(YearlyIncome) AS Media_Salarial
FROM
	DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education
ORDER BY Qtd_de_Clientes DESC



-- -> EXERC�CIO 9
select * from DimEmployee
SELECT
	DepartmentName AS 'Departamento',
	COUNT(EmployeeKey) AS Qtd_de_Funcionarios
FROM
	DimEmployee
WHERE EndDate IS NULL
GROUP BY DepartmentName
ORDER BY Qtd_de_Funcionarios DESC



-- -> EXERC�CIO 10
select * from DimEmployee
SELECT
	Title AS 'Cargo',
	SUM(VacationHours) AS Total_de_Horas
FROM
	DimEmployee
WHERE Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND HireDate BETWEEN '1999-01-01' AND '2000-12-31'
GROUP BY Title
ORDER BY Total_de_Horas DESC
