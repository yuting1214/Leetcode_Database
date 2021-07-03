
# Solution 1(self) 
FROM available.book_id, available.name
(SELECT book_id, name
FROM Books
WHERE available_from < DATE_SUB('2019-06-23', INTERVAL 1 MONTH)) available
LEFT JOIN Orders O
ON available.book_id = O.book_id 
WHERE O.dispatch_date BETWEEN DATE_SUB('2019-06-23', INTERVAL 1 YEAR) AND '2019-06-23'
GROUP BY available.book_id, available.name
HAVING SUM(available.quantity) < 10)

# Solution 2(self) 
SELECT 
  book_id,
  name
FROM Books
WHERE available_from < DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
AND book_id NOT IN 
  (SELECT book_id
  FROM Orders
  WHERE dispatch_date BETWEEN DATE_SUB('2019-06-23', INTERVAL 1 YEAR) AND '2019-06-23'
  GROUP BY book_id 
  HAVING SUM(quantity) >= 10)
