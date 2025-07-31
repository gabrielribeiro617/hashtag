-- -> LEN e DATALENGTH: Retorna a quantidade de caracteres de uma palavra
/*
	Estrutura Base LEN:
		SELECT LEN(string)

	Estrutura Base DATALENGTH:
		SELECT DATALENGTH(string, )
*/
-- Ex:
SELECT 
	LEN('SQL Hashtag   ') AS 'Len',
	DATALENGTH('SQL Hashtag   ') AS 'Datalength' -- conta os espaços


-- -> CONCAT: Permite juntar mais de um texto em uma única palavra.
/*
	Estrutura Base:
		SELECT CONCAT(string1, string2, ...)
*/
-- Ex:
SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer



-- -> LEFT: Extrai determinada quantidade de caracteres de um texto, da esquerda para a direita.
-- -> RIGHT: Extrai determinada quantidade de caracteres de um texto, da direita para a esquerda.
/*
	Estrutura Base:
		SELECT
			LEFT(string, número de caracteres),
			RIGHT(string, número de caracteres)
*/
-- Ex:
SELECT
	ProductName AS 'Produto',
	UnitPrice AS 'Preço Unitário',
	LEFT(StyleName, 7) AS 'Cod 1',
	RIGHT(StyleName, 7) AS 'Cod 2'
FROM
	DimProduct



-- -> REPLACE: Substitui um determinado texto por outro texto.
/*
	Estrutura Base:
		SELECT REPLACE(texto base, texto substituído, texto subtituto)
*/
-- Ex:
SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev.)',
	REPLACE(Gender, 'M', 'Masculino') AS 'Sexo'
FROM
	DimCustomer
WHERE Gender = 'M'

UNION

SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev.)',
	REPLACE(Gender, 'F', 'Feminino') AS 'Sexo'
FROM
	DimCustomer
WHERE Gender = 'F'



-- -> TRANSLATE: Substitui cada caractere na ordem encontrada no texto.
/*
	Estrutura Base:
		SELECT TRANSLATE(texto base, seq. de caracteres antigos, seq. de caracteres novos)
*/
-- Ex:
SELECT TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ')



-- -> STUFF: Substitui qualquer texto com uma quanitdade de caracteres limitados, por um outro texto.
/*
	Estrutura Base:
		SELECT STUFF(texto base, pos. inicial, qtd. de caractesres, texto substituto)
*/
-- Ex: 
SELECT 
	STUFF('MT98-Moto G', 1, 2, 'CEL'),
	STUFF('AP01-IPhone', 1, 2, 'CEL'),
	STUFF('SS61-Samsung Galaxy', 1, 2, 'CEL')



-- -> UPPER: Transforma um texto em maiúscula.
-- -> LOWER: Transforma um texto em minúscula.
/*
	Estrutura Base:
		SELECT
			UPPER(string),
			LOWER(string)
*/
-- Ex:
SELECT
	FirstName AS 'Nome',
	UPPER(FirstName) AS 'NOME',
	LOWER(FirstName) AS 'nome',
	EmailAddress AS 'E-mail'
FROM
	DimCustomer

	

-- -> FORMAT: Formata um valor de acordo com uma formatação.
-- A. Formatação de número
--	=> 5123
--	* Geral
SELECT FORMAT(5123, 'G')		

--	* Número
SELECT FORMAT(5123, 'N')

--	* Moeda
SELECT FORMAT(5123, 'C')


-- B. Formatação de Data
-- => 23/04/2020
-- * dd/MM/yyyy
SELECT FORMAT(CAST('2020/04/23' AS DATE), 'dd/MMM/yyyy', 'pt-BR')

-- * dia
SELECT FORMAT(CAST('2020/04/23' AS DATE), 'dddd', 'pt-BR')

-- * mês
SELECT FORMAT(CAST('2020/04/23' AS DATE), 'MMMM', 'pt-BR')

-- * ano
SELECT FORMAT(CAST('2020/04/23' AS DATE), 'yyyy')


-- C. Formatação Personalizada
-- => 1234567 -> 12-34-567
SELECT FORMAT(1234567, '##-##-###')



-- -> CHARINDEX: Descobre a posição de um determinado caractere dentro de um texto.
/*
	Estrutura Base:
		SELECT CHARINDEX(string procurada, string base)
*/
-- Ex:
SELECT CHARINDEX('Moreno', 'Raquel Moreno')



-- -> SUBSTRING: Extrai alguns caracteres de dentro de um texto.
/*
	Estrutura Base:
		SELECT SUBSTRING(string base, pos. inicial, qtd. caracteres)
*/
-- Ex:
SELECT SUBSTRING('Raquel Moreno', 8, 6)

