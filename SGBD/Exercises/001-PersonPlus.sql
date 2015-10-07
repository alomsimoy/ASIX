use AdventureWorks2008R2
go

--Create table Person plus

--Check exist table
if exist (select * from sys.tables where name = 'PersonPlus')
begin
	--Delete content
	delete from PersonPlus
end
else
begin
	--Create table
	create table PersonPlus
	(
		Code int identity(1,1) not null primary key,
		FullName nvarchar(250) not null,
		Address nvarchar(60) null
	)
end

--Create cursor

--Declare vars
declare @title nvarchar(8)
declare @lastName nvarchar(50)
declare @firstName nvarchar(50)
declare @address nvarchar(60)

declare emailing cursor for
select p.Title, p.firstName, p.LastName, a.AddressLine1
from (((Person.Person as p inner join Person.BusinessEntity as be
on p.BussinesEntityID = be.BussinessEntityID)
inner join Person.BusinessEntityAddress as bea
on be.BusinessEntityID = bea.BusinessEntityID)
inner join Person.Address as a
on bea.AddressID = a.AddressID)

--Open cursor and first
open emailing
fetch next from emailing into @title, @firstName, @lastName, @address
while (@@FETCH_STATUS = 0)
begin
	--Insert into table PersonPlus
	insert into PersonPlus (FullName, Address)
	values (@title + ' ' + @firstName + ' ' + @lastName, @address)

	--Fetch next
	fetch next from emailing into @title, @firstName, @lastName, @address
end
close emailing
deallocate emailing
