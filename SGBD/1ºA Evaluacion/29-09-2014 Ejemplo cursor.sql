USE AdventureWorksLT2008R2
GO

DECLARE @FIRSTNAME NVARCHAR (50)
DECLARE @LASTNAME NVARCHAR (50)
DECLARE @COMPANYNAME NVARCHAR (50)

DECLARE CURSOR_CUSTOMER CURSOR FOR
SELECT FIRSTNAME, LASTNAME, COMPANYNAME FROM SalesLT.Customer

OPEN CURSOR_CUSTOMER
FETCH NEXT FROM CURSOR_CUSTOMER INTO @FIRSTNAME, @LASTNAME, @COMPANYNAME

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT @FIRSTNAME
	PRINT @LASTNAME
	PRINT @COMPANYNAME
	FETCH NEXT FROM CURSOR_CUSTOMER INTO
@FIRSTNAME, @LASTNAME, @COMPANYNAME
END
CLOSE CURSOR_CUSTOMER
DEALLOCATE CURSOR_CUSTOMER
---------------------------------------------
USE AdventureWorksLT2008R2
GO

DECLARE @CUSTOMERID NVARCHAR (50)
DECLARE @FIRSTNAME NVARCHAR (50)
DECLARE @MIDDLENAME NVARCHAR (50)
DECLARE @LASTNAME NVARCHAR (50)
DECLARE @PHONE NVARCHAR (20)

DECLARE CURSOR_CUSTOMER2 CURSOR FOR
SELECT CustomerID,FirstName,MiddleName, LastName, Phone FROM SalesLT.Customer

OPEN CURSOR_CUSTOMER2
FETCH NEXT FROM CURSOR_CUSTOMER2 INTO @CUSTOMERID, @FIRSTNAME, @MIDDLENAME, @LASTNAME, @PHONE

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT @CUSTOMERID
	PRINT @FIRSTNAME
	PRINT @MIDDLENAME
	PRINT @LASTNAME
	PRINT @PHONE
	FETCH  FROM CURSOR_CUSTOMER2 INTO
@CUSTOMERID, @FIRSTNAME, @MIDDLENAME, @LASTNAME, @PHONE
END
CLOSE CURSOR_CUSTOMER2
DEALLOCATE CURSOR_CUSTOMER2
------------------------------
USE AdventureWorksLT2008R2
GO

DECLARE @CUSTOMERID NVARCHAR (50)
DECLARE @FIRSTNAME NVARCHAR (50)
DECLARE @MIDDLENAME NVARCHAR (50)
DECLARE @LASTNAME NVARCHAR (50)
DECLARE @PHONE NVARCHAR (20)

DECLARE CURSOR_CUSTOMER2 SCROLL CURSOR FOR
SELECT CustomerID,FirstName,MiddleName, LastName, Phone FROM SalesLT.Customer

OPEN CURSOR_CUSTOMER2
FETCH NEXT FROM CURSOR_CUSTOMER2 INTO @CUSTOMERID, @FIRSTNAME, @MIDDLENAME, @LASTNAME, @PHONE

WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT @CUSTOMERID
	PRINT @FIRSTNAME
	PRINT @MIDDLENAME
	PRINT @LASTNAME
	PRINT @PHONE
	FETCH RELATIVE 5  FROM CURSOR_CUSTOMER2 INTO
@CUSTOMERID, @FIRSTNAME, @MIDDLENAME, @LASTNAME, @PHONE
END
CLOSE CURSOR_CUSTOMER2
DEALLOCATE CURSOR_CUSTOMER2

SELECT * FROM SalesLT.Customer