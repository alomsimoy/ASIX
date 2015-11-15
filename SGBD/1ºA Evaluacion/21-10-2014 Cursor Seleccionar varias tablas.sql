USE AdventureWorks2008R2
GO


SELECT PSC.Name, P.Name, p.ListPrice
FROM Production.Product AS P INNER JOIN Production.ProductSubcategory AS PSC
ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
GROUP BY psc.Name, p.Name, p.ListPrice

SELECT * FROM Production.ProductSubcategory
SELECT * FROM Production.Product


declare @IDSubcat INT
declare @Name NVARCHAR(50)

declare @IDSubcatP INT
declare @NameP NVARCHAR(50)
declare @ListPrice SMALLMONEY

declare subcat_cursor cursor for
select Name, ProductSubcategoryID from Production.ProductSubcategory 

open subcat_cursor

fetch next from subcat_cursor into @Name, @IDSubcat 


WHILE (@@FETCH_STATUS=0)

BEGIN
	Print 'NOMBRE CATEGORIA: '+@Name
	
	declare product_cursor cursor for
	select ProductSubcategoryID, Name, ListPrice FROM Production.Product
	WHERE ProductSubcategoryID=@IDSubcat
		
	open product_cursor
	
	fetch next from product_cursor into @IDSubcatP, @NameP, @ListPrice
	
	WHILE (@@FETCH_STATUS=0)
	begin
		print 'Producto: '+@NameP+' Price: '+cast(@ListPrice AS NVARCHAR)
		fetch next from product_cursor into @IDSubcatP, @NameP, @ListPrice
	end
	
	close product_cursor
	deallocate product_cursor
	print '-----------------------------------------------------------------------'
	
	fetch next from subcat_cursor into @Name, @IDSubcat
 		
END

-----------------------------------------
close subcat_cursor
deallocate subcat_cursor


SELECT * FROM Production.ProductSubcategory

SELECT * FROM Production.Product

---------------------------------------------------------------------------------------
Con el de Juanra

DECLARE @CATEGORYID INT
DECLARE @CATEGORYNAME NVARCHAR (50)
DECLARE @PRODUCTNAME NVARCHAR (50)
DECLARE C1 CURSOR FOR
SELECT PRODUCTCATEORYID, NAME FROM Production.ProductSubcategory
OPEN C1
	FETCH NEXT FROM C1 INTO @CATEGORYID, @CATEGORYNAME
		WHILE (@@FETCH_STATUS = 0)
		BEGIN
			PRINT @CATEGORYNAME
			DECLARE C2 CURSOR FOR SELECT NAME FROM Production.Product WHERE ProductSubcategoryID = @SUBCATEGORYID
			FETCH NEXT FROM C1 INTO @CATEGORYID, @CATEGORYNAME
		END
