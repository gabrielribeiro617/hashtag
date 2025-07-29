-- -> Variáveis: objeto que armazena o valor de um dado.

/*
-> Tipos de Dados: Maneira como o SQL consegue diferenciar cada valor dentro deum BD.
	* Inteiro: INT
		- EX: IDs, qtd. vendida.

	* Decimal: FLOAT ou DECIMAL(N , M)
		- N -> n. de dígitos que o número pode ter, incluindo casas decimais.
		- M -> n. máximo de casas decimais.
		- EX: preço unitário, custo unitário, média de salário.

	* Texto/String: VARCHAR(N)
		- N -> número de caracteres que o texto pode ter.

	* Data: DATETIME
*/


-- -> SQL_VARIANT_PROPERTY(variável, 'BaseType'): Verifica o tipo de determinada variável.
/*
	EX base:
		SELECT SQL_VARIANT_PROPERTY([variável], 'BaseType')
*/
SELECT SQL_VARIANT_PROPERTY(21.45, 'BaseType')


-- -> CAST: Função para especificar o tipo dos dados.
/*
	EX base:
		SELECT CAST([variável] AS [tipo])
*/
SELECT CAST(21.45 AS INT)
-- Verrificando o tipo:
SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS INT), 'BaseType')

-- EX:
SELECT 'O preço do produto é ' + CAST(30.99 AS VARCHAR(50)) AS 'Preço'
SELECT CAST('20210620' AS DATETIME) + 1


-- -> FORMAT: Função para formatação de valores no SQL.
/*
	EX base:
		SELECT FORMAT(valor, formato)
*/
--	* Numéricos:
SELECT FORMAT(1000, 'N') -- com separador de milhar.
SELECT FORMAT(1000, 'G')

--	* Personalizados:
SELECT FORMAT(123456789, '###-##-####')

--	* Data:
SELECT FORMAT(CAST('20210321' AS DATETIME), 'dd/MM/yyyy')

-- EX:
SELECT 'A data de validade do produto é: ' + FORMAT(CAST('20220417' AS DATETIME), 'dd/MMM/yyyy') AS 'Data de Validade'



-- -> ROUND (c/ ou s/ truncar): Função de arredondamento.
/*
	Ex base (s/ truncar):
		SELECT ROUND(valor, qtd. de cadas decimais arredondar)

	Ex base (c/ truncar):
		SELECT ROUND(valor, qtd. de cadas decimais arredondar, 1)
*/
-- EX: 
SELECT ROUND(18.739130, 2)
SELECT ROUND(18.739130, 2, 1)


-- -> FLOOR: Arredonda para o chão.
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


-- -> DECLARE + SET: Declara e atribui um valor a uma variável.
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

SELECT @preco AS 'Preço Unitário'

-- EX 4: string
DECLARE @nome VARCHAR(50)
SET @nome = 'Mateus'

SELECT @nome AS 'Nome'

-- EX 5: data
DECLARE @data DATE
SET @data = '20250728'

SELECT @data AS 'Data de Hoje'


-- -> Declarando mais de uma variável:
DECLARE @var1 INT = 10,
		@texto VARCHAR(50) = 'Um texto qualquer',
		@data DATE = '20210218'

SELECT 
	@var1 AS 'Número Inteiro',
	@texto AS 'String',
	@data AS 'Data'

-- EX (execícios):
DECLARE @qtd_vendas INT = 100,
		@preco_unitario FLOAT = 89.99

SELECT @qtd_vendas * @preco_unitario AS 'Faturamento'

-- Usando o BD Contoso:
DECLARE @desconto FLOAT = 0.10
SELECT
	ProductKey AS 'ID',
	ProductName AS 'Produto',
	UnitPrice 'Preço Unitário',
	UnitPrice * (1 - @desconto) AS 'Preço com Desconto'
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
	'Funcionário' AS 'Tipo'
FROM
	DimEmployee
WHERE BirthDate >= @data
ORDER BY Nascimento

-- Armazenando resultado de um SELECT em uma variável:
DECLARE @varTotalFuncionarios INT = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionarios AS 'Total de Funcionários'

--
DECLARE @varLojasOff INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')
SELECT @varLojasOff AS 'Total de Lojas Fechadas'



-- -> PRINT: Mostra o resultado de uma consulta.
SET NOCOUNT ON -- Não faz nenhuma contagem quando executa os SELECTs, variáveis, etc.

DECLARE @varLojasOn INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On'),
		@varLojasOff INT = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')

SELECT
	@varLojasOn AS 'Lojas Abertas',
	@varLojasOff AS 'Lojas Fechadas'

PRINT 'O total de lojas abertas é de ' + CAST(@varLojasOn AS VARCHAR(50))
PRINT 'O total de lojas fechadas é de ' + CAST(@varLojasOff AS VARCHAR(50))


-- Armazenando em uma variável o registro de uma consulta:
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



-- Acumulando valores dentro de uma variável
SET NOCOUNT ON

DECLARE @varListaNomes VARCHAR(100) = ''

SELECT
	@varListaNomes = @varListaNomes + FirstName + ', ' + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing' AND Gender = 'F'

PRINT 'Funcionárias do departamento de marketing:'
PRINT LEFT(@varListaNomes, DATALENGTH(@varListaNomes) - 3)



-- -> Variáveis Globais:
/*
	* @@SERVERNAME: retorna o nome do servidor.

	* @@VERSION: retorna o nome da versão do programa.

	* @@ROWCOUNT: retorna a quantidade de linha que determinada tabela tem.
*/
-- EX:
SELECT @@SERVERNAME

SELECT @@VERSION

SELECT * FROM DimProduct
SELECT @@ROWCOUNT



