IF OBJECT_ID ('tempdb..#drugs') IS NOT NULL DROP TABLE #drugs
select DISTINCT 
m.drug_name,
m.ddid,
m.route_of_administration
INTO #drugs
from common.dbo.t_medispan m
where m.ddid IN (select ddid from incubation_studio.dbo.specialty_master_drug_list)

--TRUNCATE TABLE incubation_studio.dbo.specialty_master_drug_list
--INSERT INTO incubation_studio.dbo.specialty_master_drug_list (drug_name, ddid)
select d.drug_name, d.ddid, d.route_of_administration
FROM #drugs d
ORDER BY d.drug_name ASC