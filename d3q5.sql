-- I dont think it is possible to use union to solve it and it is derivative to solve it using sub-query
SELECT c.City
FROM Customers c
GROUP BY c.City
HAVING COUNT(c.CustomerID) >= 2
;