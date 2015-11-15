declare @ProductSubID int
declare @Name nvarchar

declare c_ab scroll cursor for
select ProductSubcategoryID, Name from Production.ProductSubcategory

open c_ab
/*esto pone el cursor en la primera posicion*/
fetch first from c_ab 

/*esto pone el cursor en la ultima posicion*/
fetch last from c_ab 

--muestra la posicion numero 10
fetch absolute 10 from c_ab 

--muestra la posicion numero 16
fetch absolute 16 from c_ab 

close c_ab
deallocate c_ab
