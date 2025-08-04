-- -> EXERCÍCIO 1:
SELECT * FROM DimProduct
-- A:
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	CASE
		WHEN ClassName = 'Economy'
			THEN '5%'
		WHEN ClassName = 'Regular'
			THEN '7%'
		ELSE '9%'
	END AS '% Desconto',
	CASE
		WHEN ClassName = 'Economy'
			THEN UnitPrice * 1.05
		WHEN ClassName = 'Regular'
			THEN UnitPrice * 1.07
		ELSE UnitPrice * 1.09
	END AS 'Preço com Desconto'
FROM
	DimProduct

-- B:
DECLARE @varDescontEconomy FLOAT = 0.05,
		@varDescontoRegular FLOAT = 0.07,
		@varDescontoDeluxe FLOAT = 0.09

SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	CASE
		WHEN ClassName = 'Economy'
			THEN @varDescontEconomy
		WHEN ClassName = 'Regular'
			THEN @varDescontoRegular
		ELSE @varDescontoDeluxe
	END AS '% Desconto',
	CASE
		WHEN ClassName = 'Economy'
			THEN UnitPrice * (1 + @varDescontEconomy)
		WHEN ClassName = 'Regular'
			THEN UnitPrice * (1 + @varDescontoRegular)
		ELSE UnitPrice * (1 + @varDescontoDeluxe)
	END AS 'Preço com Desconto'
FROM
	DimProduct



-- -> EXERCÍCIO 2:
SELECT * FROM DimProduct

SELECT
	BrandName AS 'Marca',
	COUNT(ProductName) AS 'Qtd. de Produtos',
	CASE
		WHEN COUNT(ProductName) >= 500
			THEN 'A'
		WHEN COUNT(ProductName) >= 100
			THEN 'B'
		ELSE 'C'
	END AS 'Categoria'
FROM
	DimProduct
GROUP BY BrandName



-- -> EXERCÍCIO 3:
SELECT * FROM DimStore

SELECT
	StoreName AS 'Loja',
	EmployeeCount AS 'Qtd. Funcionários',
	CASE
		WHEN EmployeeCount > 50
			THEN 'Acima de 50 funcionários'
		WHEN EmployeeCount >= 40
			THEN 'Entre 40 e 50 funcionários'
		WHEN EmployeeCount >= 30
			THEN 'Entre 30 e 40 funcionários'
		WHEN EmployeeCount >= 20
			THEN 'Entre 20 e 30 funcionários'
		WHEN EmployeeCount >= 10
			THEN 'Entre 10 e 20 funcionários'
		ELSE 'Abaixo de 10 funcionários'
	END
FROM
	DimStore



-- -> EXERCÍCIO 4:
SELECT * FROM DimProduct

SELECT
	ProductSubcategoryName AS 'Subcategoria',
	ROUND(AVG(Weight) * 100, 2) AS 'Peso Total',
	CASE
		WHEN ROUND(AVG(Weight) * 100, 2) * 100 < 1000
			THEN 'Rota 1'
		ELSE 'Rota 2'
	END AS 'Rota'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY ProductSubcategoryName



-- -> EXERCÍCIO 5:
SELECT * FROM DimCustomer

SELECT
	FirstName AS 'Nome',
	Gender AS 'Sexo',
	TotalChildren AS 'Qtd. Filhos',
	EmailAddress AS 'E-mail',
	CASE
		WHEN Gender = 'F' AND TotalChildren > 0
			THEN 'Sorteio Mãe do Ano'
		WHEN Gender = 'M' AND TotalChildren > 0
			THEN 'Sorteio Pai do Ano'
		ELSE 'Caminhão de Prêmios'
	END AS 'Ação de Marketing'
FROM
	DimCustomer	
WHERE FirstName IS NOT NULL AND Gender IS NOT NULL AND TotalChildren IS NOT NULL AND EmailAddress IS NOT NULL



-- -> EXERCÍCIO 6:
SELECT * FROM DimStore

DECLARE @varDataAtual DATETIME = GETDATE()

SELECT
	StoreKey AS 'ID',
	StoreName AS 'Loja',
	CASE
		WHEN CloseDate IS NULL
			THEN DATEDIFF(DAY, OpenDate, @varDataAtual)
		ELSE DATEDIFF(DAY, OpenDate, CloseDate)
	END AS 'Tempo de Atividade'
FROM
	DimStore



