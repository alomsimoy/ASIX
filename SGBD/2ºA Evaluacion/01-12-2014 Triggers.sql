DROP TABLE Articles
CREATE TABLE Articles
(
	Code INT PRIMARY KEY NOT NULL,
	Name NVARCHAR (50) NOT NULL,
	Price SMALLMONEY NOT NULL,
	Cost SMALLMONEY NOT NULL
)
DROP TABLE ChristmasArticles
CREATE TABLE ChristmasArticles
(
	Code INT PRIMARY KEY NOT NULL
)
--------------------------------------------ESTRUCTURA INSERTAR
CREATE TRIGGER ChristmasArticlesUpdate
ON Articles
FOR INSERT
AS
	BEGIN
		DECLARE @Code INT
		SELECT @Code = Code FROM inserted --Tabla que contiene el unico registro que se acaba de insertar en esta tabla
		IF EXISTS (SELECT Code FROM ChristmasArticles WHERE Code = @Code)
			BEGIN
				UPDATE Articles SET Price = Price*1.05 WHERE Code = @Code
			END
	END
------------------------
INSERT INTO ChristmasArticles (Code) VALUES (3)
INSERT INTO ChristmasArticles (Code) VALUES (4)
INSERT INTO ChristmasArticles (Code) VALUES (6)
INSERT INTO ChristmasArticles (Code) VALUES (9)

SELECT * FROM ChristmasArticles
------------------------
INSERT INTO Articles (Code,Name,Price,Cost) VALUES (1,'Grapadora Universal',19,4)
INSERT INTO Articles (Code,Name,Price,Cost) VALUES (2,'Goma de Borrar',2,1)
INSERT INTO Articles (Code,Name,Price,Cost) VALUES (3,'CD-Canciones de Navidad',9,1)
INSERT INTO Articles (Code,Name,Price,Cost) VALUES (9,'Gorro Papa Noel',6,2)

SELECT * FROM Articles
--------------------------------------------ESTRUCTURA BORRAR
CREATE TRIGGER ArticlesUpdate
ON ChristmasArticles
FOR DELETE
AS
	BEGIN
		DECLARE @Code INT
		SELECT @Code = Code FROM deleted
		
		IF EXISTS (SELECT Code FROM Articles WHERE Code = @Code)
			BEGIN
				UPDATE Articles SET Price = Price/1.05 WHERE Code = @Code
			END
	END
--------------------------------------------ESTRUCTURA ACTUALIZAR
CREATE TRIGGER ChristmasUpdate
ON Articles
FOR UPDATE
AS
	BEGIN
		IF UPDATE(Code)
			BEGIN
				DECLARE @CodeOld INT
				DECLARE @CodeNew INT
				SELECT @CodeOld = Code FROM deleted
				SELECT @CodeNew = Code FROM inserted
				IF EXISTS (SELECT Code FROM ChristmasArticles WHERE Code = @CodeOld)
					BEGIN
						UPDATE ChristmasArticles SET Code = @CodeNew WHERE Code = @CodeOld
					END
			END
	END
----------------------------------------------
CREATE TRIGGER ChristmasUpdate
ON Articles WITH ENCRYPTION --Para que no pueda verse el código
FOR UPDATE
AS
	BEGIN
		IF UPDATE (Code)
			BEGIN
				
			END
	END