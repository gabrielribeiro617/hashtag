-- -> Chave Prim�ria: Coluna que identifica as informa��es distintas em uma tabela. Geralmente, � uma coluna de ID.
-- -> Chave Estrangeira: Coluna que permite relacionar as linhas de uma segunda tabela com a Chave Prim�ria de uma primeira tabela.

-- -> Tabela Dimens�o: Tabela que cont�m caracter�sticas de um determinado elemento: lojas, produtos, funcion�rios, clientes, etc. 
--    * Nenhum elemento se repete. 
--    * � onde encontramos as PK.
--    * Dim...

-- -> Tabela Fato: Tabela que vai regirtar os fatos ou acontecimentos de uma empresa/neg�cio em determinados per�odos de tempo(vendas, devolu��es, aberturas de chamados, receitas, despesas, etc).
--    * Geralmente � uma tabela com milhares de informa��es e composta essencialmene por colunas de ID usadas para buscar informa��es complementares de uma tabela dimens�o, conhecidas como FK.
--    * Fact...

-- * Duas dimens�es tamb�m podem se relacionar.
-- * O que n�o fazemos � uma rela��o entre duas fatos.


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


-- -> INNER JOIN: Retorna a interse��o da Tabela A e B.
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


-- -> LEFT (OUTER) JOIN: Retorna a Tabela A e a Interse��o da Tabela A e B.
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


-- -> RIGHT (OUTER) JOIN: Retorna a interse��o da Tabela A e B e a Tabela B.
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


-- -> FULL (OUTER) JOIN: Retorna tudo (Tabela A e B e interse��o).
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



--- -> M�ltiplos JOIN:
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

