-- -> Vari�veis: objeto que armazena o valor de um dado.

/*
-> Tipos de Dados: Maneira como o SQL consegue diferenciar cada valor dentro deum BD.
	* Inteiro: INT
		- EX: IDs, qtd. vendida.

	* Decimal: FLOAT ou DECIMAL(N , M)
		- N -> n. de d�gitos que o n�mero pode ter, incluindo casas decimais.
		- M -> n. m�ximo de casas decimais.
		- EX: pre�o unit�rio, custo unit�rio, m�dia de sal�rio.

	* Texto/String: VARCHAR(N)
		- N -> n�mero de caracteres que o texto pode ter.

	* Data: DATETIME
*/


-- -> SQL_VARIANT_PROPERTY(vari�vel, 'BaseType'): Verifica o tipo de determinada vari�vel.
/*
	EX base:
		SELECT SQL_VARIANT_PROPERTY([vari�vel], 'BaseType')
*/
SELECT SQL_VARIANT_PROPERTY(21.45, 'BaseType')


-- -> CAST: Fun��o para especificar o tipo dos dados.
/*
	EX base:
		SELECT CAST([vari�vel] AS [tipo])
*/
SELECT CAST(21.45 AS INT)
-- Verrificando o tipo:
SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS INT), 'BaseType')

-- EX:
SELECT 'O pre�o do produto � ' + CAST(30.99 AS VARCHAR(50)) AS 'Pre�o'
SELECT CAST('20210620' AS DATETIME) + 1


-- -> FORMAT: Fun��o para formata��o de valores no SQL.
/*
	EX base:
		SELECT FORMAT(valor, formato)
*/
--	* Num�ricos:
SELECT FORMAT(1000, 'N') -- com separador de milhar.
SELECT FORMAT(1000, 'G')

--	* Personalizados:
SELECT FORMAT(123456789, '###-##-####')

--	* Data:
SELECT FORMAT(CAST('20210321' AS DATETIME), 'dd/MM/yyyy')

-- EX:
SELECT 'A data de validade do produto �: ' + FORMAT(CAST('20220417' AS DATETIME), 'dd/MMM/yyyy') AS 'Data de Validade'



-- -> ROUND (c/ ou s/ truncar): Fun��o de arredondamento.
/*
	Ex base (s/ truncar):
		SELECT ROUND(valor, qtd. de cadas decimais arredondar)

	Ex base (c/ truncar):
		SELECT ROUND(valor, qtd. de cadas decimais arredondar, 1)
*/
-- EX: 
SELECT ROUND(18.739130, 2)
SELECT ROUND(18.739130, 2, 1)


-- -> FLOOR: Arredonda para o ch�o.
/*
	Ex base (s/ truncar):
		SELECT FLOOR(valor)
*/
-- EX:
SELECT FLOOR(18.739130)


-- -> CEILING: Arredonda para o teto
/*
	Ex base (s/ truncar):
		SELECT CEILING(valor)
*/
-- EX:
	SELECT CEILING(18.739130)


-- -> DECLARE + SET: Declara e atribui um valor a uma vari�vel.
/*
	Estrutura Base:
		DECLARE @var tipo
		SET @var = valor
		SELECT @var
*/
-- EX 1:
DECLARE @numero FLOAT
SET @numero = 1000

SELECT @numero
SELECT @numero * @numero
SELECT FORMAT(@numero * @numero, 'N')

-- EX 2: inteiro
DECLARE @idade INT
SET @idade = 30

SELECT @idade AS 'Idade'

-- EX 3: decimal
DECLARE @preco FLOAT
SET @preco = 10.89

SELECT @preco AS 'Pre�o Unit�rio'

-- EX 4: string
DECLARE @nome VARCHAR(50)
SET @nome = 'Mateus'

SELECT @nome AS 'Nome'

-- EX 5: data
DECLARE @data DATE
SET @data = '20250728'

SELECT @data AS 'Data de Hoje'


-- -> Declarando mais de uma vari�vel:
DECLARE @var1 INT = 10,
		@texto VARCHAR(50) = 'Um texto qualquer',
		@data DATE = '20210218'

SELECT 
	@var1 AS 'N�mero Inteiro',
	@texto AS 'String',
	@data AS 'Data'

-- EX (exec�cios):
DECLARE @qtd_vendas INT = 100,
		@preco_unitario FLOAT = 89.99

SELECT @qtd_vendas * @preco_unitario AS 'Faturamento'

-- Usando o BD Contoso:
DECLARE @desconto FLOAT = 0.10
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice 'Pre�o Unit�rio',
	UnitPrice * (1 - @desconto) AS 'Pre�o com Desconto'
FROM 
	DimProduct

--
DECLARE @data DATE = '19800101'

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Cliente' AS 'Tipo'
FROM
	DimCustomer
WHERE BirthDate >= @data

UNION

SELECT
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Funcion�rio' AS 'Tipo'
FROM
	DimEmployee
WHERE BirthDate >= @data
ORDER BY Nascimento

-- Armazenando resultado de um SELECT em uma vari�vel:
DECLARE @varTotalFuncionarios INT = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionarios AS 'Total de Funcion�rios'

--
DECLARE @varLojasOff INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')
SELECT @varLojasOff AS 'Total de Lojas Fechadas'



-- -> PRINT: Mostra o resultado de uma consulta.
SET NOCOUNT ON -- N�o faz nenhuma contagem quando executa os SELECTs, vari�veis, etc.

DECLARE @varLojasOn INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On'),
		@varLojasOff INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')

SELECT
	@varLojasOn AS 'Lojas Abertas',
	@varLojasOff AS 'Lojas Fechadas'

PRINT 'O total de lojas abertas � de ' + CAST(@varLojasOn AS VARCHAR(50))
PRINT 'O total de lojas fechadas � de ' + CAST(@varLojasOff AS VARCHAR(50))


-- Armazenando em uma vari�vel o registro de uma consulta:
DECLARE @varProdutoMaisVendido INT,
		@varTotalMaisVendido INT

SELECT TOP(1)
	@varProdutoMaisVendido = ProductKey,
	@varTotalMaisVendido = SalesQuantity
FROM
	FactSales
ORDER BY SalesQuantity DESC

PRINT 'Produto mais vendido: ' + CAST(@varProdutoMaisVendido AS VARCHAR(30))
PRINT 'Total mais vendido: ' + CAST(@varTotalMaisVendido AS VARCHAR(30))

SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto'
FROM
	DimProduct
WHERE ProductKey = @varProdutoMaisVendido



-- Acumulando valores dentro de uma vari�vel
SET NOCOUNT ON

DECLARE @varListaNomes VARCHAR(100) = ''

SELECT
	@varListaNomes = @varListaNomes + FirstName + ', ' + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F'

PRINT 'Funcion�rias do departamento de marketing:'
PRINT LEFT(@varListaNomes, DATALENGTH(@varListaNomes) - 3)



-- -> Vari�veis Globais:
/*
	* @@SERVERNAME: retorna o nome do servidor.

	* @@VERSION: retorna o nome da vers�o do programa.

	* @@ROWCOUNT: retorna a quantidade de linha que determinada tabela tem.
*/
-- EX:
SELECT @@SERVERNAME

SELECT @@VERSION

SELECT * FROM DimProduct
SELECT @@ROWCOUNT



