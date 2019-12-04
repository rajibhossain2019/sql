CREATE VIEW Sales.Orders1Oyearsmultipleitems
AS
SELECT OrderId, CustomerID, SalespersonPersonID, Orderdate,
ExpectedDeliveryDate
FROM	Sales.Orders
WHERE	OrderDate >= DATEADD(YEAR,-10,SYSDATETIME())
	AND (SELECT COUNT(*)
		FROM	Sales.OrderLines
		WHERE	OrderLines.OrderID= Orders.OrderID) > 1;

SELECT TOP 5*
FROM Sales. Orders12MonthsMultipleItems
ORDER BY ExpectedDeliveryDate DESC