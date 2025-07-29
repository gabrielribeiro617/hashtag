-- -> GROUP BY: Agrupa linhas com valores iguais em colunas específicas para aplicar funções de agregação.
-- Ex 1
SELECT
	BrandName AS 'Marca',
	COUNT(*) AS 'Qtd. Total'
FROM
	DimProduct
GROUP BY BrandName

-- Ex 2
SELECT
	StoreType AS 'Tipo de Loja',
	SUM(EmployeeCount) AS 'Soma da Loja'
FROM
	DimStore
GROUP BY StoreType

-- Ex 3
SELECT
	BrandName AS 'Marca',
	AVG(UnitPrice) AS 'Média d Preço'
FROM
	DimProduct
GROUP BY BrandName

-- Ex 4
select * from DimProduct
SELECT
	ClassName AS 'Classe',
	MAX(UnitPrice) AS 'Preço Máximo'
FROM
	DimProduct
GROUP BY ClassName



-- -> GOUP BY + ORDER BY:
select * from DimStore
SELECT
	StoreType AS 'Tipo de Loja',
	SUM(EmployeeCount) AS Total_de_Funcionários
FROM 
	DimStore
GROUP BY StoreType
ORDER BY Total_de_Funcionários DESC



-- -> GROUP BY + WHERE:
select * from DimProduct
SELECT
	ColorName AS 'Cor do Produto',
	COUNT(ProductName) AS Total_de_Produtos
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY ColorName
ORDER BY Total_de_Produtos DESC



-- -> HAVING:
select * from DimProduct
SELECT
	BrandName AS 'Marca',
	COUNT(ProductName) AS Qtd_Produtos
FROM
	DimProduct
GROUP BY BrandName
HAVING COUNT(ProductName) >= 200
ORDER BY Qtd_Produtos DESC



-- -> HAVING vs. WHERE:
select * from DimProduct
SELECT
	BrandName AS 'Marca',
	COUNT(BrandName) AS Total_Marca
FROM 
	DimProduct
WHERE ClassName = 'Economy'     -- Filtra a tabela original, antes do agrupamento.
GROUP BY BrandName
HAVING COUNT(BrandName) >= 50  -- Filtra a tabela depois de agrupada.
ORDER BY Total_Marca DESC