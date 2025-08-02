-- EXERC�CIO 1:
SELECT * FROM DimProduct
-- A:
SELECT
	ProductName AS 'Produto',
	LEN(ProductName) AS 'Qtd. de Caracteres'
FROM
	DimProduct
ORDER BY LEN(ProductName) DESC

-- B:
SELECT
	AVG(LEN(ProductName)) AS 'Qtd. M�dia de Caracteres'
FROM
	DimProduct

-- C:
SELECT
	REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, '') AS 'Produtos'
FROM
	DimProduct

-- D:
SELECT
	AVG(LEN(REPLACE(REPLACE(ProductName, BrandName, ''), ColorName, ''))) AS 'Qtd. de Caracteres'
FROM
	DimProduct



-- EXERC�CIO 2:
SELECT * FROM DimProduct
SELECT
	TRANSLATE(StyleName, '0123456789', 'ABCDEFGHIJ') AS 'StyleName'
FROM
	DimProduct



-- EXERC�CIO 3:
SELECT * FROM DimEmployee

SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	EmailAddress AS 'E-mail',
	SUBSTRING(EmailAddress, 0, CHARINDEX('@', EmailAddress)) AS 'ID do E-mail',
	CONCAT(UPPER(FirstName), DAY(BirthDate)) AS 'Senha'
FROM
	DimEmployee



-- EXERC�CIO 4:
SELECT * FROM DimCustomer
SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	EmailAddress AS 'E-mail',
	AddressLine1 AS 'Endere�o',
	DateFirstPurchase 'Data da Primeira Compra'
FROM
	DimCustomer
WHERE YEAR(DateFirstPurchase) = '2001'


-- EXERC�CIO 5:
SELECT * FROM DimEmployee
SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	EmailAddress AS 'E-mail',
	HireDate AS 'Data de Contrata��o',
	DAY(HireDate) AS 'Dia de Contrata��o',
	FORMAT(HireDate, 'MMMM', 'pt-BR') AS 'M�s de Contrata��o',
	YEAR(HireDate) AS 'Ano de Contrata��o'
FROM
	DimEmployee



-- EXERC�CIO 6:
SELECT * FROM DimStore
SELECT
	StoreName AS 'Loja',
	OpenDate AS 'Data de Abertura',
	DATEDIFF(DAY, OpenDate, GETDATE()) AS 'Dias de Atividade'
FROM
	DimStore
WHERE CloseDate IS NULL

