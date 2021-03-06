CREATE TABLE Familias
(
	Codigo INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Nombre NVARCHAR(50) NOT NULL
)
CREATE TABLE Articulos
(
	Codigo INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	Name NVARCHAR (50) NOT NULL,
	Price SMALLMONEY NOT NULL,
	Orden INT NOT NULL,
	CodFamilia INT FOREIGN KEY REFERENCES Familias(Codigo) NOT NULL
)
---------------------------------------Creadas tablas
INSERT INTO Familias VALUES ('Electrodomesticos')
INSERT INTO Familias VALUES ('Verduras')
INSERT INTO Familias VALUES ('Mascotas')

SELECT * FROM Familias

INSERT INTO Articulos VALUES ('Batidora', 25.20, 1, 1)
INSERT INTO Articulos VALUES ('Tostadora', 20, 2, 1)
INSERT INTO Articulos VALUES ('Exprimidor', 19, 3, 1)
INSERT INTO Articulos VALUES ('Nevera', 120, 4, 1)

INSERT INTO Articulos VALUES ('Tomate', 0.39, 1, 2)
INSERT INTO Articulos VALUES ('Lechuga', 0.57, 2, 2)
INSERT INTO Articulos VALUES ('Col', 0.63, 3, 2)
INSERT INTO Articulos VALUES ('Guisantes', 0.17, 4, 2)

INSERT INTO Articulos VALUES ('Perro', 300, 1, 3)
INSERT INTO Articulos VALUES ('Gato', 150, 2, 3)
INSERT INTO Articulos VALUES ('Hamster', 5, 3, 3)
INSERT INTO Articulos VALUES ('Tortuga', 3, 4, 3)

SELECT * FROM Articulos
--------------------------------------Introducidos datos
CREATE PROCEDURE CambiarOrden
@CODIGOFAMILIA INT,
@INICIOORDEN INT
AS
DECLARE @CODIGO INT

DECLARE UPDATE_ORDEN CURSOR FOR
SELECT Codigo FROM Articulos WHERE CodFamilia=@CODIGOFAMILIA ORDER BY Codigo

OPEN UPDATE_ORDEN

FETCH NEXT FROM UPDATE_ORDEN INTO @CODIGO

WHILE (@@FETCH_STATUS = 0)
BEGIN
	UPDATE Articulos SET Orden=@INICIOORDEN WHERE Codigo=@CODIGO
	SET @INICIOORDEN = @INICIOORDEN + 1
	FETCH NEXT FROM UPDATE_ORDEN INTO @CODIGO
END

CLOSE UPDATE_ORDEN
DEALLOCATE UPDATE_ORDEN

EXEC CambiarOrden 1, 200