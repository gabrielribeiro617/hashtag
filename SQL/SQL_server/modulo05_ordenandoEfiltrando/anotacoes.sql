-- * ORDER BY: Ordena determinada coluna de forma ascendente.
-- -> Seleciona duas colunas da tabela DimProduct, ordenando a 
--		coluna ProductName de forma ascendente.
SELECT
	ProductName, 
	UnitPrice 
FROM 
	DimProduct
ORDER BY
	ProductName


-- * ORDER BY DESC: Ordena determinada coluna de forma descendente.
-- -> Seleciona duas colunas da tabela DimProduct, ordenando a coluna
--		UnitPrice de forma descendente.
SELECT
	ProductName, 
	UnitPrice 
FROM 
	DimProduct
ORDER BY
	UnitPrice DESC


-- * WHERE: Comando de Filtragem.
-- Ex 1 - colunas de números
SELECT
	ProductName, 
	UnitPrice 
FROM 
	DimProduct
WHERE UnitPrice >= 1000

-- Ex 2 - colunas de texto
SELECT
	BrandName 
FROM 
	DimProduct
WHERE BrandName = 'Fabrikam'

-- Ex 3 - colunas de datas
SELECT * FROM DimCustomer
WHERE BirthDate >= '1970-12-31'


-- Ex 4 - AND
SELECT
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct
WHERE BrandName = 'Fabrikam' AND ColorName = 'Black'
ORDER BY ProductName 


-- Ex 5 - OR
SELECT
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct
WHERE BrandName = 'Contoso' OR ColorName = 'White'
ORDER BY ProductName 


-- Ex 6 - NOT
SELECT * FROM DimEmployee
WHERE NOT DepartmentName = 'Marketing'


-- Ex 7 - OR e AND
SELECT * FROM DimProduct
WHERE (ColorName = 'Black' OR ColorName = 'Red') AND BrandName = 'Fabrikam'


-- Ex 8 - IN -> Alternativa ao OR para múltiplas condições
SELECT * FROM DimProduct
WHERE ColorName IN ('Black', 'Red', 'Silver', 'Blue')


-- Ex 9 - LIKE
SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 Player%'
-- OU
SELECT * FROM DimProduct
WHERE ProductDescription LIKE 'Type%'


-- Ex 10 - BETWEEN
SELECT * FROM DimProduct
WHERE UnitPrice BETWEEN 50 AND 100
-- OU
SELECT * FROM DimProduct
WHERE UnitPrice NOT BETWEEN 50 AND 100


-- Ex 11 - IS NULL e IS NOT NULL
SELECT * FROM DimCustomer
WHERE CompanyName IS NULL
-- OU
SELECT * FROM DimCustomer
WHERE CompanyName IS NOT NULL


