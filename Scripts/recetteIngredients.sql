create or replace table tempRecetIng as 
SELECT ing_id, nom, item_id, unites, prix as PrixAchat ,  unites*prix as prixParUnitesxAchat FROM JunkFood.Recettes
join Ingredients
on Ingredients.id = Recettes.ing_id
;

#create or replace table tempRecetIngItems as 
#select ing_id, tempRecetIng.nom as IngNom, item_id, unites, PrixAchat, prixParUnitesxAchat, id, Items.nom as ItemsNom, prix as PrixDeVente  from tempRecetIng
#join Items
#on tempRecetIng.item_id = Items.id
#;

create or replace table tempRecetIngItems as 
select item_id, sum(prixParUnitesxAchat) as SumPrixDAchat , Items.nom as ItemsNom, prix as PrixDeVente from tempRecetIng
join Items
on tempRecetIng.item_id = Items.id
group by item_id
;


