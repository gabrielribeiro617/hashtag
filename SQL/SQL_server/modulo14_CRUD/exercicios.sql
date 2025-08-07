-- -> EXERC�CIO 1:
-- A:
CREATE DATABASE BD_Teste


-- B:
DROP DATABASE BD_Teste

-- C:
CREATE DATABASE Exercicios



-- -> EXERC�CIO 2:
CREATE TABLE dCliente(
	ID_Cliente INT,
	Nome_Cliente VARCHAR(100),
	Data_de_Nascimento DATETIME
)

CREATE TABLE dGerente(
	ID_Gerente INT,
	Nome_Gerente VARCHAR(100),
	Data_de_Contratacao DATETIME,
	Salario FLOAT
)

CREATE TABLE fContratos(
	ID_Contrato INT,
	Data_de_Assinatura DATETIME,
	ID_Cliente INT,
	ID_Gerente INT,
	Valor_do_Contrato FLOAT
)


SELECT * FROM dCliente
SELECT * FROM dGerente
SELECT * FROM fContratos



-- -> EXERC�CIO 3:
SET LANGUAGE 'Portuguese'

INSERT INTO dCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES
	(1, 'Andr� Martins'    , '12/02/1989'),
	(2, 'B�rbara Campos'   , '07/05/1992'),
	(3, 'Carol Freitas'    , '23/04/1985'),
	(4, 'Diego Cardoso'    , '11/10/1994'),
	(5, 'Eduardo Pereira'  , '09/11/1988'),
	(6, 'Fabiana Silva'    , '02/09/1989'),
	(7, 'Gustavo Barbosa'  , '27/06/1993'),
	(8, 'Helen Viana'      , '11/02/1990')

INSERT INTO dGerente(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
	(1, 'Lucas Sampaio'    , '21/03/2015', 6700),
	(2, 'Mariana Padilha'  , '10/01/2011', 9900),
	(3, 'Nath�lia Santos'  , '03/10/2018', 7200),
	(4, 'Ot�vio Costa'     , '18/04/2017', 11000)

INSERT INTO fContratos(ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
VALUES
	(1, '12/01/2019', 8, 1, 23000),
	(2, '10/02/2019', 3, 2, 15500),
	(3, '07/03/2019', 7, 2, 6500),
	(4, '15/03/2019', 1, 3, 33000),
	(5, '21/03/2019', 5, 4, 11100),
	(6, '23/03/2019', 4, 2, 5500),
	(7, '28/03/2019', 9, 3, 55000),
	(8, '04/04/2019', 2, 1, 31000),
	(9, '05/04/2019', 10, 4, 3400),
	(10, '05/04/2019', 6, 2, 9200)



-- -> EXERC�CIO 4:
INSERT INTO dCliente(ID_Cliente, Nome_Cliente, Data_de_Nascimento)
VALUES
	(9, 'Gabriel Ribeiro', '14/10/2005')

INSERT INTO dGerente(ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario)
VALUES
	(5, 'Maria Oliveira', '21/07/2020', 5500)

INSERT INTO fContratos(ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato)
VALUES
	(11, '07/04/2019', 4, 1, 33000)



-- -> EXERC�CIO 5:
UPDATE fContratos
SET Data_de_Assinatura = '17/03/2019',
	ID_Gerente = 2,
	Valor_do_Contrato = 33500
WHERE ID_Contrato = 4

SELECT * FROM fContratos



-- -> EXERC�CIO 6:
DELETE
FROM fContratos
WHERE ID_Contrato = 4



