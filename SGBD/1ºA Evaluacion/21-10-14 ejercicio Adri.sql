declare cursor_subcat cursor for
select ProductSubcategoryID, Name from Production.ProductSubcategory

declare @SubCatID int
declare @SubCatName nvarchar(50)

open cursor_subcat
fetch next from cursor_subcat into @SubCatID, @SubCatName

declare @ProdName nvarchar(50)
declare @Color nvarchar(15)

while (@@FETCH_STATUS = 0)
begin
	
	declare cursor_products cursor for
	select Name, ISNULL(color, 'no color') from Production.Product where ProductSubcategoryID  = @SubCatID

	print '--------------------'
	print 'Category: ' + @SubCatName 
	print 'Name						Color'

	open cursor_products
	fetch next from cursor_products into @ProdName, @Color

		while (@@FETCH_STATUS = 0)
		begin
			print @ProdName + ' - ' + @Color
			fetch next from cursor_products into @ProdName, @Color
		end

	close cursor_products
	deallocate cursor_products

	fetch next from cursor_subcat into @SubCatID, @SubCatName
end

close cursor_subcat
deallocate cursor_subcat
