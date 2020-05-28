SELECT count(resto_id) FROM JunkFood.Postes 
where resto_id in 
(SELECT id FROM JunkFood.Restaurants where code_postal like '64%') 
and en_cours = True;