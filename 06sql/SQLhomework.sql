-- 1a
Select first_name, last_name
from actor;

-- 1b 
Select UPPER(CONCAT(first_name, ' ', last_name)) 'Actor Name'
from actor;

-- 2a  
Select actor_id, first_name, last_name 
from actor
Where first_name = 'Joe';

-- 2b
Select *
from actor
Where last_name Like '%GEN%';

-- 2c. Find all actors whose last names contain the letters `LI`. 
-- This time, order the rows by last name and first name, in that order:
Select *
from actor
Where last_name Like '%LI%'
Order By last_name, first_name;


-- 2d. 
Select country_id, country
from country
Where country IN ('Afghanistan', 'Bangladesh', 'China');

-- 3a. Add a `middle_name` column to the table `actor`.
 -- Position it between `first_name` and `last_name`. 
--  Hint: you will need to specify the data type.
Alter table actor
Add column middle_name VARCHAR(45) after first_name;

-- 3b. You realize that some of these actors have tremendously long last names. 
-- Change the data type of the `middle_name` column to `blobs`.
Alter table actor
modify column middle_name blob; 

-- 3c. Now delete the `middle_name` column.
Alter table actor
drop column middle_name;

-- 4a. List the last names of actors and how many actors have that last name.
Select last_name, count(last_name)
from actor
group by last_name;

-- 4b. List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors
Select last_name, count(last_name)
from actor
group by last_name
Having count(last_name)>=2;

-- 4c. Oh, no! The actor `HARPO WILLIAMS` was accidentally entered in the `actor` 
-- table as `GROUCHO WILLIAMS`,
-- the name of Harpo's second cousin's husband's yoga teacher. 
-- Write a query to fix the record.
Update actor
SET first_name = 'HARPO'
Where first_name = 'GROUCHO'
And last_name = 'Williams';
-- Change first_name to 'HARPO'
-- Where first_name was 'GROUCHO'


-- 4d. In a single query, if the first name of the actor is currently `HARPO`, 
-- change it to `GROUCHO`. Otherwise, change the first name to `MUCHO GROUCHO`, 
-- as that is exactly what the actor will be with the grievous error. 
-- BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO `MUCHO GROUCHO`, 
-- HOWEVER! (Hint: update the record using a unique identifier.)
Update actor
SET first_name = 'GROUCHO'
Where first_name = 'HARPO'
And last_name = 'Williams';

-- 5a. You cannot locate the schema of the `address` table.
--  Which query would you use to re-create it?
SHOW CREATE TABLE address;

-- 6a. Use `JOIN` to display the first and last names, as well as the address, 
-- staffaddressof each staff member. 
-- Use the tables `staff` and `address`:
Select first_name, last_name, address
from staff
join address
on staff.address_id = address.address_id;

/* 
Select first_name, last_name, address
from staff, address
WHERE staff.address_id = address.address_id; 
*/
-- 6b Use `JOIN` to display the total amount rung up by each staff member 
-- in August of 2005. Use tables `staff` and `payment`.
Select first_name, last_name, sum(amount) 'total amount'
from payment
join staff
on staff.staff_id = payment.staff_id
Where payment_date >= '2005-08-01'
and payment_date <= '2005-08-31'
group by first_name, last_name;

-- 6c  List each film and the number of actors who are listed for that film.
--  Use tables `film_actor` and `film`. Use inner join.
Select title, count(actor_id) 'total'
from film
inner join film_actor
on film.film_id = film_actor.film_id
group by title;

-- 6d. How many copies of the film `Hunchback Impossible` 
-- exist in the inventory system?
Select title, count(inventory_id) 'total'
from inventory
inner join film
on film.film_id = inventory.film_id
Where title = 'Hunchback Impossible'
group by title;

-- 6e. Using the tables `payment` and `customer` and the `JOIN` command, 
-- list the total paid by each customer. List the customers alphabetically by last name:
select last_name, first_name, sum(amount) 'total'
from customer
Join payment
on payment.customer_id= customer.customer_id
group by last_name, first_name
Order by last_name;


-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. 
-- As an unintended consequence, films starting with the letters `K` and `Q` 
-- have also soared in popularity. 
-- Use subqueries to display the titles of movies starting with the 
-- letters `K` and `Q` whose language is English.
Select title
from film
Where (title like 'K%'
or title like 'Q%')
AND language_id in 
	(select language_id
		from language
		where name = 'English');
        
-- 7b. Use subqueries to display all actors who appear in the film `Alone Trip`.

-- Display the last name, first name and film id from the actor and film_actor tables

select last_name, first_name, film_id
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
Where film_id IN 
	(select film_id
    from film
    where title = 'Alone Trip');
    
    
-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and 
-- email addresses of all Canadian customers. 
-- Use joins to retrieve this information.
select last_name, first_name, email,country
from address
Join customer
on address.address_id = customer.address_id
Join city
on city.city_id = address.city_id
join country
on country.country_id = city.country_id
Where country = 'Canada';


-- 7d. Sales have been lagging among young families, and you wish to target all family movies 
-- for a promotion. 
-- Identify all movies categorized as famiy films.
Select title, name
from film
Join film_category
on film.film_id =  film_category.film_id
Join category
on category.category_id = film_category.film_id
Where name = 'Family';

-- 7e Display the most frequently rented movies in descending order.
Select title, count(rental_id)
from film
Join inventory
on film.film_id = inventory.film_id
join rental
on rental.inventory_id = inventory.inventory_id
Join customer
on customer.customer_id = rental.customer_id
group by title
order by count(rental_id) desc;


-- 7f Write a query to display how much business, in dollars, each store brought in.
Select store.store_id, sum(amount) 'amount in dollars'
from store
Join inventory
on store.store_id= inventory.store_id
Join rental
on rental.inventory_id = inventory.inventory_id
Join payment
on payment.rental_id = rental.rental_id
group by store.store_id;

--  7g. Write a query to display for each store its store ID, city, and country.

Select store_id, city, country
from store
Join address
on store.address_id = address.address_id
Join city
on city.city_id = address.city_id
Join country
on country.country_id = city.country_id;

-- 7h. List the top five genres in gross revenue in descending order. 
-- (**Hint**: you may need to use the following tables: 
-- category, film_category, inventory, payment, and rental.)
Select category.name, sum(amount) 'gross revenue'
from store
Join inventory
on store.store_id = inventory.store_id
Join rental
on rental.inventory_id = inventory.inventory_id
Join payment
on payment.rental_id = rental.rental_id
join film
on film.film_id = inventory.film_id
Join film_category
on film_category.film_id = film.film_id
Join category
on category.category_id = film_category.category_id
group by category.name
order by sum(amount) desc
limit 0,5


















  






