-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT
  COUNT(*) AS AvalibleCopies
FROM Books
WHERE 1=1
AND BookID NOT IN (
  SELECT
    BookID
  FROM Loans
  WHERE BookID IN (SELECT BookID FROM Books WHERE Title LIKE '%Dracula%')
  AND ReturnedDate IS NULL
) 
AND Title LIKE '%Dracula%'