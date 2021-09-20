SELECT TOP 1 cq.City
FROM 
	(SELECT TOP 1 c.City, COUNT(o.OrderID) as OrderCount
	FROM [Order Details] od join Orders o ON od.OrderID = o.OrderID
		join Customers c ON c.CustomerID = o.CustomerID
	GROUP BY c.City
	ORDER BY OrderCount DESC) cityordertop, 

	(SELECT c.City, SUM(tmp.quantity) QuantityByCity
	FROM Customers as c left join 
	(SELECT c.CustomerID, SUM(Quantity) quantity
	FROM [Order Details] as od join Orders as o ON od.OrderID = o.OrderID
			join Customers as c on o.CustomerID = c.CustomerID
	GROUP BY c.CustomerID) as tmp on c.CustomerID = tmp.CustomerID
	GROUP BY c.City) cq
WHERE cityordertop.City = cq.City
ORDER BY cq.QuantityByCity DESC
;