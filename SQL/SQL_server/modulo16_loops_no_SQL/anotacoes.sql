-- -> WHILE: Loop.
/*
	Estrutura Base:
		WHILE condicao
		BEGIN
			... comandos
		END
*/
-- Ex:
DECLARE @varContador INT = 0

WHILE @varContador <= 10
BEGIN
	PRINT @varContador
	SET @varContador = @varContador + 1
END



-- -> BREAK: Interrompe o loop.
/*
	Estrutura Base:
		WHILE condicao
		BEGIN
			IF condicao
			BREAK
			... comandos
		END
*/
-- Ex:
DECLARE @varContador INT = 0

WHILE @varContador <= 100
BEGIN
	PRINT @varContador
	IF @varContador = 15
	BREAK
	SET @varContador += 1
END



-- -> CONTINUE: Pula repetições num loop.
/*
	Estrutura Base:
		WHILE condicao
		BEGIN
			IF condicao
			CONTINUE
			... comandos
		END
*/
-- Ex:
DECLARE @varContador INT = 0

WHILE @varContador <= 10
BEGIN
	SET @varContador += 1
	IF @varContador IN (3, 6)
	CONTINUE
	PRINT @varContador
END



