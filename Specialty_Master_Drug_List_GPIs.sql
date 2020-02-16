select DISTINCT
m.drug_name,
m.ddid
--INTO specialty_drug_list_master_gpi10
from common.dbo.t_medispan m
where m.drug_name IN (select drug_name from incubation_studio.dbo.master_specialty_drug_list)