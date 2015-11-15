SELECT SOH.SalesOrderID, RevisionNumber, OrderDate, ProductID, OrderQty, UnitPrice, UnitPriceDiscount, LineTotal
FROM SalesLT.SalesOrderHeader AS SOH INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
--
SELECT SOH.SalesOrderID, SOH.RevisionNumber, SOH.OrderDate, SOD.ProductID, SOD.OrderQty, SOD.UnitPrice, SOD.UnitPriceDiscount, SOD.LineTotal 
FROM SalesLT.SalesOrderHeader AS SOH INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE SOD.UnitPrice BETWEEN 100 AND 500
--
SELECT PC.Name, P.Name AS NombreDelProducto, P.ProductNumber, P.Color, P.StandardCost AS CosteDelProducto, P.ListPrice AS PrecioDeVenta, P.Size AS Tamaño, P.Weight AS Peso
FROM SalesLT.ProductCategory AS PC INNER JOIN SalesLT.Product AS P
ON PC.ProductCategoryID = P.ProductCategoryID
--
SELECT PM.Name AS NombreDelModelo, PM.CatalogDescription, P.Name AS NombreDelProducto, P.ProductNumber, P.Color
FROM SalesLT.ProductModel AS PM INNER JOIN SalesLT.Product AS P
ON PM.ProductModelID = P.ProductModelID
WHERE P.Color IN ('Red', 'White') AND PM.CatalogDescription IS NOT NULL
--
SELECT A.CountryRegion, A.StateProvince, A.City, A.AddressLine1, A.AddressLine2, A.PostalCode, CA.AddressID
FROM SalesLT.Address AS A INNER JOIN SalesLT.CustomerAddress AS CA
ON A.AddressID = CA.AddressID
WHERE A.AddressLine1 LIKE '%String%'
ORDER BY A.CountryRegion,A.StateProvince, A.City
--
SELECT ProductID, Name, Color, ListPrice,
CASE	
		WHEN Color = 'black' THEN (ListPrice * 0.05) + ListPrice
		WHEN Color = 'red' THEN ListPrice - (ListPrice * 0.05)
		WHEN Color = 'white' THEN  ListPrice - (ListPrice * 0.05)
		ELSE ListPrice
END AS NuevosPrecioTemporada
FROM SalesLT.Product

