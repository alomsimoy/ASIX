/* crear un cursor que visualice los campos siguientes
Name, color, Listprice, Weight ProductSubcategoriID, de la tabla Production.product
ordenadas de mayor a menor numero de ProductID, de tal modo,
que muestre un registro si y uno no */

declare @ProductID int
declare @Name nvarchar(50) 
declare @Color nvarchar(15)
declare @Listprice money
declare @Weight decimal(8,2)
declare @ProductSubcategoryID int

declare c_campos scroll cursor for
select ProductID, Name, color, Listprice, Weight, ProductSubcategoryID from Production.Product
where ProductID is not null
order by ProductID

open c_campos
fetch next from c_campos into @ProductID, @Name, @Color, @Listprice, @Weight, @ProductSubcategoryID
while(@@FETCH_STATUS = 0)
begin
	print '-----------------------'
	print cast(@ProductID as nvarchar(max)) + @Name + @Color + cast(@Listprice as nvarchar(max)) + cast(@Weight as nvarchar(max)) + cast(@ProductSubcategoryID as nvarchar(max))
	print '-----------------------'
	fetch relative 1 from c_campos into @ProductID, @Name, @Color, @Listprice, @Weight, @ProductSubcategoryID
end
close c_campos
deallocate c_campos
