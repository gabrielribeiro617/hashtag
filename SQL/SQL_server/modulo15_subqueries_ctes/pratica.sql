-- Exemplo 1: WHERE
SELECT
	*
FROM
	DimProduct
WHERE UnitCost >= (SELECT AVG(UnitCost) FROM DimProduct)



-- Exemplo 2: WHERE
SELECT
	*
FROM
	DimProduct
WHERE ProductSubcategoryKey = (
	SELECT 
		ProductSubcategoryKey 
	FROM 
		DimProductSubcategory
	WHERE ProductSubcategoryName = 'Televisions'
)



-- Exemplo 3: WHERE
SELECT
	*
FROM
	FactSales
WHERE StoreKey IN (
	SELECT 
		StoreKey 
	FROM 
		DimStore
	WHERE EmployeeCount >= 100
)



-- Exemplo 4:
CREATE TABLE funcionarios(
	id_funcionario INT,
	nome VARCHAR(50),
	idade INT,
	sexo VARCHAR(50))

INSERT INTO funcionarios(id_funcionario, nome, idade, sexo)
VALUES
	(1, 'Julia'  , 20, 'F'),
	(2, 'Daniel' , 21, 'M'),
	(3, 'Amanda' , 22, 'F'),
	(4, 'Pedro'  , 23, 'M'),
	(5, 'André'  , 24, 'M'),
	(6, 'Luisa'  , 25, 'F')

SELECT * FROM funcionarios

-- Selecione os funcionários do sexo masculino (MAS, usando a coluna de IDADE):

-- Usando o ANY (mais usado):
SELECT
	*
FROM
	funcionarios
WHERE idade > ANY (
	SELECT
		idade
	FROM
		funcionarios
	WHERE sexo = 'M'
)

-- Usando o SOME:
SELECT
	*
FROM
	funcionarios
WHERE idade > SOME (
	SELECT
		idade
	FROM
		funcionarios
	WHERE sexo = 'M'
)

-- Usando ALL:
SELECT
	*
FROM
	funcionarios
WHERE idade > ALL (
	SELECT
		idade
	FROM
		funcionarios
	WHERE sexo = 'M'
)



-- EXISTS:
SELECT
	ProductKey,
	ProductName
FROM
	DimProduct
WHERE EXISTS(
	SELECT
		ProductKey
	FROM
		FactSales
	WHERE 
		DateKey = '01/01/2007'
		AND FactSales.ProductKey = DimProduct.ProductKey
)



-- Exemplo usando SELECT:
SELECT
	ProductKey,
	ProductName,
	(SELECT 
		COUNT(ProductKey) 
	FROM 
		FactSales 
	WHERE 
		FactSales.ProductKey = DimProduct.ProductKey) AS 'Qtd. Vendas'
FROM
	DimProduct



-- Exemplo usando FROM:
SELECT
	COUNT(*) AS 'Qtd. Produtos'
FROM
	(SELECT * FROM DimProduct WHERE BrandName = 'Contoso') As T



-- 
SELECT
	MAX(YearlyIncome) AS 'Maior Salário'
FROM
	DimCustomer
WHERE CustomerType = 'Person'

--


-- Subquery aninhada:
SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM
	DimCustomer
WHERE YearlyIncome = (
		SELECT
			MAX(YearlyIncome)
		FROM
			DimCustomer
		WHERE YearlyIncome < (
				SELECT
					MAX(YearlyIncome)
				FROM
					DimCustomer
				WHERE CustomerType = 'Person'
				)
		)



-- Criando CTE's:
WITH produtos_contoso(ID_Produto, Produto, Marca) AS (
SELECT
	ProductKey,
	ProductName,
	BrandName
FROM
	DimProduct
WHERE BrandName = 'Contoso'
),
vendas_top100(ID_Venda, ID_Produto, ID_Data, Qtd_Vendas) AS (
SELECT TOP(100)
	SalesKey,
	ProductKey,
	DateKey,
	SalesQuantity
FROM
	FactSales
ORDER BY DateKey DESC
)

SELECT * FROM vendas_top100
INNER JOIN produtos_contoso
	ON vendas_top100.ID_Produto = produtos_contoso.ID_Produto