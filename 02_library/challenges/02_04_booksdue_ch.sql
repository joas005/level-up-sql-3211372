-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.

SELECT
  P.FirstName,
  P.Email,
  B.Title,
  L.LoanDate,
  L.DueDate
FROM Loans AS L
INNER JOIN Patrons AS P ON L.PatronID = P.PatronID
INNER JOIN Books AS B ON L.BookID = B.BookID
WHERE L.DueDate = '2022-07-13'