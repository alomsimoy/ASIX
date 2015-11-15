USE Examen
GO

DECLARE @BusinessEntityID int
DECLARE @Title NVARCHAR (8)
DECLARE @MiddleName NVARCHAR (50)

DECLARE CURSOR_PERSON CURSOR FOR
SELECT BusinessEntityID, Title, MiddleName FROM Person

OPEN CURSOR_PERSON
FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @MiddleName
PRINT 'Title – FirstName – MiddleName – LastName - EmailPromotion'
WHILE (@@FETCH_STATUS = 0)
BEGIN
	if (@MiddleName is null)
		BEGIN
			if (@Title is null)
			BEGIN
				delete from Person where BusinessEntityID = @BusinessEntityID
			END
		END
	FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @MiddleName
END
CLOSE CURSOR_PERSON
DEALLOCATE CURSOR_PERSON