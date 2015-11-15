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

JUANRA-------------
DROP TABLE Familias
CREATE TABLE Familias
(
	Codigo INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Nombre NVARCHAR (50) NOT NULL
)
DROP TABLE Articulos
CREATE TABLE Articulos
(
	Codigo INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Name NVARCHAR (50) NOT NULL,
	Price SMALLMONEY NOT NULL,
	Codfamilia INT FOREIGN KEY REFERENCES Familias(Codigo) NULL,
	Orden INT NULL
)
SELECT * FROM Familias
INSERT INTO Familias VALUES ('Carpinteria')
INSERT INTO Familias VALUES ('Mecanica')
INSERT INTO Familias VALUES ('Nautica')

SELECT * FROM Articulos
INSERT INTO Articulos VALUES ('Martillo','20','1','1')
INSERT INTO Articulos VALUES ('Clavos 10 mm','0,5','1','2')
INSERT INTO Articulos VALUES ('Clavos 20 mm','0,5','1','3')
INSERT INTO Articulos VALUES ('Tornillos 5 mm','0,25','1','4')
INSERT INTO Articulos VALUES ('Tornillos 10 mm','0,25','1','5')
INSERT INTO Articulos VALUES ('Destornillador estrella 10 mm','6','1','6')
INSERT INTO Articulos VALUES ('Destornillador estrella 25 mm','9','1','7')
INSERT INTO Articulos VALUES ('Motor de arranque 100 CV','300','2','8')
INSERT INTO Articulos VALUES ('Ruedas 155','80','2','9')
INSERT INTO Articulos VALUES ('Ruedas 200','87','2','10')
INSERT INTO Articulos VALUES ('Cristal delantero universal','150','2','11')
INSERT INTO Articulos VALUES ('Motor fuera borda Yamaha 50','5000','3','12')
INSERT INTO Articulos VALUES ('Defensas estándar 100 cmm','60','3','13')
INSERT INTO Articulos VALUES ('Salvavidas Adulto 100 Kg','50','3','14')
INSERT INTO Articulos VALUES ('Salvavidas Adulto 75 Kg','45','3','15')
INSERT INTO Articulos VALUES ('Mesa 100 x 200 cm','30',NULL,'16')
INSERT INTO Articulos VALUES ('Mesa 100 x 100 xm','20',NULL,'17')
INSERT INTO Articulos VALUES ('Ratón Logitech','20',NULL,'18')
INSERT INTO Articulos VALUES ('Portatil HP 2000','600',NULL,'19')
INSERT INTO Articulos VALUES ('Llavero náutico','21',NULL,'20')

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
