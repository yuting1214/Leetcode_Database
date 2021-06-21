# Sales
create table Sales(seller_id integer, product_id integer, buyer_id integer,sale_date date, quantity integer, price integer);
insert into Sales(seller_id, product_id, buyer_id, sale_date, quantity, price) values( 1, 1,1,'2019-01-21' ,2,2000);
insert into Sales(seller_id, product_id, buyer_id, sale_date, quantity, price) values( 1, 2,2,'2019-02-17' ,1,800);
insert into Sales(seller_id, product_id, buyer_id, sale_date, quantity, price) values( 2, 2,3,'2019-06-02' ,1,800);
insert into Sales(seller_id, product_id, buyer_id, sale_date, quantity, price) values( 3, 3,3,'2019-05-13' ,2,2800);

# Product
create table Product(product_id integer, product_name varchar(10), unit_price integer);
insert into Product(product_id, product_name, unit_price) values(1, 'S8', 1000);
insert into Product(product_id, product_name, unit_price) values(2, 'G8', 800);
insert into Product(product_id, product_name, unit_price) values(3, 'iPhone', 1400);

# Solution 1 (self, correct)
SELECT product_id, product_name
  FROM Product
  WHERE product_id IN 
    (SELECT S.product_id
    FROM Sales AS S
    LEFT JOIN Product AS P
    ON S.product_id = P.product_id
    GROUP BY S.product_id
    HAVING SUM(S.sale_date BETWEEN '2019-01-01' AND '2019-03-31') = COUNT(S.sale_date))

    
# Solution 2(reference, wrong)   
select p.product_id, p.product_name
from Product p
left join Sales s
on p.product_id = s.product_id
group by p.product_id
having sum(s.sale_date between '2019-01-01' and '2019-03-31') = count(s.sale_date)
