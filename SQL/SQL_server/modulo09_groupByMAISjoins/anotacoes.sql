-- -> GROUP BY + INNER JOIN:
select top(100) * from FactSales
select * from DimDate

SELECT
	CalendarYear AS 'Ano',
	SUM(SalesQuantity) As 'Total Vendido'
FROM
	FactSales
INNER JOIN DimDate
	ON FactSales.DateKey = DimDate.Datekey
WHERE CalendarMonthLabel = 'January'
GROUP BY CalendarYear
--HAVING SUM(SalesQuantity) >= 1200000
ORDER BY SUM(SalesQuantity) DESC