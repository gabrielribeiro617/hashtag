-- -> CASE WHEN ELSE:
/*
	Estrutura Base:
		SELECT
			CASE
				WHEN teste_logico THEN 'resultado1'
				ELSE 'resultado2'
			END
*/
-- Ex:
DECLARE @varNota FLOAT = 7

SELECT
	CASE
		WHEN @varNota >= 6 THEN 'Aprovado'
		ELSE 'Reprovado'
	END AS 'Situação'

--
DECLARE @varDataVencimento DATE = '20220310',
		@varDataAtual DATE = GETDATE()

SELECT
	CASE
		WHEN @varDataAtual <= @varDataVencimento THEN 'Produto Consumível'
		ELSE 'Produto Vencido'
	END AS 'Validade'

--
SELECT * FROM DimCustomer

SELECT
	CustomerKey AS 'ID',
	FirstName AS 'Nome',
	Gender AS 'Sexo',
	CASE
		WHEN Gender = 'M' THEN 'Masculino'
		ELSE 'Feminino'
	END AS 'Sexo (CASE)'
FROM
	DimCustomer

--
DECLARE @varNota FLOAT = 5

SELECT
	CASE
		WHEN @varNota >= 6 THEN 'Aprovado'
		WHEN @varNota >= 4 THEN 'Prova Final'
		ELSE 'Reprovado'
	END AS 'Boletim'

--
SELECT
	CustomerKey AS 'ID',
	FirstName AS 'Nome',
	Gender AS 'Sexo (Abrev.)',
	CASE
		WHEN Gender = 'M' THEN 'Masculino'
		WHEN Gender = 'F' THEN 'Feminino'
		ELSE 'Empresa'
	END AS 'Sexo'
FROM
	DimCustomer



-- -> CASE Aninhado:
-- Ex:
SELECT * FROM DimEmployee

DECLARE @varGroupAss FLOAT = 0.30,
		@varGroup FLOAT = 0.20,
		@varRegion FLOAT = 0.15,
		@varState FLOAT = 0.07,
		@varStore FLOAT = 0.02

SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Title AS 'Cargo',
	SalariedFlag 'Bandeira de Assalariado',
	CASE
		WHEN Title = 'Sales Group Manager' THEN
		CASE
			WHEN SalariedFlag = 1 THEN @varGroupAss
			ELSE @varGroup
		END
		WHEN Title = 'Sales Region Manager' THEN @varRegion
		WHEN Title = 'Sales State Manager' THEN @varState
		ELSE @varStore
	END AS 'Bônus'
FROM
	DimEmployee



-- -> CASE AND:
-- Ex:
DECLARE @varDesconto10 FLOAT = 0.10,
		@varDesconto5 FLOAT = 0.05

SELECT
	ProductName AS 'Produto',
	BrandName AS 'Marca',
	ColorName AS 'Cor',
	UnitPrice AS 'Preço Unitário',
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN UnitPrice * (1 - @varDesconto10) 
		WHEN BrandName IN ('Litware', 'Fabrikam') THEN UnitPrice * (1 - @varDesconto5)
		ELSE NULL
	END AS 'Preço Final',
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN '10%'
		WHEN BrandName IN ('Litware', 'Fabrikam') THEN '5%'
		ELSE 'Nenhum'
	END AS 'Desconto Aplicado'
FROM
	DimProduct



-- -> CASE Aditivo:
/*
	Estrutura Base:
		CASE WHEN teste_logico
			THEN resultado1 ELSE resultado2 END
		+ CASE WHEN teste_logico
			THEN adicao1 ELSE adicao2 END
*/
-- Ex:
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	ProductCategoryName AS 'Categoria',
	ProductSubcategoryName AS 'Subcategoria',
	UnitPrice AS 'Preço Unitário',
	CASE WHEN ProductCategoryName = 'TV and Video'
		THEN 0.10 ELSE 0.0 END
	+ CASE WHEN ProductSubcategoryName = 'Television'
		THEN 0.05 ELSE 0.0 END
FROM
	DimProduct	
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		INNER JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey



-- -> CASE IIF:
/*
	Estrutura Base:
		IIF(
			teste_logico,
			se_verdadeiro,
			se_falso)
*/
-- Ex:
DECLARE @varClassificacao INT = 9

SELECT
	IIF(
		@varClassificacao>= 5,
		'Risco Alto',
		'Risco Baixo') AS 'Risco'

--
SELECT
	CustomerKey AS 'ID',
	CustomerType AS 'Tipo',
	IIF(
		CustomerType = 'Person',
		FirstName,
		CompanyName) AS 'Cliente'
FROM
	DimCustomer

--
SELECT * FROM DimProduct

SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	StockTypeName,
	IIF(
		StockTypeName = 'High',
		'João',
		IIF(
			StockTypeName = 'Mid',
			'Maria',
			'Luis')
			) AS 'Responsável'
FROM
	DimProduct



-- -> CASE ISNULL:
/*
	Estrutura Base:
		SELECT
			ISNULL(expressao, resultado)
*/
-- Ex:
SELECT
	GeographyKey,
	ContinentName,
	ISNULL(CityName, 'Local Desconhecido') AS 'CityName'
FROM
	DimGeography


