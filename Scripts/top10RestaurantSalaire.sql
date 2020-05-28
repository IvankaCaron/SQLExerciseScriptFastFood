create or replace table PersonnelPostes as
SELECT Personnel.id as PersonnelID, experience, resto_id FROM JunkFood.Personnel
join Postes
on Postes.ind_id = Personnel.id
where experience >24;

select resto_id,  avg(salaire) as moyenneSalaire  from  PersonnelPostes
join SalairesNotes
on SalairesNotes.ind_id = PersonnelPostes.PersonnelID
group by resto_id 
order by moyenneSalaire desc
limit 10

;