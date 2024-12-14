-- Create a table in the database to store customer
-- responses to our anniversary invitation.

-- Associate a customer's ID number with the number of people
-- they plan to bring in their party.

-- Hint: SQLite offers the INTEGER and REAL datatypes

CREATE TABLE IF NOT EXISTS AnniversaryAttendees (
  CustomerID INTEGER PRIMARY KEY, 
  NumberOfGuests INTEGER,
  FOREIGN KEY (CustomerID) 
      REFERENCES Customers (CustomerID)
      ON DELETE CASCADE 
      ON UPDATE NO ACTION
);

INSERT INTO AnniversaryAttendees (CustomerID, NumberOfGuests) VALUES (1, 12);

SELECT 
  AA.CustomerID,
  C.FirstName,
  AA.NumberOfGuests
FROM AnniversaryAttendees AS AA
INNER JOIN Customers AS C ON AA.CustomerID = C.CustomerID;