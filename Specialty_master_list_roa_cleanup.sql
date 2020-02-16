SELECT DISTINCT
sml.drug_name,
sml.ddid,
sml.REMS,
sml.LDN,
sml.HUB,
sml.biosimilar,
sml.site_of_care_restriction,
m.route_of_administration 

FROM dbo.specialty_master_drug_list sml
INNER JOIN common.dbo.t_medispan m ON sml.ddid = m.ddid
WHERE m.route_of_administration ='XX'
ORDER BY sml.drug_name ASC;