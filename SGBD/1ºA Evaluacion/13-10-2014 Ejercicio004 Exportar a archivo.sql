USE AdventureWorks2008R2
GO

SELECT * FROM Production.Product

SELECT * FROM Production.ProductSubcategory


CREATE TABLE PRODUCTOS
(
	ProductID INT PRIMARY KEY,
	Name NVARCHAR (50),
	ProductNumber NVARCHAR (50),
	Color NVARCHAR (15)
	
)

CREATE TABLE SUBPRODUCTOS
(
	ProductSubcategoryID INT PRIMARY KEY,
	ProductCategoryID NVARCHAR (50),
	Name NVARCHAR (50),
	Rowguid NVARCHAR (16),
	ModifiedDate DATETIME
)
DECLARE @ProductID INT
DECLARE @Name NVARCHAR (50)
DECLARE @ProductNumber NVARCHAR (50)
DECLARE @Color NVARCHAR (15)

DECLARE CURSOR_EXTRAER SCROLL CURSOR FOR
SELECT ProductID, Name, ProductNumber, Color FROM Production.Product

OPEN CURSOR_EXTRAER
FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT 'INSERT INTO PRODUCTOS(ProductID, ProductNumber, Color, Name)'
	PRINT 'VALUES (''' + @ProductID + ''', ''' + @ProductNumber + ''',''' + @Color + ''',''' + @Name + ''')'
	FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name
END
CLOSE CURSOR_EXTRAER
DEALLOCATE CURSOR_EXTRAER
---------------------------------------------------------------------------------
DECLARE @ProductID INT
DECLARE @Name NVARCHAR (50)
DECLARE @ProductNumber NVARCHAR (50)
DECLARE @Color NVARCHAR (15)

DECLARE CURSOR_EXTRAER SCROLL CURSOR FOR
SELECT ProductID, Name, ProductNumber, Color FROM Production.Product

OPEN CURSOR_EXTRAER
FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT 'INSERT INTO PRODUCTOS(ProductID, ProductNumber, Color, Name)'
	PRINT 'VALUES (''' + CAST(@ProductID AS INT) + ''', ''' +CAST(@ProductNumber AS NVARCHAR (50)) + ''',''' +CAST(@Color AS NVARCHAR (15)) + ''',''' +CAST(@Name AS NVARCHAR (50)) + ''')'
	FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name
END
CLOSE CURSOR_EXTRAER
DEALLOCATE CURSOR_EXTRAER
--------------------------------------------------------------------------------------------
DECLARE @NAME NVARCHAR (10)
DECLARE @COLOR NVARCHAR (10)
SET @NAME = 'IMPRESORA'
SET @COLOR = 'ROJO'

PRINT 'INSERT INTO PRODUCT (NAME, COLOR)'
PRINT 'VALUES (''' + @NAME + ''',''' + @COLOR + ''')'
-------------------------------------------------------------------------------------------
DECLARE @ProductID INT
DECLARE @Name NVARCHAR (50)
DECLARE @ProductNumber NVARCHAR (50)
DECLARE @Color NVARCHAR (15)

DECLARE CURSOR_EXTRAER SCROLL CURSOR FOR
SELECT ProductID, Name, ProductNumber, Color FROM Production.Product

OPEN CURSOR_EXTRAER
FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT 'INSERT INTO PRODUCTOS(ProductID, ProductNumber, Color, Name) VALUES (''' + CAST(@ProductID AS INT) + ''', ''' +CAST(@ProductNumber AS NVARCHAR (50)) + ''',''' +CAST(@Color AS NVARCHAR (15)) + ''',''' +CAST(@Name AS NVARCHAR (50)) + ''')'
	FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name
END
CLOSE CURSOR_EXTRAER
DEALLOCATE CURSOR_EXTRAER

-------------------------------------------------------------------------------------------
DECLARE @ProductID INT
DECLARE @Name NVARCHAR (50)
DECLARE @ProductNumber NVARCHAR (50)
DECLARE @Color NVARCHAR (15)

DECLARE CURSOR_EXTRAER SCROLL CURSOR FOR
SELECT ProductID, Name, ProductNumber, Color FROM Production.Product

OPEN CURSOR_EXTRAER
FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT 'INSERT INTO PRODUCTOS(ProductID, ProductNumber, Color, Name) VALUES (''' + @ProductID + ''', ''' + @ProductNumber + ''',''' + @Color + ''',''' + @Name + ''')'
	FETCH NEXT FROM CURSOR_EXTRAER INTO @ProductID, @ProductNumber, @Color, @Name
END
CLOSE CURSOR_EXTRAER
DEALLOCATE CURSOR_EXTRAER