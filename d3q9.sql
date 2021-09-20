-- USING SUB
SELECT e.City
FROM Employees e
WHERE e.City NOT IN (SELECT c.City
					FROM [Order Details] od join Orders o ON od.OrderID = o.OrderID 
						join Customers c ON c.CustomerID = o.CustomerID
					)
;

-- NOT using sub
SELECT City
FROM Employees

EXCEPT 

SELECT c.City
FROM [Order Details] od join Orders o ON od.OrderID = o.OrderID 
	join Customers c ON c.CustomerID = o.CustomerID
;