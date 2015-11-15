use Ejercicios
go

create table Articles
(
	Code int primary key identity (1,1) not null,
	Name nvarchar(50) not null,
	Price smallmoney not null,
	VAT numeric(3,2) not null,
	Cost smallmoney not null,
	Stock int not null
)

create table Sales
(
	Code int primary key identity (1,1) not null,
	Temp smalldatetime not null
)

create table SalesDetails
(
	CodeSale int foreign key references Sales(Code) not null,
	CodeArticle int foreign key references Articles(Code) not null,
	Price smallmoney null,
	VAT numeric(3,2) null,
	Profits smallmoney null,
	Quantity int not null
)

alter table SalesDetails
add constraint PK_SalesDetails primary key (CodeSale, CodeArticle)