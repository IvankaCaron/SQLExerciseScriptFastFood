CREATE OR REPLACE TABLE CheckStock AS
SELECT nom, ing_id, rest_id, unites  FROM JunkFood.Stocks
join Ingredients
on Stocks.ing_id = Ingredients.id
where rest_id in(SELECT id FROM JunkFood.Restaurants
where code_postal = 64200);

ALTER TABLE CheckStock
ADD acomm varchar(255);
update CheckStock set acomm = "Ok" where unites >= 1000;
update CheckStock set acomm = "En stock" where unites < 1000 and unites >= 750;
update CheckStock set acomm = "Pas d’urgence" where unites < 750 and unites >= 500;
update CheckStock set acomm = "Urgence" where unites < 500 and unites >= 250;
update CheckStock set acomm = "Prioritaire" where unites < 250 and unites >= 1;
update CheckStock set acomm = "Rupture de stock" where unites < 1;

SELECT nom, acomm from CheckStock;


