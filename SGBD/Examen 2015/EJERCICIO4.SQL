USE Examen
GO

DECLARE @BusinessEntityID int
DECLARE @Title NVARCHAR (50)
DECLARE @FirstName NVARCHAR (50)
DECLARE @LastName NVARCHAR (50)

DECLARE CURSOR_PERSON CURSOR FOR
SELECT BusinessEntityID, Title, FirstName, LastName FROM Person

OPEN CURSOR_PERSON
FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @FirstName, @LastName
PRINT 'BusinessEntityID – (Title) – FirstName - LastName'
WHILE (@@FETCH_STATUS = 0)
BEGIN
	if (@Title is null) set @Title = ' '
	else set @Title = ' ' + @Title + ' '
	PRINT cast(@BusinessEntityID as nvarchar(20)) + '.-' + @Title + @FirstName + ' '+ @Lastname
	FETCH  NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @FirstName, @LastName
END
CLOSE CURSOR_PERSON
DEALLOCATE CURSOR_PERSON