-- -> Chave Primária: Coluna que identifica as informações distintas em uma tabela. Geralmente, é uma coluna de ID.
-- -> Chave Estrangeira: Coluna que permite relacionar as linhas de uma segunda tabela com a Chave Primária de uma primeira tabela.

-- -> Tabela Dimensão: Tabela que contém características de um determinado elemento: lojas, produtos, funcionários, clientes, etc. 
--    * Nenhum elemento se repete. 
--    * É onde encontramos as PK.
--    * Dim...

-- -> Tabela Fato: Tabela que vai regirtar os fatos ou acontecimentos de uma empresa/negócio em determinados períodos de tempo(vendas, devoluções, aberturas de chamados, receitas, despesas, etc).
--    * Geralmente é uma tabela com milhares de informações e composta essencialmene por colunas de ID usadas para buscar informações complementares de uma tabela dimensão, conhecidas como FK.
--    * Fact...

-- * Duas dimensões também podem se relacionar.
-- * O que não fazemos é uma relação entre duas fatos.


-- -> JOIN - Estrutura
/*
	SELECT
		Tabela_A.coluna1
		Tabela_A.coluna2
		Tabela_A.coluna3
		Tabela_B.coluna1
	FROM
		Tabela_A
	INNER JOIN Tabela_B
		ON Tabela_A.id_chave_estrangeira = Tabela_B.id_chave_primaria
*/


-- -> INNER JOIN: Retorna a interseção da Tabela A e B.
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID_Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- -> LEFT (OUTER) JOIN: Retorna a Tabela A e a Interseção da Tabela A e B.
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
LEFT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- -> RIGHT (OUTER) JOIN: Retorna a interseção da Tabela A e B e a Tabela B.
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
RIGHT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- -> FULL (OUTER) JOIN: Retorna tudo (Tabela A e B e interseção).
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID_Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
FULL JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- -> LEFT (ANTI) JOIN:
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID_Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
LEFT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE DimProductSubcategory.ProductSubcategoryName IS NULL


-- -> RIGHT (ANTI) JOIN:
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID_Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
RIGHT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductKey IS NULL


-- -> FULL (ANTI) JOIN:
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey AS 'ID_Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
FULL JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductKey IS NULL OR DimProductSubcategory.ProductSubcategoryName IS NULL


-- -> CROSS JOIN:



--- -> Múltiplos JOIN:
SELECT
	ProductKey AS 'ID do Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID da Subcategoria',
	ProductCategoryName
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey


-- -> UNION: Une duas tabelas, removendo as duplicatas.
SELECT
	*
FROM
	DimCustomer
WHERE Gender = 'M'
UNION
SELECT
	*
FROM
	DimCustomer
WHERE Gender = 'F'


-- -> UNION ALL: Une duas tabelas.
SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE Gender = 'M'
UNION ALL
SELECT
	FirstName,
	BirthDate
FROM
	DimCustomer
WHERE Gender = 'F'

