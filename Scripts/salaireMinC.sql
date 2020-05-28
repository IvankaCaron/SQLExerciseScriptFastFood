create or replace table TEMP as
 (select SalairesNotes.ind_id, salaire, resto_id 
    from SalairesNotes 
  left join Postes 
        on SalairesNotes.ind_id = Postes.ind_id);
        
create or replace table TEMP_2 as        
 (select ind_id, salaire, resto_id, code_postal  ,ville
    from TEMP 
  left join Restaurants 
        on resto_id = id);
        
create or replace table TEMP_3
 (select sum(salaire) as tot_salaire, code_postal , ville
    from TEMP_2 
    group by code_postal 
    order by tot_salaire);
    
select min(tot_salaire), code_postal, ville from TEMP_3;

drop table TEMP, TEMP_2, TEMP_3;