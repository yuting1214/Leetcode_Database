# Table
create table Prices(product_id integer, start_date date, end_date date , price integer);
Insert into Prices(product_id, start_date, end_date, price) values(1,'2019-02-17', '2019-02-28',5);
Insert into Prices(product_id, start_date, end_date, price) values(1,'2019-03-01', '2019-03-22',20);
Insert into Prices(product_id, start_date, end_date, price) values(2,'2019-02-01', '2019-02-20',15);
Insert into Prices(product_id, start_date, end_date, price) values(2,'2019-02-21', '2019-03-31',30);

create table UnitsSold(product_id integer, purchase_date date, units integer);
Insert into UnitsSold(product_id, purchase_date, units) values(1,'2019-02-25', 100);
Insert into UnitsSold(product_id, purchase_date, units) values(1,'2019-03-01', 15);
Insert into UnitsSold(product_id, purchase_date, units) values(2,'2019-02-10', 200);
Insert into UnitsSold(product_id, purchase_date, units) values(2,'2019-03-22', 30);

# Solution 1 (self, correct)
select 
    p.product_id,
    round(sum(u.units * p.price) / sum(u.units), 2) as average_price 
from Prices p
left join UnitsSold u
on p.product_id = u.product_id and 
    u.purchase_date >= p.start_date and
    p.end_date > u.purchase_date
group by p.product_id;
