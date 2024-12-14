-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

SELECT
  Published,
  COUNT(DISTINCT BookID) AS CountBooks
FROM Books
GROUP BY Published
ORDER BY 2 DESC
LIMIT 10;

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT
  L.BookID,
  B.Title,
  COUNT(L.LoanID) AS CountLoans
FROM Loans AS L
INNER JOIN Books AS B ON L.BookID = B.BookID
GROUP BY L.BookID, B.Title
ORDER BY 3 DESC
LIMIT 5;