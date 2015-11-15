USE Examen
GO
CREATE TABLE Person(
	BusinessEntityID int PRIMARY KEY NOT NULL,
	PersonType nchar(2) NOT NULL,
	NameStyle nvarchar(50) NOT NULL,
	Title nvarchar(8) NULL,
	FirstName nvarchar(50) NOT NULL,
	MiddleName nvarchar(50) NULL,
	LastName nvarchar(50) NOT NULL,
	Suffix nvarchar(10) NULL,
	EmailPromotion int NOT NULL,
	AdditionalContactInfo xml NULL,
	Demographics xml NULL,
	rowguid uniqueidentifier NOT NULL,
	ModifiedDate datetime NOT NULL)
GO
