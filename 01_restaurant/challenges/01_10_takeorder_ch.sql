-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

INSERT INTO Orders (CustomerID, OrderDate)
VALUES ((SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey' AND Address = '6939 Elka Place'), '2022-09-20 14:00:00');

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (
  (SELECT OrderID 
   FROM Orders 
   WHERE CustomerID = 
    (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey' AND Address = '6939 Elka Place')
   AND OrderDate = '2022-09-20 14:00:00'),
  (SELECT DishID FROM Dishes WHERE NAME = 'House Salad')
),
( (SELECT OrderID 
   FROM Orders 
   WHERE CustomerID = 
    (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey' AND Address = '6939 Elka Place')
   AND OrderDate = '2022-09-20 14:00:00'),
  (SELECT DishID FROM Dishes WHERE NAME = 'Mini Cheeseburgers')
),
( (SELECT OrderID 
   FROM Orders 
   WHERE CustomerID = 
    (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey' AND Address = '6939 Elka Place')
   AND OrderDate = '2022-09-20 14:00:00'),
  (SELECT DishID FROM Dishes WHERE NAME = 'Tropical Blue Smoothie'));

SELECT * FROM OrdersDishes WHERE OrderID =
  (SELECT OrderID 
   FROM Orders 
   WHERE CustomerID = 
    (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey' AND Address = '6939 Elka Place')
   AND OrderDate = '2022-09-20 14:00:00') 

SELECT
  OD.OrderID,
  SUM(D.Price) AS TotalSpent
FROM OrdersDishes AS OD
INNER JOIN Dishes AS D ON OD.DishID = D.DishID
WHERE OD.OrderID = (SELECT OrderID 
   FROM Orders 
   WHERE CustomerID = 
    (SELECT CustomerID FROM Customers WHERE FirstName = 'Loretta' AND LastName = 'Hundey' AND Address = '6939 Elka Place')
   AND OrderDate = '2022-09-20 14:00:00')
GROUP BY OD.OrderID