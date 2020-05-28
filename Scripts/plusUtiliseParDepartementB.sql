CREATE OR REPLACE TABLE temp AS
SELECT pays_id, ing_id, sum(unites) AS Tot_ing FROM Cartes
JOIN Recettes
ON Cartes.item_id = Recettes.item_id
GROUP BY pays_id, ing_id;

CREATE OR REPLACE TABLE Resto AS
SELECT *,  SUBSTR(code_postal,1,2) AS Dep FROM Restaurants;

CREATE OR REPLACE TABLE tmp AS
SELECT Dep, ing_id, SUM(Tot_ing) AS tot FROM Resto
JOIN temp
ON Resto.pays_id = temp.pays_id
GROUP BY Dep, ing_id;

SELECT Dep, ing_id ,nom , MAX(tot)FROM tmp 
join Ingredients
on tmp.ing_id = Ingredients.id
GROUP BY Dep;

drop table temp, Resto, tmp;