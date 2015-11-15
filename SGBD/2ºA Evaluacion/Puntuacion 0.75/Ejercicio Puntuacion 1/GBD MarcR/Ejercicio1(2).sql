use Ejercicios
go

CREATE PROCEDURE insertdeatail
	@CodeSale int,
	@CodeArticle int,
	@Quantity int
AS
BEGIN
	insert into SalesDetails (CodeSale, CodeArticle, Quantity)
	values (@CodeSale, @CodeArticle, @Quantity)
END