use adventureworks2008R2
go
declare @firstname nvarchar(50)
declare @lastname nvarchar(50)
declare @persontype nvarchar(2)
declare cursor_person cursor for
select firstname,lastname,persontype from person.person

open cursor_person
fetch next from cursor_person into @firstname,@lastname,@persontype

while (@@fetch_status = 0)
begin
	--tarea del cursor
	print @firstname
	print @lastname
	print @persontype
	fetch next from cursor_Customer into @firstname,@lastname,@persontype
end
close cursor_person
deallocate cursor_person
--=================================================================================================================
--=================================================================================================================
--teniendo un ejemplo como el del cursor person
--Modificar el cursor para que trabaje sobre la tabla Customer
use adventureworks2008R2
go
declare @CustomerID int
declare @PersonID int
declare @StoreID int
declare @TerritoryID int
declare cursor_Customer cursor for
select CustomerID,PersonID,StoreID,TerritoryID from Sales.Customer

open cursor_Customer
fetch next from cursor_Customer into @CustomerID,@PersonID,@StoreID,@TerritoryID

while (@@fetch_status = 0)
begin
	--tarea del cursor
	print @CustomerID
	print @PersonID
	print @StoreID
	print @TerritoryID
	fetch next from cursor_Customer into @CustomerID,@PersonID,@StoreID,@TerritoryID
end
close cursor_Customer
deallocate cursor_Customer

--=================================================================================================================
--=================================================================================================================

--Ejercicio 2
--Realizar un cursor que liste los campos customerID, firstname, middlename, lastname, phone de la tabla customer, de tal modo que el cursor debe listar 5 customers, pero no los 5 primeros, sino los customers 1, 5, 10, 15, 20. Es decir, de 5 en 5.
--Usando SalesLT.Customers
use AdventureWorksLT2008R2
go
declare @CustomerCounter int
set @CustomerCounter = 0
declare @CustomerID int
declare @FirstName nvarchar(50)
declare @MiddleName nvarchar(50)
declare @LastName nvarchar(50)
declare @Phone nvarchar(20)
declare cursor_Customer cursor for
select CustomerID,FirstName,MiddleName,LastName,Phone from SalesLT.Customer
open cursor_Customer
fetch next from cursor_Customer into @CustomerID,@FirstName,@MiddleName,@LastName,@Phone
while (@@fetch_status = 0)
begin 
	if(@CustomerCounter % 5 = 0 and @CustomerCounter < 21)
	begin
		--tarea del cursor
		print 'Customer#' + cast(@CustomerCounter as nvarchar(20))
		print 'CustomerID: ' + cast(@CustomerID as nvarchar(20))
		print 'First Name: ' + cast(@FirstName as nvarchar(50))
		print 'Middle Name: ' + cast(@MiddleName as nvarchar(50))
		print 'Last Name: ' + cast(@LastName as nvarchar(50))
		print 'Phone: ' + cast(@Phone as nvarchar(20))
		print '------------------------------'
	end	
	set @CustomerCounter = @CustomerCounter + 1
	fetch next from cursor_Customer into @CustomerID,@FirstName,@MiddleName,@LastName,@Phone
end
close cursor_Customer
deallocate cursor_Customer

--=================================================================================================================
--=================================================================================================================
--Version Con Sales.Customer
use adventureworks2008R2
go
declare @CustomerCounter int
set @CustomerCounter = 0
declare @CustomerID int
declare @PersonID int
declare @StoreID int
declare @TerritoryID int
declare cursor_Customer cursor for
select CustomerID,PersonID,StoreID,TerritoryID from Sales.Customer
open cursor_Customer
fetch next from cursor_Customer into @CustomerID,@PersonID,@StoreID,@TerritoryID
while (@@fetch_status = 0)
begin 
	if(@CustomerCounter % 5 = 0 and @CustomerCounter < 21)
	begin
		--tarea del cursor
		print 'Customer#' + cast(@CustomerCounter as nvarchar(20))
		print 'CustomerID: ' + cast(@CustomerID as nvarchar(20))
		print 'PersonID: ' + cast(@PersonID as nvarchar(20))
		print 'StoreID: ' + cast(@StoreID as nvarchar(20))
		print 'TerritoryID: ' + cast(@TerritoryID as nvarchar(20))
	end	
	set @CustomerCounter = @CustomerCounter + 1
	fetch next from cursor_Customer into @CustomerID,@PersonID,@StoreID,@TerritoryID
end
close cursor_Customer
deallocate cursor_Customer

--======================================================================================================
--======================================================================================================
-- Versión que recorra los registros a base de saltos del fetch
use AdventureWorksLT2008R2
go
declare @CustomerID int
declare @FirstName nvarchar(50)
declare @MiddleName nvarchar(50)
declare @LastName nvarchar(50)
declare @Phone nvarchar(20)
declare cursor_Customer scroll cursor for
select CustomerID,FirstName,MiddleName,LastName,Phone from SalesLT.Customer
open cursor_Customer
fetch next from cursor_Customer into @CustomerID,@FirstName,@MiddleName,@LastName,@Phone
while (@@fetch_status = 0)
begin 
	--tarea del cursor
	if(@CustomerID is not null) print 'CustomerID: ' + cast(@CustomerID as nvarchar(20))
	if(@FirstName is not null) print 'First Name: ' + cast(@FirstName as nvarchar(50))
	if(@MiddleName is not null) print 'Middle Name: ' + cast(@MiddleName as nvarchar(50))
	if(@LastName is not null) print 'Last Name: ' + cast(@LastName as nvarchar(50))
	if(@Phone is not null) print 'Phone: ' + cast(@Phone as nvarchar(20))
	print '------------------------------'
	fetch relative 5 from cursor_Customer into @CustomerID,@FirstName,@MiddleName,@LastName,@Phone
end
close cursor_Customer
deallocate cursor_Customer