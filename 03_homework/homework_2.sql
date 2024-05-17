--SELECT
/* 1. Write a query that returns everything in the customer table. */

select * 
from customer

/* 2. Write a query that displays all of the columns and 10 rows from the cus- tomer table, 
sorted by customer_last_name, then customer_first_ name. */


select customer_id, customer_first_name, customer_last_name, customer_zip
from customer 
order by customer_last_name, customer_first_name 
limit 10

--WHERE
/* 1. Write a query that returns all customer purchases of product IDs 4 and 9. */
-- option 1
select product_id, vendor_id, market_date, customer_id, quantity, cost_to_customer_per_qty, transaction_time
from customer_purchases
where product_id in (4,9)
-- option 2
select product_id, vendor_id, market_date, customer_id, quantity, cost_to_customer_per_qty, transaction_time
from customer_purchases
where product_id=4 or product_id=9

/*2. Write a query that returns all customer purchases and a new calculated column 'price' (quantity * cost_to_customer_per_qty), 
filtered by vendor IDs between 8 and 10 (inclusive) using either:
	1.  two conditions using AND
	2.  one condition using BETWEEN
*/
-- option 1
select product_id, vendor_id, market_date, customer_id, quantity, cost_to_customer_per_qty, transaction_time,
quantity*cost_to_customer_per_qty as price
from customer_purchases
where vendor_id>=8 and vendor_id<=10
-- option 2
select product_id, vendor_id, market_date, customer_id, quantity, cost_to_customer_per_qty, transaction_time,
quantity*cost_to_customer_per_qty as price
from customer_purchases
where vendor_id between 8 and 10
--CASE
/* 1. Products can be sold by the individual unit or by bulk measures like lbs. or oz. 
Using the product table, write a query that outputs the product_id and product_name
columns and add a column called prod_qty_type_condensed that displays the word “unit” 
if the product_qty_type is “unit,” and otherwise displays the word “bulk.” */
select product_id, product_name, case product_qty_type when 'unit' then 'unit' else 'bulk' end prod_qty_type_condensed
from product

/* 2. We want to flag all of the different types of pepper products that are sold at the market. 
add a column to the previous query called pepper_flag that outputs a 1 if the product_name 
contains the word “pepper” (regardless of capitalization), and otherwise outputs 0. */
select product_id, product_name, case product_qty_type when 'unit' then 'unit' else 'bulk' end prod_qty_type_condensed,
case when lower(product_name) like '%pepper%' then 1 else 0 end pepper_flag
from product

--JOIN
/* 1. Write a query that INNER JOINs the vendor table to the vendor_booth_assignments table on the 
vendor_id field they both have in common, and sorts the result by vendor_name, then market_date. */
select * 
from vendor
join vendor_booth_assignments on vendor_booth_assignments.vendor_id=vendor.vendor_id
order by vendor_name, market_date