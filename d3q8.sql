SELECT DISTINCT cpc1.City, cpc1.CountByCity, cpc1.ProductID, av.average as AVGPriceOfTop5
FROM 
	(SELECT AVG(avgprice.UnitPrice) average
	FROM 
		(SELECT TOP 5 p.UnitPrice
		FROM Products p left join
			(SELECT ProductID, SUM(Quantity) Quantity
			FROM [Order Details]
			GROUP BY ProductID) tmp
			ON p.ProductID = tmp.ProductID
		ORDER BY tmp.Quantity DESC) avgprice) as av,
	(SELECT c.City, pid_up.ProductID, COUNT(pid_up.ProductID) CountByCity
	FROM Customers c join Orders o ON c.CustomerID = o.CustomerID
		join [Order Details] od ON od.OrderID = o.OrderID
		join 
			(SELECT TOP 5 p.ProductID
			FROM Products p left join
				(SELECT ProductID, SUM(Quantity) Quantity
				FROM [Order Details]
				GROUP BY ProductID) tmp
				ON p.ProductID = tmp.ProductID
			ORDER BY tmp.Quantity DESC) pid_up ON pid_up.ProductID = od.ProductID
	GROUP BY c.City, pid_up.ProductID) as cpc1,
	(SELECT cpc.ProductID, MAX(cpc.CountByCity) MaxWithCity
	FROM 
		(SELECT c.City, pid_up.ProductID, COUNT(pid_up.ProductID) CountByCity
		FROM Customers c join Orders o ON c.CustomerID = o.CustomerID
			join [Order Details] od ON od.OrderID = o.OrderID
			join 
				(SELECT TOP 5 p.ProductID
				FROM Products p left join
					(SELECT ProductID, SUM(Quantity) Quantity
					FROM [Order Details]
					GROUP BY ProductID) tmp
					ON p.ProductID = tmp.ProductID
				ORDER BY tmp.Quantity DESC) pid_up ON pid_up.ProductID = od.ProductID
		GROUP BY c.City, pid_up.ProductID) as cpc
	GROUP BY cpc.ProductID) pid_max

WHERE cpc1.CountByCity = pid_max.MaxWithCity
;


;