
select * from customer c;

-- Discretização

SELECT
  c.first_name,
  SUM(p2.amount) as total_amount
from payment p2  
INNER JOIN customer c 
    ON c.customer_id  = p2.customer_id 
group by 
  c.customer_id,
  c.first_name
ORDER BY total_amount desc limit 10;
 	
select 
	MIN(total_amount) as minimo,
	MAX(total_amount) as maximo,
	AVG(total_amount) as media
from (
	select
		customer_id,
		sum(amount) as total_amount
	from payment
	group by customer_id
	) as valores;

select
	c.first_name,
	SUM(p2.amount) as total_amount,
	case 
	 	when SUM(p2.amount) > 200 then 'Alto'
	  	when SUM(p2.amount)  > 110 then 'Medio'
	 	when SUM(p2.amount)  > 50  then 'Baixo'
	 	else 'NA'
	 end as amount_Level
	 from payment as p2
	 INNER JOIN customer AS c
   		 ON c.customer_id = p2.customer_id
	GROUP BY
    c.customer_id,
    c.first_name
    order by  total_amount desc;

-- Padronização

select first_name,
	case 
		when first_name = 'Mike' then 'MIKE'
		when first_name = 'Jon'	 then 'JON'
		else first_name
		end as Nome_Caps
	from staff s;
	


	 