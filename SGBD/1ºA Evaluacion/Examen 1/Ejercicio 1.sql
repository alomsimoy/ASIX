USE AdventureWorks2008R2
GO

create procedure SalesPersonReview
@nombre nvarchar (50)
as

declare @business int
declare @numero int

declare cursor_uno cursor for
select BusinessEntityID from Sales.SalesPerson where TerritoryID is null

open cursor_uno
fetch next from cursor_uno into @business

while (@@FETCH_STATUS = 0)
	begin
		insert into Sales.SalesTerritory values (@nombre)
		set @numero = @@IDENTITY
		update Sales.SalesPerson set TerritoryID=@numero where BusinessEntityID=@business
		fetch next from cursor_uno into @business
	end
close cursor_uno
deallocate cursor_uno

exec SalesPersonReview 'Ejemplo'

select * from Sales.SalesPerson
select * from Sales.SalesTerritory
