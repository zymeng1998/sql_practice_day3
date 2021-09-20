SELECT DISTINCT c.CustomerID, c.ContactName, c.City, o.ShipCity
FROM Customers c join Orders o ON c.CustomerID = o.CustomerID
WHERE c.City != o.ShipCity
;