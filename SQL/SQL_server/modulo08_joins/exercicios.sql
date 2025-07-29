-- EXERC�CIO 1:
select * from DimProduct
select * from DimProductSubcategory

SELECT 
	ProductKey AS 'ID do Produto',
	ProductName AS 'Produto',
	DimProduct.ProductSubcategoryKey AS 'ID da Subcategoria',
	DimProductSubcategory.ProductSubcategoryName AS 'Subcategoria'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey



-- EXERC�CIO 2:
select * from DimProductSubcategory
select * from DimProductCategory

SELECT
	ProductSubcategoryKey AS 'ID da Subcategoria',
	ProductSubcategoryName As 'Subcategoria',
	DimProductSubcategory.ProductCategoryKey AS 'ID da Categoria',
	DimProductCategory.ProductCategoryName As 'Categoria'
FROM
	DimProductSubcategory
LEFT JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey



-- EXERC�CIO 3:
select * from DimStore
select * from DimGeography

SELECT
	StoreKey AS 'ID da Loja',
	StoreName As 'Loja',
	EmployeeCount AS 'Qtd. de Funcion�rios',
	DimGeography.ContinentName AS 'Continente',
	DimGeography.RegionCountryName AS 'Pa�s'
FROM
	DimStore
LEFT JOIN DimGeography
	ON DimStore.GeographyKey = DimGeography.GeographyKey



-- EXERC�CIO 4:
select * from DimProduct
select * from DimProductSubcategory
select * from DimProductCategory

SELECT
	ProductKey,
	ProductName,
	DimProductCategory.ProductCategoryKey,
	DimProductCategory.ProductCategoryDescription
FROM
	DimProduct
LEFT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
		LEFT JOIN DimProductCategory
			ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey



-- EXERC�CIO 5:
select * from FactStrategyPlan
select * from DimAccount

-- * A
SELECT TOP(100)
	*
FROM
	FactStrategyPlan

-- * B
SELECT
	StrategyPlanKey,
	Datekey,
	DimAccount.AccountName,
	Amount
FROM
	FactStrategyPlan
INNER JOIN DimAccount
	ON FactStrategyPlan.AccountKey = DimAccount.AccountKey



-- EXERC�CIO 6:
select * from FactStrategyPlan
select * from DimScenario

SELECT
	StrategyPlanKey,
	Datekey,
	DimScenario.ScenarioName,
	Amount
FROM
	FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey



-- EXERC�CIO 7:
select * from DimProduct
select * from DimProductSubcategory

SELECT
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
FROM
	DimProduct
RIGHT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductKey IS NULL



-- EXERC�CIO 8:
select * from DimProduct
select * from DimChannel

SELECT DISTINCT
	BrandName,
	DimChannel.ChannelName
FROM
	DimProduct
INNER JOIN DimChannel
	ON DimProduct.ETLLoadID = DimChannel.ETLLoadID
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')
ORDER BY BrandName



-- EXERC�CIO 9:
select top(50) * from FactOnlineSales
select top(50) * from DimPromotion

SELECT
	OnlineSalesKey,
	DateKey,
	DimPromotion.PromotionName,
	SalesAmount
FROM
	FactOnlineSales
LEFT JOIN DimPromotion
	ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE DimPromotion.PromotionCategory <> 'No Discount'
ORDER BY DateKey



-- EXERC�CIO 10:
select top(50) * from FactSales
select top(50) * from DimChannel
select top(50) * from DimStore
select top(50) * from DimProduct

SELECT 
	SalesKey,
	DimChannel.ChannelName,
	DimStore.StoreName,
	DimProduct.ProductName,
	SalesAmount
FROM
	FactSales
LEFT JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
LEFT JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
LEFT JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
ORDER BY SalesAmount DESC
