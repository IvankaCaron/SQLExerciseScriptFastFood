CREATE OR REPLACE TABLE temp AS
SELECT order_id, nom, id as item_id, type_item, quantite FROM JunkFood.Items
join Orders_items
on Orders_items.item_id = Items.id
where type_item = "plat";

CREATE OR REPLACE TABLE temp1 AS
SELECT resto_id, order_id, nom, item_id, type_item, quantite, DATE(date_heure), TIME(date_heure) FROM Orders
right join temp
on temp.order_id = Orders.id
WHERE TIME(date_heure) < "12:00:00";

CREATE OR REPLACE TABLE temp2 AS
select  resto_id, ville , order_id, nom as plat, item_id, type_item, sum(quantite) as SumQuantite from Restaurants
join temp1
on temp1.resto_id = Restaurants.id
Group by ville
order by sum(quantite);

select ville as Restaurant, plat, min(SumQuantite) from temp2;

drop table temp, temp1, temp2;

