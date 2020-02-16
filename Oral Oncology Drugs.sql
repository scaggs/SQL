SELECT DISTINCT
drug_name,
ddid, route_of_administration
FROM common..t_medispan
WHERE Drug_Group = 'ANTINEOPLASTICS AND ADJUNCTIVE THERAPIES'
AND Route_of_Administration ='OR'
AND MultiSource IN ('N','M')
ORDER BY drug_name