SELECT DISTINCT
drug_name,
mfr,
strength,
strength_unit_of_measure,
ddid,
drugtype,
clientdrug,
drug_group,
drug_class,
drug_sub_class
FROM common..t_medispan
WHERE Drug_Group = 'ANALGESICS - ANTI-INFLAMMATORY'
AND MultiSource IN ('N','M') -- single-source oral oncology drugs
ORDER BY drug_name, drug_group, drug_class, drug_sub_class
