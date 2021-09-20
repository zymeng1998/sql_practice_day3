-- Using a sub-query
SELECT DISTINCT c.City
FROM Customers c
WHERE c.City NOT IN (SELECT DISTINCT City FROM Employees)
;

-- Not using a sub-query
SELECT c.City
FROM Customers c

EXCEPT 

SELECT e.City
FROM Employees e
;