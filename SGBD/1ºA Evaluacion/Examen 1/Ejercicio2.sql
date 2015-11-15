declare cursor_dos cursor for
select TerritoryID,Name from sales.SalesTerritory

declare @territoryid int
declare @name nvarchar (50)

declare @business int
declare @sales money
declare @bonus money
declare @comission smallmoney

declare @businessalmacen int
declare @namealmacen nvarchar (50)

open cursor_dos
fetch next from cursor_dos into @territoryid, @name

while (@@FETCH_STATUS = 0)
begin
	print 'INFORMACIÓN DEL TERRITORIO:'
	print '	 CÓDIGO DE TERRITORIO:' + cast(@territoryid as nvarchar(10)) + '  NOMBRE:' + cast(@name as nvarchar(50))
		
		declare cursor_dosvendedores cursor for
		select BusinessEntityID,SalesQuota,Bonus,CommissionPct from sales.SalesPerson where TerritoryID=@territoryid
		
		open cursor_dosvendedores
		fetch next from cursor_dosvendedores into @business, @sales, @bonus, @comission
		
		while (@@FETCH_STATUS = 0)
			begin
				print '		INFORMACIÓN DE LOS VENDEDORES:'
				print '			CÓDIGO DEL VENDEDOR:' + cast(@business as nvarchar (10)) + '  CUOTA DE VENTA:' + cast(@sales as nvarchar(20))
				print '			BONO:' + cast(@bonus as nvarchar (15)) + '  COMISIÓN:' + cast(@comission as nvarchar (10))
				
					declare cursor_dosalmacenes cursor for
					select BusinessEntityID,Name from sales.Store where SalesPersonID=@business
					
					open cursor_dosalmacenes
					fetch next from cursor_dosalmacenes into @businessalmacen, @namealmacen
					
					while (@@FETCH_STATUS = 0)
						begin
							print '				INFORMACIÓN DE LOS ALMACENES:'
							print '					CODIGO DEL ALMACEN:' + cast(@businessalmacen as nvarchar (10)) + '  NOMBRE:' + cast(@namealmacen as nvarchar (50))
							fetch next from cursor_dosalmacenes into @businessalmacen, @namealmacen
						end
					close cursor_dosalmacenes
					deallocate cursor_dosalmacenes
					
				fetch next from cursor_dosvendedores into @business, @sales, @bonus, @comission
			end
		close cursor_dosvendedores
		deallocate cursor_dosvendedores
		
	fetch next from cursor_dos into @territoryid, @name
end
close cursor_dos
deallocate cursor_dos

select * from Sales.Store
select * from sales.SalesPerson
select * from sales.SalesTerritory
