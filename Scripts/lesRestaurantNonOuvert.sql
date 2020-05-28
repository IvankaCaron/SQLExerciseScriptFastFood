SELECT resto_id, count(en_cours) FROM JunkFood.Postes 
where  en_cours = false
group by resto_id;

