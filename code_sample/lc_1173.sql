# Example table
create table Delivery(delivery_id integer, customer_id integer, order_date date, customer_pref_delivery_date date);
insert into Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
            values(1, 1, '2019-08-01', '2019-08-02');
insert into Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
            values(2, 5, '2019-08-02', '2019-08-02');
insert into Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
            values(3, 1, '2019-08-11', '2019-08-11');
insert into Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
            values(4, 1, '2019-08-24', '2019-08-26');
insert into Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
            values(5, 1, '2019-08-21', '2019-08-22');
insert into Delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
            values(6, 1, '2019-08-11', '2019-08-13');

# Solution (MySQL)
select ROUND(SUM(order_date = customer_pref_delivery_date) / COUNT(*) * 100, 2) AS immediate_percentage 
from Delivery;

# Solution (PostgreSQL)
SELECT
		CAST(
			SUM(
				CASE
					WHEN order_date = customer_pref_delivery_date THEN 1
					ELSE 0
					END
				) AS FLOAT) / COUNT(*) AS ratio
FROM Delivery;
