-- Exercício 1
--  * A
SELECT 
	* 
FROM 
	DimProduct

-- * B
SELECT
	* 
FROM 
	DimCustomer
-- -> Resposta: O número diminuiu - 18.869


-- Exercício 2
-- * A
SELECT 
	CustomerKey, 
	FirstName, 
	EmailAddress, 
	BirthDate 
FROM 
	DimCustomer

-- * B
SELECT 
	CustomerKey AS 'ID do Cliente', 
	FirstName AS 'Primeiro Nome', 
	EmailAddress AS 'Endereço de E-mail', 
	BirthDate AS 'Data de Nascimento' 
FROM 
	DimCustomer


-- Exercício 3
-- * A
SELECT TOP(100)
	*
FROM
	DimCustomer

-- * B
SELECT TOP(10) PERCENT
	*
FROM
	DimCustomer

-- * C
SELECT TOP(100)
	FirstName, 
	EmailAddress,
	BirthDate
FROM
	DimCustomer

-- * D
SELECT TOP(100)
	FirstName AS 'Primeiro Nome', 
	EmailAddress AS 'Endereço de E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer


-- Exercício 4
SELECT
	DISTINCT Manufacturer AS 'Fornecedores'
FROM
	DimProduct


-- Exercício 5
SELECT
	ProductKey
FROM
	DimProduct

SELECT
	DISTINCT ProductKey
FROM
	FactSales
-- -> Resposta: Sim, teve algum produto que ainda não foi vendido.
