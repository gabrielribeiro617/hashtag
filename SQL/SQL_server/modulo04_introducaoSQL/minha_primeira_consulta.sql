/* 
	* SELECT: Seleciona algo em uma tabela.
	* FROM: Tabela que será selecionada.
*/
-- -> Seleciona todas a linhas e colunas da tabela DimStore.
SELECT 
	* 
FROM 
	DimStore


-- -> Seleciona as colunas StoreKey, StoreName e StorePhone da tabela DimStore.
SELECT 
	StoreKey, 
	StoreName, 
	StorePhone 
FROM 
	DimStore


-- * SELECT TOP(n): Selecionar as n primeiras linhas de uma tabela.
-- -> Seleciona as 10 primeiras linhas de todas a linhas e colunas da tabela DimStore.
SELECT TOP(10)
	* 
FROM 
	DimStore


-- * SELECT TOP(n) PERCENT: Seleciona 10% de uma tabela.
-- -> Seleciona os 10% de todas a linhas e colunas da tabela DimStore.
SELECT TOP(10) PERCENT
	* 
FROM 
	DimStore


-- * SELECT DISTINCT: Retorna os valores distintos de uma tabela.
-- -> Seleciona somente a coluna ColorName com valores distintos da tabela DimProduct.
SELECT
	DISTINCT ColorName
FROM 
	DimProduct


-- * AS: Renomeia colunas (aliasing)
-- -> Seleciona três colunas, renomeando-as, da tabela DimProduct.
SELECT
	ProductName AS 'Nome do Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor'
FROM
	DimProduct