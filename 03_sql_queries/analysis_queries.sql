SELECT TOP 3
c.FullName,
SUM(o.Amount) AS TotalSpent
from Customers_Clean c
JOIN Orders_Clean o ON c.CustomerID=o.CustomerID
GROUP BY c.FullName
ORDER BY TotalSpent DESC;

-- Total sales per product
SELECT p.ProductName,
       SUM(o.Amount) AS TotalSales,
       SUM(o.Quantity) AS TotalUnitsSold
FROM Products_Clean p
JOIN Orders_Clean o
    ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;

-- Monthly total sales
SELECT 
    FORMAT(OrderDate, 'yyyy-MM') AS Month,
    SUM(Amount) AS TotalSales
FROM Orders_Clean
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Month;

-- Customers who have not placed any orders
SELECT c.FullName, c.Email
FROM Customers_Clean c
LEFT JOIN Orders_Clean o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
