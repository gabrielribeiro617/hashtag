-- -> EXERCÍCIO 1:
DECLARE @ValorInicial INT = 0,
		@ValorFinal INT = 10

WHILE @ValorInicial <= @ValorFinal
BEGIN
	PRINT 'O valor do contador é: ' + CONVERT(VARCHAR, @ValorInicial)
	SET @ValorInicial += 1
END



-- -> EXERCÍCIO 2:
DECLARE @AnoInicial INT = 1996,
		@AnoFinal INT = 2003

WHILE @AnoInicial <= @AnoFinal
BEGIN
	DECLARE @QtdFuncionarios INT = (SELECT COUNT(*) FROM DimEmployee WHERE YEAR(HireDate) = @AnoInicial)

	PRINT CAST(@QtdFuncionarios AS VARCHAR(5)) + ' contratações em ' + CAST(@AnoInicial AS VARCHAR(4))
	SET @AnoInicial += 1
END



-- -> EXERCÍCIO 3:
SET LANGUAGE 'Portuguese'

CREATE TABLE Calendario (
	Data DATE
)

DECLARE @DataInicial DATE = '01/01/2021',
		@DataFinal DATE = '31/12/2021'

WHILE @DataInicial <= @DataFinal
BEGIN

	INSERT INTO Calendario (Data)
	VALUES
		(@DataInicial)

	SET @DataInicial = DATEADD(DAY, 1, @DataInicial)

END

SELECT * FROM Calendario

DROP TABLE Calendario
