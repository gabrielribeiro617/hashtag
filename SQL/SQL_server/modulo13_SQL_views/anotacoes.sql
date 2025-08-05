-- -> O que é uma View?
/*
	* Tabela virtual criada a partir de uma consulta a uma ou mais tabelas (ou até mesmo de outras views) no BD.

	* Contém linhas e colunas assim como uma tabela real. Nela podemos utilizar comando como o JOIN, WHERE e outras funções.

	* Sempre mostra resultados atualizados dos dados.

	* Caso o servidor seja desligado (ou o SSMS fechado), a view continua armazenada no sistema.

	* A view é agradável para a reutilização, segurança e ganho de tempo.

	* A View fica na pasta Exibições do DB.

	* Para utilizá-la, basta utilizar o comando SELECT.

	Ex:
		SELECT * FROM nome_view
*/



-- -> CREATE VIEW: Cria uma View.
/*
	Estrutura Base:
		GO
		CREATE VIEW nome_view AS
		SELECT ...
		GO
*/
-- Ex:
GO
CREATE VIEW vwClientes AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data de Nascimento'
FROM
	DimCustomer
GO

SELECT * FROM vwClientes

--
GO
CREATE VIEW vwProdutos AS
SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Produto',
	ProductSubcategoryKey AS 'ID Subcategoria',
	BrandName AS 'Marca',
	UnitPrice AS 'Preço Unitário'
FROM
	DimProduct
GO

SELECT * FROM vwProdutos



-- -> ALTER VIEW: Altera uma View.
/*
	Estrutura Base:
		GO
		ALTER VIEW nome_view AS
		SELECT ...
		GO
*/
-- Ex:
SELECT * FROM vwClientes

GO
ALTER VIEW vwClientes AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data de Nascimento',
	Gender AS 'Sexo'
FROM
	DimCustomer
WHERE Gender = 'F'
GO



-- -> DROP VIEW: Exclui uma View.
/*
	Estrutura Base:
		DROP VIEW nome_view
*/
-- Ex:
DROP VIEW vwProdutos, vwClientes

