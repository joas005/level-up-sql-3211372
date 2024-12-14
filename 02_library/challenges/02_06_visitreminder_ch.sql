-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT
  P.FirstName,
  P.LastName,
  P.Email,
  COUNT(DISTINCT LoanID) AS NumLoans
FROM Loans AS L
INNER JOIN Patrons AS P ON L.PatronID = P.PatronID
GROUP BY P.FirstName, P.LastName, P.Email
ORDER BY NumLoans ASC
LIMIT 15