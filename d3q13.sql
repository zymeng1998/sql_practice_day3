SELECT d.deptname
FROM Dept d, 
	(SELECT TOP 1 e1.deptid, COUNT(1) as deptheadcount
	FROM Employees e1
	GROUP BY e1.deptid
	ORDER BY deptheadcount) tmp
WHERE d.deptid = tmp.deptid
;