-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

SELECT COUNT(*) FROM Loans WHERE ReturnedDate = '2022-07-05';

UPDATE Loans
SET 
  ReturnedDate = '2022-07-05'
WHERE 
  BookID IN (SELECT BookID FROM Books WHERE Barcode IN (6435968624, 5677520613, 8730298424))
  AND ReturnedDate IS NULL;

SELECT COUNT(*) FROM Loans WHERE ReturnedDate = '2022-07-05';