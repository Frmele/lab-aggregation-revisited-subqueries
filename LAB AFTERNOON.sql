#Write the SQL queries to answer the following questions:

#Select the first name, last name, and email address of all the customers who have rented a movie.
select first_name,last_name,email from sakila.customer;
#What is the average payment made by each customer (display the customer id, customer name (concatenated),
# and the average payment made).
use sakila;
select c.customer_id, concat(c.first_name,' ', c.last_name) as customer_name, avg(p.amount) as avg_amount 
from payment as p
join customer as c
on c.customer_id=p.customer_id
group by customer_name;

#Select the name and email address of all the customers who have rented the "Action" movies.
select c.email, concat(c.first_name,' ', c.last_name) as customer_name
from customer as c
JOIN rental r
ON c.customer_id = r.customer_id
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film_category fc
ON i.film_id = fc.film_id
join film as f 
ON fc.film_id = f.film_id
#join category as cat
#on fc.category_id=cat.category_id
where fc.category_id=(select category_id from category where name like 'Action')
;




#Verify if the above two queries produce the same results or not - yes  they are switch # above 

#Use the case statement to create a new column classifying existing columns as either or high value 
#transactions based on the amount of payment. If the amount is between 0 and 2, label should be low 
#and if the amount is between 2 and 4, the label should be medium, and if it is more than 4, then it 
#should be high.
use sakila;
SELECT *,CASE 
		WHEN amount <= 2 THEN 'low' 
		WHEN amount <= 4 THEN 'medium' 
        ELSE 'high' END AS classifying
        FROM payment;

