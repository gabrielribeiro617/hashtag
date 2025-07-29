-- Exerc�cio 1
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
-- -> Resposta: O n�mero diminuiu - 18.869


-- Exerc�cio 2
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
	EmailAddress AS 'Endere�o de E-mail', 
	BirthDate AS 'Data de Nascimento' 
FROM 
	DimCustomer


-- Exerc�cio 3
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
	EmailAddress AS 'Endere�o de E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer


-- Exerc�cio 4
SELECT
	DISTINCT Manufacturer AS 'Fornecedores'
FROM
	DimProduct


-- Exerc�cio 5
SELECT
	ProductKey
FROM
	DimProduct

SELECT
	DISTINCT ProductKey
FROM
	FactSales
-- -> Resposta: Sim, teve algum produto que ainda n�o foi vendido.