-- Usando variável:
DECLARE @varNome VARCHAR(100) = 'Raquel Moreno'

SELECT SUBSTRING(@varNome, CHARINDEX(' ',@varNome) + 1, 100) AS 'Sobrenome'


-- Funções para tirar espaços adicionais:
-- -> TRIM: Retira espaços adicionais à esquerda e à direita do texto.
/*
	Estrutura Base:
		SELECT TRIM(string)
*/
-- -> LTRIM: Retira espaços adicionais à esquerda do texto.
/*
	Estrutura Base:
		SELECT LTRIM(string)
*/
-- -> RTRIM: Retira espaços adicionais à direita do texto.
/*
	Estrutura Base:
		SELECT RTRIM(string)
*/
-- Ex:
DECLARE @varCodigo VARCHAR(100) = '  ABC123   '

SELECT
	TRIM(@varCodigo) AS 'Trim',
	LTRIM(@varCodigo) AS 'Ltrim',
	RTRIM(@varCodigo) AS 'Rtrim'

SELECT
	DATALENGTH(TRIM(@varCodigo)) AS 'Qtd. caractere Trim',
	DATALENGTH(LTRIM(@varCodigo)) AS 'Qtd. caractere Ltrim',
	DATALENGTH(RTRIM(@varCodigo)) AS 'Qtd. caractere Rtrim'



-- -> DAY, MONTH, YEAR: Descobrir o dia, mês ou ano de determinada data.
DECLARE @varData DATE = '20200518'

SELECT 
	DAY(@varData) AS 'Dia',
	MONTH(@varData) AS 'Mês',
	YEAR(@varData) AS 'Ano'



-- -> DATEFROMPARTS: Obter uma data a partir de dia, mês e ano.
DECLARE @varDia INT = 15,
		@varMes INT = 6,
		@varAno INT = 2017

SELECT DATEFROMPARTS(@varAno, @varMes, @varDia)



-- -> GETDATE: Retorna a data/hora atual do sistema.
/*
	Estrutura Base:
		SELECT GETDATE()
*/
-- EX:
SELECT GETDATE()



-- -> SYSDATETIME: Retorna a data/hora atual do sistema (mais preciso que a GETDATE).
/*
	Estrutura Base:
		SELECT SYSDATETIME()
*/
-- EX:
SELECT SYSDATETIME()



-- -> DATEPART e DATENAME: Retornam informações (dia, mês, ano, semana, etc) de uma data.
-- -> DATEPART: Retorna o restultado em formato de número.
/*
	Estrutura Base:
		SELECT DATEPART([dia/mês/ano/semana/etc], data)
*/
-- -> DATENAME: 
/*
	Estrutura Base: Retorna o resultado em formato de texto
		SELECT DATENAME([dia/mês/ano/semana/etc], data)
*/
-- EX:
DECLARE @varData DATETIME = GETDATE()

SELECT
	DATENAME(DAY, @varData) AS 'Dia',
	DATENAME(MONTH, @varData) AS 'Mês',
	DATENAME(YEAR, @varData) AS 'Ano',
	DATENAME(DAYOFYEAR, @varData) AS 'Dia do Ano'

SELECT
	DATEPART(DAY, @varData) AS 'Dia',
	DATEPART(MONTH, @varData) AS 'Mês',
	DATEPART(YEAR, @varData) AS 'Ano',
	DATEPART(DAYOFYEAR, @varData) AS 'Dia do Ano'

SELECT
	SQL_VARIANT_PROPERTY(DATENAME(DAY, @varData), 'BaseType'),
	SQL_VARIANT_PROPERTY(DATEPART(DAY, @varData), 'BaseType')



-- -> DATEADD: Adiciona ou subtrai uma determinada quantidade de dias, meses ou anos a uma data.
/*
	Estrutura Base:
		SELECT DATEADD([dia/mês/ano/semana/etc], qtd. dias somar/subtrair, data pra somar)
*/
-- EX:
DECLARE @varData1 DATETIME = '2020/07/10',
		@varData2 DATETIME = '2020/03/05',
		@varData3 DATETIME = '2021/11/14'

SELECT DATEADD(MONTH, -1, @varData1)



-- -> DATEDIFF: Calcula a diferença entre duas datas.
/*
	Estrutura Base:
		SELECT DATEDIFF([dia/mês/ano/semana/etc], data inicial, data final)
*/
-- EX:
SELECT DATEDIFF(YEAR, @varData2, @varData3)



