SELECT p.ProductName, tmp.Quantity
FROM Products p left join
	(SELECT ProductID, SUM(Quantity) Quantity
	FROM [Order Details]
	GROUP BY ProductID) tmp
	ON p.ProductID = tmp.ProductID
