use AdventureWorks2008R2
GO


SELECT * FROM Production.Product

declare @ListPrice SMALLMoney
declare @StandardCost SMALLMoney
declare @ProductID INT 

declare insert_cursor cursor for
select ProductID, ListPrice, StandardCost  FROM Production.Product

open insert_cursor

fetch next from insert_cursor into @ProductID, @StandardCost ,@ListPrice

while (@@FETCH_STATUS = 0)
begin	
	print 'UPDATE Production.Products SET StandardCost='+ cast(@StandardCost AS NVARCHAR(50)) +', ListPrice='''+ cast(@ListPrice AS NVARCHAR(50))
	print 'WHERE ProductID='+ cast(@ProductID AS NVARCHAR(50))
	print '------------------------------------------'

fetch next from insert_cursor into @ProductID, @ListPrice,@StandardCost
end

close insert_cursor
deallocate insert_cursor 

-------------------------------------------------------------------------------------------------------

declare @ListPrice SMALLMoney
declare @StandardCost SMALLMoney
declare @ProductID INT 

declare insert_cursor cursor for
select ProductID, ListPrice, StandardCost  FROM Production.Product

open insert_cursor

fetch next from insert_cursor into @ProductID, @StandardCost ,@ListPrice

while (@@FETCH_STATUS = 0)
begin	
	UPDATE Production.Product 
	SET StandardCost=@ListPrice, ListPrice=@StandardCost
	WHERE ProductID=@ProductID
fetch next from insert_cursor into @ProductID, @ListPrice,@StandardCost
end

close insert_cursor
deallocate insert_cursor 


SELECT * from Production.Product
----------------------------------------------------------------
Con el de	JUANRA

SELECT ProductID, ListPrice, StandardCost FROM Production.Product
DECLARE @PRODUCTID INT
DECLARE @LISTPRICE MONEY
DECLARE @STANDARDCOST MONEY
DECLARE @TEMP MONEY
DECLARE C CURSOR FOR SELECT PRODUCTID, LISTPRICE, STANDARDCOST FROM Production.Product
OPEN C
FETCH NEXT FROM C INTO @PRODUCTID, @LISTPRICE, @STANDARCOST
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @TEMP = @LISTPRICE
	SET @LISTPRICE = @STANDARDCOST
	SET @STANDARDCOST = @TEMP
	UPDATE Production.Product SET ListPrice = @LISTPRICE, StandardCost = @STANDARDCOST WHERE ProductID = @PRODUCTID
	FETCH NEXT FROM C INTO @PRODUCTID, @LISTPRICE, @STANDARDCOST
END
CLOSE C