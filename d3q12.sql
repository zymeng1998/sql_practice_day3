SELECT e1.EmployeeID
FROM Employees e1
WHERE e1.EmployeeID NOT IN (SELECT e2.ReportsTo
							FROM Employees e2
							WHERE e2.ReportsTo IS NOT NULL)
;
