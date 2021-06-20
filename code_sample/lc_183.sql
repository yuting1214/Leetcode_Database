SELECT Name AS Customers
FROM Customers AS C
WHERE C.Id NOT IN (
    SELECT CustomerId
    FROM Orders
)
