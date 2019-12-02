SELECT * FROM sales.orders
SELECT *
FROM Sales.CustomerTransactions
WHERE PaymentMethodid = 4;



SELECT CustomerID, OrderID, OrderDate, ExpectedDeliveryDate
FROM Sales. Orders
WHERE CustomerPurchaseOrderNumber = '16374'

SELECT SalespersonPersonId, Orderdate
FROM Sales.Orders
ORDER BY SalespersonPersonId ASC, OrderDate DESC;

CREATE INDEX SalespersonPersonID_OrderDate ON Sales.Orders (SalespersonPersonID ASC, OrderDate  DESC);

SELECT oRDERiD, OrderDate, ExpectedDeliveryDate, People.FullName
FROM Sales.Orders
		JOIN Application.People
			ON People.PersonID = Orders.ContactPersonID
WHERE PreferredName = 'Aakriti'; 
SELECT Orders.ContactPersonId, People.PreferredName
From Sales.Orders
		JOIN Application.People
			ON People.PersonID = Orders.ContactPersonID
WHERE People.PreferredName = 'Aakriti';

CREATE NONCLUSTERED INDEX ContactPersonID_Include_OrderDate_ExpectedDeliveryDate
ON Sales.Orders ( ContactPersonID )
INCLUDE ( OrderDate,ExpectedDeliveryDate)
ON USERDATA;
GO


