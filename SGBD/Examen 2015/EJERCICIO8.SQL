USE Examen
GO

DECLARE @BusinessEntityID int
DECLARE @Title NVARCHAR (50)
DECLARE @MiddleName NVARCHAR (50)
DECLARE @Suffix nvarchar(10)
DECLARE @AdditionalContactInfo xml
DECLARE @Demographics xml
DECLARE @contador int

DECLARE CURSOR_PERSON CURSOR FOR
SELECT BusinessEntityID, Title, MiddleName, Suffix, AdditionalContactInfo, Demographics FROM Person

OPEN CURSOR_PERSON
FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @MiddleName, @Suffix, @AdditionalContactInfo, @Demographics

WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @contador = 0
	if (@Title is null) SET @contador = @contador + 1
	if (@MiddleName is null) SET @contador = @contador + 1
	if (@Suffix is null) SET @contador = @contador + 1
	if (@AdditionalContactInfo is null) SET @contador = @contador + 1
	if (@Demographics is null) SET @contador = @contador + 1
	
	if (@contador >= 2)
	PRINT 'DELETE FROM Person WHERE BusinessEntityID = ''' + cast(@BusinessEntityID as nvarchar(20)) + ''''
	
	
	FETCH NEXT FROM CURSOR_PERSON INTO @BusinessEntityID, @Title, @MiddleName, @Suffix, @AdditionalContactInfo, @Demographics
END
CLOSE CURSOR_PERSON
DEALLOCATE CURSOR_PERSON
