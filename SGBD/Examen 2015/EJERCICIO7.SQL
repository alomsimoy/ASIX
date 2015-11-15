USE Examen
GO

DECLARE @BusinessEntityID int
DECLARE @Title NVARCHAR (50)
DECLARE @MiddleName NVARCHAR (50)

DECLARE CURSOR_PERSON CURSOR FOR
SELECT BusinessEntityID, Title, MiddleName FROM Person

OPEN CURSOR_PERSON
FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @MiddleName

WHILE (@@FETCH_STATUS = 0)
BEGIN
	if (@Title is null)
	BEGIN
		if (@MiddleName is null)
		BEGIN
			PRINT 'DELETE FROM Person WHERE BusinessEntityID = ''' + cast(@BusinessEntityID as nvarchar(20)) + ''''
		END
	END
	FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @MiddleName
END
CLOSE CURSOR_PERSON
DEALLOCATE CURSOR_PERSON
