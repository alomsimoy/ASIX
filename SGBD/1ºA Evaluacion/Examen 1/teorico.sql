USE BD009
GO

declare cursor_uno cursor for
select Codigo,Name,Price,Codfamilia,Orden from Articulos

declare @codigo int
declare @name nvarchar (20)
declare @price smallmoney
declare @codfamilia int
declare @orden int

open cursor_uno
fetch next from cursor_uno into @codigo,@name,@price,@codfamilia,@orden

while (@@FETCH_STATUS = 0)
begin
	print cast(@codigo as nvarchar(20)) + cast(@name as nvarchar(20)) + cast(@price as nvarchar(20)) + cast(@codfamilia as nvarchar(20)) + cast(@orden as nvarchar (20))
	fetch next from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
end
close cursor_uno
deallocate cursor_uno

select * from Articulos
---------------------------------------------
declare cursor_uno scroll cursor for
select Codigo,Name,Price,Codfamilia,Orden from Articulos

declare @codigo int
declare @name nvarchar (20)
declare @price smallmoney
declare @codfamilia int
declare @orden int

open cursor_uno
fetch next from cursor_uno into @codigo,@name,@price,@codfamilia,@orden

while (@@FETCH_STATUS = 0)
begin
	print cast(@codigo as nvarchar(20)) 
	fetch relative 2 from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
end
close cursor_uno
deallocate cursor_uno
------------------------------------------
declare cursor_uno scroll cursor for
select Codigo,Name,Price,Codfamilia,Orden from Articulos

declare @codigo int
declare @name nvarchar (20)
declare @price smallmoney
declare @codfamilia int
declare @orden int

open cursor_uno
fetch next from cursor_uno into @codigo,@name,@price,@codfamilia,@orden

while (@@FETCH_STATUS = 0)
begin
	print cast(@codigo as nvarchar(20)) 
	fetch relative 10 from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
end
close cursor_uno
deallocate cursor_uno
------------------------------------------------
declare cursor_uno scroll cursor for
select Codigo,Name,Price,Codfamilia,Orden from Articulos

declare @codigo int
declare @name nvarchar (20)
declare @price smallmoney
declare @codfamilia int
declare @orden int

open cursor_uno
fetch next from cursor_uno into @codigo,@name,@price,@codfamilia,@orden

fetch first from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
print cast(@codigo as nvarchar(20))
fetch last from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
print cast(@codigo as nvarchar(20))
fetch absolute 10 from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
print cast(@codigo as nvarchar(20))
fetch absolute 16 from cursor_uno into @codigo,@name,@price,@codfamilia,@orden
print cast(@codigo as nvarchar(20))

close cursor_uno
deallocate cursor_uno
-----------------------------------------
CREATE PROCEDURE FILLFK009

DECLARE @CODIGO INT,
DECLARE @NAME NVARCHAR (50),
DECLARE @VALOR_IDENTITY INT
AS

DECLARE CURSOR_IDENTITY FOR 
SELECT Codigo, Name FROM Articulos WHERE Codfamilia IS NULL
OPEN CURSOR_IDENTITY
FETCH NEXT FROM CURSOR_IDENTITY INTO @CODIGO, @NAME

WHILE (@@FETCH_STATUS = 0)
BEGIN
	INSERT INTO Familias VALUES (@NAME)
	SET @VALOR_IDENTITY = @@IDENTITY
	UPDATE Articulos SET Codfamilia=@VALOR_IDENTITY WHERE Codigo=@CODIGO
	FETCH NEXT FROM CURSOR_IDENTITY INTO @CODIGO, @NAME
END
CLOSE CURSOR_IDENTITY
DEALLOCATE CURSOR_IDENTITY

select * from Articulos

declare @codigo integer
declare @name nvarchar (50)
declare @identity_value integer
declare c cursor for select codigo, name from Articulos where CodFamilia is null
open c
fetch next from c into @codigo, @name
while (@@fetch_status = 0)
begin
	insert into Familias values (@name)set @identity_value = @@IDENTITY
	update Articulos set CodFamilia=@identity_value where Codigo = @codigo
	fetch next from c into @codigo, @name
end
close c
deallocate c
