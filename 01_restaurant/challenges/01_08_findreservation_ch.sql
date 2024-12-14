-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant

-- There are four people in the party. Today is June 14th.

SELECT 
  * 
FROM Reservations AS R
INNER JOIN Customers AS C ON R.CustomerID = C.CustomerID
WHERE 1=1 
AND C.FirstName LIKE 'St%'
AND R.PartySize = 4
AND R.Date > '2021-06-14 00:00:00'
