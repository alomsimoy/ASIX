USE Sales
GO

CREATE TABLE Articles
(
	Code  INT PRIMARY KEY IDENTITY (1,1)  NOT NULL,
	Name  NVARCHAR(50)        NOT NULL,
	Price  SMALLMONEY        NOT NULL,
	VAT  NUMERIC(3,2)        NOT NULL,
	Cost  SMALLMONEY        NOT NULL,
	Stock  INTEGER        NOT NULL
)

CREATE TABLE Sales
(
	Code  INT PRIMARY KEY IDENTITY (1,1)  NOT NULL,
	Time  SMALLDATETIME        NOT NULL
)

CREATE TABLE SalesDetails
(
	CodeSale  INT FOREIGN KEY REFERENCES Sales(Code)  NOT NULL,
	CodeArticle  INT FOREIGN KEY REFERENCES Articles(Code)    NOT NULL,
	Price    SMALLMONEY            NULL,
	VAT    NUMERIC(3,2)            NULL,
	Profits  SMALLMONEY            NULL,
	Quantity  INTEGER            NOT NULL
)

ALTER TABLE SalesDetails
ADD CONSTRAINT PK_SalesDetails PRIMARY KEY (CodeSale, CodeArticle)

----------------------------PROCEDURE
CREATE PROCEDURE INSERDETAIL
@CODESALE INT,
@CODEARTICLE INT,
@QUANTITY INT
AS
INSERT INTO SalesDetails (CodeSale,CodeArticle,Quantity) VALUES (@CODESALE,@CODEARTICLE,@QUANTITY)

----------------------------
EXEC INSERDETAIL 1, 1, 1
----------------------------

--------------------------BANCO PRUEBAS
SELECT * FROM SalesDetails
SELECT * FROM Sales
SELECT * FROM Articles

DROP TABLE Sales
DROP TABLE Articles
DROP TABLE SalesDetails
------------------INSERTS ARTICLES
INSERT INTO Articles (Name,Price,VAT,Cost,Stock) VALUES ('Pato',500,0.21,450,90)
INSERT INTO Articles (Name,Price,VAT,Cost,Stock) VALUES ('Helado',0.70,0.21,0.33,100)
INSERT INTO Articles (Name,Price,VAT,Cost,Stock) VALUES ('Lancha',15000,0.21,10500,10)
INSERT INTO Articles (Name,Price,VAT,Cost,Stock) VALUES ('Silla',15,0.21,9.90,25)
INSERT INTO Articles (Name,Price,VAT,Cost,Stock) VALUES ('Cargador',21,0.21,15.50,6)
-----------------INSERTS SALES
INSERT INTO Sales (Time) VALUES (02/12/2014)
---------------------CREAR TRIGGER
DROP TRIGGER Update012
CREATE TRIGGER Update012
ON SalesDetails
FOR INSERT
AS
	BEGIN
		DECLARE @PRICE INT
		DECLARE @VAT NUMERIC(3,2)
		DECLARE @COST INT
		SELECT @PRICE=Price, @VAT=VAT, @COST=Cost FROM Articles
		
		DECLARE @CODE INT
		SELECT @CODE=CodeSale FROM inserted
		
		DECLARE @CODEARTICLES INT
		SELECT @CODEARTICLES=Code FROM Articles
		
		IF EXISTS(SELECT CodeArticle FROM inserted WHERE CodeArticle=@CODEARTICLES)
			BEGIN
				UPDATE SalesDetails SET Price=@PRICE, VAT=@VAT, Profits=@PRICE-@COST WHERE CodeSale=@CODE
			END
	END


