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
-- -> SUBSTRING: Extrai alguns caracteres de dentro de um texto.





-- -> TRIM, LTRIM, RTRIM:




-- -> DAY, MONDAY, YEAR e DATEFROMPARTS:




-- -> GETDATE, SYSDATETIME, DATEPART e DATENAME:




-- -> DATEADD e DATEDIFF:




