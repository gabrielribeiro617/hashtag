-- -> EXERCÍCIO 1:
-- A:
GO
CREATE VIEW vwProdutos AS
SELECT
	ProductName AS 'Produto',
	ColorName AS 'Cor',
	UnitPrice AS 'Preço Unitário',
	UnitCost AS 'Custo Unitário'
FROM
	DimProduct
GO

-- B:
GO
CREATE VIEW vwFuncionarios AS
SELECT
	FirstName AS 'Nome',
	BirthDate AS 'Data de Nascimento',
	DepartmentName AS 'Departamento'
FROM
	DimEmployee
GO

-- C:
GO
CREATE VIEW vwLojas AS
SELECT
	StoreKey AS 'ID Loja',
	StoreName AS 'Loja',
	OpenDate AS 'Data de Abertura'
FROM
	DimStore
GO



-- -> EXERCÍCIO 2:
GO
CREATE VIEW vwClientes AS
SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	CASE
		WHEN Gender = 'M'
			THEN 'Masculino'
		ELSE 'Feminino'
	END AS 'Gênero',
	EmailAddress AS 'E-mail',
	FORMAT(YearlyIncome, 'C') AS 'Renda Anual'
FROM
	DimCustomer
GO



-- -> EXERCÍCIO 3:
-- A:
GO
CREATE VIEW vwLojasAtivas AS
SELECT
	*
FROM
	DimStore
WHERE Status = 'On'
GO

-- B:
GO
CREATE VIEW vwFuncionariosMkt AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	DepartmentName AS 'Departamento'
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing'
GO

-- C:
GO
CREATE VIEW vwContosoLitwareSilver AS
SELECT
	*
FROM
	DimProduct
WHERE BrandName IN ('Contoso', 'Litware') AND ColorName = 'Silver'
GO



-- -> EXERCÍCIO 4:
GO
CREATE VIEW vwTotalVendidoProdutos AS
SELECT
	ProductName AS 'Produto',
	SUM(SalesQuantity) AS 'Qtd. Vendas'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ProductName
GO



-- -> EXERCÍCIO 5:
-- A:
SELECT * FROM vwProdutos

GO
ALTER VIEW vwProdutos AS
SELECT
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor',
	UnitPrice AS 'Preço Unitário',
	UnitCost AS 'Custo Unitário'
FROM
	DimProduct
GO

-- B:
SELECT * FROM vwFuncionarios

GO
ALTER VIEW vwFuncionarios AS
SELECT
	FirstName AS 'Nome',
	BirthDate AS 'Data de Nascimento',
	DepartmentName AS 'Departamento'
FROM
	DimEmployee
WHERE Gender = 'F'
GO

-- C:
SELECT * FROM vwLojas

GO
ALTER VIEW vwLojas AS
SELECT
	StoreKey AS 'ID Loja',
	StoreName AS 'Loja',
	OpenDate AS 'Data de Abertura'
FROM
	DimStore
WHERE Status = 'On'
GO



-- -> EXERCÍCIO 6:
-- A:
GO
CREATE VIEW vw_6a AS
SELECT
	BrandName AS 'Marca',
	COUNT(ProductName) AS 'Qtd. Produtos'
FROM
	DimProduct
GROUP BY BrandName
GO

-- B:
SELECT * FROM vw_6a

GO
ALTER VIEW vw_6a AS
SELECT
	BrandName AS 'Nome da Marca',
	COUNT(ProductName) AS 'Total de Produtos',
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
GROUP BY BrandName
GO

-- C:
GO
DROP VIEW vw_6a
GO


