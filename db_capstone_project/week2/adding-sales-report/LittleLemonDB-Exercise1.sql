-- TASK 1
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

-- TASK 2
SELECT
  c.CustomerID,
  c.FullName,
  o.OrderID,
  o.TotalCost,
  m.MenuName,
  mi.CourseName,
  mi.StarterName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Menus m ON o.MenuID = m.MenuID
INNER JOIN MenuItems mi ON o.MenuItemID = mi.MenuItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;

-- TASK 3
SELECT
  MenuName
FROM Menus
WHERE MenuID IN (
  SELECT MenuID
  FROM Orders
  GROUP BY MenuID
  HAVING ANY(Quantity > 2)
);
