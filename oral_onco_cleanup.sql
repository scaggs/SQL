SELECT DISTINCT
m.drug_name,
m.ddid,
m.route_of_administration 

FROM dbo.oral_oncology_drug_list oo
INNER JOIN common.dbo.t_medispan m ON oo.ddid = m.ddid
WHERE m.route_of_administration !='OR'