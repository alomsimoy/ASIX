use adventureworks2008R2
go
create table persontoexport
(
    title nvarchar(8) null,
    firstName nvarchar(50) not null,
    middleName nvarchar(50) null,
    lastName nvarchar(50) not null
)
DECLARE @TITLE nvarchar(8)
DECLARE @FIRSTNAME nvarchar(50)
DECLARE @MIDDLENAME nvarchar(50)
DECLARE @LASTNAME nvarchar(50)

DECLARE person_cursor cursor for
select title,firstname,middlename,lastname from person.person

open person_cursor
fetch next from person_cursor into @TITLE, @FIRSTNAME, @MIDDLENAME, @LASTNAME
while(@@FETCH_STATUS=0)
BEGIN
    insert into persontoexport(title,firstName,middleName,lastName) 
    values(case when @title is null then 'Sr/Sra' when @TITLE='Mr.' then 'Sr.' when @TITLE='Ms.' then 'Sr.' else @title end,
    @FIRSTNAME,
    @MIDDLENAME,
    @LASTNAME
    )
    fetch next from person_cursor into @TITLE, @FIRSTNAME, @MIDDLENAME, @LASTNAME
END

close person_cursor
deallocate person_cursor

select * from persontoexport order by title
select * from person.person

delete persontoexport