create or replace table temp1 as
SELECT Orders.id as OrderID, somme, pays_id FROM JunkFood.Orders
join Restaurants
on Restaurants.id = Orders.resto_id;

create or replace table Orders_itemsOrdersRestaurant as
select * from temp1
join Orders_items
on temp1.OrderID = Orders_items.order_id;

create or replace table tempRecetIng as 
SELECT ing_id, nom, item_id, unites, prix as PrixAchat ,  unites*prix as prixParUnitesxAchat FROM JunkFood.Recettes
join Ingredients
on Ingredients.id = Recettes.ing_id
;

create or replace table tempRecetIngItems as 
select item_id, sum(prixParUnitesxAchat) as SumPrixDAchat , Items.nom as ItemsNom, prix as PrixDeVente from tempRecetIng
join Items
on tempRecetIng.item_id = Items.id
group by item_id
;

create or replace table beneficeSum as
select pays_id, order_id, sum((quantite*PrixDeVente - quantite*SumPrixDAchat )) as benefice    from Orders_itemsOrdersRestaurant
join tempRecetIngItems
on tempRecetIngItems.item_id = Orders_itemsOrdersRestaurant.item_id
group by pays_id;

create or replace table nombreResto as
SELECT pays_id, count(pays_id) as nombreResto FROM JunkFood.Restaurants
group by pays_id;

create or replace table BeneficeEtMoyene as
select nombreResto.pays_id, benefice , benefice/nombreResto as moyeneParResto from beneficeSum
join nombreResto
on nombreResto.pays_id = beneficeSum.pays_id
;

create or replace table MoyenneParPays as
select pays, benefice, moyeneParResto from BeneficeEtMoyene
join Pays
on Pays.id = BeneficeEtMoyene.Pays_id;

drop table temp1, Orders_itemsOrdersRestaurant, tempRecetIng, tempRecetIngItems, beneficeSum, nombreResto, BeneficeEtMoyene;








