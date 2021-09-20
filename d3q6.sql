SELECT tmp.City
FROM 
(SELECT c.city, od.ProductID
FROM [Order Details] od join Orders o ON od.OrderID = o.OrderID
	join Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.City, od.ProductID) tmp
GROUP BY tmp.City
HAVING COUNT(tmp.ProductID) >= 2
;