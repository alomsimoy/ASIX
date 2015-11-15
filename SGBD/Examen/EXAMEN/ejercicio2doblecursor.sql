use AdventureWorks2008R2

declare @ProSubID int
declare @Name nvarchar(50)
declare @ProductSubcategoryID int
	
declare c_list cursor for
select ProductSubcategoryID, Name from Production.ProductSubcategory

open c_list
fetch next from c_list into @ProSubID, @Name



while(@@FETCH_STATUS = 0)
begin 
	print 'ProductID ' +  '           Name'  
	print cast(@ProSubID as nvarchar(max))+'            ' + @Name
	print '----------------------------------------------------------'
	print 'name                 Color    Listprice     Weight'
	print '----------------------------------------------------------'	
	
	declare c_data cursor for
	select ISNULL(ProductSubcategoryID, '1'), name, ISNULL(Color, 'no color'), ISNULL(Listprice, '1'), ISNULL(Weight, '0.00') from Production.Product where @ProductSubcategoryID = @ProSubID
	

	
	open c_data
	declare @Name2 nvarchar(50)
	declare @Color nvarchar(15)
	declare @Listprice money
	declare @Weight decimal(8,2)

	/*aqui falla*/fetch next from c_data into @ProductSubcategoryID, @Name2, @Color, @Listprice, @Weight 
	
	while(@@FETCH_STATUS = 0)
	begin
		print @Name2 + @Color + cast(@Listprice as nvarchar(max)) + cast(@Weight as nvarchar(max))
		fetch next from c_data into @ProductSubcategoryID, @Name2, @Color, @Listprice, @Weight 
	end
	close c_data
	deallocate c_data
fetch next from c_list into @ProSubID, @Name
end
close c_list
deallocate c_list
