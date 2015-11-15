USE AdventureWorks2008R2
GO
CREATE FUNCTION PersonCount()
RETURNS INTEGER
AS
	BEGIN
		DECLARE @Counter INTEGER
		SET @Counter = (SELECT COUNT(BusinessEntityID)FROM Person.Person)
		RETURN @Counter
	END
---------------------------
DECLARE @Resultado INTEGER
SET @Resultado = dbo.PersonCount()
SELECT @Resultado as RESULTADO --PRINT @Resultado
--------------------------------------------------
----------------COLORES MÁS VENDIDOS--------------
--------------------------------------------------
CREATE FUNCTION GETMAINCOLOR()
RETURNS NVARCHAR (25)
AS
BEGIN
	DECLARE @ORDERQTY INT
	DECLARE @COLOR NVARCHAR (25)

	DECLARE MASVENDIDO CURSOR SCROLL FOR

	SELECT TOP 1 SUM(SOD.OrderQty) AS OrderQty, P.Color FROM Sales.SalesOrderDetail AS SOD
	INNER JOIN Production.Product AS P
	ON SOD.ProductID = P.ProductID
	WHERE P.Color IS NOT NULL
	GROUP BY P.Color
	ORDER BY OrderQty DESC

	OPEN MASVENDIDO
	FETCH FIRST FROM MASVENDIDO INTO @ORDERQTY, @COLOR
	IF (@@FETCH_STATUS <> 0) SET @COLOR= ''
		CLOSE MASVENDIDO
		DEALLOCATE MASVENDIDO
		RETURN @COLOR
END
-------
SELECT * FROM Production.Product
WHERE Color = dbo.GetMainColor()
-----
DECLARE @COLOR NVARCHAR (25)
SET @COLOR = dbo.GetMainColor()
SELECT * FROM Production.Product
WHERE Color = @COLOR