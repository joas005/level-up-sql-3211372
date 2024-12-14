-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT 
  CustomerID,
  COUNT(CustomerID) NumOrders
FROM Orders
GROUP BY CustomerID
ORDER BY 2 DESC