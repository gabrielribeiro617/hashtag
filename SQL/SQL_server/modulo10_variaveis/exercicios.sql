-- EXERCÍCIO 1:
DECLARE @valor1 FLOAT = 10,
		@valor2 FLOAT = 5,
		@valor3 FLOAT = 34,
		@valor4 FLOAT = 7

-- A
DECLARE @soma FLOAT = @valor1 + @valor2

-- B
DECLARE @subtracao FLOAT = @valor3 - @valor4

-- C
DECLARE @multiplicacao FLOAT = @valor1 * @valor4

-- D
DECLARE @divisao FLOAT = @valor3 / @valor4

-- E
SET @divisao = ROUND(@divisao, 2)

--
PRINT @soma
PRINT @subtracao
PRINT @multiplicacao
PRINT @divisao



-- EXERCÍCIO 2:
-- A
DECLARE @produto VARCHAR(30) = 'Celular'

-- B
DECLARE @quantidade INT = 12

-- C
DECLARE @preco FLOAT = 9.99

-- D
DECLARE @faturamento FLOAT = @quantidade * @preco

-- E
SELECT
	@produto AS 'Produto',
	@quantidade AS 'Quantidade',
	@preco AS 'Preço',
	@faturamento AS 'Faturamento'



-- EXERCÍCIO 3:
DECLARE @nome VARCHAR(50) = 'André',
		@data_nascimento DATE = '19980210',
		@num_pets INT = 2

SELECT 'Meu nome é ' + @nome +', nasci em ' + FORMAT(@data_nascimento, 'dd/MM/yyyy') + ' e tenho ' + CAST(@num_pets AS VARCHAR(30)) + ' pets.' AS 'Apresentação'



-- EXERCÍCIO 4:
DECLARE @lojas_fechadas VARCHAR(100) = ''

SELECT
	@lojas_fechadas = @lojas_fechadas + StoreName + ', '
FROM
	DimStore
WHERE FORMAT(CloseDate, 'yyyy') = 2008

PRINT 'As lojas fechadas no ano de 2008 foram: ' + LEFT(@lojas_fechadas, DATALENGTH(@lojas_fechadas) - 2)



-- EXERCÍCIO 5:
DECLARE @nome_subcategoria VARCHAR(30) = 'Lamps',
		@id_nome_subcategoria INT
		
SET @id_nome_subcategoria = (SELECT ProductSubcategoryKey FROM DimProductSubcategory WHERE ProductSubcategoryName = @nome_subcategoria)

SELECT
	ProductName
FROM
	DimProduct
WHERE ProductSubcategoryKey = @id_nome_subcategoria
