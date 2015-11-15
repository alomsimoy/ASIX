alter trigger SalesDetailsInsert
on SalesDetails
for insert
as
begin
	declare @Code int
	declare @Price smallmoney
	declare @VAT numeric(3,2)
	declare @Profits smallmoney
	declare @Cost smallmoney
	declare @Quantity int
	declare @CodeSale int
	
	select @Quantity = Quantity, @Code = CodeArticle, @CodeSale = CodeSale from inserted
	select @Cost = Cost from Articles where Code = @Code
	
	if exists(select Code from Articles where Code = @Code)
	begin
	
		select @Price = Price, @VAT = VAT from Articles where Code = @Code
		select @Profits = @Price - @Cost
		
		update SalesDetails
		set Price=@Price, VAT=@VAT, Profits=@Profits
		where CodeArticle = @Code and  CodeSale = @CodeSale
		
		update Articles
		set Stock = Stock - @Quantity
		where Code = @Code
		
	end

end