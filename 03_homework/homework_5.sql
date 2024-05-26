-- Cross Join
/*1. Suppose every vendor in the `vendor_inventory` table had 5 of each of their products to sell to **every** 
customer on record. How much money would each vendor make per product? 
Show this by vendor_name and product name, rather than using the IDs.

HINT: Be sure you select only relevant columns and rows. 
Remember, CROSS JOIN will explode your table rows, so CROSS JOIN should likely be a subquery. 
Think a bit about the row counts: how many distinct vendors, product names are there (x)?
How many customers are there (y). 
Before your final group by you should have the product of those two queries (x*y).  */

with product_vendor as (
select distinct product.product_name
, vendor.vendor_name, vendor_inventory.original_price
from vendor_inventory
join product on vendor_inventory.product_id=product.product_id
join vendor on vendor.vendor_id=vendor_inventory.vendor_id)

select sum(5*original_price) as sell_5products,
product_name, vendor_name 
from customer
cross join product_vendor
group by product_name, vendor_name


-- INSERT
/*1.  Create a new table "product_units". 
This table will contain only products where the `product_qty_type = 'unit'`. 
It should use all of the columns from the product table, as well as a new column for the `CURRENT_TIMESTAMP`.  
Name the timestamp column `snapshot_timestamp`. */

create table product_units as select *, CURRENT_TIMESTAMP as snapshot_timestamp from product
where product_qty_type = 'unit'

/*2. Using `INSERT`, add a new row to the product_units table (with an updated timestamp). 
This can be any product you desire (e.g. add another record for Apple Pie). */

insert into product_units (product_id, product_name, product_size, product_category_id, product_qty_type, snapshot_timestamp )
values (24, 'Pumpkin pie', '10"', 3, 'unit', CURRENT_TIMESTAMP)

-- DELETE
/* 1. Delete the older record for the whatever product you added. 

HINT: If you don't specify a WHERE clause, you are going to have a bad time.*/

delete from product_units where snapshot_timestamp=(select max(snapshot_timestamp) from product_units)

-- UPDATE
/* 1.We want to add the current_quantity to the product_units table. 
First, add a new column, current_quantity to the table using the following syntax.

ALTER TABLE product_units
ADD current_quantity INT;

Then, using UPDATE, change the current_quantity equal to the last quantity value from the vendor_inventory details.

HINT: This one is pretty hard. 
First, determine how to get the "last" quantity per product. 
Second, coalesce null values to 0 (if you don't have null values, figure out how to rearrange your query so you do.) 
Third, SET current_quantity = (...your select statement...), remembering that WHERE can only accommodate one column. 
Finally, make sure you have a WHERE statement to update the right row, 
	you'll need to use product_units.product_id to refer to the correct row within the product_units table. 
When you have all of these components, you can run the update statement. */

update product_units 
SET current_quantity = (select coalesce(quantity,0) from vendor_inventory where vendor_inventory.product_id=product_units.product_id
order by market_date desc limit 1 )