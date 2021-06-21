# Solution 1
select distinct s.buyer_id
from Product p
join Sales s
on p.product_id=s.product_id
group by buyer_id
having sum(p.product_name='S8') > 0 and sum(p.product_name = 'iPhone') = 0
