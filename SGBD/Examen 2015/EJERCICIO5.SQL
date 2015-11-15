USE Examen
GO

DECLARE @Title NVARCHAR (8)
DECLARE @FirstName NVARCHAR (50)
DECLARE @MiddleName NVARCHAR (50)
DECLARE @LastName NVARCHAR (50)
DECLARE @EmailPromotion int

DECLARE CURSOR_PERSON SCROLL CURSOR FOR
SELECT Title, FirstName, MiddleName, LastName, EmailPromotion FROM Person

OPEN CURSOR_PERSON
FETCH RELATIVE 10 FROM CURSOR_PERSON INTO @Title, @FirstName, @MiddleName, @LastName, @EmailPromotion

PRINT 'Title – FirstName – MiddleName – LastName - EmailPromotion'
WHILE (@@FETCH_STATUS = 0)
BEGIN
	if (@MiddleName is null) set @Middlename = ' '
	else set @Middlename = @Middlename + ' '
	if (@Title is null) set @Title = ' '
	else set @Title = ' ' + @Title + ' '
	PRINT @Title + @FirstName + ' '+ @MiddleName + @Lastname + ' (EmailPromotion: ' + cast(@EmailPromotion as nvarchar(20)) + ')'
	FETCH  RELATIVE 10 FROM CURSOR_PERSON INTO @Title, @FirstName, @MiddleName, @LastName, @EmailPromotion
END
CLOSE CURSOR_PERSON
DEALLOCATE CURSOR_PERSON