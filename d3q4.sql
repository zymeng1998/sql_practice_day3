SELECT c.City, SUM(tmp.quantity) QuantityByCity
FROM Customers as c left join 
(SELECT c.CustomerID, SUM(Quantity) quantity
FROM [Order Details] as od join Orders as o ON od.OrderID = o.OrderID
		join Customers as c on o.CustomerID = c.CustomerID
GROUP BY c.CustomerID) as tmp on c.CustomerID = tmp.CustomerID
GROUP BY c.City