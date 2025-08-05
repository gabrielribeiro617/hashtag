-- Criando tabela:

CREATE TABLE Produtos(
	id_produto INT,
	nome_produto VARCHAR(200),
	data_validade DATETIME,
	preco_produto FLOAT
)

SELECT * FROM Produtos



-- Inserindo dados na tabela usando outra tabela:
INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
SELECT
	ProductKey,
	ProductName,
	AvailableForSaleDate,
	UnitPrice
FROM
	ContosoRetailDW.dbo.DimProduct



-- Adicionando novos valores na tabela do zero:
INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
VALUES
	(1, 'Arroz', '2022/12/31', 22.50),
	(2, 'Feijão', '2022/11/20', 8.99)

--
INSERT INTO Produtos(id_produto, data_validade, preco_produto)
VALUES
	(3, '2023/05/31', 33.99)



-- Atualizando dados de uma tabela:
UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 3



-- Deletando dados de uma tabela:
DELETE
FROM Produtos
WHERE id_produto = 3



-- Exluido uma tabela:
DROP TABLE Produtos



-- Código para exemplo:
CREATE TABLE Funcionarios(
	id_funcionario INT,
	nome_funcionario VARCHAR(100),
	salario FLOAT,
	data_nascimento DATETIME
)

SET LANGUAGE 'Portuguese'

INSERT INTO Funcionarios(id_funcionario,nome_funcionario, salario, data_nascimento)
VALUES
	(1, 'Lucas'    , 1500, '20/03/1990'),
	(2, 'Andressa' , 2300, '07/12/1988'),
	(3, 'Felipe'   , 4000, '13/02/1993'),
	(4, 'Marcelo'  , 7100, '10/04/1993'),
	(5, 'Carla'    , 3200, '02/09/1986'),
	(6, 'Juliana'  , 5500, '21/01/1989'),
	(7, 'Mateus'   , 1900, '02/11/1993'),
	(8, 'Sandra'   , 3900, '09/05/1990'),
	(9, 'André'    , 1000, '13/03/1994'),
	(10, 'Julio'   , 4700, '05/07/1992')

SELECT * FROM Funcionarios